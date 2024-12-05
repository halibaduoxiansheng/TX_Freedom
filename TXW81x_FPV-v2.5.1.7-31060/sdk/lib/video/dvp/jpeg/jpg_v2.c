#include "sys_config.h"
#include "tx_platform.h"
#include "list.h"
#include "dev.h"
#include "typesdef.h"
#include "lib/video/dvp/cmos_sensor/csi.h"
#include "devid.h"
#include "osal/irq.h"
#include "osal/string.h"
#include "lib/video/dvp/jpeg/jpg.h"
#include "hal/jpeg.h"
#include "dev/scale/hgscale.h"
#include "osal/semaphore.h"
#include "openDML.h"
#include "osal/mutex.h"
#include "custom_mem/custom_mem.h" 

#include "../../../../app/halibaduo/halibaduo.h"
//#include "media.h"
//#include "lib/common/common.h"

extern struct os_mutex m2m1_mutex;


#if JPG_EN


static uint8_t *global_jpg0_buf = NULL;
static uint8_t *global_jpg1_buf = NULL;



extern struct dvp_device *dvp_test;
extern uint8_t qc_mode;
extern Vpp_stream photo_msg;
extern uint8 *yuvbuf;
extern FIL fp_jpg;


struct list_head* get_frame(uint8 jpgid);


uint8 *psram_jpg0_buf;
uint8 *psram_jpg1_buf;


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

#define JPEG_FRAME_NUM     2


volatile struct list_head free_tab[JPG_NUM];			//空闲列表，存放空间节点

volatile struct list_head *jpg_p[JPG_NUM];			//jpg模块的节点指针
volatile struct list_head *usr_p[JPG_NUM];			//应用的节点指针

volatile jpeg_frame jpg_frame[JPG_NUM][JPEG_FRAME_NUM];			//最大frame数量
volatile struct list_head* jpg_f_p[JPG_NUM];			//当前jpg所使用的frame

volatile mjpeg_node jpg0_node_src[JPG0_NODE]; 
volatile mjpeg_node jpg1_node_src[JPG1_NODE];

volatile uint32 outbuff_isr[JPG_NUM] = {0x0,0x0};
volatile uint8 default_qt[JPG_NUM] = {0xf,0xf};
struct jpg_device *jpeg_dev_global[JPG_NUM];

volatile uint8 psram_example_buf[38548] __attribute__ ((aligned(4),section(".psram.src")));
extern uint8 psram_ybuf_src[IMAGE_H*IMAGE_W+IMAGE_H*IMAGE_W/2];

/**@brief 
 * 将传入的frame根节点下的buf池都送回空间池（free_tab）中
 */
bool free_get_node_list(volatile struct list_head *head,volatile struct list_head *free){
	if(list_empty((struct list_head *)head)){
		return 0;
	}	

	list_splice_init((struct list_head *)head,(struct list_head *)free);
	return 1;
}


/**@brief 
 * 从初始化的frame根节点中抽取其中一个空闲的根节点进行使用，并标记frame的使用状态为正在使用
 * @param 是否开启抢占模式，如果开启，则将上一帧已完成的帧节点删掉，并返回
 */


volatile struct list_head* get_new_frame_head(uint8 jpgnum,int grab){
	uint8 frame_num = 0;
	for(frame_num = 0;frame_num < JPEG_FRAME_NUM;frame_num++){
		if(jpg_frame[jpgnum][frame_num].usable == 0){
			jpg_frame[jpgnum][frame_num].usable = 1;
			return &jpg_frame[jpgnum][frame_num].list;
		}

	}

	if(grab)								//是否开启抢占模式,开启抢占后，肯定有frame返回，上一帧没使用的frame肯定usable为2
	{
		
		for(frame_num = 0;frame_num < JPEG_FRAME_NUM;frame_num++){
			if(jpg_frame[jpgnum][frame_num].usable == 2){
				jpg_frame[jpgnum][frame_num].usable = 1;
				free_get_node_list(&jpg_frame[jpgnum][frame_num].list,&free_tab[jpgnum]);
				return &jpg_frame[jpgnum][frame_num].list;
			}
		}
	}
	
	return 0;
}



/**@brief 
 * 获取当前frame根节点中保存成功的frame，返回根节点以供链表查询
 */

extern struct list_head *get_node(volatile struct list_head *head,volatile struct list_head *del);
extern uint32 get_addr(volatile struct list_head *list);



void set_frame_ready(jpeg_frame *jf){
	jf->usable = 2;
}


/**@brief 
 * 将传入的frame根节点状态调整为空闲，以供下次重新获取
 */
void del_frame(uint8 jpg_num,volatile struct list_head* frame_list)
{


	jpeg_frame* fl;
	uint32_t flags;
	if(list_empty((struct list_head *)frame_list) != TRUE){
		//NVIC_DisableIRQ(MJPEG01_IRQn);
	
		flags = disable_irq();
		free_get_node_list(frame_list,&free_tab[jpg_num]);
		fl = list_entry((struct list_head *)frame_list,jpeg_frame,list);
		fl->usable = 0;
		//NVIC_EnableIRQ(MJPEG01_IRQn);
		enable_irq(flags);
		return;		

	}else{
		//NVIC_DisableIRQ(MJPEG01_IRQn);
		flags = disable_irq();
		fl = list_entry((struct list_head *)frame_list,jpeg_frame,list);
		fl->usable = 0;
		enable_irq(flags);
		//NVIC_EnableIRQ(MJPEG01_IRQn);
		return;
	}


}


/**@brief 
 * 初始化free_tab池，将mjpeg_node的节点都放到空闲池中，供frame后面提取使用
 * @param ftb 空闲池头指针
 * @param jpn mjpeg_node节点源
 * @param use_num  mjpeg_node的数量，即多少个mjpeg_node放到空闲池
 * @param addr   mjpeg_node的总buf起始地址
 * @param buf_len  每个mjpeg_node所关联到的数据量
 */
void free_table_init(uint8 jpgnum,volatile struct list_head *ftb, volatile mjpeg_node* jpn,int use_num,uint32 addr,uint32 buf_len){
	int itk;
	for(itk = 0;itk < use_num;itk++){
		if(jpgnum == 0)
			jpn->buf_addr = (uint8*)(addr + itk*(buf_len+JPG0_TAIL_RESERVER)+JPG0_HEAD_RESERVER);
		else
			jpn->buf_addr = (uint8*)(addr + itk*(buf_len+JPG1_TAIL_RESERVER)+JPG1_HEAD_RESERVER);

		list_add_tail((struct list_head *)&jpn->list,(struct list_head *)ftb); 
		jpn++;
	}
}


/**@brief 
 * 从空间池中提取一个节点，放到队列中，并将此节点作为返回值返回
 */
struct list_head *get_node(volatile struct list_head *head,volatile struct list_head *del){
	if(list_empty((struct list_head *)del)){
		return 0;
	}

	list_move((struct list_head *)del->next,(struct list_head *)head);

	return head->next;				//返回最新的位置
}


int get_node_count(volatile struct list_head *head)
{
	int count = 0;
	struct list_head *first = (struct list_head *)head;
	while(head->next != first)
	{
		head = head->next;
		count++;
	}

	return count;				//返回最新的位置
}



/**@brief 
 * 从当前使用的节点回放到消息池中
 */
bool put_node(volatile struct list_head *head,volatile struct list_head *del){
	//portINIT_CRITICAL();
	if(list_empty((struct list_head *)del)){
		return 0;
	}
	uint32_t flags;
	flags = disable_irq();
	//NVIC_DisableIRQ(MJPEG01_IRQn);
	list_move(del->next,(struct list_head *)head);
	enable_irq(flags);
	//NVIC_EnableIRQ(MJPEG01_IRQn);

	return 1;
}

/**@brief 
 * 获取当前jpeg节点buf地址进行返回
 */
uint32 get_addr(volatile struct list_head *list){
	mjpeg_node* mjn;
	mjn = list_entry((struct list_head *)list,mjpeg_node,list);
	return (uint32)mjn->buf_addr;
}



void jpg_DQT_updata(struct jpg_device *p_jpg,uint8 upOdown){
	uint32 *ptable;
	static uint8 pdqt_tab = DQT_DEF;
	if(upOdown == 1){
		pdqt_tab--;
		if(pdqt_tab == 0xff)
			pdqt_tab = 0;
	}else{
		pdqt_tab++;
		if(pdqt_tab == 6)
			pdqt_tab = 5;
	}
	
	ptable = (uint32*)quality_tab[pdqt_tab];
	jpg_updata_dqt(p_jpg,ptable);
}


extern volatile  uint32 hs_isr;
volatile uint8 rtp_speed = 0;     //1:降低    2:提升

uint8 jpg_quality_tidy(uint8 jpgnum,uint32 len){
	uint8 updata_dqt = 0;
	if(qc_mode){
		if(len >= 15*1024){
			default_qt[jpgnum]++;
			if(default_qt[jpgnum] == 0x10){
				default_qt[jpgnum] = 0x8;
				updata_dqt = 2;
			}
		}else if(len <= 5*1024){
			default_qt[jpgnum]--;	
			if(default_qt[jpgnum] == 0){
				default_qt[jpgnum] = 8;	
				updata_dqt = 1;
			}	
		}		
		return updata_dqt;
	}	
#if 1
	if(len >= 25*1024){
		default_qt[jpgnum]++;
		if(default_qt[jpgnum] == 0x10){
			default_qt[jpgnum] = 0x8;
			updata_dqt = 2;
		}
	}else if(len <= 15*1024){
		default_qt[jpgnum]--;	
		if(default_qt[jpgnum] == 0){
			default_qt[jpgnum] = 8;	
			updata_dqt = 1;
		}	
	}
#else

	if(len >= 35*1024){
		default_qt++;
		if(default_qt == 0x10){
			default_qt = 0x8;
			updata_dqt = 2;
		}		
	}else{
		if(rtp_speed == 1){
			default_qt++;
			if(default_qt == 0x10){
				default_qt = 0x8;
				updata_dqt = 2;
			}
		}else if(rtp_speed == 2){
			default_qt--;	
			if(default_qt == 0){
				default_qt = 8; 
				updata_dqt = 1;
			}
		}
		rtp_speed = 0;
	}
#endif
	return updata_dqt;
}



//获取实际内容buf的长度
int get_jpg_node_len(uint8 jpg_num)
{
	if(jpg_num == 0)
	{
		return JPG0_BUF_LEN-JPG0_HEAD_RESERVER;
	}
	else
	{
		return JPG1_BUF_LEN-JPG1_HEAD_RESERVER;
	}
}



uint32 get_jpg_node_len_new(void *get_f)
{
	jpeg_frame* jpg_frame = (jpeg_frame*)get_f;
	if(jpg_frame->jpg_num == 0)
		return JPG0_BUF_LEN-JPG0_HEAD_RESERVER;
	else
		return JPG1_BUF_LEN-JPG1_HEAD_RESERVER;
}

extern volatile uint8 scale_take_photo;


#if 0
extern uint8 video_psram_mem[616320];
extern uint8 video_psram_mem1[616320];

void location_reset(uint8_t *inbuf,uint8_t *outbuf,int x,int y,int w){
	int xn,yn;
	uint8_t yd,ud,vd;
	//float angle;
	//angle = (30*3.14)/180;
	y = y*-1;
	xn = (x * 866 - y * 499)/1000;
	yn = (x * 499 + y * 866)/1000;
	yn = yn*-1;
	
	if(xn < 0){
		return;
	}

	if(xn > 640){
		return;
	}

	if(yn < 0){
		return;
	}

	//yd = inbuf[x+y*w];
	//ud = inbuf[307200+x/2+(y/2)*320];
	//vd = inbuf[384000+x/2+(y/2)*320];

	
	outbuf[xn+yn*w]               = inbuf[x+y*w];
	outbuf[307200+xn/2+(yn/2)*320]= inbuf[307200+x/2+(y/2)*320];
	outbuf[384000+xn/2+(yn/2)*320]= inbuf[384000+x/2+(y/2)*320];
	//if(xn+1 < 640)
	{
		if((unsigned char)outbuf[xn+1+yn*w] == 0x80){
			outbuf[xn+1+(int)yn*w]                    = inbuf[x+y*w];
			//if((xn+1)%2 == 0){
			//	outbuf[307200+xn/2+1+(yn/2)*320]	   = ud;
			//	outbuf[384000+xn/2+1+(yn/2)*320]= vd;
			//}
			
		}
	}
	
}
#endif

#if 0
//认证或者用户学习使用
void jpeg_user(uint32* pixel_itp)				//应用层
{
	//#define TAKE_PHOTO_HIGH    1080//1080//2560//4320
	//#define TAKE_PHOTO_WIDTH   1920//1920//3840//7680
	uint16_t itp_w,itp_h;
	uint8_t  continous_spon;
	struct scale_device *scale_dev;
	struct lcdc_device *lcd_dev;
	struct vpp_device *vpp_dev;
	uint8  jpg_chose;
	uint32 pingpang = 0;
	uint32 count = 0;
	uint32 flen;
	uint32 itk;
	struct list_head* get_f;
	mjpeg_node* mjn;
	jpeg_frame* jpf;
	uint8 printf_dat = 0;
	struct jpg_device *jpeg_dev;
	jpeg_dev = (struct jpg_device *)dev_get(HG_JPG0_DEVID);	
	scale_dev = (struct scale_device *)dev_get(HG_SCALE1_DEVID);
	lcd_dev = (struct lcdc_device *)dev_get(HG_LCDC_DEVID);
	vpp_dev = (struct vpp_device *)dev_get(HG_VPP_DEVID);
	itp_w = pixel_itp[0]&0xffff;
	itp_h = (pixel_itp[0]>>16)&0xffff;
	continous_spon = pixel_itp[1];
	scale_close(scale_dev);
	jpg_close(jpeg_dev);
	os_sleep_ms(100);
	jpg_cfg(HG_JPG0_DEVID,SCALER_DATA);
	_os_printf("itp_w:%d itp_h:%d   continous_spon:%d\r\n",itp_w,itp_h,continous_spon);
	photo_msg.out0_w = itp_w;
	photo_msg.out0_h = itp_h;
	jpg_start(HG_JPG0_DEVID);
	if(itp_h <= 720){
		scale_from_vpp_to_jpg(scale_dev,yuvbuf,photo_msg.in_w,photo_msg.in_h,itp_w,itp_h);
	}

	while(1){
		if(itp_h > 720){
			if(m2m1_mutex.magic == 0xa8b4c2d5)
				os_mutex_lock(&m2m1_mutex,osWaitForever);
			
			lcdc_video_enable_auto_ks(lcd_dev,1);
			scale_from_soft_to_jpg(scale_dev,psram_ybuf_src,photo_msg.in_w,photo_msg.in_h,itp_w,itp_h);
			scale_take_photo = 0;
			while(scale_take_photo == 0){
				os_sleep_ms(2);
			}

			if(m2m1_mutex.magic == 0xa8b4c2d5)
				os_mutex_unlock(&m2m1_mutex);
			
			os_sleep_ms(10);
			lcdc_video_enable_auto_ks(lcd_dev,0);
			vpp_open(vpp_dev);	
		}

		
		get_f = get_frame(HG_JPG0_DEVID);
		jpg_chose = 0;

		if(get_f){
			fatfs_create_jpg();
			_os_printf("usr(%d)====>get_f:%x\r\n",jpg_chose,(uint32)get_f);
			count++;
			usr_p[jpg_chose] = get_f;
			
			jpf = list_entry(get_f,jpeg_frame,list);
			flen = jpf->frame_len;
			
			_os_printf("flen_write:%d\r\n",flen);
			while(list_empty((struct list_head *)usr_p[jpg_chose]) != TRUE)
			{
				mjn = list_entry((struct list_head *)usr_p[jpg_chose]->next,mjpeg_node,list);
				
				//_os_printf("mjn:%x\r\n",mjn);
				/*
					此处使用当前mjn，获取节点对应的buf数据位置，对数据进行处理
				*/
				if(jpg_chose){
					if(flen > JPG1_BUF_LEN){
						//fatfs_write_data(mjn->buf_addr,JPG1_BUF_LEN);
						osal_fwrite(mjn->buf_addr,1,JPG1_BUF_LEN,&fp_jpg);
						flen -= get_jpg_node_len(jpg_chose);
					}
					else{
						//for(itk = 0;itk < flen+JPG1_HEAD_RESERVER;itk++){
						//	_os_printf("%02x ",mjn->buf_addr[itk-JPG1_HEAD_RESERVER]);
						//}
						//fatfs_write_data(mjn->buf_addr,flen);
						osal_fwrite(mjn->buf_addr,1,flen,&fp_jpg);
						flen = 0;
					}
				}else{
					if(flen > JPG0_BUF_LEN){
						//for(itk = 0;itk < JPG0_BUF_LEN;itk++){
						//	_os_printf("%02x ",mjn->buf_addr[itk-JPG0_HEAD_RESERVER]);
						//}
						//fatfs_write_data(mjn->buf_addr,JPG0_BUF_LEN);
						osal_fwrite(mjn->buf_addr,1,JPG0_BUF_LEN,&fp_jpg);
						flen -= get_jpg_node_len(jpg_chose);
					}
					else{
						//for(itk = 0;itk < flen+JPG0_HEAD_RESERVER;itk++){
						//	_os_printf("%02x ",mjn->buf_addr[itk-JPG0_HEAD_RESERVER]);
						//}
						//fatfs_write_data(mjn->buf_addr,flen);
						osal_fwrite(mjn->buf_addr,1,flen,&fp_jpg);
						flen = 0;
					}
				}								
				put_node(&free_tab[jpg_chose],usr_p[jpg_chose]);				//节点归还到free_tab,边处理边给下一帧释放空间
			}
			_os_printf("flen_write_end:%d\r\n",flen);
			del_frame(jpg_chose,usr_p[jpg_chose]);							//删除frame
			fatfs_close_jpg();
			if(count == continous_spon)
				break;
		}
	}
	csi_kernel_task_del(csi_kernel_task_get_cur());
}
#endif
extern void take_photo_thread(void *d);
uint32_t takephoto_arg[3] = {0};
void take_photo_thread_init(uint16_t w,uint16_t h,uint8_t continuous_spot){
	k_task_handle_t photo_task_handle;
	takephoto_arg[0] = (w&0xffff) | ((h<<16)&0xffff0000);
	takephoto_arg[1] = continuous_spot;
	takephoto_arg[2] = 1;
    csi_kernel_task_new((k_task_entry_t)take_photo_thread, "take_photo_thread", &takephoto_arg, 10, 0, NULL, 1024, &photo_task_handle);
}

uint32_t get_takephoto_thread_status()
{
	return takephoto_arg[2];
}




void jpg_room_init(uint8 jpgnum){
	//INIT_LIST_HEAD(&jpg_node);
	uint8 *buf; 

	if(jpgnum == 0)
	{

		if(global_jpg0_buf)
		{
			os_printf("0please custom_free jpg_buf when custom_malloc again\n");
			return ;
		}

		#ifdef PSRAM_HEAP
		buf = (uint8*)custom_malloc_psram(JPG0_NODE*(JPG0_BUF_LEN+JPG0_TAIL_RESERVER));
		#else
		buf = (uint8*)custom_malloc(JPG0_NODE*(JPG0_BUF_LEN+JPG0_TAIL_RESERVER));
		#endif
		global_jpg0_buf = buf;	
		//sys_dcache_clean_invalid_range((void *)buf, JPG0_NODE*(JPG0_BUF_LEN+JPG0_TAIL_RESERVER));	
	}
	else
	{

		if(global_jpg1_buf)
		{
			os_printf("1please custom_free jpg_buf when custom_malloc again\n");
			return ;
		}
		#ifdef PSRAM_HEAP
		buf = (uint8*)custom_malloc_psram(JPG1_NODE*(JPG1_BUF_LEN+JPG1_TAIL_RESERVER));
		#else
		buf = (uint8*)custom_malloc(JPG1_NODE*(JPG1_BUF_LEN+JPG1_TAIL_RESERVER));
		#endif
		global_jpg1_buf = buf;
		//sys_dcache_clean_invalid_range((void *)buf, JPG1_NODE*(JPG1_BUF_LEN+JPG1_TAIL_RESERVER));
	}

	while(!buf)
	{
		os_printf("%s:%d\n",__FUNCTION__,__LINE__);
		os_sleep_ms(1000);
	}
	
	INIT_LIST_HEAD((struct list_head *)&jpg_frame[jpgnum][0].list);
	INIT_LIST_HEAD((struct list_head *)&jpg_frame[jpgnum][1].list);
	INIT_LIST_HEAD((struct list_head *)&free_tab[jpgnum]);

	if(jpgnum == 0)
		free_table_init(jpgnum,&free_tab[jpgnum],(mjpeg_node*)&jpg0_node_src,JPG0_NODE,(uint32)buf,JPG0_BUF_LEN);
	else
		free_table_init(jpgnum,&free_tab[jpgnum],(mjpeg_node*)&jpg1_node_src,JPG1_NODE,(uint32)buf,JPG1_BUF_LEN);
	jpg_frame[jpgnum][0].usable = 0;
	jpg_frame[jpgnum][1].usable = 0;




	jpg_frame[jpgnum][0].jpg_num = jpgnum;
	jpg_frame[jpgnum][1].jpg_num = jpgnum;


	jpg_f_p[jpgnum] = get_new_frame_head(jpgnum,1);								//预先分配第一frame，待帧结束的时候再分配下一frame			
	jpg_p[jpgnum] = jpg_f_p[jpgnum];
}


uint8_t jpg_room_deinit(uint8 jpgnum)
{
	if(jpgnum == 0)
	{
		if(global_jpg0_buf)
		{
			#ifndef PSRAM_HEAP
			custom_free(global_jpg0_buf);
			#else
			custom_free_psram(global_jpg0_buf);
			#endif
			global_jpg0_buf = NULL;
		}
	}
	else if(jpgnum == 1)
	{
		if(global_jpg1_buf)
		{
			#ifndef PSRAM_HEAP
			custom_free(global_jpg1_buf);
			#else
			custom_free_psram(global_jpg1_buf);
			#endif
			global_jpg1_buf = NULL;
		}
	}

	return TRUE;
}


/*********************************
			获取分辨率
0:无效
1:vga(640x480)
2:720p(1280x720)
*********************************/
uint8 get_camera_dpi()
{
	return 1;
}


void jpg_outbuff_full_isr(uint32 irq_flag,uint32 irq_data,uint32 param1,uint32 param2){
	uint8 jpg_chose;
	uint32 addr;
	struct jpg_device *p_jpg = (struct jpg_device *)irq_data;
	if(p_jpg == jpeg_dev_global[0]){
		jpg_chose = 0;
	}else{
		jpg_chose = 1;
	}

	sensor_ols.offline_flag = 0;
	
	
	if(outbuff_isr[jpg_chose] != 0xff)
		outbuff_isr[jpg_chose]++;
	else
		return;


	
	jpg_p[jpg_chose] = get_node(jpg_p[jpg_chose],&free_tab[jpg_chose]);
	if(jpg_p[jpg_chose] == NULL){
		outbuff_isr[jpg_chose] = 0xff;
		return;
	}

//	if((jpg_addr_num%2) == 0){
//		data_cmp_u32(jpg_addr0,psram_example_buf+1284*jpg_addr_num,1284);
//	}else{	
//		data_cmp_u32(jpg_addr1,psram_example_buf+1284*jpg_addr_num,1284);
//	}

//	jpg_addr_num++;

	
	addr = get_addr(jpg_p[jpg_chose]);
	jpg_set_addr(p_jpg,addr,get_jpg_node_len(jpg_chose));
	sys_dcache_clean_invalid_range((uint32_t *)addr, get_jpg_node_len(jpg_chose));
	//os_printf("OF-%x \r\n",addr);
//	if((jpg_addr_num%2) == 1){
//		jpg_addr0 = addr;
//	}else{
//		jpg_addr1 = addr;
//	}
}

void jpg_buf_err(uint32 irq_flag,uint32 irq_data,uint32 param1,uint32 param2){
	uint8 jpg_chose;
	struct scale_device *scale_dev;
	uint32 addr;
	struct jpg_device *p_jpg = (struct jpg_device *)irq_data;
	scale_dev = (struct scale_device *)dev_get(HG_SCALE1_DEVID);
	if(p_jpg == jpeg_dev_global[0]){
		jpg_chose = 0;
	}else{
		jpg_chose = 1;
	}
	jpg_close(p_jpg);

	sensor_ols.offline_flag =0;

	if(jpg_chose == 0)
		scale_close(scale_dev);
//	dvp_close(dvp_test);	
	_os_printf("(%d)?\r\n",jpg_chose);
	del_frame(jpg_chose,jpg_f_p[jpg_chose]);
	
	jpg_f_p[jpg_chose] = get_new_frame_head(jpg_chose,1);
	jpg_p[jpg_chose] = jpg_f_p[jpg_chose];
	outbuff_isr[jpg_chose] = 0;

	jpg_p[jpg_chose] = get_node(jpg_p[jpg_chose],&free_tab[jpg_chose]);							//预分配的两个buf地址，帧结束的时候要去掉一个预分配节点
	if(jpg_p[jpg_chose] == NULL){
		_os_printf("need more node for new frame start1\r\n");
		while(1);
	}
	//p_jpg->DMA_TADR0 = get_addr(jpg_p);
	addr = get_addr(jpg_p[jpg_chose]);
	//jpg_set_addr0(p_jpg,addr);
	jpg_set_addr(p_jpg,addr,get_jpg_node_len(jpg_chose));
	sys_dcache_clean_invalid_range((uint32_t *)addr, get_jpg_node_len(jpg_chose));
	jpg_p[jpg_chose] = get_node(jpg_p[jpg_chose],&free_tab[jpg_chose]);
	if(jpg_p[jpg_chose] == NULL){
		_os_printf("need more node for new frame start2\r\n");
		while(1);		
	}	
	//p_jpg->DMA_TADR1 = get_addr(jpg_p);	
	addr = get_addr(jpg_p[jpg_chose]);
	//jpg_set_addr1(p_jpg,addr);
	jpg_set_addr(p_jpg,addr,get_jpg_node_len(jpg_chose));
	sys_dcache_clean_invalid_range((uint32_t *)addr, get_jpg_node_len(jpg_chose));
	jpg_open(p_jpg);
	if(jpg_chose == 0)
		scale_open(scale_dev);	
		
		
	uint32 jpg_len; 
	jpg_len = param1;
	uint8 default_qt_last;
	uint8 updata_dqt = 0;
	default_qt_last = default_qt[jpg_chose];
	updata_dqt = jpg_quality_tidy(jpg_chose,jpg_len);
	if(default_qt_last != default_qt[jpg_chose]){
		jpg_set_qt(p_jpg,default_qt[jpg_chose]);
	}
	if(updata_dqt)
		jpg_DQT_updata(p_jpg,updata_dqt);

//	dvp_open(dvp_test);

	
}

void jpg_done_isr(uint32 irq_flag,uint32 irq_data,uint32 param1,uint32 param2){
	uint8 jpg_chose;
	struct jpg_device *p_jpg = (struct jpg_device *)irq_data;

	uint32 addr;
	jpeg_frame* jf;
	uint8 out_buf_num_err = 0;
	uint8 updata_dqt = 0;
	uint8 default_qt_last;
	uint32 jpg_len; 
	if(p_jpg == jpeg_dev_global[0]){
		jpg_chose = 0;
	}else{
		jpg_chose = 1;
	}	
	
	sensor_ols.offline_flag = 0;
	
	jpg_len = param1;//jpg_get_len(p_jpg);
	//os_printf("len(%d)=>:%d ",jpg_chose,jpg_len);
	//if(outbuff_isr !=  jpg_get_outbuf_num(p_jpg))
	if(param2||(outbuff_isr[jpg_chose] == 255)){
		os_printf("jpg done len err:%d\r\n",outbuff_isr[jpg_chose]);
		out_buf_num_err = 1;
	}
	default_qt_last = default_qt[jpg_chose];
	updata_dqt = jpg_quality_tidy(jpg_chose,jpg_len);
	if(default_qt_last != default_qt[jpg_chose]){
		jpg_set_qt(p_jpg,default_qt[jpg_chose]);
	}

	if(get_node_count(&free_tab[jpg_chose])<2)
	{
		outbuff_isr[jpg_chose] = 0xff;
	}
/**/
	if(jpg_len < outbuff_isr[jpg_chose] * get_jpg_node_len(jpg_chose)){
		os_printf("BUF len err:%d  %d\r\n",jpg_len,outbuff_isr[jpg_chose] * get_jpg_node_len(jpg_chose));
		del_frame(jpg_chose,jpg_f_p[jpg_chose]);
	}else if(outbuff_isr[jpg_chose] == 0xff){
		os_printf("outbuff_isr err,no room\r\n");
		del_frame(jpg_chose,jpg_f_p[jpg_chose]);
	}else if(out_buf_num_err){
		os_printf("out_buf_num_err happen\r\n");
		del_frame(jpg_chose,jpg_f_p[jpg_chose]);
	}
	else{
		//帧OK
			
		jf = list_entry((struct list_head *)jpg_f_p[jpg_chose],jpeg_frame,list);
		jf->frame_len = jpg_len;
		
		//因为有预分配机制，所以要先去掉最后一个节点
		put_node(&free_tab[jpg_chose],jpg_p[jpg_chose]->prev);
		set_frame_ready(jf);	
		//os_printf("jf_ready:%x jpg_chose:%d\r\n",jf,jpg_chose);
	}

	jpg_f_p[jpg_chose] = get_new_frame_head(jpg_chose,1);
	//os_printf("jpg_f_p[jpg_chose]:%X\n",jpg_f_p[jpg_chose]);
	jpg_p[jpg_chose] = jpg_f_p[jpg_chose];
	outbuff_isr[jpg_chose] = 0;
	//再设置DMA地址
	jpg_p[jpg_chose] = get_node(jpg_p[jpg_chose],&free_tab[jpg_chose]);							//预分配的两个buf地址，帧结束的时候要去掉一个预分配节点
	if(jpg_p[jpg_chose] == NULL){
		_os_printf("need more node for new frame start1\r\n");
		while(1);
	}
	//p_jpg->DMA_TADR0 = get_addr(jpg_p);
	addr = get_addr(jpg_p[jpg_chose]);
	jpg_set_addr(p_jpg,addr,get_jpg_node_len(jpg_chose));
	sys_dcache_clean_invalid_range((uint32_t *)addr, get_jpg_node_len(jpg_chose));
	jpg_p[jpg_chose] = get_node(jpg_p[jpg_chose],&free_tab[jpg_chose]);
	if(jpg_p[jpg_chose] == NULL){
		_os_printf("need more node for new frame start2\r\n");
		while(1);		
	}	
	//os_printf("addr:%x \r\n",addr);
	addr = get_addr(jpg_p[jpg_chose]);
	jpg_set_addr(p_jpg,addr,get_jpg_node_len(jpg_chose));
	sys_dcache_clean_invalid_range((uint32_t *)addr, get_jpg_node_len(jpg_chose));
	if(updata_dqt)
		jpg_DQT_updata(p_jpg,updata_dqt);


}

#if PRC_EN
	void jpg_pixel_done(uint32 irq_flag,uint32 irq_data,uint32 param1,uint32 param2){
		
	}
#endif

void jpg_config_addr(struct jpg_device *p_jpg,uint8 jpgnum){
	uint32 addr;
	jpg_p[jpgnum] = get_node(jpg_p[jpgnum],&free_tab[jpgnum]);							//预分配的两个buf地址，帧结束的时候要去掉一个预分配节点
	addr = get_addr(jpg_p[jpgnum]);
	jpg_set_addr(p_jpg,addr,get_jpg_node_len(jpgnum));
	sys_dcache_clean_invalid_range((uint32_t *)addr, get_jpg_node_len(jpgnum));
	jpg_p[jpgnum] = get_node(jpg_p[jpgnum],&free_tab[jpgnum]);
	addr = get_addr(jpg_p[jpgnum]);
	jpg_set_addr(p_jpg,addr,get_jpg_node_len(jpgnum));	
	sys_dcache_clean_invalid_range((uint32_t *)addr, get_jpg_node_len(jpgnum));
}

void jpg_isr_init(struct jpg_device *p_jpg){
	jpg_request_irq(p_jpg,(jpg_irq_hdl )&jpg_outbuff_full_isr,JPG_IRQ_FLAG_JPG_BUF_FULL,p_jpg);
	jpg_request_irq(p_jpg,(jpg_irq_hdl )&jpg_buf_err,JPG_IRQ_FLAG_ERROR,p_jpg);		
	jpg_request_irq(p_jpg,(jpg_irq_hdl )&jpg_done_isr,JPG_IRQ_FLAG_JPG_DONE,p_jpg);
#if	PRC_EN
	jpg_request_irq(p_jpg,(jpg_irq_hdl )&jpg_pixel_done,JPG_IRQ_FLAG_PIXEL_DONE,p_jpg);
#endif
	NVIC_EnableIRQ(MJPEG01_IRQn);
}

void jpg_cfg(uint8 jpgid,enum JPG_SRC_FROM src_from){
	uint8 jpg_chose;
	//uint32 itk,jtk;
	_os_printf("JPG start\r\n");
	struct jpg_device *jpeg_dev;
	if(jpgid == HG_JPG0_DEVID)
		jpg_chose = 0;
	else
		jpg_chose = 1;	
	
	jpeg_dev = (struct jpg_device *)dev_get(jpgid);	
	jpeg_dev_global[jpg_chose] = jpeg_dev;
	jpg_room_init(jpg_chose);

//jpg table init
	jpg_init(jpeg_dev,DQT_DEF,default_qt[jpg_chose]);
	
//jpg config
	jpg_config_addr(jpeg_dev,jpg_chose);
	
	jpg_set_data_from(jpeg_dev,src_from);
	jpg_set_hw_check(jpeg_dev,1);
//jpg int init
	jpg_isr_init(jpeg_dev);
	jpg_room_deinit(jpg_chose);
#if 0
	memset(video_psram_mem,0x80,sizeof(video_psram_mem));
	_os_printf("start:%d\r\n",os_jiffies());
	for(jtk = 0;jtk < 480;jtk++){
		for(itk = 0;itk < 640;itk++){
			location_reset(video_psram_mem1,video_psram_mem,(int)itk,(int)jtk,640);
		}
		//_os_printf("cal:%d %d\r\n",itk,jtk);
	}
	_os_printf("end:%d\r\n",os_jiffies());
#endif

}


//jpg重新配置
void jpg_recfg(uint8 jpg_num)
{
	uint32_t jpg_id;
	jpg_id = jpg_num + HG_JPG0_DEVID;

	jpg_room_init(jpg_num);
	struct jpg_device *jpeg_dev;
	jpeg_dev = (struct jpg_device *)dev_get(jpg_id);	
	jpg_config_addr(jpeg_dev,jpg_num);
}



void jpg_start(uint8 jpg_num){
	struct jpg_device *jpeg_dev;
	uint32_t jpgid;
	jpgid = jpg_num + HG_JPG0_DEVID;
	jpeg_dev = (struct jpg_device *)dev_get(jpgid);	

	//jpg csr config
	if(jpgid == HG_JPG0_DEVID){
		jpg_set_size(jpeg_dev,photo_msg.out0_h,photo_msg.out0_w);
	}
	else{
		jpg_set_size(jpeg_dev,photo_msg.out0_h,photo_msg.out0_w);
	}
	jpg_open(jpeg_dev);	
}

void jpg_stop(uint32_t jpg_num)
{
	uint32_t jpg_id;
	jpg_id = jpg_num + HG_JPG0_DEVID;
	struct jpg_device *jpeg_dev;
	jpeg_dev = (struct jpg_device *)dev_get(jpg_id);	
	jpg_close(jpeg_dev);
	jpg_room_deinit(jpg_num);
}



void del_jpeg_frame(void *d)
{
	jpeg_frame* get_f = (jpeg_frame*)d;
	del_frame(get_f->jpg_num,(struct list_head*)get_f);

}

struct list_head* get_frame(uint8 jpgid)
{
	uint8 frame_num = 0;
	uint8 jpg_chose;
	if(jpgid == HG_JPG0_DEVID)
		jpg_chose = 0;
	else
		jpg_chose = 1;
	
	for(frame_num = 0;frame_num < JPEG_FRAME_NUM;frame_num++){
		if(jpg_frame[jpg_chose][frame_num].usable == 2){
			jpg_frame[jpg_chose][frame_num].usable = 1;
			return (struct list_head *)&jpg_frame[jpg_chose][frame_num].list;
		}
	}

	return NULL;	
}

uint32 get_jpeg_len(void *d)
{
	uint32 flen;
	struct list_head* get_f = (struct list_head*)d;
	jpeg_frame* jpf;
	jpf = list_entry(get_f,jpeg_frame,list);
	flen = jpf->frame_len;
	//_os_printf("%s:%d\tflen:%d\n",__FUNCTION__,__LINE__,flen);

	return flen;
}



void *get_jpeg_first_buf(void *d)
{
	struct list_head* get_f = (struct list_head*)d;
	mjpeg_node* mjn;
	mjn = list_entry(get_f->next,mjpeg_node,list);
	if(mjn)
	{
		return mjn->buf_addr;
	}
	return NULL;
} 
 
int del_jpeg_first_node(void *d)
{	
	jpeg_frame* get_f = (jpeg_frame*)d;
	put_node(&free_tab[get_f->jpg_num],(struct list_head*)get_f);
	
	return 0;	
}
 
void *get_jpeg_node_buf(void *d)
{
	struct list_head* get_f = (struct list_head*)d;
	mjpeg_node* mjn;
	mjn = list_entry(get_f,mjpeg_node,list);
	if(mjn)
	{
		return mjn->buf_addr;
	}
	return NULL;
}


//删除节点,是实际节点
void del_jpeg_node(void *d,uint32_t jpg_num)
{
	uint32_t flags;
	struct list_head* get_f = (struct list_head *)d;
	flags = disable_irq();
	list_add_tail(get_f,(struct list_head*)&free_tab[jpg_num]);
	enable_irq(flags);
}






#endif

