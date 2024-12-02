/* 
    在硬件初始化后,这里就是相关video的接口
*/
#include "video_app.h"

//临时利用,V200接口需要用到
#include "devid.h"

#if JPG_EN == 1
#include "stream_frame.h"
#include "utlist.h"
#include "osal/work.h"
#include "jpgdef.h"
#include "hal/jpeg.h"
#include "hal/vpp.h"
#include "custom_mem/custom_mem.h"
#include "lib/lcd/lcd.h"
#include "lib/lcd/gui.h"
#include "lib/video/dvp/jpeg/jpg.h"


 
static stream *g_jpeg_s = NULL;
static struct os_work jpeg_stream_work;

//txw81x重写一下,因为有些模块可能被其他模块用
#if TXW80X
static void start_jpeg_stream()
{
    jpg_recfg();
    jpg_start(0);

    csi_recfg();
    csi_open();
}

void stop_jpeg_stream()
{
    csi_close();
	jpg_stop(0);
}
#else

extern volatile uint32 prc_new_frame;
uint8 spi_sensor_to_mjpeg_is_run();
static void start_jpeg_stream()
{
    //jpg_recfg();
#if PRC_EN
	if(spi_sensor_to_mjpeg_is_run()){
		while(prc_new_frame == 0){
			os_sleep_ms(1);
		}
	}
#endif
	jpg_recfg(0);
    jpg_start(0);

    //csi_recfg();
    //csi_open();
}

static void stop_jpeg_stream()
{
    //csi_close();
	jpg_stop(0);

}
#endif

void stop_jpeg()
{
	jpeg_stream_deinit();
}

void start_jpeg()
{
    jpeg_stream_init();
}



struct jpg_frame_msg
{
	uint32_t len;
	void *malloc_mem;
};

static uint32_t get_data_len(void *data)
{
    struct data_structure  *d = (struct data_structure  *)data;
	struct jpg_frame_msg *j = (struct jpg_frame_msg*)d->priv;
	uint32_t len = 0;
	if(j)
	{
		len = j->len;
	}
	return len;
}



static uint32_t jpg_custom_func(void *data,int opcode,void *priv);
static int32 stream_get_jpg_work(struct os_work *work);





static stream_ops_func stream_jpg_ops = 
{
	.get_data_len = get_data_len,
	.custom_func = jpg_custom_func,
};

static uint32_t jpg_custom_func(void *data,int opcode,void *priv)
{
	uint32_t res = 0;
    uint32_t flags;
	struct data_structure  *d = (struct data_structure  *)data;
	switch(opcode)
	{
		case CUSTOM_GET_NODE_LEN:
        {
            
            
			if(GET_DATA_TYPE2(d->type) == JPEG_DVP_NODE)
			{
				res = get_jpg_node_len(0);
			}
			#ifdef PSRAM_HEAP
			else if(GET_DATA_TYPE2(d->type) == JPEG_DVP_FULL)
			{
				struct jpg_frame_msg *j = (struct jpg_frame_msg*)d->priv;
				res = j->len;
			}
			#endif
            
        }
			
		break;
		case CUSTOM_GET_NODE_BUF:
			if(GET_DATA_TYPE2(d->type) == JPEG_DVP_NODE)
			{
				res = (uint32_t)get_jpeg_node_buf(priv);
			}
			#ifdef PSRAM_HEAP
			else if(GET_DATA_TYPE2(d->type) == JPEG_DVP_FULL)
			{
				res = (uint32_t)priv;
			}
			#endif
			
		break;
        
		case CUSTOM_GET_FIRST_BUF:
		{
			struct stream_jpeg_data_s *dest_list = (struct stream_jpeg_data_s *)GET_DATA_BUF(data);
			//头是固定用,next才是真正的数据
			if(dest_list->next)
			{
				
				if(GET_DATA_TYPE2(d->type) == JPEG_DVP_NODE)
				{
					res =(uint32) get_jpeg_node_buf(dest_list->next->data);
				}
				#ifdef PSRAM_HEAP
				else if(GET_DATA_TYPE2(d->type) == JPEG_DVP_FULL)
				{
					res =(uint32) dest_list->next->data;
				}
				#endif
			}



		}
		break;

		case CUSTOM_FREE_NODE:
		{
			//释放data->data里面的图片数据
			//清除已经提取的图片节点
			struct data_structure *d = (struct data_structure *)data;
			struct stream_jpeg_data_s *el,*tmp;
			struct stream_jpeg_data_s *dest_list = (struct stream_jpeg_data_s *)d->data;
			struct stream_jpeg_data_s *dest_list_tmp = dest_list;
			uint32_t flags;
			flags = disable_irq();
			//释放el->data后,最后将链表释放
			LL_FOREACH_SAFE(dest_list,el,tmp)
			{
				if(el == dest_list_tmp)
				{
					continue;
				}
				el->ref--;
				//是否要释放
                if(!el->ref)
                {
                    LL_DELETE(dest_list,el);
                    if(el->data)
                    {
                        

						if(GET_DATA_TYPE2(d->type) == JPEG_DVP_NODE)
						{
							del_jpeg_node(el->data,0);
						}
						#ifdef PSRAM_HEAP
						else if(GET_DATA_TYPE2(d->type) == JPEG_DVP_FULL)
						{
							custom_free_psram(el->data);
						}
						#endif
                    }
                }
			}
			enable_irq(flags);

		}
		break;

		case CUSTOM_DEL_NODE:
        {  
            uint32_t ref;
            struct data_structure *d = (struct data_structure *)data;
            struct stream_jpeg_data_s *dest_list = (struct stream_jpeg_data_s *)d->data;
            struct stream_jpeg_data_s *el = (struct stream_jpeg_data_s *)priv;
            flags = disable_irq();
            ref = --el->ref;
            enable_irq(flags);
            if(!ref)
            {
                LL_DELETE(dest_list,el);
				if(GET_DATA_TYPE2(d->type) == JPEG_DVP_NODE)
				{
					del_jpeg_node(el->data,0);
				}
				#ifdef PSRAM_HEAP
				else if(GET_DATA_TYPE2(d->type) == JPEG_DVP_FULL)
				{
					custom_free_psram(el->data);
				}
				#endif
            }
        }
		break;

		default:
		break;
	}
	return res;
}

static uint32_t stream_cmd_func(stream *s,int cmd,uint32_t arg)
{
    uint32_t res = 0;

    switch(cmd)
    {
        case SET_MJPEG_RESOLUTION_PARM_CMD:
        {
            os_printf("%s:%d\n",__FUNCTION__,__LINE__);
			
			resolution_parm *gui_cfg = (resolution_parm*)arg;
			os_printf("dvp_h:%d dvp_w:%d rec_h:%d rec_w:%d\n",gui_cfg->dvp_h,gui_cfg->dvp_w,gui_cfg->rec_h,gui_cfg->rec_w);
#if LCD_EN
			extern uint8 *yuvbuf;
			struct scale_device *scale_dev;
			struct vpp_device *vpp_dev;
			scale_dev = (struct scale_device *)dev_get(HG_SCALE1_DEVID);
			vpp_dev = (struct vpp_device *)dev_get(HG_VPP_DEVID);

			if(gui_cfg->dvp_h != gui_cfg->rec_h || gui_cfg->dvp_w != gui_cfg->rec_w)
			{
				os_work_cancle(&jpeg_stream_work,1);
				stop_jpeg_stream();
				os_printf("---------SCALE TO MJPEG---------\n");
				scale_from_vpp_to_jpg(scale_dev,(uint32)yuvbuf,gui_cfg->dvp_w,gui_cfg->dvp_h,gui_cfg->rec_w,gui_cfg->rec_h);
				jpg_cfg(HG_JPG0_DEVID,SCALER_DATA);
				vpp_open(vpp_dev);
				start_jpeg_stream();
				OS_WORK_INIT(&jpeg_stream_work, stream_get_jpg_work, 0);
				os_run_work_delay(&jpeg_stream_work, 1);
			}
			else
			{
				os_work_cancle(&jpeg_stream_work,1);
				stop_jpeg_stream();				
				vpp_close(vpp_dev);
				os_printf("---------VPP TO MJPEG---------\n");
				os_sleep_ms(50);
				jpg_cfg(HG_JPG0_DEVID,VPP_DATA0);
				vpp_open(vpp_dev);
				start_jpeg_stream();
				OS_WORK_INIT(&jpeg_stream_work, stream_get_jpg_work, 0);
				os_run_work_delay(&jpeg_stream_work, 1);
				}
#endif
        }
        break;

        default:
        break;
    }
    return res;
}


static int opcode_func(stream *s,void *priv,int opcode)
{
	int res = 0;
	switch(opcode)
	{
		case STREAM_OPEN_ENTER:
		break;
		case STREAM_OPEN_EXIT:
		{
			stream_data_dis_mem(s,2);
            #if 0
            streamSrc_bind_streamDest(s,R_PSRAM_JPEG);

            #else
            //注意这里,使用psram的时候不要直接到图传,先到psram变成一帧图,然后psram再发送到图传和录卡流
			streamSrc_bind_streamDest(s,R_RTP_JPEG);
			streamSrc_bind_streamDest(s,R_RECORD_JPEG);
			streamSrc_bind_streamDest(s,R_ALK_JPEG);
			streamSrc_bind_streamDest(s,R_PHOTO_JPEG);
			streamSrc_bind_streamDest(s,R_AT_SAVE_PHOTO);
			streamSrc_bind_streamDest(s,R_AT_AVI_JPEG);
            #endif
			register_stream_self_cmd_func(s,stream_cmd_func);
			//启动jpeg流
			extern void start_jpeg_stream();
            os_printf("%s:%d\n",__FUNCTION__,__LINE__);
			start_jpeg_stream();
			//启动workqueue
			OS_WORK_INIT(&jpeg_stream_work, stream_get_jpg_work, 0);
			os_run_work_delay(&jpeg_stream_work, 1);
		}
		break;
		case STREAM_OPEN_FAIL:
		break;
		case STREAM_DATA_DIS:
		{
			struct data_structure *data = (struct data_structure *)priv;
			//注册对应函数
			data->ops = &stream_jpg_ops;
			data->data = NULL;
			data->priv = (struct jpg_frame_msg*)os_malloc(sizeof(struct jpg_frame_msg));
			if(data->priv)
			{
				memset(data->priv,0,sizeof(struct jpg_frame_msg));
			}
			else
			{
				os_printf("malloc mem fail,%s:%d\n",__FUNCTION__,__LINE__);
			}
		}
		break;

		case STREAM_DATA_DESTORY:
		{
			struct data_structure *data = (struct data_structure *)priv;
			if(data->priv)
			{
				os_free(data->priv);
			}
		}
		break;

		//如果释放空间,则删除所有的节点
		case STREAM_DATA_FREE:
		{
			//释放data->data里面的图片数据
			//清除已经提取的图片节点
			struct data_structure *data = (struct data_structure *)priv;
			struct stream_jpeg_data_s *el,*tmp;
			struct stream_jpeg_data_s *dest_list = (struct stream_jpeg_data_s *)data->data;
			struct stream_jpeg_data_s *dest_list_tmp = dest_list;
			//释放el->data后,最后将链表释放
			LL_FOREACH_SAFE(dest_list,el,tmp)
			{
				if(dest_list_tmp == el)
				{
					continue;
				}
				if(el->data)
				{
					//这里只要判断type2,因为默认type1一定是JPEG
					if(GET_DATA_TYPE2(data->type) == JPEG_DVP_NODE)
					{
						del_jpeg_node(el->data,0);
					}
					#ifdef PSRAM_HEAP
					else if(GET_DATA_TYPE2(data->type) == JPEG_DVP_FULL)
					{
						custom_free_psram(el->data);
					}
					#endif
					
				}
			}
			struct jpg_frame_msg *j = (struct jpg_frame_msg*)data->priv;
			if(j)
			{
				os_free(j->malloc_mem);
				j->malloc_mem = NULL;
			}
		}
		break;

        case STREAM_DATA_FREE_END:
        break;

		//每次即将发送到一个流,就调用一次
		case STREAM_SEND_TO_DEST:
		{
			//释放data->data里面的图片数据
			//清除已经提取的图片节点
			struct data_structure *data = (struct data_structure *)priv;
			struct stream_jpeg_data_s *el,*tmp;
			struct stream_jpeg_data_s *dest_list = (struct stream_jpeg_data_s *)data->data;
			uint32_t flags;
			flags = disable_irq();
			//释放el->data后,最后将链表释放
			LL_FOREACH_SAFE(dest_list,el,tmp)
			{
				el->ref++;
			}
			enable_irq(flags);

		}
		break;


		//数据发送完成
		case STREAM_SEND_DATA_FINISH:
		{
			//释放data->data里面的图片数据
			//清除已经提取的图片节点
			struct data_structure *data = (struct data_structure *)priv;
			struct stream_jpeg_data_s *el,*tmp;
			struct stream_jpeg_data_s *dest_list = (struct stream_jpeg_data_s *)data->data;
			struct stream_jpeg_data_s *dest_list_tmp = dest_list;
			uint32_t flags;
			flags = disable_irq();
			//释放el->data后,最后将链表释放
			LL_FOREACH_SAFE(dest_list,el,tmp)
			{
				if(el == dest_list_tmp)
				{
					continue;
				}
				el->ref--;
				//是否要释放
                if(!el->ref)
                {
                    LL_DELETE(dest_list,el);
					//这里只要判断type2,因为默认type1一定是JPEG
					if(GET_DATA_TYPE2(data->type) == JPEG_DVP_NODE)
					{
						del_jpeg_node(el->data,0);
					}
					#ifdef PSRAM_HEAP
					else if(GET_DATA_TYPE2(data->type) == JPEG_DVP_FULL)
					{
						custom_free_psram(el->data);
					}
					#endif

                }
			}
			enable_irq(flags);

		}
		break;

		//退出,则关闭对应得流
		case STREAM_CLOSE_EXIT:
		{
			extern void stop_jpeg_stream();
			os_work_cancle(&jpeg_stream_work,1);
			stop_jpeg_stream();
			
		}
		break;

		default:
			//默认都返回成功
		break;
	}
	return res;
}

void jpeg_in_sram(struct list_head  *get_f)
{
	stream *s = g_jpeg_s;
	struct list_head  *data;
	int err = 1;
	if(get_f)
	{
		struct stream_jpeg_data_s *el,*tmp;
		struct stream_jpeg_data_s *dest_list = NULL;
		int get_f_count = get_node_count(get_f);
		struct stream_jpeg_data_s *m = NULL;
		if(get_f_count)
		{
			//多一个,为了固定头指针
			m = (struct stream_jpeg_data_s *)os_malloc((get_f_count+1)*sizeof(struct stream_jpeg_data_s));
			memset(m,0,(get_f_count+1)*sizeof(struct stream_jpeg_data_s));
			el = m;
			el->next = NULL;
			el->data = NULL;
			el->ref = 0;
			LL_APPEND(dest_list,el);
			m++;
		}

		//节点进行提取到stream里面,如果节点不够,也要删除已经提取的节点(理论节点与jpeg节点一致,不应该不一样)
		//先判断get_f的节点数量是多少
		while(m && get_f_count--)
		{
			//图片节点提取
			if(list_empty(get_f))
			{
				err = 0;
				break;
			}
			else
			{
				el = m++;
				//保存next
				data = get_f->next;
				//将next断开
				list_del(get_f->next);
				el->data = (void*)data;
				el->ref = 1;
				el->next = NULL;
				err = 0;
				//添加到另一个链表
				LL_APPEND(dest_list,el);
			}
		}

		
		struct data_structure  *data_s = NULL;
		//没有错误的情况才去申请空间
		if(!err)
		{
			data_s = get_src_data_f(s);
			if(data_s)
			{
				//设置这个为正常图片的的形式
				data_s->type = SET_DATA_TYPE(JPEG,JPEG_DVP_NODE);
			}
		}


		if(err || !data_s || !data_s->priv)
		{
			del_jpeg_frame(get_f);
			//清除已经提取的图片节点
			LL_FOREACH_SAFE(dest_list,el,tmp)
			{
				el->ref = 0;
				el->next = NULL;
				if(el->data)
				{
					del_jpeg_node(el->data,0);
				}
				el->data = NULL;
			}
			os_free(dest_list);

			if(data_s)
			{
				force_del_data(data_s);
			}
			
		}
		else
		{
			//数据绑定
			data_s->data = dest_list;
			data_s->ref = 0;
			//设置这个为图片节点形式,接收端需要根据这个去实现读取图片方式
			data_s->type = SET_DATA_TYPE(JPEG,JPEG_DVP_NODE);
			set_stream_data_time(data_s,os_jiffies()); 
			struct jpg_frame_msg *j = (struct jpg_frame_msg*)data_s->priv;
			j->len = get_jpeg_len(get_f);
			j->malloc_mem = dest_list;
			del_jpeg_frame(get_f);
			//统一发送数据,这个时候,其他流才有可能获取到数据
            _os_printf("$");
			send_data_to_stream(data_s);
		}
	}
}

#ifdef PSRAM_HEAP
void jpeg_in_psram(struct list_head  *get_f)
{

    uint8_t *tmp_buf;
	stream *s = g_jpeg_s;
	int err = 1;
    uint32_t jpg_len,jpg_len_tmp,cp_offset,cp_len;
    uint8_t *jpg_psram_space = NULL;
    uint32_t node_len;

	if(get_f)
	{
        node_len = get_jpg_node_len_new((void*)get_f);
		struct stream_jpeg_data_s *el,*tmp;
		struct stream_jpeg_data_s *dest_list = NULL;
        jpg_len = get_jpeg_len(get_f);
        //os_printf("get_f:%X\tjpg_len:%d\n",get_f,jpg_len);
        //带psram的情况下,这里总是等于1,因为psram空间大,一张图片约30KB的情况,可以尽量保证图片在内存是连续的
		int get_f_count = 1;
		struct stream_jpeg_data_s *m = NULL;

        //与无psram的结构同步,用于兼容
		if(get_f_count)
		{
			//多一个,为了固定头指针
			m = (struct stream_jpeg_data_s *)os_malloc((get_f_count+1)*sizeof(struct stream_jpeg_data_s));
			memset(m,0,(get_f_count+1)*sizeof(struct stream_jpeg_data_s));
			el = m;
			el->next = NULL;
			el->data = NULL;
			el->ref = 0;
			LL_APPEND(dest_list,el);
			m++;
		}
        jpg_psram_space = (uint8_t*)custom_malloc_psram(jpg_len);
        jpg_len_tmp = jpg_len;
        cp_offset = 0;

        if(m)
        {
            el = m;
            //节点先添加
            el->data = (void*)jpg_psram_space;
            el->ref = 1;
            el->next = NULL;
            LL_APPEND(dest_list,el);
        }
		//节点进行提取到stream里面,如果节点不够,也要删除已经提取的节点(理论节点与jpeg节点一致,不应该不一样)
		//先判断get_f的节点数量是多少
		while(jpg_psram_space && m)
		{
            
			//图片节点提取
			if(list_empty(get_f) || jpg_len_tmp == 0)
			{
				err = 0;
				break;
			}

            if(jpg_len_tmp > node_len)
            {
                cp_len = node_len;
            }
            else
            {
                cp_len = jpg_len_tmp;
            }
            jpg_len_tmp -= cp_len;
            tmp_buf = get_jpeg_first_buf(get_f);


            hw_memcpy0(jpg_psram_space+cp_offset,get_jpeg_first_buf(get_f),cp_len);
            del_jpeg_first_node(get_f);
            cp_offset += cp_len;
		}

		struct data_structure  *data_s = NULL;
		//没有错误的情况才去申请空间
		if(!err)
		{
			data_s = get_src_data_f(s);
			if(data_s)
			{
				//设置这个为正常图片的的形式
				data_s->type = SET_DATA_TYPE(JPEG,JPEG_DVP_FULL);
			}
            
		}
		if(err || !data_s || !data_s->priv || !jpg_psram_space)
		{
			del_jpeg_frame(get_f);
            struct stream_jpeg_data_s *dest_list_tmp = dest_list;
			//清除已经提取的图片节点
			LL_FOREACH_SAFE(dest_list,el,tmp)
			{
                if(el == dest_list_tmp)
                {
                    continue;
                }
				el->ref = 0;
				el->next = NULL;
                //理论psram的空间在这里释放
				if(el->data)
				{
					custom_free_psram(el->data);
				}
				el->data = NULL;
			}
			os_free(dest_list);
			if(data_s)
			{
				force_del_data(data_s);
			}


			
		}
		else
		{
			//数据绑定
			data_s->data = dest_list;
			data_s->ref = 0;

			set_stream_data_time(data_s,os_jiffies()); 
			struct jpg_frame_msg *j = (struct jpg_frame_msg*)data_s->priv;
			j->len = jpg_len;
			j->malloc_mem = dest_list;
			del_jpeg_frame(get_f);
			//统一发送数据,这个时候,其他流才有可能获取到数据
			_os_printf("V");
			send_data_to_stream(data_s);
		}

	}
}
#endif

static int32 stream_get_jpg_work(struct os_work *work)
{
	//首先获取节点先
	uint32_t flags;

	flags = disable_irq();
	struct list_head  *get_f = (void*)get_frame(HG_JPG0_DEVID);
	enable_irq(flags);

	

	if(get_f)
	{
		#ifdef PSRAM_HEAP
			uint32_t jpg_len;
			jpg_len = get_jpeg_len(get_f);
			if(jpg_len < 200*1024)
			{
				jpeg_in_psram(get_f);
			}
			else
			{
				jpeg_in_sram(get_f);
			}
		#else
			jpeg_in_sram(get_f);
		#endif
		
	}
    os_run_work_delay(&jpeg_stream_work, 1);
	return 0;
}




stream *jpeg_stream_init()
{
	stream *src = NULL;
    os_printf("%s:%d\n",__FUNCTION__,__LINE__);
    src = open_stream_available(S_JPEG,2,0,opcode_func,NULL);
	g_jpeg_s = src;
	os_printf("src:%X\n",src);
	if(src)
	{
		os_printf("src open_ref:%d\n",src->open_ref);
	}
    return src;
}
void jpeg_stream_deinit(stream *s)
{
	int res;
	if(g_jpeg_s)
	{
		res = close_stream(g_jpeg_s);
		if(!res)
		{
			g_jpeg_s = NULL;
		}
		
	}
}
#else
stream *jpeg_stream_init()
{
	return NULL;
}
void jpeg_stream_deinit(stream *s)
{
	
}
void stop_jpeg()
{
}

void start_jpeg()
{
}

#endif
