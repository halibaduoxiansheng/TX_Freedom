#include "sys_config.h"
#include "typesdef.h"
#include "lib/lcd/lcd.h"
#include "lib/lcd/gui.h"
#include "lib/video/dvp/cmos_sensor/csi.h"
#include "dev.h"
#include "devid.h"
#include "hal/gpio.h"
#include "hal/lcdc.h"
#include "hal/spi.h"
#include "osal/irq.h"
#include "osal/string.h"
#include "dev/vpp/hgvpp.h"
#include "dev/scale/hgscale.h"
#include "dev/jpg/hgjpg.h"
#include "dev/lcdc/hglcdc.h"
#include "osal/semaphore.h"
#include "hal/uart.h"
#include "lib/lcd/lcd.h"
#include "lv_demo_benchmark.h"
#include "hal/adc.h"

#include "osal/msgqueue.h"
#include "keyWork.h"
#include "keyScan.h"

struct os_msgqueue lvgl_key_msgq;


void lv_init(void);
void lv_port_disp_init(void);
void lv_port_indev_init(void);
void lv_time_set();
void lv_page_init();
void lv_page_select(uint8_t page);
lcd_msg lcd_info;
gui_msg gui_cfg;
extern uint8_t disp_updata;
uint8_t uart4_buf[16];
uint8_t uart4_buf_result[16];
//uint8_t *osd_encode_buf;
//uint8_t *osd_encode_buf1;
uint8_t osd_encode_buf[110*1024] __attribute__ ((aligned(4),section(".psram.src")));
uint8_t osd_encode_buf1[110*1024] __attribute__ ((aligned(4),section(".psram.src")));

extern uint8_t osd_menu565_buf[SCALE_HIGH*SCALE_WIDTH*2];
extern Vpp_stream photo_msg;
//lcd信号量创建
static struct os_semaphore lcd_sem   = {0,NULL};




void lcd_sema_init()
{
	os_sema_init(&lcd_sem,0);
}

void lcd_sema_down(int32 tmo_ms)
{
	os_sema_down(&lcd_sem,tmo_ms);
	//printf("$\n");
}

void lcd_sema_up()
{
	os_sema_up(&lcd_sem);
	//printf("@\n");
}

extern int globa_play_key_sound();


uint32_t key_get_data()
{
	uint32_t key_ret = 0x30;
	#if KEY_MODULE_EN == 1
	uint32_t val = os_msgq_get(&lvgl_key_msgq,0);
	if(val > 0)
	{
		os_printf("lvgl keyval:%02X\n",val);
		if((val&0xff) ==   KEY_EVENT_SUP)
		{
			switch(val>>8)
			{
				case AD_UP:
					key_ret += 2;
				break;
				case AD_DOWN:
					key_ret += 1;
				break;
				case AD_LEFT:
					key_ret += 2;
				break;
				case AD_RIGHT:
					key_ret += 1;
				break;
				case AD_PRESS:
					key_ret += 5;
				break;
				case AD_A:
				break;
				case AD_B:

				break;
				case AD_C:

				break;
				default:
				break;

			}
		}
	}
	#endif
	return key_ret;
}

void lvgl_run(){
	uint32 lvgl_len;
	uint32 cur_tick;
	uint8 sleep_time;
	//uint32 itk;
	uint32_t flags;
	struct lcdc_device *lcd_dev;	
	lcd_sema_init();
	lvgl_len = SCALE_WIDTH*SCALE_HIGH;//320*240;//	
	lcd_dev = (struct lcdc_device *)dev_get(HG_LCDC_DEVID);
	cur_tick = os_jiffies();
	sleep_time = 10;
	while(1){
		os_sleep_ms(sleep_time);	
		lv_tick_inc(os_jiffies() - cur_tick);
		cur_tick = os_jiffies();
        lv_timer_handler();
		if(disp_updata == 1){
			flags = disable_irq();	
			//__BKPT();
			//lcd_osd_tran_config(0xFFFFFF,0xFFFBFF,0x000000,0x000000);
			
			if(lcd_info.osd_buf_to_lcd == 0){		
				//lcd_osd_encode_cfg(osd_menu565_buf,lvgl_len*2,osd_encode_buf1);
				lcdc_set_osd_enc_src_addr(lcd_dev,(uint32)osd_menu565_buf);
				lcdc_set_osd_enc_dst_addr(lcd_dev,(uint32)osd_encode_buf1);
				lcdc_set_osd_enc_src_len(lcd_dev,lvgl_len*2);
				//gpio_set_val(PA_15,1);
				lcdc_osd_enc_start_run(lcd_dev);
				//os_printf("e1");
			}					
			else{
				//lcd_osd_encode_cfg(osd_menu565_buf,lvgl_len*2,osd_encode_buf);
				lcdc_set_osd_enc_src_addr(lcd_dev,(uint32)osd_menu565_buf);
				lcdc_set_osd_enc_dst_addr(lcd_dev,(uint32)osd_encode_buf);
				lcdc_set_osd_enc_src_len(lcd_dev,lvgl_len*2);
				//gpio_set_val(PA_15,0);
				lcdc_osd_enc_start_run(lcd_dev);
				//os_printf("e0");
			}
			
			lcd_info.updata_finish = 0;
			enable_irq(flags);
			lcd_sema_down(-1);
			//os_printf("enc_len:%d\r\n",lcdc_get_osd_enc_dst_len(lcd_dev));
			if(lcd_info.osd_buf_to_lcd == 0){
				lcd_info.osd_buf_to_lcd = 1;
			}else{
				lcd_info.osd_buf_to_lcd = 0;
			}
			lcd_info.lcd_run_new_lcd = 1;
		}
		disp_updata = 0;
		
		//sleep_time = 10 - (os_jiffies() - cur_tick);
	}
}




extern Vpp_stream photo_msg;
#if KEY_MODULE_EN == 1
uint32_t lvgl_push_key(struct key_callback_list_s *callback_list,uint32_t keyvalue,uint32_t extern_value)
{
	os_msgq_put(&lvgl_key_msgq,keyvalue,0);
	return 0;
}
#endif

void lvgl_init(){
    k_task_handle_t lvgl_task_handle;
	memset(&gui_cfg,0x00,sizeof(gui_cfg));
	gui_cfg.dvp_h   = photo_msg.in_h;
	gui_cfg.dvp_w   = photo_msg.in_w;
	gui_cfg.photo_h = photo_msg.in_h;
	gui_cfg.photo_w = photo_msg.in_w;	
	gui_cfg.rec_h   = photo_msg.in_h;
	gui_cfg.rec_w   = photo_msg.in_w;
	gui_cfg.sound_en= 0;
	gui_cfg.cycle_rec_en = 0;
	gui_cfg.take_photo_num = 1;
	gui_cfg.iso_en  = 0; 
	gui_cfg.enlarge_lcd = 10;


#if KEY_MODULE_EN == 1
	memset(&lvgl_key_msgq,0,sizeof(lvgl_key_msgq));
	os_msgq_init(&lvgl_key_msgq,10);
	add_keycallback(lvgl_push_key,NULL);
#endif


	lv_init();                  // lvgl初始化，如果这个没有初始化，那么下面的初始化会崩溃
    lv_port_disp_init();        // 显示器初始化
    lv_port_indev_init();
#if 1	
	lv_page_init();
    lv_page_select(0);
	lv_time_set();
#elif 0
	void lv_baby_display();
	lv_time_set();
	lv_baby_display();
#else
	void lv_uvc_display();
	lv_time_set();
	lv_uvc_display();	
#endif
	csi_kernel_task_new((k_task_entry_t)lvgl_run, "gui_thread", NULL, 25, 0, NULL, 4096, &lvgl_task_handle);

}


