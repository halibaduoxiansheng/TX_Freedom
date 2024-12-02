/*
    在硬件初始化后,这里就是相关video的接口
*/
#include "video_app_usb_psram.h"

//临时利用,V200接口需要用到
#include "devid.h"


#include "stream_frame.h"
#include "utlist.h"
#include "osal/work.h"
#include "jpgdef.h"
#include "custom_mem/custom_mem.h"
#include "lib/video/uvc/hg_usb_device.h"

#include "osal/irq.h"
#ifdef PSRAM_HEAP
static stream *g_usb_jpeg_s = NULL;

struct jpg_frame_msg
{
	uint32_t len;
	void *malloc_mem;
};


//私有结构体
struct usb_jpg_userdata
{
	uint32_t malloc_max_size;	//记录当前应该申请的最大size
	uint32_t current_photo_max_size;
	//记录的时间与次数主要为了动态修改malloc_max_size,尽可能节约空间
	uint32_t malloc_time;		//记录malloc_max_size修改的size
	uint32_t malloc_count_near; //记录从记录malloc_max_size开始计算,申请的次数

	uint32_t *task_status;
	struct uvc_user_arg *uvc_arg;
};


//usb的情况下,如果是在sram,则获取的get_uvc_frame一定是独占,只有等自己释放
static void stream_get_usb_jpg_psram_thread(void *d)
{
	//这里为了让usb那边初始化好对应的空间
	os_printf("%s:%d\n",__FUNCTION__,__LINE__);
	os_sleep_ms(5);
	stream *s = (stream *)d;
    struct list_head* get_f;
	UVC_MANAGE* uvc_message = NULL;
	UVC_BLANK* uvc_b;
	int err = 1;
	uint32_t flags;
	uint32_t offset = 0;
	struct data_structure  *data_s = NULL;
	struct usb_jpg_userdata *userdata = (struct usb_jpg_userdata*)s->priv;
	//uint8_t *buf;
	uint32_t irq_time = 0;
	uint8_t *malloc_buf = NULL;
	uint32_t current_photo_size = 0;
	uint32_t current_photo_max_size = 80*1024;
	uint8_t exit_err = 0;
	struct uvc_user_arg *uvc_arg = userdata->uvc_arg;
	uint32_t usb_time_out = 0;
	uint32_t usb_dma_irq_count = 0;
	uint32_t count_time = 0;
	while(1)
	{
	uvc_get_psram_again:
		flags = disable_irq();
        get_f = get_uvc_frame();
		enable_irq(flags);

		//如果其他任务通知,可以在这里判断,然后退出
		if(uvc_arg->state == 2)
		{
			goto uvc_get_psram_err_deal;
		}

		if(usb_time_out > 500)
		{
			if(usb_dma_irq_count == usb_dma_irq_times)
			{
				os_printf("%s:%d\n",__FUNCTION__,__LINE__);
				exit_err = 1;
				goto uvc_get_psram_err_deal;
			}
			usb_dma_irq_count = usb_dma_irq_times;
			usb_time_out = 0;
		}

		if(!get_f)
		{
			os_sleep_ms(1);
			usb_time_out++;
			goto uvc_get_psram_again;
		}
		usb_time_out = 0;
		err = 0;
		offset = 0;
		malloc_buf = NULL;
		current_photo_size = 0;
		flags = disable_irq();
        uvc_message = list_entry(get_f,UVC_MANAGE,list);
        set_uvc_frame_using(uvc_message); 
		enable_irq(flags);




		extern uint8_t uvc_open;
		while((uvc_message->frame_end != 2) && ((list_empty(&uvc_message->list) != TRUE )||(uvc_message->frame_end == 0)))
		{
			if(uvc_open == 0)
			{
				count_time++;
				if(count_time > 1000)
				{
					count_time = 0;
					os_printf("uvc:%X\tend:%d\n",uvc_message,uvc_message->frame_end);
				}
			}
			if(uvc_arg->state == 2)
			{
				goto uvc_get_psram_err_deal;
			}
            flags = disable_irq();
            uvc_b = list_entry(uvc_message->list.prev,UVC_BLANK,list);
            enable_irq(flags);
            if(uvc_b && uvc_b->busy == 2)
            {
                //数据头,所以要申请一帧数据
                if(uvc_b->blank_loop == 0)
                {
					//获取是否有节点,有节点的话,才可以填充数据
					data_s = get_src_data_f(s);
                }
                //没有帧,那么只能将bank删除,应该是rtsp处理速度不够
                if(data_s)
                {
					//会申请一个连续的空间有可能空间不够,后续会重新申请,如果不够,则丢帧
					if(!malloc_buf)
					{
						_os_printf("#");
						malloc_buf = (uint8_t*)custom_malloc_psram(userdata->malloc_max_size);
						userdata->malloc_count_near++;
					}
					if(malloc_buf)
					{
						//判断一下偏移后是否大于当前最大的size,如果是,则需要重新去申请空间了,这种情况申请大于20%,自动调整,则增加10%
						if(offset+uvc_b->blank_len > userdata->malloc_max_size)
						{
							_os_printf("{}\n");
							userdata->malloc_max_size = (uint32_t)((offset+uvc_b->blank_len)<<1);
							
							userdata->malloc_time = os_jiffies();
							userdata->malloc_count_near = 0;
							uint8_t *m_buf = (void*)custom_malloc_psram(userdata->malloc_max_size);
							os_printf("userdata->malloc_max_size:%d\t%X\n",userdata->malloc_max_size,m_buf);
							if(m_buf)
							{
								hw_memcpy0(m_buf,malloc_buf,offset);
								custom_free_psram(malloc_buf );
								malloc_buf = m_buf;
							}
							else
							{
								if(malloc_buf)
								{
									custom_free_psram(malloc_buf );
									malloc_buf = NULL;
								}
							}
						}
					}


					//申请不到空间,则要去移除这张图片,并且释放data_s,但是要这张图片接收完成才能进行操作
					if(!malloc_buf)
					{
						err = 1;
						_os_printf("[");
						if(data_s)
						{
							force_del_data(data_s);
							data_s = NULL;
						}
					}
					else
					{
						//申请空间
						hw_memcpy0(malloc_buf+offset,uvc_b->buf_ptr,uvc_b->blank_len);
						offset += uvc_b->blank_len;
					}

                }
                else
                {
                    _os_printf("=");
                }
                free_usb_node((struct list_head *)uvc_b);
				uvc_b = NULL;
				irq_time = 0;
            }   
            else
            {
                //释放cpu
                os_sleep_ms(1);
                irq_time++;
                if(irq_time>500)
                {
					_os_printf("&");
					os_printf("uvc_b:%X\n",uvc_b);
					if(uvc_b)
					{
						os_printf("busy:%d\n",uvc_b->busy);
					}

					os_printf("uvc_message:%X\t%d\n",uvc_message,uvc_message->frame_end);
					#if 1
                    if(usb_dma_irq_count == usb_dma_irq_times)
                    {
                        exit_err = 1;
                        os_printf("%s usb maybe disconnect\n",__FUNCTION__);
						os_printf("usb_dev:%X\n",uvc_arg->usb_dev);
                        //int32 usb_host_uvc_ioctl(struct usb_device *p_usb_d, uint32 cmd, uint32 param1, uint32 param2);
                        //usb_host_uvc_ioctl((struct usb_device *)uvc_arg->usb_dev, USB_HOST_IO_CMD_RESET,0,0);
						
						goto uvc_get_psram_err_deal;
                    }
					#else
					os_printf("%s usb maybe disconnect\n",__FUNCTION__);
					#endif

                    usb_dma_irq_count = usb_dma_irq_times;
					irq_time = 0;
                }
            }
		}


		if(err || !malloc_buf)
		{
			goto uvc_get_psram_err_deal;
		}

        if(uvc_message->frame_end == 2)
        {
			goto uvc_get_psram_err_deal;

        }
        else
        {
            //设置状态,等于发送frame
            if(data_s)
            {

				//这里代表图片收集完成,申请对应链表空间
				int get_f_count = 1;
				struct stream_jpeg_data_s *m = NULL;
				struct stream_jpeg_data_s *el;//,*tmp;
				struct stream_jpeg_data_s *dest_list = NULL;
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

				if(m)
				{
					el = m;
					//节点先添加
					el->data = (void*)malloc_buf;
					el->ref = 1;
					el->next = NULL;
					LL_APPEND(dest_list,el);
					malloc_buf = NULL;
				}
				//申请失败,那么去处理掉异常吧
				else
				{
					goto uvc_get_psram_err_deal;
				}

				data_s->data = dest_list;
				data_s->ref = 0;
				data_s->type = 1;
				set_stream_data_time(data_s,os_jiffies()); 
				struct jpg_frame_msg *j = (struct jpg_frame_msg*)data_s->priv;
				j->len = uvc_message->frame_len;
				j->malloc_mem = dest_list;
				current_photo_size = uvc_message->frame_len;

				if(current_photo_max_size < current_photo_size)
				{
					current_photo_max_size = current_photo_size;
				}
				//os_printf("current_photo_size:%d\tcurrent_photo_max_size:%d\n",current_photo_size,current_photo_max_size);
				send_data_to_stream(data_s);
				data_s = NULL;

            }
            del_uvc_frame(uvc_message); 
        }


		if(userdata->malloc_count_near < 2)
		{
			os_printf("malloc_max_size:%d\tcurrent_photo_max_size:%d\n",userdata->malloc_max_size,current_photo_max_size);
		}

		//这里用算法开始对malloc_max_size进行计算,尽量贴近申请的空间大小,在申请超过30次,并且没有调整过后,才考虑将
		//申请最大内存减少到合适位置,然后重新统计
		if(userdata->malloc_count_near > 30 && current_photo_max_size*1.1 < userdata->malloc_max_size)
		{
			//重新调整一下
			userdata->malloc_max_size = current_photo_max_size*1.1;
			current_photo_max_size = 0;
			userdata->malloc_count_near  = 0;
		}
		//重新统计一下
		else if(userdata->malloc_count_near > 30)
		{
			userdata->malloc_count_near = 0;
			current_photo_max_size = 0;
		}
		//一直要保证图片有10%的冗余度来容纳下一帧可能变化太大的情况,如果这一次调整了,则malloc_count_near清0
		else if(current_photo_max_size*1.1 > userdata->malloc_max_size)
		{
			userdata->malloc_max_size = current_photo_max_size*1.15;
			userdata->malloc_count_near  = 0;
		}






		//重新获取图片
		goto uvc_get_psram_again;

		
		//异常处理,可能是空间不够之类
	uvc_get_psram_err_deal:
		_os_printf("!");
        del_usb_frame(get_f);     
        del_uvc_frame(uvc_message);
        if(data_s)
        {
            force_del_data(data_s);
            data_s = NULL;
        }
		if(malloc_buf)
		{
			custom_free_psram(malloc_buf );
			malloc_buf = NULL;
		}
		//如果有必要,还要看看是不是usb断开,是不是应该退出线程


		//如果其他任务通知,可以在这里判断,然后退出
		if(uvc_arg->state == 2 || exit_err)
		{
			break;
		}
	}
	//代表任务退出,并且将流也退出
	usb_jpeg_psram_stream_deinit(s);
	//标志一下退出标志
	return;
}	




static uint32_t usb_jpg_custom_func_psram(void *data,int opcode,void *priv)
{
	uint32_t res = 0;
    uint32_t flags;
	switch(opcode)
	{
		case CUSTOM_GET_NODE_LEN:
        {
            struct data_structure  *d = (struct data_structure  *)data;
            struct jpg_frame_msg *j = (struct jpg_frame_msg*)d->priv;
            res = j->len;
        }
		break;
		case CUSTOM_GET_NODE_BUF:
			res = (uint32_t)priv;
		break;
		case CUSTOM_GET_FIRST_BUF:
		{
			struct stream_jpeg_data_s *dest_list = (struct stream_jpeg_data_s *)GET_DATA_BUF(data);
			//头是固定用,next才是真正的数据
			if(dest_list->next)
			{
				res =(uint32) dest_list->next->data;
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
                        custom_free_psram(el->data);
						el->data = NULL;
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
			    custom_free_psram(el->data);
				el->data = NULL;
            }
        }
		break;

		default:
		break;
	}
	return res;
}




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

static stream_ops_func stream_usb_jpg_ops = 
{
	.get_data_len = get_data_len,
	.custom_func = usb_jpg_custom_func_psram,
};

#define UVC_PSRAM_MALLOC_SIZE_INIT	(100*1024)
static struct os_task     uvc_task;
static int opcode_func_psram(stream *s,void *priv,int opcode)
{
	int res = 0;
	switch(opcode)
	{
		case STREAM_OPEN_ENTER:
		break;
		case STREAM_OPEN_EXIT:
		{

			//创建流成功,为流创建一个私有结构体,记录信息
			struct usb_jpg_userdata *userdata = (struct usb_jpg_userdata*)os_malloc(sizeof(struct usb_jpg_userdata));
			memset(userdata,0,sizeof(struct usb_jpg_userdata));
			//设置初始默认申请的最大空间
			userdata->malloc_max_size = UVC_PSRAM_MALLOC_SIZE_INIT;
			//记录申请时间以及
			userdata->malloc_time = os_jiffies();
			userdata->malloc_count_near = 0;
			userdata->uvc_arg = (struct uvc_user_arg *)priv;
			struct uvc_user_arg *uvc_arg = userdata->uvc_arg;
			

			s->priv = (void*)userdata;
			stream_data_dis_mem(s,2);
			streamSrc_bind_streamDest(s,R_RTP_JPEG);
			streamSrc_bind_streamDest(s,R_RECORD_JPEG);
			streamSrc_bind_streamDest(s,R_JPEG_TO_LCD);
			//启动jpeg流
			//extern void start_jpeg_stream();
			//start_jpeg_stream();
			//启动workqueue
			//OS_WORK_INIT(&usb_jpeg_stream_work, stream_get_usb_jpg_work_sram, 0);
			//os_run_work_delay(&usb_jpeg_stream_work, 1);

			//要判断一下,如果说任务创建失败,需要将流关闭一下,这里就默认任务创建成功
			uvc_arg->state = 1;
			OS_TASK_INIT("uvc_stream", &uvc_task, stream_get_usb_jpg_psram_thread, (uint32)s, OS_TASK_PRIORITY_ABOVE_NORMAL, 1024);
		}
		break;
		case STREAM_OPEN_FAIL:
		break;
		case STREAM_DATA_DIS:
		{
			struct data_structure *data = (struct data_structure *)priv;
			data->type = 0x10;//设置声音的类型,后续用宏代替
			//注册对应函数
			data->ops = &stream_usb_jpg_ops;
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
				data->priv = NULL;
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
					custom_free_psram(el->data);
					el->data = NULL;
				}
			}
			struct jpg_frame_msg *j = (struct jpg_frame_msg*)data->priv;
			if(j)
			{
				os_free(j->malloc_mem);
				j->malloc_mem = NULL;
			}
			data->data = NULL;
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
                    custom_free_psram(el->data);
					el->data = NULL;
                }
			}
			enable_irq(flags);

		}
		break;

		//退出,则关闭对应得流
		case STREAM_CLOSE_EXIT:
		{

			
		}
		break;

		case STREAM_DEL:
		{
			struct usb_jpg_userdata *userdata = (struct usb_jpg_userdata*)s->priv;
			struct uvc_user_arg *uvc_arg = userdata->uvc_arg;
			uvc_arg->state = 0;
		}

		default:
			//默认都返回成功
		break;
	}
	return res;
}


stream *usb_jpeg_psram_stream_init(struct uvc_user_arg *uvc_arg)
{
	stream *src = NULL;
	

    os_printf("%s:%d\n",__FUNCTION__,__LINE__);
	if(g_usb_jpeg_s)
	{
		return NULL;
	}
	
	src = open_stream_available(S_USB_JPEG_PSRAM,2,0,opcode_func_psram,uvc_arg);

	g_usb_jpeg_s = src;
	os_printf("src:%X\n",src);
	if(src)
	{
		os_printf("src open_ref:%d\n",src->open_ref);
	}
    return src;
}


void usb_jpeg_psram_stream_deinit(stream *s)
{
	int res;
	os_printf("%s g_usb_jpeg_s:%X\n",__FUNCTION__,g_usb_jpeg_s);
	if(g_usb_jpeg_s)
	{
		res = close_stream(g_usb_jpeg_s);
		os_printf("%s res:%d\n",__FUNCTION__,res);
		if(!res)
		{
			g_usb_jpeg_s = NULL;
		}
		
	}
}


//usb host枚举成功后会执行的这个函数
void usb_host_enum_finish_init()
{
	extern struct uvc_user_arg uvc_arg;
	uint32_t timeout = 0;
    if(uvc_arg.state == 1)
    {
        uvc_arg.state = 2;
    }
    while(uvc_arg.state != 0 || timeout > 3000)
    {
        os_sleep_ms(1);
		timeout++;
    }

	uvc_arg.state = 1;
	usb_jpeg_psram_stream_init(&uvc_arg);
}

int uvc_default_dpi()
{
    return UVC_720P;
}

#endif