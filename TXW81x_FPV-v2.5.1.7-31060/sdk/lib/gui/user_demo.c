/**
 * @file lv_demo_widgets.c
 *
 */

/*********************
 *      INCLUDES
 *********************/
#include "sys_config.h"
#include "typesdef.h"
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
#include "lib/lcd/lcd.h"
#include "lib/lcd/gui.h"
#include "dev/vpp/hgvpp.h"
#include "dev/csi/hgdvp.h"
#include "lib/video/dvp/jpeg/jpg.h"

#include "video_app/video_app.h"
#include "resorce/language.h"
#include "lv_demo_widgets.h"
#include "openDML.h"
#include "osal/mutex.h"
#include "avidemux.h"
#include "avi/play_avi.h"
#include "playback/playback.h"


extern gui_msg gui_cfg;

extern lv_group_t * group_golop;
extern lv_indev_t * indev_keypad;

lv_group_t * group_cur;
lv_group_t * group0_golop;
lv_group_t * group1_golop;
lv_group_t * group2_golop;
lv_group_t * group3_golop;
lv_group_t * group4_golop;
lv_group_t * group5_golop;
lv_group_t * group6_golop;
lv_group_t * group7_golop;
lv_group_t * group8_golop;
lv_group_t * group9_golop;
lv_obj_t * cur_obj;
lv_obj_t * page0_obj;
lv_obj_t * page1_obj;
lv_obj_t * page2_obj;
lv_obj_t * page3_obj;
lv_obj_t * page4_obj;
lv_obj_t * page5_obj;
lv_obj_t * page6_obj;
lv_obj_t * page7_obj;
lv_obj_t * page8_obj;
lv_obj_t * page9_obj;
lv_obj_t * page15_obj;    //usb
lv_obj_t * back_btn;
lv_obj_t * record_btn;	
lv_obj_t * start_rec_btn;
lv_obj_t * photo_btn;
lv_obj_t * take_photo_btn;
lv_obj_t * setting_btn;
lv_obj_t * wifi_btn;
lv_obj_t * uvc_on_btn;
lv_obj_t * larger_btn;
lv_obj_t * rahmen_btn;
lv_obj_t * next_btn;
lv_obj_t * label_uvc_on;
lv_obj_t * label_time;
lv_obj_t * label_rec;
//lv_obj_t * main_img;
lv_obj_t * playback_photo_btn;
lv_obj_t * playback_rec_btn;
lv_obj_t * next_photo_btn;
lv_obj_t * next_rec_btn;
lv_obj_t * game_btn;
lv_obj_t * spi_btn;

lv_obj_t * rec_next_btn;
lv_obj_t * rec_back_btn;
lv_obj_t * photo_next_btn;
lv_obj_t * photo_back_btn;
lv_obj_t * wifi_next_btn;
lv_obj_t * wifi_back_btn;
lv_obj_t * setting_next_btn;
lv_obj_t * setting_back_btn;
lv_obj_t * playback_rec_next_btn;
lv_obj_t * playback_rec_back_btn;
lv_obj_t * playback_photo_next_btn;
lv_obj_t * playback_photo_back_btn;
lv_obj_t * game_start_btn;
lv_obj_t * game_back_btn;
lv_obj_t * game_next_btn;

lv_obj_t * spi_back_btn;
lv_obj_t * spi_next_btn;

lv_obj_t * list_setting_children;


lv_obj_t * setting_option_btn[LANGUAGE_STR_MAX];
lv_obj_t * resolution_btn[6];    //VGA,720P,1080P,2K,4K,8K
lv_obj_t * continous_btn[5];
lv_obj_t * game_list_btn[13];

extern uint8 *video_psram_mem;
extern uint8 *video_psram_mem1;
extern uint8 *video_psram_mem2;

extern uint8 *video_decode_mem;
extern uint8 *video_decode_mem1;
extern uint8 *video_decode_mem2;
extern uint8 video_decode_config_mem[SCALE_PHOTO1_CONFIG_W*PHOTO1_H+SCALE_PHOTO1_CONFIG_W*PHOTO1_H/2];
extern uint8 video_decode_config_mem1[SCALE_PHOTO1_CONFIG_W*PHOTO1_H+SCALE_PHOTO1_CONFIG_W*PHOTO1_H/2];
extern uint8 video_decode_config_mem2[SCALE_PHOTO1_CONFIG_W*PHOTO1_H+SCALE_PHOTO1_CONFIG_W*PHOTO1_H/2];

extern uint8 video_psram_config_mem[SCALE_CONFIG_W*SCALE_HIGH+SCALE_CONFIG_W*SCALE_HIGH/2];
extern uint8 video_psram_config_mem1[SCALE_CONFIG_W*SCALE_HIGH+SCALE_CONFIG_W*SCALE_HIGH/2];
extern uint8 video_psram_config_mem2[SCALE_CONFIG_W*SCALE_HIGH+SCALE_CONFIG_W*SCALE_HIGH/2];


extern int global_avi_running;
extern int global_avi_exit;
extern lv_font_t myfont;
extern uint8 *yuvbuf;
uint8_t page_cur = 0;
uint8_t page_num;
uint8_t uvc_start = 0;
extern uint8_t uvc_open;

uint8_t rec_open;
uint8_t enlarge_glo = 10;
uint8_t rahmen_open;

extern Vpp_stream photo_msg;
extern lcd_msg lcd_info;
extern uint32_t scsi_count;
extern uint8 spi_video_run;
uint8_t name_rec_photo[32];
struct lv_time {
	uint8 lv_hour;
	uint8 lv_min;
	uint8 lv_sec;
	uint8 res;
};

struct lv_time time_msg;


extern const unsigned char main_demo[118351];
extern const unsigned char menu_wifi[60464];
extern const unsigned char menu_usb[55191];


void yes_or_no_list();
void language_list();
void sound_list();
void ios_list();
void rec_list();
void game_list();
void takephoto_list();
void cycle_list();
void continous_shot_list();
void lv_page_select(uint8_t page);
uint32_t file_mode (const char *mode);
void play_wav_page();
void start_record_thread(uint8_t video_fps,uint8_t audio_frq);
uint8_t send_stop_record_cmd();


LV_IMG_DECLARE(photo);
LV_IMG_DECLARE(rec);
LV_IMG_DECLARE(DV_W);
LV_IMG_DECLARE(DV_R);
LV_IMG_DECLARE(srcbtn0);
LV_IMG_DECLARE(srcbtn0_1);
LV_IMG_DECLARE(menu1_0);
LV_IMG_DECLARE(menu1_1);
LV_IMG_DECLARE(menu1_2);
LV_IMG_DECLARE(menu2_0);
LV_IMG_DECLARE(menu2_1);
LV_IMG_DECLARE(menu2_2);
LV_IMG_DECLARE(menu3_0);
LV_IMG_DECLARE(menu3_1);
LV_IMG_DECLARE(menu3_2);
LV_IMG_DECLARE(menu4_0);
LV_IMG_DECLARE(menu4_1);
LV_IMG_DECLARE(menu4_2);
LV_IMG_DECLARE(menu5_0);
LV_IMG_DECLARE(menu5_1);
LV_IMG_DECLARE(menu5_2);
LV_IMG_DECLARE(menu6_0);
LV_IMG_DECLARE(menu6_1);
LV_IMG_DECLARE(menu6_2);
LV_IMG_DECLARE(menu_null);
LV_IMG_DECLARE(menu_test);
LV_IMG_DECLARE(menu_spi);

void take_photo_thread_init(uint16_t w,uint16_t h,uint8_t continuous_spot);

void lv_time_reset(struct lv_time *time_now){
	static lv_style_t style;	
	time_now->lv_hour = 0;
	time_now->lv_min  = 0;
	time_now->lv_sec  = 0;

	lv_style_reset(&style);
	lv_style_init(&style);
	lv_style_set_text_font(&style,&lv_font_montserrat_24);
	
	if(label_time == NULL){	
		label_time = lv_label_create(page1_obj);
	}
	os_printf("label_time:%x\n",label_time);
	lv_obj_add_style(label_time,&style,LV_STATE_DEFAULT);
	lv_obj_align(label_time,LV_ALIGN_BOTTOM_MID,0,0);
	lv_label_set_recolor(label_time, 1);	
	
}


void lv_time_add(struct lv_time *time_now){
	if(time_now->lv_sec == 59){
		if(time_now->lv_min == 59){
			if(time_now->lv_hour >= 99){
				time_now->lv_hour = 0;
				time_now->lv_min  = 0;
				time_now->lv_sec  = 0;				
			}else{
				time_now->lv_hour++;
				time_now->lv_min  = 0;
				time_now->lv_sec  = 0;				
			}
		}else{
			time_now->lv_min++;
			time_now->lv_sec = 0;
		}
	}else{
		time_now->lv_sec++;
	}
}


void display_time(lv_obj_t * p_label,struct lv_time *time_now){
	static char time_str[20];
	printf("%02d:%02d:%02d\r\n",time_now->lv_hour,time_now->lv_min,time_now->lv_sec);
	sprintf(time_str,"#ff0088 %02d:%02d:%02d#",time_now->lv_hour,time_now->lv_min,time_now->lv_sec);
	lv_label_set_text(label_time,time_str);
	
}

void del_time_label(){
	lv_obj_del(label_time);
	label_time = NULL;
}

void dv_flash(uint8_t flash){
	lv_obj_t * img;
	lv_obj_del(label_rec);
	img = lv_img_create(page1_obj);
	label_rec = img;
	if(flash == 1)
		lv_img_set_src(img,&DV_W);
	else
		lv_img_set_src(img,&DV_R);
	
	lv_obj_set_pos(img, SCALE_WIDTH-80, 0);
}

static void setting_handler(lv_event_t * e)
{
	lv_event_code_t code = lv_event_get_code(e);
	if(code == LV_EVENT_CLICKED) {
		LV_LOG_USER("Clicked");
		
		if(e->target == setting_option_btn[FORMAT_STR]){
			yes_or_no_list();
		}

		if(e->target == setting_option_btn[LANGUAGE_STR]){
			language_list();
		}
		
		if(e->target == setting_option_btn[SOUND_STR]){
			sound_list();
		}	

		if(e->target == setting_option_btn[ISO_STR]){
			ios_list();
		}

		if(e->target == setting_option_btn[RECORD_STR]){
			rec_list();
		}

		if(e->target == setting_option_btn[TAKEPHOTO_STR]){
			takephoto_list();
		}
		
		if(e->target == setting_option_btn[CYCLE_STR]){
			cycle_list();
		}

		if(e->target == setting_option_btn[CONTINUOUS_STR]){
			continous_shot_list();
		}

		if(e->target == setting_option_btn[EXIT_STR]){
			lv_page_select(0);
		}

	}

}

static void format_handler(lv_event_t * e)
{
	lv_event_code_t code = lv_event_get_code(e);
	if(code == LV_EVENT_CLICKED) {
		LV_LOG_USER("Clicked");
		
		if(e->target == setting_option_btn[YES_STR]){
			lv_page_select(6);
		}
		
		if(e->target == setting_option_btn[NO_STR]){
			lv_page_select(6);
		}
		lv_group_focus_obj(setting_option_btn[FORMAT_STR]);
	}
}


void nesStart(char* game);
extern const unsigned char acTanks[];
uint8_t game_sdh_cache[512];
extern FIL fp_jpg;
uint8 game_rom[1*1024*1024] __attribute__ ((aligned(4),section(".psram.src")));
static void game_handler(lv_event_t * e)
{
	lv_event_code_t code = lv_event_get_code(e);
	struct lcdc_device *lcd_dev;	
	lcd_dev = (struct lcdc_device *)dev_get(HG_LCDC_DEVID);		
	uint32_t res;
	uint32_t read_count = 0;
	uint32_t readLen;
	uint32_t data_len,data_count;
	uint32_t mod = file_mode ("rb");
	if(code == LV_EVENT_CLICKED) {
		LV_LOG_USER("Clicked");
		
		if(e->target == game_list_btn[0]){
			res = f_open(&fp_jpg,"0:nes/1.nes",mod);
			if(res){
				printf("f_open error\r\n");
				return;
			}		
		}
		
		if(e->target == game_list_btn[1]){
			res = f_open(&fp_jpg,"0:nes/2.nes",mod);
			if(res){
				printf("f_open error\r\n");
				return;
			}
		}
		
		if(e->target == game_list_btn[2]){
			res = f_open(&fp_jpg,"0:nes/3.nes",mod);
			if(res){
				printf("f_open error\r\n");
				return;
			}
		}		

		if(e->target == game_list_btn[3]){
			res = f_open(&fp_jpg,"0:nes/4.nes",mod);
			if(res){
				printf("f_open error\r\n");
				return;
			}
		}

		if(e->target == game_list_btn[4]){
			res = f_open(&fp_jpg,"0:nes/5.nes",mod);
			if(res){
				printf("f_open error\r\n");
				return;
			}
		}

		if(e->target == game_list_btn[5]){
			res = f_open(&fp_jpg,"0:nes/6.nes",mod);
			if(res){
				printf("f_open error\r\n");
				return;
			}

		}
		
		if(e->target == game_list_btn[6]){
			res = f_open(&fp_jpg,"0:nes/7.nes",mod);
			if(res){
				printf("f_open error\r\n");
				return;
			}

		}

		if(e->target == game_list_btn[7]){
			res = f_open(&fp_jpg,"0:nes/8.nes",mod);
			if(res){
				printf("f_open error\r\n");
				return;
			}

		}		

		if(e->target == game_list_btn[8]){
			res = f_open(&fp_jpg,"0:nes/9.nes",mod);
			if(res){
				printf("f_open error\r\n");
				return;
			}

		}

		if(e->target == game_list_btn[9]){
			res = f_open(&fp_jpg,"0:nes/10.nes",mod);
			if(res){
				printf("f_open error\r\n");
				return;
			}

		}

		if(e->target == game_list_btn[10]){
			res = f_open(&fp_jpg,"0:nes/11.nes",mod);
			if(res){
				printf("f_open error\r\n");
				return;
			}

		}

		if(e->target == game_list_btn[11]){
			res = f_open(&fp_jpg,"0:nes/12.nes",mod);
			if(res){
				printf("f_open error\r\n");
				return;
			}

		}

		if(e->target == game_list_btn[12]){
			res = f_open(&fp_jpg,"0:nes/13.nes",mod);
			if(res){
				printf("f_open error\r\n");
				return;
			}

		}
		
		data_len = f_size(&fp_jpg); 		
		data_count = 512;
		while(data_len){
			res = f_read(&fp_jpg,game_sdh_cache,data_count,&readLen);
			memcpy(game_rom+read_count,game_sdh_cache,data_count);
			read_count += data_count;
			if(data_len > 512){
				data_len = data_len-data_count;
			}else{
				data_count = data_len; 
				data_len = 0;
			}
			
		}
		res = f_read(&fp_jpg,game_sdh_cache,data_count,&readLen);
		memcpy(game_rom+read_count,game_sdh_cache,data_count);	
		
		f_close(&fp_jpg);		
		lcdc_set_osd_en(lcd_dev,0);
		printf("rom:%02x%02x%02x%02x\r\n",game_rom[0],game_rom[1],game_rom[2],game_rom[3]);
		//nesStart((char*)game_rom); 

	}

}


static void language_handler(lv_event_t * e)
{
	lv_event_code_t code = lv_event_get_code(e);
	if(code == LV_EVENT_CLICKED) {
		LV_LOG_USER("Clicked");
		
		if(e->target == setting_option_btn[LANGUAGE_EN_STR]){
			language_cur = 0;
			lv_page_select(6);
		}
		
		if(e->target == setting_option_btn[LANGUAGE_CN_STR]){
			language_cur = 1;
			lv_page_select(6);
		}
		lv_group_focus_obj(setting_option_btn[LANGUAGE_STR]);
	}
}

static void sound_handler(lv_event_t * e)
{
	lv_event_code_t code = lv_event_get_code(e);
	if(code == LV_EVENT_CLICKED) {
		LV_LOG_USER("Clicked");
		
		if(e->target == setting_option_btn[OPEN_STR]){
			gui_cfg.sound_en = 1;
			lv_page_select(6);
		}
		
		if(e->target == setting_option_btn[CLOSE_STR]){
			gui_cfg.sound_en = 0;
			lv_page_select(6);
		}
		lv_group_focus_obj(setting_option_btn[SOUND_STR]);
	}
}

static void ios_handler(lv_event_t * e)
{
	lv_event_code_t code = lv_event_get_code(e);
	if(code == LV_EVENT_CLICKED) {
		LV_LOG_USER("Clicked");
		
		if(e->target == setting_option_btn[OPEN_STR]){
			gui_cfg.iso_en = 1;
			lv_page_select(6);
		}
		
		if(e->target == setting_option_btn[CLOSE_STR]){
			gui_cfg.iso_en = 0;
			lv_page_select(6);
		}
		lv_group_focus_obj(setting_option_btn[ISO_STR]);
	}
}

static void cycle_handler(lv_event_t * e)
{
	lv_event_code_t code = lv_event_get_code(e);
	if(code == LV_EVENT_CLICKED) {
		LV_LOG_USER("Clicked");
		
		if(e->target == setting_option_btn[OPEN_STR]){
			gui_cfg.cycle_rec_en = 1;
			lv_page_select(6);
		}
		
		if(e->target == setting_option_btn[CLOSE_STR]){
			gui_cfg.cycle_rec_en = 0;
			lv_page_select(6);
		}
		lv_group_focus_obj(setting_option_btn[CYCLE_STR]);
	}
}


static void rec_handler(lv_event_t * e)
{
	lv_event_code_t code = lv_event_get_code(e);	
	if(code == LV_EVENT_CLICKED) {
		LV_LOG_USER("Clicked");
		
		if(e->target == resolution_btn[0]){
			gui_cfg.rec_w = 640;
			gui_cfg.rec_h = 480;
			lv_page_select(6);
		}
		
		if(e->target == resolution_btn[1]){
			gui_cfg.rec_w = 1280;
			gui_cfg.rec_h = 720;
			lv_page_select(6);
		}
		
		if(e->target == resolution_btn[2]){
			gui_cfg.rec_w = 1920;
			gui_cfg.rec_h = 1080;			
			lv_page_select(6);
		}
		lv_group_focus_obj(setting_option_btn[RECORD_STR]);
	}
}

static void takephoto_handler(lv_event_t * e)
{
	lv_event_code_t code = lv_event_get_code(e);
	if(code == LV_EVENT_CLICKED) {
		LV_LOG_USER("Clicked");
		
		if(e->target == resolution_btn[0]){
			gui_cfg.photo_w = 640;
			gui_cfg.photo_h = 480;
			lv_page_select(6);
		}
		
		if(e->target == resolution_btn[1]){
			gui_cfg.photo_w = 1280;
			gui_cfg.photo_h = 720;
			lv_page_select(6);
		}
		
		if(e->target == resolution_btn[2]){
			gui_cfg.photo_w = 1920;
			gui_cfg.photo_h = 1080;
			lv_page_select(6);
		}

		if(e->target == resolution_btn[3]){
			gui_cfg.photo_w = 2560;
			gui_cfg.photo_h = 1440;
			lv_page_select(6);
		}

		if(e->target == resolution_btn[4]){
			gui_cfg.photo_w = 3840;
			gui_cfg.photo_h = 2560;
			lv_page_select(6);
		}

		if(e->target == resolution_btn[5]){
			gui_cfg.photo_w = 7680;
			gui_cfg.photo_h = 4320;
			lv_page_select(6);
		}
		
		lv_group_focus_obj(setting_option_btn[TAKEPHOTO_STR]);
	}
}

static void continous_shot_handler(lv_event_t * e)
{
	lv_event_code_t code = lv_event_get_code(e);
	if(code == LV_EVENT_CLICKED) {
		LV_LOG_USER("Clicked");
		
		if(e->target == continous_btn[0]){
			printf("take photo 1\r\n");
			gui_cfg.take_photo_num = 1;
			lv_page_select(6);
		}
		
		if(e->target == continous_btn[1]){
			printf("take photo 2\r\n");
			gui_cfg.take_photo_num = 2;
			lv_page_select(6);
		}
		
		if(e->target == continous_btn[2]){
			printf("take photo 5\r\n");
			gui_cfg.take_photo_num = 5;
			lv_page_select(6);
		}

		if(e->target == continous_btn[3]){
			printf("take photo 8\r\n");
			gui_cfg.take_photo_num = 8;
			lv_page_select(6);
		}

		if(e->target == continous_btn[4]){
			printf("take photo 10\r\n");
			gui_cfg.take_photo_num = 10;
			lv_page_select(6);
		}
		
		lv_group_focus_obj(setting_option_btn[CONTINUOUS_STR]);
	}
}

void yes_or_no_list(){
	lv_obj_t *list;
	if(group_golop)
		lv_group_del(group_golop);
	
	group_golop = lv_group_create();
	lv_indev_set_group(indev_keypad, group_golop);
	
	list = lv_list_create(page4_obj);
	list_setting_children = list;
	lv_obj_add_flag(list, LV_OBJ_FLAG_HIDDEN);  
	lv_obj_clear_flag(list, LV_OBJ_FLAG_HIDDEN);		
    lv_obj_set_size(list, 160, 160);
	lv_obj_align(list, LV_ALIGN_OUT_TOP_MID, 80, 0);
	setting_option_btn[YES_STR] = lv_list_add_btn(list, NULL, (const char *)language_switch[language_cur][YES_STR]);
	lv_obj_add_event_cb(setting_option_btn[YES_STR], format_handler, LV_EVENT_ALL, NULL);
	lv_group_add_obj(group_golop, setting_option_btn[YES_STR]);
	
	setting_option_btn[NO_STR] = lv_list_add_btn(list, NULL, (const char *)language_switch[language_cur][NO_STR]);
	lv_obj_add_event_cb(setting_option_btn[NO_STR], format_handler, LV_EVENT_ALL, NULL);
	lv_group_add_obj(group_golop, setting_option_btn[NO_STR]);

}


void language_list(){
	lv_obj_t *list;
	if(group_golop)
		lv_group_del(group_golop);
	
	group_golop = lv_group_create();
	lv_indev_set_group(indev_keypad, group_golop);
	
	list = lv_list_create(page4_obj);
	list_setting_children = list;
	lv_obj_add_flag(list, LV_OBJ_FLAG_HIDDEN);  
	lv_obj_clear_flag(list, LV_OBJ_FLAG_HIDDEN);		
    lv_obj_set_size(list, 160, 160);
	lv_obj_align(list, LV_ALIGN_OUT_TOP_MID, 80, 0);
	setting_option_btn[LANGUAGE_EN_STR] = lv_list_add_btn(list, NULL, (const char *)language_switch[language_cur][LANGUAGE_EN_STR]);
	lv_obj_add_event_cb(setting_option_btn[LANGUAGE_EN_STR], language_handler, LV_EVENT_ALL, NULL);
	lv_group_add_obj(group_golop, setting_option_btn[LANGUAGE_EN_STR]);
	
	setting_option_btn[LANGUAGE_CN_STR] = lv_list_add_btn(list, NULL, (const char *)language_switch[language_cur][LANGUAGE_CN_STR]);
	lv_obj_add_event_cb(setting_option_btn[LANGUAGE_CN_STR], language_handler, LV_EVENT_ALL, NULL);
	lv_group_add_obj(group_golop, setting_option_btn[LANGUAGE_CN_STR]);

}


void sound_list(){
	lv_obj_t *list;
	if(group_golop)
		lv_group_del(group_golop);
	
	group_golop = lv_group_create();
	lv_indev_set_group(indev_keypad, group_golop);
	
	list = lv_list_create(page4_obj);
	list_setting_children = list;
	lv_obj_add_flag(list, LV_OBJ_FLAG_HIDDEN);  
	lv_obj_clear_flag(list, LV_OBJ_FLAG_HIDDEN);		
    lv_obj_set_size(list, 160, 160);
	lv_obj_align(list, LV_ALIGN_OUT_TOP_MID, 80, 0);
	setting_option_btn[OPEN_STR] = lv_list_add_btn(list, NULL, (const char *)language_switch[language_cur][OPEN_STR]);
	lv_obj_add_event_cb(setting_option_btn[OPEN_STR], sound_handler, LV_EVENT_ALL, NULL);
	lv_group_add_obj(group_golop, setting_option_btn[OPEN_STR]);
	
	setting_option_btn[CLOSE_STR] = lv_list_add_btn(list, NULL, (const char *)language_switch[language_cur][CLOSE_STR]);
	lv_obj_add_event_cb(setting_option_btn[CLOSE_STR], sound_handler, LV_EVENT_ALL, NULL);
	lv_group_add_obj(group_golop, setting_option_btn[CLOSE_STR]);

}

void ios_list(){
	lv_obj_t *list;
	if(group_golop)
		lv_group_del(group_golop);
	
	group_golop = lv_group_create();
	lv_indev_set_group(indev_keypad, group_golop);
	
	list = lv_list_create(page4_obj);
	list_setting_children = list;
	lv_obj_add_flag(list, LV_OBJ_FLAG_HIDDEN);  
	lv_obj_clear_flag(list, LV_OBJ_FLAG_HIDDEN);		
    lv_obj_set_size(list, 160, 160);
	lv_obj_align(list, LV_ALIGN_OUT_TOP_MID, 80, 0);
	setting_option_btn[OPEN_STR] = lv_list_add_btn(list, NULL, (const char *)language_switch[language_cur][OPEN_STR]);
	lv_obj_add_event_cb(setting_option_btn[OPEN_STR], ios_handler, LV_EVENT_ALL, NULL);
	lv_group_add_obj(group_golop, setting_option_btn[OPEN_STR]);
	
	setting_option_btn[CLOSE_STR] = lv_list_add_btn(list, NULL, (const char *)language_switch[language_cur][CLOSE_STR]);
	lv_obj_add_event_cb(setting_option_btn[CLOSE_STR], ios_handler, LV_EVENT_ALL, NULL);
	lv_group_add_obj(group_golop, setting_option_btn[CLOSE_STR]);

}

void rec_list(){
	lv_obj_t *list;
	if(group_golop)
		lv_group_del(group_golop);
	
	group_golop = lv_group_create();
	lv_indev_set_group(indev_keypad, group_golop);
	
	list = lv_list_create(page4_obj);
	list_setting_children = list;
	lv_obj_add_flag(list, LV_OBJ_FLAG_HIDDEN);  
	lv_obj_clear_flag(list, LV_OBJ_FLAG_HIDDEN);		
    lv_obj_set_size(list, 160, 160);
	lv_obj_align(list, LV_ALIGN_OUT_TOP_MID, 80, 0);
	resolution_btn[0] = lv_list_add_btn(list, NULL, "VGA");
	lv_obj_add_event_cb(resolution_btn[0], rec_handler, LV_EVENT_ALL, NULL);
	lv_group_add_obj(group_golop, resolution_btn[0]);
	
	resolution_btn[1] = lv_list_add_btn(list, NULL, "720P");
	lv_obj_add_event_cb(resolution_btn[1], rec_handler, LV_EVENT_ALL, NULL);
	lv_group_add_obj(group_golop, resolution_btn[1]);
	
	resolution_btn[2] = lv_list_add_btn(list, NULL, "1080P");
	lv_obj_add_event_cb(resolution_btn[2], rec_handler, LV_EVENT_ALL, NULL);
	lv_group_add_obj(group_golop, resolution_btn[2]);

}

void game_list(){
	lv_obj_t *list;
	if(group_golop)
		lv_group_del(group_golop);
	
	group_golop = lv_group_create();
	lv_indev_set_group(indev_keypad, group_golop);
	
	list = lv_list_create(page7_obj);
	list_setting_children = list;
	lv_obj_add_flag(list, LV_OBJ_FLAG_HIDDEN);  
	lv_obj_clear_flag(list, LV_OBJ_FLAG_HIDDEN);		
    lv_obj_set_size(list, 160, 160);
	lv_obj_align(list, LV_ALIGN_OUT_TOP_MID, 80, 0);
	game_list_btn[0] = lv_list_add_btn(list, NULL, "赤影战士");
	lv_obj_add_event_cb(game_list_btn[0], game_handler, LV_EVENT_ALL, NULL);
	lv_group_add_obj(group_golop, game_list_btn[0]);
	
	game_list_btn[1] = lv_list_add_btn(list, NULL, "魂斗罗");
	lv_obj_add_event_cb(game_list_btn[1], game_handler, LV_EVENT_ALL, NULL);
	lv_group_add_obj(group_golop, game_list_btn[1]);
	
	game_list_btn[2] = lv_list_add_btn(list, NULL, "泡泡龙");
	lv_obj_add_event_cb(game_list_btn[2], game_handler, LV_EVENT_ALL, NULL);
	lv_group_add_obj(group_golop, game_list_btn[2]);

	game_list_btn[3] = lv_list_add_btn(list, NULL, "热血格斗传说");
	lv_obj_add_event_cb(game_list_btn[3], game_handler, LV_EVENT_ALL, NULL);
	lv_group_add_obj(group_golop, game_list_btn[3]);

	game_list_btn[4] = lv_list_add_btn(list, NULL, "热血物语");
	lv_obj_add_event_cb(game_list_btn[4], game_handler, LV_EVENT_ALL, NULL);
	lv_group_add_obj(group_golop, game_list_btn[4]);

	game_list_btn[5] = lv_list_add_btn(list, NULL, "忍者龙剑传");
	lv_obj_add_event_cb(game_list_btn[5], game_handler, LV_EVENT_ALL, NULL);
	lv_group_add_obj(group_golop, game_list_btn[5]);

	game_list_btn[6] = lv_list_add_btn(list, NULL, "忍者神龟");
	lv_obj_add_event_cb(game_list_btn[6], game_handler, LV_EVENT_ALL, NULL);
	lv_group_add_obj(group_golop, game_list_btn[6]);	

	game_list_btn[7] = lv_list_add_btn(list, NULL, "神奇世界");
	lv_obj_add_event_cb(game_list_btn[7], game_handler, LV_EVENT_ALL, NULL);
	lv_group_add_obj(group_golop, game_list_btn[7]);

	game_list_btn[8] = lv_list_add_btn(list, NULL, "双截龙3");
	lv_obj_add_event_cb(game_list_btn[8], game_handler, LV_EVENT_ALL, NULL);
	lv_group_add_obj(group_golop, game_list_btn[8]);

	game_list_btn[9] = lv_list_add_btn(list, NULL, "松鼠大作战");
	lv_obj_add_event_cb(game_list_btn[9], game_handler, LV_EVENT_ALL, NULL);
	lv_group_add_obj(group_golop, game_list_btn[9]);

	game_list_btn[10] = lv_list_add_btn(list, NULL, "西游记");
	lv_obj_add_event_cb(game_list_btn[10], game_handler, LV_EVENT_ALL, NULL);
	lv_group_add_obj(group_golop, game_list_btn[10]);

	game_list_btn[11] = lv_list_add_btn(list, NULL, "雪人兄弟");
	lv_obj_add_event_cb(game_list_btn[11], game_handler, LV_EVENT_ALL, NULL);
	lv_group_add_obj(group_golop, game_list_btn[11]);	

	game_list_btn[12] = lv_list_add_btn(list, NULL, "幽幽白书");
	lv_obj_add_event_cb(game_list_btn[12], game_handler, LV_EVENT_ALL, NULL);
	lv_group_add_obj(group_golop, game_list_btn[12]);		
}

void takephoto_list(){
	lv_obj_t *list;
	if(group_golop)
		lv_group_del(group_golop);
	
	group_golop = lv_group_create();
	lv_indev_set_group(indev_keypad, group_golop);
	
	list = lv_list_create(page4_obj);
	list_setting_children = list;
	lv_obj_add_flag(list, LV_OBJ_FLAG_HIDDEN);	
	lv_obj_clear_flag(list, LV_OBJ_FLAG_HIDDEN);		
	lv_obj_set_size(list, 160, 160);
	lv_obj_align(list, LV_ALIGN_OUT_TOP_MID, 80, 0);
	resolution_btn[0] = lv_list_add_btn(list, NULL, "VGA");
	lv_obj_add_event_cb(resolution_btn[0], takephoto_handler, LV_EVENT_ALL, NULL);
	lv_group_add_obj(group_golop, resolution_btn[0]);
	
	resolution_btn[1] = lv_list_add_btn(list, NULL, "720P");
	lv_obj_add_event_cb(resolution_btn[1], takephoto_handler, LV_EVENT_ALL, NULL);
	lv_group_add_obj(group_golop, resolution_btn[1]);
	
	resolution_btn[2] = lv_list_add_btn(list, NULL, "1080P");
	lv_obj_add_event_cb(resolution_btn[2], takephoto_handler, LV_EVENT_ALL, NULL);
	lv_group_add_obj(group_golop, resolution_btn[2]);

	resolution_btn[3] = lv_list_add_btn(list, NULL, "2K");
	lv_obj_add_event_cb(resolution_btn[3], takephoto_handler, LV_EVENT_ALL, NULL);
	lv_group_add_obj(group_golop, resolution_btn[3]);

	resolution_btn[4] = lv_list_add_btn(list, NULL, "4K");
	lv_obj_add_event_cb(resolution_btn[4], takephoto_handler, LV_EVENT_ALL, NULL);
	lv_group_add_obj(group_golop, resolution_btn[4]);

	resolution_btn[5] = lv_list_add_btn(list, NULL, "8K");
	lv_obj_add_event_cb(resolution_btn[5], takephoto_handler, LV_EVENT_ALL, NULL);
	lv_group_add_obj(group_golop, resolution_btn[5]);

}

void cycle_list(){
	lv_obj_t *list;
	if(group_golop)
		lv_group_del(group_golop);
	
	group_golop = lv_group_create();
	lv_indev_set_group(indev_keypad, group_golop);
	
	list = lv_list_create(page4_obj);
	list_setting_children = list;
	lv_obj_add_flag(list, LV_OBJ_FLAG_HIDDEN);  
	lv_obj_clear_flag(list, LV_OBJ_FLAG_HIDDEN);		
    lv_obj_set_size(list, 160, 160);
	lv_obj_align(list, LV_ALIGN_OUT_TOP_MID, 80, 0);
	setting_option_btn[OPEN_STR] = lv_list_add_btn(list, NULL, (const char *)language_switch[language_cur][OPEN_STR]);
	lv_obj_add_event_cb(setting_option_btn[OPEN_STR], cycle_handler, LV_EVENT_ALL, NULL);
	lv_group_add_obj(group_golop, setting_option_btn[OPEN_STR]);
	
	setting_option_btn[CLOSE_STR] = lv_list_add_btn(list, NULL, (const char *)language_switch[language_cur][CLOSE_STR]);
	lv_obj_add_event_cb(setting_option_btn[CLOSE_STR], cycle_handler, LV_EVENT_ALL, NULL);
	lv_group_add_obj(group_golop, setting_option_btn[CLOSE_STR]);

}

void continous_shot_list(){
	lv_obj_t *list;
	if(group_golop)
		lv_group_del(group_golop);
	
	group_golop = lv_group_create();
	lv_indev_set_group(indev_keypad, group_golop);
	
	list = lv_list_create(page4_obj);
	list_setting_children = list;
	lv_obj_add_flag(list, LV_OBJ_FLAG_HIDDEN);	
	lv_obj_clear_flag(list, LV_OBJ_FLAG_HIDDEN);		
	lv_obj_set_size(list, 160, 160);
	lv_obj_align(list, LV_ALIGN_OUT_TOP_MID, 80, 0);
	continous_btn[0] = lv_list_add_btn(list, NULL, (const char *)language_switch[language_cur][CLOSE_STR]);
	lv_obj_add_event_cb(continous_btn[0], continous_shot_handler, LV_EVENT_ALL, NULL);
	lv_group_add_obj(group_golop, continous_btn[0]);
	
	continous_btn[1] = lv_list_add_btn(list, NULL, "2");
	lv_obj_add_event_cb(continous_btn[1], continous_shot_handler, LV_EVENT_ALL, NULL);
	lv_group_add_obj(group_golop, continous_btn[1]);
	
	continous_btn[2] = lv_list_add_btn(list, NULL, "5");
	lv_obj_add_event_cb(continous_btn[2], continous_shot_handler, LV_EVENT_ALL, NULL);
	lv_group_add_obj(group_golop, continous_btn[2]);

	continous_btn[3] = lv_list_add_btn(list, NULL, "8");
	lv_obj_add_event_cb(continous_btn[3], continous_shot_handler, LV_EVENT_ALL, NULL);
	lv_group_add_obj(group_golop, continous_btn[3]);

	continous_btn[4] = lv_list_add_btn(list, NULL, "10");
	lv_obj_add_event_cb(continous_btn[4], continous_shot_handler, LV_EVENT_ALL, NULL);
	lv_group_add_obj(group_golop, continous_btn[4]);


}


/**********************
 *   GLOBAL FUNCTIONS
 **********************/
static void main_menu_key_analyze(lv_event_t * e){
	uint8_t key_code;
	key_code = lv_indev_get_key(lv_indev_get_act());
	if(e->target == record_btn){
		if(key_code == LV_KEY_RIGHT){
			lv_group_focus_obj(photo_btn);
		}

		if(key_code == LV_KEY_LEFT){
			lv_group_focus_obj(playback_rec_btn);
		}

		if(key_code == LV_KEY_UP){
			lv_group_focus_obj(playback_rec_btn);
		}	
		
		if(key_code == LV_KEY_DOWN){
			lv_group_focus_obj(setting_btn);
		}				
	}

	if(e->target == photo_btn){
		if(key_code == LV_KEY_RIGHT){
			lv_group_focus_obj(wifi_btn);
		}

		if(key_code == LV_KEY_LEFT){
			lv_group_focus_obj(record_btn);
		}

		if(key_code == LV_KEY_UP){
			lv_group_focus_obj(setting_btn);
		}	
		
		if(key_code == LV_KEY_DOWN){
			lv_group_focus_obj(playback_photo_btn);
		}				
	}	

	if(e->target == wifi_btn){
		if(key_code == LV_KEY_RIGHT){
			lv_group_focus_obj(setting_btn);
		}

		if(key_code == LV_KEY_LEFT){
			lv_group_focus_obj(photo_btn);
		}

		if(key_code == LV_KEY_UP){
			lv_group_focus_obj(playback_photo_btn);
		}	
		
		if(key_code == LV_KEY_DOWN){
			lv_group_focus_obj(playback_rec_btn);
		}				
	}			

	if(e->target == setting_btn){
		if(key_code == LV_KEY_RIGHT){
			lv_group_focus_obj(playback_photo_btn);
		}

		if(key_code == LV_KEY_LEFT){
			lv_group_focus_obj(wifi_btn);
		}

		if(key_code == LV_KEY_UP){
			lv_group_focus_obj(record_btn);
		}	
		
		if(key_code == LV_KEY_DOWN){
			lv_group_focus_obj(photo_btn);
		}				
	}

	if(e->target == playback_photo_btn){
		if(key_code == LV_KEY_RIGHT){
			lv_group_focus_obj(playback_rec_btn);
		}

		if(key_code == LV_KEY_LEFT){
			lv_group_focus_obj(setting_btn);
		}

		if(key_code == LV_KEY_UP){
			lv_group_focus_obj(photo_btn);
		}	
		
		if(key_code == LV_KEY_DOWN){
			lv_group_focus_obj(wifi_btn);
		}				
	}	

	if(e->target == playback_rec_btn){
		if(key_code == LV_KEY_RIGHT){
			lv_group_focus_obj(record_btn);
		}

		if(key_code == LV_KEY_LEFT){
			lv_group_focus_obj(playback_photo_btn);
		}

		if(key_code == LV_KEY_UP){
			lv_group_focus_obj(wifi_btn);
		}	
		
		if(key_code == LV_KEY_DOWN){
			lv_group_focus_obj(record_btn);
		}				
	}

		//特殊,直接跳转
		if(key_code == LV_KEY_END)
		{
			play_wav_page();
		}

}

void page0_analyze(lv_event_t * e){
	if(e->target == record_btn){
		lv_page_select(1);
		page_num = 1;
	}
	
	if(e->target == photo_btn){
		lv_page_select(2);
		page_num = 2;			
	}
	
	if(e->target == wifi_btn){
		lv_page_select(3);
		page_num = 3;
	}
	
	if(e->target == setting_btn){
		lv_page_select(6);
		page_num = 6;			
//		lv_page_select(4);
//		page_num = 4;
	}
	
	if(e->target == playback_photo_btn){
		lv_page_select(4);
		page_num = 4;		
//		lv_page_select(5);
//		page_num = 5;				
	}
	
	if(e->target == playback_rec_btn){
		lv_page_select(5);
		page_num = 5;
//		lv_page_select(6);
//		page_num = 6;				
	}			

	if(e->target == game_btn){
		lv_page_select(7);
		page_num = 7;				
	}	

	if(e->target == spi_btn){
		lv_page_select(8);
		page_num = 8;				
	}	
}

void page_rec_analyze(lv_event_t * e){
	struct vpp_device *vpp_dev;
	vpp_dev = (struct vpp_device *)dev_get(HG_VPP_DEVID);

	if(e->target == start_rec_btn){
		if(rec_open == 0){
			printf("rec start\r\n");
			os_printf("===photo out0h:%d w:%d rec_h:%d rec_w:%d===\n",photo_msg.out0_h,photo_msg.out0_w,gui_cfg.rec_h,gui_cfg.rec_w);
	
			#if 0
			jpg_start(HG_JPG0_DEVID);
			#else
			start_record_thread(30,8);
			#endif

			rec_open = 1;
			dv_flash(0);
			lv_time_add(&time_msg);
			lv_time_reset(&time_msg);
			display_time(page1_obj,&time_msg);
		}else{
			// scale_close(scale_dev);
			#if 0
			jpeg_dev = (struct jpg_device *)dev_get(HG_JPG0_DEVID); 
			jpg_close(jpeg_dev);
			printf("rec close\r\n");
			#else
			send_stop_record_cmd();
			#endif
			
			rec_open = 0;
			dv_flash(1);
			del_time_label();
		}
	}
	
	if(e->target == rec_back_btn){
		send_stop_record_cmd();
		lv_page_select(0);
		page_num = 0;
	}
	
	if(e->target == rec_next_btn){
		page_num++;
		if(page_num == 9)
			page_num = 1;
		send_stop_record_cmd();
		lv_page_select(page_num);
	}			
	
	if(e->target == uvc_on_btn){	
		uvc_start ^= BIT(0);
		//lcdc_set_p0p1_enable(lcd_dev,1,uvc_start);
		if(uvc_start){
			lcd_info.lcd_p0p1_state = 3;
		}else{
			lcd_info.lcd_p0p1_state = 1;
		}
		if(uvc_start){
			extern uint8_t  enable_video_usb_to_lcd(uint8_t enable);
			lv_label_set_text(label_uvc_on, "uvc_off");
			uvc_open = 1;
			enable_video_usb_to_lcd(1);
		}
		else{
			extern uint8_t  enable_video_usb_to_lcd(uint8_t enable);
			lv_label_set_text(label_uvc_on, "uvc_on");				
			uvc_open = 0;		
			enable_video_usb_to_lcd(0);	
		}
		
	}
	
	if(e->target == larger_btn){
		enlarge_glo++;
		if(enlarge_glo == 21){
			enlarge_glo = 10;
		}
		gui_cfg.enlarge_lcd = enlarge_glo;			
	}

	if(e->target == rahmen_btn){
		if(rahmen_open == 0){
			rahmen_open = 1;
			vpp_set_ifp_en(vpp_dev,1);
		}else{
			rahmen_open = 0;
			vpp_set_ifp_en(vpp_dev,0);
		}		
	}

	
}
extern uint32_t get_takephoto_thread_status();
void page_takephoto_analyze(lv_event_t * e){
	struct vpp_device *vpp_dev;
	vpp_dev = (struct vpp_device *)dev_get(HG_VPP_DEVID);

	if(e->target == photo_back_btn){
		lv_page_select(0);
		page_num = 0;
	}
	
	if(e->target == take_photo_btn){
		printf("gui_cfg.take_photo_num:%d\r\n",gui_cfg.take_photo_num);
		if(!get_takephoto_thread_status())
		{
			take_photo_thread_init(gui_cfg.photo_w,gui_cfg.photo_h,gui_cfg.take_photo_num);
		}
		else
		{
			os_printf("%s err,get_takephoto_thread_status:%d\n",__FUNCTION__,get_takephoto_thread_status());
		}
	}
	
	if(e->target == photo_next_btn){
		page_num++;
		if(page_num == 9)
			page_num = 1;

		printf("take photo next(%d)...................................\r\n",page_num);
		lv_page_select(page_num);
	}

	if(e->target == rahmen_btn){
		if(rahmen_open == 0){
			rahmen_open = 1;
			vpp_set_ifp_en(vpp_dev,1);
		}else{
			rahmen_open = 0;
			vpp_set_ifp_en(vpp_dev,0);
		}		
	}	
}

void page_wifi_analyze(lv_event_t * e){
	if(e->target == wifi_back_btn){
		lv_page_select(0);
		page_num = 0;
	}
	
	if(e->target == wifi_next_btn){
		page_num++;
		if(page_num == 9)
			page_num = 1;
		lv_page_select(page_num);
	}
}

void page_setting_analyze(lv_event_t * e){
	if(e->target == setting_back_btn){
		lv_page_select(0);
		page_num = 0;
	}
	
	if(e->target == setting_next_btn){
		page_num++;
		if(page_num == 9)
			page_num = 1;
		lv_page_select(page_num);
	}

}
  
void page_playback_photo_analyze(lv_event_t * e){
	uint8_t name[16];
	
	if(e->target == next_photo_btn){
		jpeg_file_get(name,0,"JPEG");
		sprintf((char *)name_rec_photo,"%s%s","0:DCIM/",name);
		printf("name_rec_photo:%s\r\n",name_rec_photo);
		jpeg_photo_explain(name_rec_photo);
	}			
	
	if(e->target == playback_photo_back_btn){
		lv_page_select(0);
		page_num = 0;
	}
	
	if(e->target == playback_photo_next_btn){
		page_num++;
		if(page_num == 9)
			page_num = 1;
		lv_page_select(page_num);
	}

}

void page_playback_rec_analyze(lv_event_t * e){
	uint8_t name[16];
	if(e->target == next_rec_btn){
		if(global_avi_exit){
			os_printf("replay\r\n\r\n");
			rec_playback_thread_init(name_rec_photo);
			os_sleep_ms(10);
		}
		global_avi_running ^= BIT(0);
	}			

	if(e->target == playback_rec_back_btn){
		global_avi_exit = 1;
		lv_page_select(0);
		page_num = 0;
	}
	
	if(e->target == playback_rec_next_btn){
		global_avi_exit = 1;
		page_num++;
		if(page_num == 9)
			page_num = 1;
		lv_page_select(page_num);
	}
	
	if(e->target == setting_option_btn[NEXT_REC_STR]){
		global_avi_exit = 1;
		os_sleep_ms(10);
		jpeg_file_get(name,0,"AVI");
		sprintf((char *)name_rec_photo,"%s%s","0:DCIM/",name);
		rec_playback_thread_init(name_rec_photo);				
	}
}


void page_game_analyze(lv_event_t * e){
	
	if(e->target == game_start_btn){
		printf("play game...\r\n");

		game_list();
	}			
	
	if(e->target == game_back_btn){
		lv_page_select(0);
		page_num = 0;
	}
	
	if(e->target == game_next_btn){
		page_num++;
		if(page_num == 9)
			page_num = 1;
		lv_page_select(page_num);
	}

}

void page_spi_sensor_analyze(lv_event_t * e){
	struct lcdc_device *lcd_dev;
	lcd_dev = (struct lcdc_device *)dev_get(HG_LCDC_DEVID);
	
	if(e->target == spi_back_btn){
		spi_video_run = 0;
		//lcdc_set_rotate_mirror(lcd_dev,0,LCD_ROTATE_90);
#if LCD_33_WVGA
		set_lcd_photo1_config(848,480,0);
#else	
		//set_lcd_photo1_config(320,240,0);
#endif		
		lv_page_select(0);
		page_num = 0;
	}
	
	if(e->target == spi_next_btn){
		spi_video_run = 0;
		lcdc_set_rotate_mirror(lcd_dev,0,LCD_ROTATE_90);
		set_lcd_photo1_config(320,240,0);		
		page_num++;
		if(page_num == 9)
			page_num = 1;
		lv_page_select(page_num);
	}

} 

extern uint8_t  enable_video_usb_to_lcd(uint8_t enable);
//如果打开了uvc,也要停止
static void uvc_release(lv_event_t * e)
{
	if(uvc_start)
	{
		uvc_start ^= BIT(0);
		uvc_open = 0;		
		enable_video_usb_to_lcd(0);	

	}
}

//如果是录像,则要停止
static void rec_release(lv_event_t * e)
{
	os_printf("%s start\n",__FUNCTION__);
	if(rec_open)
	{
		struct scale_device *scale_dev;
		scale_dev = (struct scale_device *)dev_get(HG_SCALE1_DEVID);
		scale_close(scale_dev);
		rec_open = 0;
		send_stop_record_cmd();		
		del_time_label();
	}
}

static void event_handler(lv_event_t * e)
{
	lv_event_code_t code = lv_event_get_code(e);
	struct lcdc_device *lcd_dev;
	struct scale_device *scale_dev;
	scale_dev = (struct scale_device *)dev_get(HG_SCALE1_DEVID);
	lcd_dev = (struct lcdc_device *)dev_get(HG_LCDC_DEVID);	
	if(code == LV_EVENT_KEY){
		if(page_cur == 0){
			main_menu_key_analyze(e);
		}
	}

	
	if(code == LV_EVENT_CLICKED) {
		LV_LOG_USER("Clicked");
		if(page_cur == 0){
			page0_analyze(e);
		}else if(page_cur == 1){
			page_rec_analyze(e);
		}else if(page_cur == 2){
			page_takephoto_analyze(e);
		}else if(page_cur == 3){
			page_wifi_analyze(e);
		}else if(page_cur == 4){
			page_playback_photo_analyze(e);
		}else if(page_cur == 5){
			page_playback_rec_analyze(e);
		}else if(page_cur == 6){
			page_setting_analyze(e);
		}else if(page_cur == 7){
			page_game_analyze(e);
		}else if(page_cur == 8){
			page_spi_sensor_analyze(e);
		}
		
	}
	else if(code == LV_EVENT_VALUE_CHANGED) {
		LV_LOG_USER("Toggled");
	}
}

void lv_page_usb_config();
void timer_event(){
	static uint8_t rec_num = 1;
	static uint32 timer_count = 0;
	static uint32 usb_tick = 0;
	static uint8_t usb_mode = 0;
	lv_obj_t *btn = NULL;
	struct lcdc_device *lcd_dev;
	struct vpp_device *vpp_dev;
	lcd_dev = (struct lcdc_device *)dev_get(HG_LCDC_DEVID);	
	vpp_dev = (struct vpp_device *)dev_get(HG_VPP_DEVID);	
	if((timer_count%2) == 0){
		if(page_cur == 1){
			if(rec_open){
				lv_time_add(&time_msg);
				display_time(page1_obj,&time_msg);	
				dv_flash(rec_num&BIT(0));
				rec_num++;
			}
		}
	}

	if(page_cur == 0){
		if(group0_golop != NULL){
			btn = lv_group_get_focused(group0_golop);	
			if((timer_count%2)== 0){
				lv_imgbtn_set_src(btn, LV_IMGBTN_STATE_RELEASED, &menu_null, &menu_null, &menu_null);	
			}
			else{
				lv_imgbtn_set_src(record_btn, LV_IMGBTN_STATE_RELEASED, &menu1_0, &menu1_1, &menu1_2);	
				lv_imgbtn_set_src(photo_btn, LV_IMGBTN_STATE_RELEASED, &menu2_0, &menu2_1, &menu2_2);	
				lv_imgbtn_set_src(wifi_btn, LV_IMGBTN_STATE_RELEASED, &menu3_0, &menu3_1, &menu3_2);	
				lv_imgbtn_set_src(setting_btn, LV_IMGBTN_STATE_RELEASED, &menu4_0, &menu4_1, &menu4_2);	
				lv_imgbtn_set_src(playback_photo_btn, LV_IMGBTN_STATE_RELEASED, &menu5_0, &menu5_1, &menu5_2);	
				lv_imgbtn_set_src(playback_rec_btn, LV_IMGBTN_STATE_RELEASED, &menu6_0, &menu6_1, &menu6_2);	
				lv_imgbtn_set_src(game_btn, LV_IMGBTN_STATE_RELEASED, &menu_test, &menu_test, &menu_test);	
				lv_imgbtn_set_src(spi_btn, LV_IMGBTN_STATE_RELEASED, &menu_spi, &menu_spi, &menu_spi);
			}
		}
	}
	if((timer_count%4) == 0){
		if(scsi_count != usb_tick){
			usb_tick = scsi_count;
			if(usb_mode == 0){
				lcd_info.lcd_p0p1_state = 2;
				lcdc_set_video_en(lcd_dev,0);
				vpp_close(vpp_dev);

				video_decode_mem  = video_psram_mem;
				video_decode_mem1 = video_psram_mem;
				video_decode_mem2 = video_psram_mem;
				jpg_dec_scale_del();
				set_lcd_photo1_config(SCALE_WIDTH,SCALE_HIGH,0);
				jpg_decode_scale_config();
				memcpy(video_psram_mem1,menu_usb,sizeof(menu_usb));
				jpg_decode_to_lcd((uint32)video_psram_mem1,848,480,SCALE_WIDTH,SCALE_HIGH);
				lcdc_set_video_en(lcd_dev,1);
				page_num = 15;

				//lv_scr_load_anim(page15_obj, LV_SCR_LOAD_ANIM_MOVE_RIGHT, 0, 0, false);
				lv_page_usb_config();
				usb_mode = 1;
			}
		}else{
			if(usb_mode == 1){
				usb_mode = 0;
				lv_page_select(0);
			}
		}
	}

	timer_count++;
}

void lv_time_set(){
	static uint32_t user_data = 10;
	lv_timer_create(timer_event, 500,  &user_data);
}

void lv_page_main_menu_config(){	
	static lv_style_t style5;

	group0_golop = lv_group_create();
	//lv_indev_set_group(indev_keypad, group0_golop);
	group_cur = group0_golop;
	lv_style_reset(&style5);
	lv_style_init(&style5);
	lv_style_set_bg_color(&style5, lv_color_make(0x00, 0x00, 0x00));	
	lv_style_set_shadow_color(&style5, lv_color_make(0x00, 0x00, 0x00));
	lv_style_set_border_color(&style5, lv_color_make(0x00, 0x00, 0x00));
	lv_style_set_outline_color(&style5, lv_color_make(0x00, 0x00, 0x00));
	lv_style_set_radius(&style5,0);
	page0_obj = lv_obj_create(lv_scr_act());//lv_obj_create(lv_scr_act());	
	cur_obj = page0_obj;
	lv_obj_set_size(page0_obj, SCALE_WIDTH, SCALE_HIGH);
	lv_obj_add_style(page0_obj, &style5, 0);
	lv_obj_set_style_text_font(page0_obj, &myfont, 0);

	lv_obj_t * btn1 = lv_imgbtn_create(page0_obj);
	record_btn = btn1;		
	lv_obj_add_event_cb(btn1, event_handler, LV_EVENT_ALL, NULL);
	lv_imgbtn_set_src(btn1, LV_IMGBTN_STATE_RELEASED, &menu1_0, &menu1_1, &menu1_2);
	lv_imgbtn_set_src(btn1, LV_IMGBTN_STATE_PRESSED, &menu1_0, &menu1_1, &menu1_2);
	lv_obj_align(btn1, LV_ALIGN_TOP_LEFT, 0, 0);
	lv_obj_set_size(btn1,60,60);
	//label = lv_label_create(btn1);
	//lv_label_set_text(label, language_switch[language_cur][RECORD_STR]);
	//lv_obj_center(label);
	lv_group_add_obj(group0_golop, btn1);
	
	lv_obj_t * btn3 = lv_imgbtn_create(page0_obj);
	photo_btn = btn3;		
	lv_obj_add_event_cb(btn3, event_handler, LV_EVENT_ALL, NULL);
	lv_imgbtn_set_src(btn3, LV_IMGBTN_STATE_RELEASED, &menu2_0, &menu2_1, &menu2_2);
	lv_imgbtn_set_src(btn3, LV_IMGBTN_STATE_PRESSED, &menu2_0, &menu2_1, &menu2_2);
	lv_obj_align(btn3, LV_ALIGN_TOP_MID, 0, 0);
	lv_obj_set_size(btn3,60,60);
	lv_group_add_obj(group0_golop, btn3);
	
	lv_obj_t * btn4 = lv_imgbtn_create(page0_obj);
	wifi_btn = btn4;		
	lv_obj_add_event_cb(btn4, event_handler, LV_EVENT_ALL, NULL);
	lv_imgbtn_set_src(btn4, LV_IMGBTN_STATE_RELEASED, &menu3_0, &menu3_1, &menu3_2);
	lv_imgbtn_set_src(btn4, LV_IMGBTN_STATE_PRESSED, &menu3_0, &menu3_1, &menu3_2);
	lv_obj_align(btn4, LV_ALIGN_TOP_RIGHT, 0, 0);
	lv_obj_set_size(btn4,60,60);
	lv_group_add_obj(group0_golop, btn4);
	

	
	lv_obj_t * btn5 = lv_imgbtn_create(page0_obj);
	playback_photo_btn = btn5;	
	lv_obj_add_event_cb(btn5, event_handler, LV_EVENT_ALL, NULL);
	lv_imgbtn_set_src(btn5, LV_IMGBTN_STATE_RELEASED, &menu5_0, &menu5_1, &menu5_2);
	lv_imgbtn_set_src(btn5, LV_IMGBTN_STATE_PRESSED, &menu5_0, &menu5_1, &menu5_2);
	lv_obj_align(btn5, LV_ALIGN_TOP_LEFT, 0, 70);
	//lv_obj_align(btn5, LV_ALIGN_TOP_MID, 0, 80);
	lv_obj_set_size(btn5,60,60);
	lv_group_add_obj(group0_golop, btn5);
	
	lv_obj_t * btn6 = lv_imgbtn_create(page0_obj);
	playback_rec_btn = btn6;	
	lv_obj_add_event_cb(btn6, event_handler, LV_EVENT_ALL, NULL);
	lv_imgbtn_set_src(btn6, LV_IMGBTN_STATE_RELEASED, &menu6_0, &menu6_1, &menu6_2);
	lv_imgbtn_set_src(btn6, LV_IMGBTN_STATE_PRESSED, &menu6_0, &menu6_1, &menu6_2);
	lv_obj_align(btn6, LV_ALIGN_TOP_MID, 0, 70);
//	lv_obj_align(btn6, LV_ALIGN_TOP_RIGHT, 0, 80);
	lv_obj_set_size(btn6,60,60);
	lv_group_add_obj(group0_golop, btn6);

	lv_obj_t * btn2 = lv_imgbtn_create(page0_obj);
	setting_btn = btn2; 	
	lv_obj_add_event_cb(btn2, event_handler, LV_EVENT_ALL, NULL);
	lv_imgbtn_set_src(btn2, LV_IMGBTN_STATE_RELEASED, &menu4_0, &menu4_1, &menu4_2);
	lv_imgbtn_set_src(btn2, LV_IMGBTN_STATE_PRESSED, &menu4_0, &menu4_1, &menu4_2);
	//lv_obj_align(btn2, LV_ALIGN_TOP_LEFT, 0, 80);
	lv_obj_align(btn2, LV_ALIGN_TOP_RIGHT, 0, 70);
	lv_obj_set_size(btn2,60,60);
	lv_group_add_obj(group0_golop, btn2);


	
	lv_obj_t * btn7 = lv_imgbtn_create(page0_obj);
	game_btn = btn7;	
	lv_obj_add_event_cb(btn7, event_handler, LV_EVENT_ALL, NULL);
	lv_imgbtn_set_src(btn7, LV_IMGBTN_STATE_RELEASED, &menu_test, &menu_test, &menu_test);
	lv_imgbtn_set_src(btn7, LV_IMGBTN_STATE_PRESSED, &menu_test, &menu_test, &menu_test);
	lv_obj_align(btn7, LV_ALIGN_TOP_LEFT, 0, 140);
	lv_obj_set_size(btn7,60,60);
	lv_group_add_obj(group0_golop, btn7);



	lv_obj_t * btn8 = lv_imgbtn_create(page0_obj);
	spi_btn = btn8;	
	lv_obj_add_event_cb(btn8, event_handler, LV_EVENT_ALL, NULL);
	lv_imgbtn_set_src(btn8, LV_IMGBTN_STATE_RELEASED, &menu_spi, &menu_spi, &menu_spi);
	lv_imgbtn_set_src(btn8, LV_IMGBTN_STATE_PRESSED, &menu_spi, &menu_spi, &menu_spi);
	lv_obj_align(btn8, LV_ALIGN_TOP_MID, 0, 140);
	lv_obj_set_size(btn8,60,60);
	lv_group_add_obj(group0_golop, btn8);

}

void lv_page_rec_config(){
	static lv_style_t style2;
	static lv_style_t style3;
	static lv_style_t style4;
	static lv_style_t style5;
	static lv_style_t style6;
	static lv_style_t style7;
    lv_obj_t * label;
	lv_obj_t * img;
	lv_obj_t * img2;

	group1_golop = lv_group_create();
	//lv_indev_set_group(indev_keypad, group1_golop);
	group_cur = group1_golop;
	lv_style_reset(&style5);
	lv_style_init(&style5);
	lv_style_set_bg_color(&style5, lv_color_make(0x00, 0x00, 0x00));	
	lv_style_set_shadow_color(&style5, lv_color_make(0x00, 0x00, 0x00));
	lv_style_set_border_color(&style5, lv_color_make(0x00, 0x00, 0x00));
	lv_style_set_outline_color(&style5, lv_color_make(0x00, 0x00, 0x00));
	lv_style_set_radius(&style5,0);
	page1_obj = lv_obj_create(lv_scr_act());//lv_obj_create(lv_scr_act());//
	cur_obj = page1_obj;
	lv_obj_set_size(page1_obj, SCALE_WIDTH, SCALE_HIGH);
	lv_obj_add_style(page1_obj, &style5, 0);
	lv_obj_set_style_text_font(page1_obj, &myfont, 0);
	
	img = lv_img_create(page1_obj);
	lv_img_set_src(img,&rec);
	
	img2 = lv_img_create(page1_obj);
	label_rec = img2;
	lv_img_set_src(img2,&DV_W);
	lv_obj_set_pos(img2, SCALE_WIDTH-80, 0);
	
	
	lv_obj_t * btn1 = lv_btn_create(page1_obj);
	start_rec_btn = btn1;
	lv_obj_add_event_cb(btn1, event_handler, LV_EVENT_ALL, NULL);
	lv_obj_add_event_cb(btn1, rec_release, LV_EVENT_DELETE, NULL);

	lv_obj_align(btn1, LV_ALIGN_CENTER, 0, -100);
	lv_style_reset(&style2);
	lv_style_init(&style2);
	lv_style_set_bg_color(&style2, lv_color_make(0x0, 0x80, 0x00)); 
	lv_style_set_shadow_color(&style2, lv_color_make(0xff, 0xff, 0xff));
	lv_style_set_border_color(&style2, lv_color_make(0xff, 0xff, 0xff));
	lv_style_set_outline_color(&style2, lv_color_make(0xff, 0xff, 0xff));	
	lv_obj_add_style(btn1, &style2, 0);
	
	lv_group_add_obj(group1_golop, btn1);
	
	label = lv_label_create(btn1);
	lv_label_set_text(label, (const char *)language_switch[language_cur][RECORD_STR]);
	lv_obj_center(label);
	
	lv_obj_t * btn2 = lv_btn_create(page1_obj);
	rec_next_btn = btn2;
	lv_obj_add_event_cb(btn2, event_handler, LV_EVENT_ALL, NULL);
	lv_obj_align(btn2, LV_ALIGN_CENTER, 0, -55);	//参数三四为对齐后采取的偏移
	lv_obj_add_flag(btn2, LV_OBJ_FLAG_CHECKABLE);
	lv_obj_set_height(btn2, LV_SIZE_CONTENT);
	
	lv_group_add_obj(group1_golop, btn2);
	lv_style_reset(&style3);
	lv_style_init(&style3);
	lv_style_set_radius(&style3,0); //圆边
	lv_style_set_bg_color(&style3, lv_color_make(0xc0, 0xe0, 0x12));	
	lv_style_set_shadow_color(&style3, lv_color_make(0xff, 0xff, 0xff));	
	//lv_style_set_transition(lv_style_t * style, const lv_style_transition_dsc_t * value)
	lv_obj_add_style(btn2, &style3, 0);
	label = lv_label_create(btn2);
	
	lv_label_set_text(label, (const char *)language_switch[language_cur][NEXT_STR]);
	lv_obj_center(label);
	
	lv_obj_t * btn3 = lv_btn_create(page1_obj);
	rec_back_btn = btn3;
	lv_obj_add_event_cb(btn3, event_handler, LV_EVENT_ALL, NULL);
	label = lv_label_create(btn3);
	lv_label_set_text(label, (const char *)language_switch[language_cur][EXIT_STR]);
	lv_obj_center(label);
	lv_obj_align(btn3, LV_ALIGN_CENTER, 0, -10);	  
	lv_obj_add_flag(btn3, LV_OBJ_FLAG_CHECKABLE);
	lv_obj_set_size(btn3,80,40);
	lv_style_reset(&style4);
	lv_style_init(&style4);
	lv_style_set_radius(&style4,0); //圆边
	lv_style_set_bg_color(&style4, lv_color_make(0xb0, 0x50, 0xc2));	
	//lv_style_set_shadow_width(&style4, 0);
	lv_style_set_shadow_color(&style4, lv_color_make(0xff, 0xff, 0xff));
	lv_obj_add_style(btn3, &style4, 0);
	
	lv_group_add_obj(group1_golop, btn3);
	
	lv_obj_t * btn4 = lv_btn_create(page1_obj);
	uvc_on_btn = btn4;
	lv_obj_add_event_cb(btn4, event_handler, LV_EVENT_ALL, NULL);
	//设置当按键被删除的时候,要释放的资源
	lv_obj_add_event_cb(btn4, uvc_release, LV_EVENT_DELETE, NULL);
	label = lv_label_create(btn4);
	label_uvc_on = label;
	lv_label_set_text(label, "uvc_on");
	lv_obj_center(label);
	lv_obj_align(btn4, LV_ALIGN_CENTER, 0, 35);   
	lv_obj_add_flag(btn4, LV_OBJ_FLAG_CHECKABLE);
	lv_obj_set_size(btn4,80,40);
	lv_style_reset(&style4);
	lv_style_init(&style4);
	lv_style_set_radius(&style4,0); //圆边
	lv_style_set_bg_color(&style4, lv_color_make(0xb0, 0x50, 0xc2));	
	//lv_style_set_shadow_width(&style4, 0);
	lv_style_set_shadow_color(&style4, lv_color_make(0xff, 0xff, 0xff));
	lv_obj_add_style(btn4, &style4, 0);
	lv_group_add_obj(group1_golop, btn4);
	
	
	lv_obj_t * btn5 = lv_btn_create(page1_obj);
	larger_btn = btn5;
	lv_obj_add_event_cb(btn5, event_handler, LV_EVENT_ALL, NULL);
	label = lv_label_create(btn5);
	lv_label_set_text(label, (const char *)language_switch[language_cur][LARGER_STR]);
	lv_obj_center(label);
	lv_obj_align(btn5, LV_ALIGN_CENTER, 0, 80);	  
	lv_obj_add_flag(btn5, LV_OBJ_FLAG_CHECKABLE);
	lv_obj_set_size(btn5,80,40);
	lv_style_reset(&style6);
	lv_style_init(&style6);
	lv_style_set_radius(&style6,0); //圆边
	lv_style_set_bg_color(&style6, lv_color_make(0x70, 0x90, 0x22));	
	//lv_style_set_shadow_width(&style4, 0);
	lv_style_set_shadow_color(&style6, lv_color_make(0xff, 0xff, 0xff));
	lv_obj_add_style(btn5, &style6, 0);
	lv_group_add_obj(group1_golop, btn5);		


	lv_obj_t * btn6 = lv_btn_create(page1_obj);
	rahmen_btn = btn6;
	lv_obj_add_event_cb(btn6, event_handler, LV_EVENT_ALL, NULL);
	label = lv_label_create(btn6);
	lv_label_set_text(label, (const char *)language_switch[language_cur][RAHMEN_STR]);
	lv_obj_center(label);
	lv_obj_align(btn6, LV_ALIGN_CENTER, 90, -10);	  
	lv_obj_add_flag(btn6, LV_OBJ_FLAG_CHECKABLE);
	lv_obj_set_size(btn6,80,40);
	lv_style_reset(&style7);
	lv_style_init(&style7);
	lv_style_set_radius(&style7,0); //圆边
	lv_style_set_bg_color(&style7, lv_color_make(0x70, 0x90, 0x22));	
	//lv_style_set_shadow_width(&style4, 0);
	lv_style_set_shadow_color(&style7, lv_color_make(0xff, 0xff, 0xff));
	lv_obj_add_style(btn6, &style7, 0);
	lv_group_add_obj(group1_golop, btn6);		
	
	//lv_scr_load_anim(cur_obj, LV_SCR_LOAD_ANIM_FADE_ON, 1000, 0, true);

}

void lv_page_photo_config(){
	static lv_style_t style2;
	static lv_style_t style3;
	static lv_style_t style4;
	static lv_style_t style5;
	static lv_style_t style6;
	lv_obj_t * label;
	lv_obj_t * img;

	group2_golop = lv_group_create();
	//lv_indev_set_group(indev_keypad, group2_golop);
	group_cur = group2_golop;
	lv_style_reset(&style5);
	lv_style_init(&style5);
	lv_style_set_bg_color(&style5, lv_color_make(0x00, 0x00, 0x00));	
	lv_style_set_shadow_color(&style5, lv_color_make(0x00, 0x00, 0x00));
	lv_style_set_border_color(&style5, lv_color_make(0x00, 0x00, 0x00));
	lv_style_set_outline_color(&style5, lv_color_make(0x00, 0x00, 0x00));
	lv_style_set_radius(&style5,0);
	page2_obj = lv_obj_create(lv_scr_act());//
	cur_obj = page2_obj;
	lv_obj_set_size(page2_obj, SCALE_WIDTH, SCALE_HIGH);
	lv_obj_add_style(page2_obj, &style5, 0);
	lv_obj_set_style_text_font(page2_obj, &myfont, 0);
	img = lv_img_create(page2_obj);
	lv_img_set_src(img,&photo); 
	
	lv_obj_t * btn1 = lv_btn_create(page2_obj);
	take_photo_btn = btn1;
	lv_obj_add_event_cb(btn1, event_handler, LV_EVENT_ALL, NULL);
	lv_obj_align(btn1, LV_ALIGN_CENTER, 0, -60);
	lv_style_reset(&style2);
	lv_style_init(&style2);
	lv_style_set_bg_color(&style2, lv_color_make(0x0, 0x80, 0x00)); 
	lv_style_set_shadow_color(&style2, lv_color_make(0xff, 0xff, 0xff));
	lv_style_set_border_color(&style2, lv_color_make(0xff, 0xff, 0xff));
	lv_style_set_outline_color(&style2, lv_color_make(0xff, 0xff, 0xff));	
	lv_obj_add_style(btn1, &style2, 0);
	
	lv_group_add_obj(group2_golop, btn1);
	
	label = lv_label_create(btn1);
	lv_label_set_text(label, (const char *)language_switch[language_cur][TAKEPHOTO_STR]);
	lv_obj_center(label);
	
	lv_obj_t * btn2 = lv_btn_create(page2_obj);
	photo_next_btn = btn2;
	lv_obj_add_event_cb(btn2, event_handler, LV_EVENT_ALL, NULL);
	lv_obj_align(btn2, LV_ALIGN_CENTER, 0, 0);	//参数三四为对齐后采取的偏移
	lv_obj_add_flag(btn2, LV_OBJ_FLAG_CHECKABLE);
	lv_obj_set_height(btn2, LV_SIZE_CONTENT);
	
	lv_group_add_obj(group2_golop, btn2);
	lv_style_reset(&style3);
	lv_style_init(&style3);
	lv_style_set_radius(&style3,0); //圆边
	lv_style_set_bg_color(&style3, lv_color_make(0xc0, 0xe0, 0x12));	
	lv_style_set_shadow_color(&style3, lv_color_make(0xff, 0xff, 0xff));	
	//lv_style_set_transition(lv_style_t * style, const lv_style_transition_dsc_t * value)
	lv_obj_add_style(btn2, &style3, 0);
	
	label = lv_label_create(btn2);
	
	lv_label_set_text(label, (const char *)language_switch[language_cur][NEXT_STR]);
	lv_obj_center(label);
	
	lv_obj_t * btn3 = lv_btn_create(page2_obj);
	photo_back_btn = btn3;
	lv_obj_add_event_cb(btn3, event_handler, LV_EVENT_ALL, NULL);
	label = lv_label_create(btn3);
	lv_label_set_text(label, (const char *)language_switch[language_cur][EXIT_STR]);
	lv_obj_center(label);
	lv_obj_align(btn3, LV_ALIGN_CENTER, 0, 60);   
	lv_obj_add_flag(btn3, LV_OBJ_FLAG_CHECKABLE);
	lv_obj_set_size(btn3,80,40);
	lv_style_reset(&style4);
	lv_style_init(&style4);
	lv_style_set_radius(&style4,0); //圆边
	lv_style_set_bg_color(&style4, lv_color_make(0xb0, 0x50, 0xc2));	
	//lv_style_set_shadow_width(&style4, 0);
	lv_style_set_shadow_color(&style4, lv_color_make(0xff, 0xff, 0xff));
	lv_obj_add_style(btn3, &style4, 0);
	lv_group_add_obj(group2_golop, btn3);


	lv_obj_t * btn4 = lv_btn_create(page2_obj);
	rahmen_btn = btn4;
	lv_obj_add_event_cb(btn4, event_handler, LV_EVENT_ALL, NULL);
	label = lv_label_create(btn4);
	lv_label_set_text(label, (const char *)language_switch[language_cur][RAHMEN_STR]);
	lv_obj_center(label);
	lv_obj_align(btn4, LV_ALIGN_CENTER, 90, -10);	  
	lv_obj_add_flag(btn4, LV_OBJ_FLAG_CHECKABLE);
	lv_obj_set_size(btn4,80,40);
	lv_style_reset(&style6);
	lv_style_init(&style6);
	lv_style_set_radius(&style6,0); //圆边
	lv_style_set_bg_color(&style6, lv_color_make(0x70, 0x90, 0x22));	
	//lv_style_set_shadow_width(&style4, 0);
	lv_style_set_shadow_color(&style6, lv_color_make(0xff, 0xff, 0xff));
	lv_obj_add_style(btn4, &style6, 0);
	lv_group_add_obj(group2_golop, btn4);	

}

void lv_page_wifi_config(){
	static lv_style_t style2;
	static lv_style_t style3;
	static lv_style_t style4;
	static lv_style_t style5;

	lv_obj_t * label;

	group3_golop = lv_group_create();
	//lv_indev_set_group(indev_keypad, group3_golop);
	group_cur = group3_golop;
	lv_style_reset(&style5);
	lv_style_init(&style5);
	lv_style_set_bg_color(&style5, lv_color_make(0x00, 0x00, 0x00));	
	lv_style_set_shadow_color(&style5, lv_color_make(0x00, 0x00, 0x00));
	lv_style_set_border_color(&style5, lv_color_make(0x00, 0x00, 0x00));
	lv_style_set_outline_color(&style5, lv_color_make(0x00, 0x00, 0x00));
	lv_style_set_radius(&style5,0);
	page3_obj = lv_obj_create(lv_scr_act());//
	cur_obj = page3_obj;
	lv_obj_set_size(page3_obj, SCALE_WIDTH, SCALE_HIGH);
	lv_obj_add_style(page3_obj, &style5, 0);
	lv_obj_set_style_text_font(page3_obj, &myfont, 0);
	
	lv_obj_t * btn1 = lv_btn_create(page3_obj);
	lv_obj_add_event_cb(btn1, event_handler, LV_EVENT_ALL, NULL);
	lv_obj_align(btn1, LV_ALIGN_CENTER, 0, -60);
	lv_style_reset(&style2);
	lv_style_init(&style2);
	lv_style_set_bg_color(&style2, lv_color_make(0x0, 0x80, 0x00)); 
	lv_style_set_shadow_color(&style2, lv_color_make(0xff, 0xff, 0xff));
	lv_style_set_border_color(&style2, lv_color_make(0xff, 0xff, 0xff));
	lv_style_set_outline_color(&style2, lv_color_make(0xff, 0xff, 0xff));	
	lv_obj_add_style(btn1, &style2, 0);
	
	lv_group_add_obj(group3_golop, btn1);
	
	label = lv_label_create(btn1);
	lv_label_set_text(label, (const char *)language_switch[language_cur][WIFI_STR]);
	lv_obj_center(label);
	
	lv_obj_t * btn2 = lv_btn_create(page3_obj);
	wifi_next_btn = btn2;
	lv_obj_add_event_cb(btn2, event_handler, LV_EVENT_ALL, NULL);
	lv_obj_align(btn2, LV_ALIGN_CENTER, 0, 0);	//参数三四为对齐后采取的偏移
	lv_obj_add_flag(btn2, LV_OBJ_FLAG_CHECKABLE);
	lv_obj_set_height(btn2, LV_SIZE_CONTENT);
	
	lv_group_add_obj(group3_golop, btn2);
	lv_style_reset(&style3);
	lv_style_init(&style3);
	lv_style_set_radius(&style3,0); //圆边
	lv_style_set_bg_color(&style3, lv_color_make(0xc0, 0xe0, 0x12));	
	lv_style_set_shadow_color(&style3, lv_color_make(0xff, 0xff, 0xff));	
	//lv_style_set_transition(lv_style_t * style, const lv_style_transition_dsc_t * value)
	lv_obj_add_style(btn2, &style3, 0);
	
	label = lv_label_create(btn2);
	
	lv_label_set_text(label, (const char *)language_switch[language_cur][NEXT_STR]);
	lv_obj_center(label);
	
	lv_obj_t * btn3 = lv_btn_create(page3_obj);
	wifi_back_btn = btn3;
	lv_obj_add_event_cb(btn3, event_handler, LV_EVENT_ALL, NULL);
	label = lv_label_create(btn3);
	lv_label_set_text(label, (const char *)language_switch[language_cur][EXIT_STR]);
	lv_obj_center(label);
	lv_obj_align(btn3, LV_ALIGN_CENTER, 0, 60);   
	lv_obj_add_flag(btn3, LV_OBJ_FLAG_CHECKABLE);
	lv_obj_set_size(btn3,80,40);
	lv_style_reset(&style4);
	lv_style_init(&style4);
	lv_style_set_radius(&style4,0); //圆边
	lv_style_set_bg_color(&style4, lv_color_make(0xb0, 0x50, 0xc2));	
	//lv_style_set_shadow_width(&style4, 0);
	lv_style_set_shadow_color(&style4, lv_color_make(0xff, 0xff, 0xff));
	lv_obj_add_style(btn3, &style4, 0);
	
	lv_group_add_obj(group3_golop, btn3);		

}

void lv_page_setting_config(){
	static lv_style_t style5;
	lv_obj_t *main_list;
	group4_golop = lv_group_create();
	//lv_indev_set_group(indev_keypad, group4_golop);
	group_cur = group4_golop;
	lv_style_reset(&style5);
	lv_style_init(&style5);
	lv_style_set_bg_color(&style5, lv_color_make(0x00, 0x00, 0x00));	
	lv_style_set_shadow_color(&style5, lv_color_make(0x00, 0x00, 0x00));
	lv_style_set_border_color(&style5, lv_color_make(0x00, 0x00, 0x00));
	lv_style_set_outline_color(&style5, lv_color_make(0x00, 0x00, 0x00));
	lv_style_set_radius(&style5,0);
	page4_obj = lv_obj_create(lv_scr_act());//NULL
	cur_obj = page4_obj;
	lv_obj_set_size(page4_obj, SCALE_WIDTH, SCALE_HIGH);
	lv_obj_add_style(page4_obj, &style5, 0);
	lv_obj_set_style_text_font(page4_obj, &myfont, 0);
	
	main_list = lv_list_create(page4_obj);
	lv_obj_add_flag(main_list, LV_OBJ_FLAG_HIDDEN);  
	lv_obj_clear_flag(main_list, LV_OBJ_FLAG_HIDDEN);
	lv_obj_set_size(main_list, SCALE_WIDTH, SCALE_HIGH);
	lv_obj_center(main_list);		
	lv_obj_t * btn1 = lv_list_add_btn(main_list, NULL, (const char *)language_switch[language_cur][SOUND_STR]);
	lv_obj_add_event_cb(btn1, setting_handler, LV_EVENT_ALL, NULL);
	setting_option_btn[SOUND_STR] = btn1;
	lv_group_add_obj(group4_golop, btn1);
	btn1 = lv_list_add_btn(main_list, NULL, (const char *)language_switch[language_cur][ISO_STR]);
	lv_obj_add_event_cb(btn1, setting_handler, LV_EVENT_ALL, NULL);
	setting_option_btn[ISO_STR] = btn1;
	lv_group_add_obj(group4_golop, btn1);
	btn1 = lv_list_add_btn(main_list, NULL, (const char *)language_switch[language_cur][RECORD_STR]);
	lv_obj_add_event_cb(btn1, setting_handler, LV_EVENT_ALL, NULL);
	setting_option_btn[RECORD_STR] = btn1;
	lv_group_add_obj(group4_golop, btn1);
	btn1 = lv_list_add_btn(main_list, NULL, (const char *)language_switch[language_cur][TAKEPHOTO_STR]);
	lv_obj_add_event_cb(btn1, setting_handler, LV_EVENT_ALL, NULL);
	setting_option_btn[TAKEPHOTO_STR] = btn1;
	lv_group_add_obj(group4_golop, btn1);
	btn1 = lv_list_add_btn(main_list, NULL, (const char *)language_switch[language_cur][FORMAT_STR]);
	lv_obj_add_event_cb(btn1, setting_handler, LV_EVENT_ALL, NULL);
	setting_option_btn[FORMAT_STR] = btn1;
	lv_group_add_obj(group4_golop, btn1);
	btn1 = lv_list_add_btn(main_list, NULL, (const char *)language_switch[language_cur][CYCLE_STR]);
	lv_obj_add_event_cb(btn1, setting_handler, LV_EVENT_ALL, NULL);
	setting_option_btn[CYCLE_STR] = btn1;
	lv_group_add_obj(group4_golop, btn1);
	btn1 = lv_list_add_btn(main_list, NULL, (const char *)language_switch[language_cur][BATTERY_STR]);
	lv_obj_add_event_cb(btn1, setting_handler, LV_EVENT_ALL, NULL);
	setting_option_btn[BATTERY_STR] = btn1;
	lv_group_add_obj(group4_golop, btn1);
	btn1 = lv_list_add_btn(main_list, NULL, (const char *)language_switch[language_cur][LANGUAGE_STR]);
	lv_obj_add_event_cb(btn1, setting_handler, LV_EVENT_ALL, NULL);
	setting_option_btn[LANGUAGE_STR] = btn1;
	lv_group_add_obj(group4_golop, btn1);
	btn1 = lv_list_add_btn(main_list, NULL, (const char *)language_switch[language_cur][CONTINUOUS_STR]);
	lv_obj_add_event_cb(btn1, setting_handler, LV_EVENT_ALL, NULL);
	setting_option_btn[CONTINUOUS_STR] = btn1;
	lv_group_add_obj(group4_golop, btn1);
	btn1 = lv_list_add_btn(main_list, NULL, (const char *)language_switch[language_cur][EXIT_STR]);
	lv_obj_add_event_cb(btn1, setting_handler, LV_EVENT_ALL, NULL);
	setting_option_btn[EXIT_STR] = btn1;
	lv_group_add_obj(group4_golop, btn1);
	

}

void lv_page_playback_photo_config(){
	static lv_style_t style2;
	static lv_style_t style3;
	static lv_style_t style4;
	static lv_style_t style5;

	lv_obj_t * label;

	group5_golop = lv_group_create();
	//lv_indev_set_group(indev_keypad, group5_golop);
	group_cur = group5_golop;
	lv_style_reset(&style5);
	lv_style_init(&style5);
	lv_style_set_bg_color(&style5, lv_color_make(0x00, 0x00, 0x00));	
	lv_style_set_shadow_color(&style5, lv_color_make(0x00, 0x00, 0x00));
	lv_style_set_border_color(&style5, lv_color_make(0x00, 0x00, 0x00));
	lv_style_set_outline_color(&style5, lv_color_make(0x00, 0x00, 0x00));
	lv_style_set_radius(&style5,0);
	//cur_obj = lv_obj_create(lv_scr_act());
	page5_obj = lv_obj_create(lv_scr_act());//
	cur_obj = page5_obj;
	lv_obj_set_size(page5_obj, SCALE_WIDTH, SCALE_HIGH);
	lv_obj_add_style(page5_obj, &style5, 0);
	lv_obj_set_style_text_font(page5_obj, &myfont, 0);
	
	
	lv_obj_t * btn1 = lv_btn_create(page5_obj);
	next_photo_btn = btn1;
	lv_obj_add_event_cb(btn1, event_handler, LV_EVENT_ALL, NULL);
	lv_obj_align(btn1, LV_ALIGN_CENTER, 0, -60);
	lv_style_reset(&style2);
	lv_style_init(&style2);
	lv_style_set_bg_color(&style2, lv_color_make(0x0, 0x80, 0x00)); 
	lv_style_set_shadow_color(&style2, lv_color_make(0xff, 0xff, 0xff));
	lv_style_set_border_color(&style2, lv_color_make(0xff, 0xff, 0xff));
	lv_style_set_outline_color(&style2, lv_color_make(0xff, 0xff, 0xff));	
	lv_obj_add_style(btn1, &style2, 0);
	
	lv_group_add_obj(group5_golop, btn1);
	
	label = lv_label_create(btn1);
	lv_label_set_text(label, (const char *)language_switch[language_cur][PLAYBACK_PHOTO_STR]);
	lv_obj_center(label);
	
	lv_obj_t * btn2 = lv_btn_create(page5_obj);
	playback_photo_next_btn = btn2;
	lv_obj_add_event_cb(btn2, event_handler, LV_EVENT_ALL, NULL);
	lv_obj_align(btn2, LV_ALIGN_CENTER, 0, 0);	//参数三四为对齐后采取的偏移
	lv_obj_add_flag(btn2, LV_OBJ_FLAG_CHECKABLE);
	lv_obj_set_height(btn2, LV_SIZE_CONTENT);
	
	lv_group_add_obj(group5_golop, btn2);
	lv_style_reset(&style3);
	lv_style_init(&style3);
	lv_style_set_radius(&style3,0); //圆边
	lv_style_set_bg_color(&style3, lv_color_make(0xc0, 0xe0, 0x12));	
	lv_style_set_shadow_color(&style3, lv_color_make(0xff, 0xff, 0xff));	
	//lv_style_set_transition(lv_style_t * style, const lv_style_transition_dsc_t * value)
	lv_obj_add_style(btn2, &style3, 0);
	
	label = lv_label_create(btn2);
	
	lv_label_set_text(label, (const char *)language_switch[language_cur][NEXT_STR]);
	lv_obj_center(label);
	
	lv_obj_t * btn3 = lv_btn_create(page5_obj);
	playback_photo_back_btn = btn3;
	lv_obj_add_event_cb(btn3, event_handler, LV_EVENT_ALL, NULL);
	label = lv_label_create(btn3);
	lv_label_set_text(label, (const char *)language_switch[language_cur][EXIT_STR]);
	lv_obj_center(label);
	lv_obj_align(btn3, LV_ALIGN_CENTER, 0, 60);   
	lv_obj_add_flag(btn3, LV_OBJ_FLAG_CHECKABLE);
	lv_obj_set_size(btn3,80,40);
	lv_style_reset(&style4);
	lv_style_init(&style4);
	lv_style_set_radius(&style4,0); //圆边
	lv_style_set_bg_color(&style4, lv_color_make(0xb0, 0x50, 0xc2));	
	//lv_style_set_shadow_width(&style4, 0);
	lv_style_set_shadow_color(&style4, lv_color_make(0xff, 0xff, 0xff));
	lv_obj_add_style(btn3, &style4, 0);
	
	lv_group_add_obj(group5_golop, btn3);		

}


void lv_page_playback_rec_config(){
	static lv_style_t style2;
	static lv_style_t style3;
	static lv_style_t style4;
	static lv_style_t style5;
	static lv_style_t style6;
	lv_obj_t * label;
	group6_golop = lv_group_create();
	//lv_indev_set_group(indev_keypad, group6_golop);
	group_cur = group6_golop;
	lv_style_reset(&style5);
	lv_style_init(&style5);
	lv_style_set_bg_color(&style5, lv_color_make(0x00, 0x00, 0x00));	
	lv_style_set_shadow_color(&style5, lv_color_make(0x00, 0x00, 0x00));
	lv_style_set_border_color(&style5, lv_color_make(0x00, 0x00, 0x00));
	lv_style_set_outline_color(&style5, lv_color_make(0x00, 0x00, 0x00));
	lv_style_set_radius(&style5,0);
	//page6_obj = lv_obj_create(lv_scr_act());
	page6_obj = lv_obj_create(lv_scr_act());//
	cur_obj = page6_obj;
	lv_obj_set_size(page6_obj, SCALE_WIDTH, SCALE_HIGH);
	lv_obj_add_style(page6_obj, &style5, 0);
	lv_obj_set_style_text_font(page6_obj, &myfont, 0);
	
	
	lv_obj_t * btn1 = lv_btn_create(page6_obj);
	next_rec_btn = btn1;
	lv_obj_add_event_cb(btn1, event_handler, LV_EVENT_ALL, NULL);
	lv_obj_align(btn1, LV_ALIGN_CENTER, 0, -100);
	lv_style_reset(&style2);
	lv_style_init(&style2);
	lv_style_set_bg_color(&style2, lv_color_make(0x0, 0x80, 0x00)); 
	lv_style_set_shadow_color(&style2, lv_color_make(0xff, 0xff, 0xff));
	lv_style_set_border_color(&style2, lv_color_make(0xff, 0xff, 0xff));
	lv_style_set_outline_color(&style2, lv_color_make(0xff, 0xff, 0xff));	
	lv_obj_add_style(btn1, &style2, 0);
	
	lv_group_add_obj(group6_golop, btn1);
	
	label = lv_label_create(btn1);
	lv_label_set_text(label, (const char *)language_switch[language_cur][PLAY_STR]);
	lv_obj_center(label);
	
	lv_obj_t * btn2 = lv_btn_create(page6_obj);
	playback_rec_next_btn = btn2;
	lv_obj_add_event_cb(btn2, event_handler, LV_EVENT_ALL, NULL);
	lv_obj_align(btn2, LV_ALIGN_CENTER, 0, -40);	//参数三四为对齐后采取的偏移
	lv_obj_add_flag(btn2, LV_OBJ_FLAG_CHECKABLE);
	lv_obj_set_height(btn2, LV_SIZE_CONTENT);
	
	lv_group_add_obj(group6_golop, btn2);
	lv_style_reset(&style3);
	lv_style_init(&style3);
	lv_style_set_radius(&style3,0); //圆边
	lv_style_set_bg_color(&style3, lv_color_make(0xc0, 0xe0, 0x12));	
	lv_style_set_shadow_color(&style3, lv_color_make(0xff, 0xff, 0xff));	
	//lv_style_set_transition(lv_style_t * style, const lv_style_transition_dsc_t * value)
	lv_obj_add_style(btn2, &style3, 0);
	
	label = lv_label_create(btn2);
	
	lv_label_set_text(label, (const char *)language_switch[language_cur][NEXT_STR]);
	lv_obj_center(label);
	
	lv_obj_t * btn3 = lv_btn_create(page6_obj);
	playback_rec_back_btn = btn3;
	lv_obj_add_event_cb(btn3, event_handler, LV_EVENT_ALL, NULL);
	label = lv_label_create(btn3);
	lv_label_set_text(label, (const char *)language_switch[language_cur][EXIT_STR]);
	lv_obj_center(label);
	lv_obj_align(btn3, LV_ALIGN_CENTER, 0, 20);   
	lv_obj_add_flag(btn3, LV_OBJ_FLAG_CHECKABLE);
	lv_obj_set_size(btn3,80,40);
	lv_style_reset(&style4);
	lv_style_init(&style4);
	lv_style_set_radius(&style4,0); //圆边
	lv_style_set_bg_color(&style4, lv_color_make(0xb0, 0x50, 0xc2));	
	//lv_style_set_shadow_width(&style4, 0);
	lv_style_set_shadow_color(&style4, lv_color_make(0xff, 0xff, 0xff));
	lv_obj_add_style(btn3, &style4, 0);
	
	lv_group_add_obj(group6_golop, btn3);		
	
	lv_obj_t * btn4 = lv_btn_create(page6_obj);
	setting_option_btn[NEXT_REC_STR] = btn4;
	lv_obj_add_event_cb(btn4, event_handler, LV_EVENT_ALL, NULL);
	label = lv_label_create(btn4);
	lv_label_set_text(label, (const char *)language_switch[language_cur][NEXT_REC_STR]);
	lv_obj_center(label);
	lv_obj_align(btn4, LV_ALIGN_CENTER, 0, 80);	  
	lv_obj_add_flag(btn4, LV_OBJ_FLAG_CHECKABLE);
	lv_obj_set_size(btn4,80,40);
	lv_style_reset(&style6);
	lv_style_init(&style6);
	lv_style_set_radius(&style6,0); //圆边
	lv_style_set_bg_color(&style6, lv_color_make(0x70, 0x10, 0xc2));	
	//lv_style_set_shadow_width(&style4, 0);
	lv_style_set_shadow_color(&style6, lv_color_make(0xff, 0xff, 0xff));
	lv_obj_add_style(btn4, &style6, 0);
	
	lv_group_add_obj(group6_golop, btn4);		
	


}

void lv_page_usb_config(){	
	static lv_style_t style5;	
	lv_style_reset(&style5);
	lv_style_init(&style5);
	lv_style_set_bg_color(&style5, lv_color_make(0x00, 0x00, 0x00));	
	lv_style_set_shadow_color(&style5, lv_color_make(0x00, 0x00, 0x00));
	lv_style_set_border_color(&style5, lv_color_make(0x00, 0x00, 0x00));
	lv_style_set_outline_color(&style5, lv_color_make(0x00, 0x00, 0x00));
	lv_style_set_radius(&style5,0);
	page15_obj = lv_obj_create(lv_scr_act());//
	cur_obj = page15_obj;
	lv_obj_set_size(page15_obj, SCALE_WIDTH, SCALE_HIGH);
	lv_obj_add_style(page15_obj, &style5, 0);
}

void lv_page_game_config(){
	static lv_style_t style2;
	static lv_style_t style3;
	static lv_style_t style4;
	static lv_style_t style5;
	
	lv_obj_t * label;

	group7_golop = lv_group_create();
	group_cur = group7_golop;
	lv_style_reset(&style5);
	lv_style_init(&style5);
	lv_style_set_bg_color(&style5, lv_color_make(0x00, 0x00, 0x00));	
	lv_style_set_shadow_color(&style5, lv_color_make(0x00, 0x00, 0x00));
	lv_style_set_border_color(&style5, lv_color_make(0x00, 0x00, 0x00));
	lv_style_set_outline_color(&style5, lv_color_make(0x00, 0x00, 0x00));
	lv_style_set_radius(&style5,0);
	page7_obj = lv_obj_create(lv_scr_act());//
	cur_obj = page7_obj;
	lv_obj_set_size(page7_obj, SCALE_WIDTH, SCALE_HIGH);
	lv_obj_add_style(page7_obj, &style5, 0);
	lv_obj_set_style_text_font(page7_obj, &myfont, 0);
	
	lv_obj_t * btn1 = lv_btn_create(page7_obj);
	game_start_btn = btn1;
	lv_obj_add_event_cb(btn1, event_handler, LV_EVENT_ALL, NULL);
	lv_obj_align(btn1, LV_ALIGN_CENTER, 0, -60);
	lv_style_reset(&style2);
	lv_style_init(&style2);
	lv_style_set_bg_color(&style2, lv_color_make(0x0, 0x80, 0x00)); 
	lv_style_set_shadow_color(&style2, lv_color_make(0xff, 0xff, 0xff));
	lv_style_set_border_color(&style2, lv_color_make(0xff, 0xff, 0xff));
	lv_style_set_outline_color(&style2, lv_color_make(0xff, 0xff, 0xff));	
	lv_obj_add_style(btn1, &style2, 0);
	
	lv_group_add_obj(group7_golop, btn1);
	
	label = lv_label_create(btn1);
	lv_label_set_text(label, (const char *)language_switch[language_cur][GAME_STR]);
	lv_obj_center(label);
	
	lv_obj_t * btn2 = lv_btn_create(page7_obj);
	game_back_btn = btn2;
	lv_obj_add_event_cb(btn2, event_handler, LV_EVENT_ALL, NULL);
	lv_obj_align(btn2, LV_ALIGN_CENTER, 0, 0);	//参数三四为对齐后采取的偏移
	lv_obj_add_flag(btn2, LV_OBJ_FLAG_CHECKABLE);
	lv_obj_set_height(btn2, LV_SIZE_CONTENT);
	
	lv_group_add_obj(group7_golop, btn2);
	lv_style_reset(&style3);
	lv_style_init(&style3);
	lv_style_set_radius(&style3,0); //圆边
	lv_style_set_bg_color(&style3, lv_color_make(0xc0, 0xe0, 0x12));	
	lv_style_set_shadow_color(&style3, lv_color_make(0xff, 0xff, 0xff));	
	//lv_style_set_transition(lv_style_t * style, const lv_style_transition_dsc_t * value)
	lv_obj_add_style(btn2, &style3, 0);
	
	label = lv_label_create(btn2);
	
	lv_label_set_text(label, (const char *)language_switch[language_cur][NEXT_STR]);
	lv_obj_center(label);
	
	lv_obj_t * btn3 = lv_btn_create(page7_obj);
	game_next_btn = btn3;
	lv_obj_add_event_cb(btn3, event_handler, LV_EVENT_ALL, NULL);
	label = lv_label_create(btn3);
	lv_label_set_text(label, (const char *)language_switch[language_cur][EXIT_STR]);
	lv_obj_center(label);
	lv_obj_align(btn3, LV_ALIGN_CENTER, 0, 60);   
	lv_obj_add_flag(btn3, LV_OBJ_FLAG_CHECKABLE);
	lv_obj_set_size(btn3,80,40);
	lv_style_reset(&style4);
	lv_style_init(&style4);
	lv_style_set_radius(&style4,0); //圆边
	lv_style_set_bg_color(&style4, lv_color_make(0xb0, 0x50, 0xc2));	
	//lv_style_set_shadow_width(&style4, 0);
	lv_style_set_shadow_color(&style4, lv_color_make(0xff, 0xff, 0xff));
	lv_obj_add_style(btn3, &style4, 0);
	
	lv_group_add_obj(group7_golop, btn3);

}


void lv_page_spi_config(){
	
	static lv_style_t style3;
	static lv_style_t style4;
	static lv_style_t style5;
	
	lv_obj_t * label;

	group9_golop = lv_group_create();
	group_cur = group9_golop;
	lv_style_reset(&style5);
	lv_style_init(&style5);
	lv_style_set_bg_color(&style5, lv_color_make(0x00, 0x00, 0x00));	
	lv_style_set_shadow_color(&style5, lv_color_make(0x00, 0x00, 0x00));
	lv_style_set_border_color(&style5, lv_color_make(0x00, 0x00, 0x00));
	lv_style_set_outline_color(&style5, lv_color_make(0x00, 0x00, 0x00));
	lv_style_set_radius(&style5,0);
	page9_obj = lv_obj_create(lv_scr_act());//
	cur_obj = page9_obj;
	lv_obj_set_size(page9_obj, SCALE_WIDTH, SCALE_HIGH);
	lv_obj_add_style(page9_obj, &style5, 0);
	lv_obj_set_style_text_font(page9_obj, &myfont, 0);
	
	lv_obj_t * btn2 = lv_btn_create(page9_obj);
	spi_next_btn = btn2;
	lv_obj_add_event_cb(btn2, event_handler, LV_EVENT_ALL, NULL);
	lv_obj_align(btn2, LV_ALIGN_CENTER, 0, 0);	//参数三四为对齐后采取的偏移
	lv_obj_add_flag(btn2, LV_OBJ_FLAG_CHECKABLE);
	lv_obj_set_height(btn2, LV_SIZE_CONTENT);
	
	lv_group_add_obj(group9_golop, btn2);
	lv_style_reset(&style3);
	lv_style_init(&style3);
	lv_style_set_radius(&style3,0); //圆边
	lv_style_set_bg_color(&style3, lv_color_make(0xc0, 0xe0, 0x12));	
	lv_style_set_shadow_color(&style3, lv_color_make(0xff, 0xff, 0xff));	
	//lv_style_set_transition(lv_style_t * style, const lv_style_transition_dsc_t * value)
	lv_obj_add_style(btn2, &style3, 0);
	
	label = lv_label_create(btn2);
	
	lv_label_set_text(label, (const char *)language_switch[language_cur][NEXT_STR]);
	lv_obj_center(label);
	
	lv_obj_t * btn3 = lv_btn_create(page9_obj);
	spi_back_btn = btn3;
	lv_obj_add_event_cb(btn3, event_handler, LV_EVENT_ALL, NULL);
	label = lv_label_create(btn3);
	lv_label_set_text(label, (const char *)language_switch[language_cur][EXIT_STR]);
	lv_obj_center(label);
	lv_obj_align(btn3, LV_ALIGN_CENTER, 0, 60);   
	lv_obj_add_flag(btn3, LV_OBJ_FLAG_CHECKABLE);
	lv_obj_set_size(btn3,80,40);
	lv_style_reset(&style4);
	lv_style_init(&style4);
	lv_style_set_radius(&style4,0); //圆边
	lv_style_set_bg_color(&style4, lv_color_make(0xb0, 0x50, 0xc2));	
	//lv_style_set_shadow_width(&style4, 0);
	lv_style_set_shadow_color(&style4, lv_color_make(0xff, 0xff, 0xff));
	lv_obj_add_style(btn3, &style4, 0);
	
	lv_group_add_obj(group9_golop, btn3);		

}



int  play_wav_control(int control);
static void play_wav_handler(lv_event_t * e)
{

	uint8_t key_code;
	key_code = lv_indev_get_key(lv_indev_get_act()); 
	printf("button:%s\n",lv_list_get_btn_text(NULL,lv_event_get_target(e)));
	if(key_code == LV_KEY_RIGHT)
	{
		//播放暂停或者播放
		//play_wav_control2(5,lv_list_get_btn_text(NULL,lv_event_get_target(e)));
	}
	//播放或者停止
	else if(key_code == LV_KEY_LEFT)
	{
		//play_wav_control2(6,lv_list_get_btn_text(NULL,lv_event_get_target(e)));
	}
	else if(key_code == LV_KEY_END)
	{
		lv_page_select(0);
	}

}


void lv_page_wav_config()
{
	static lv_style_t style5;

	group8_golop = lv_group_create();
	lv_indev_set_group(indev_keypad, group8_golop);
	group_cur = group8_golop;
	lv_style_reset(&style5);
	lv_style_init(&style5);
	lv_style_set_bg_color(&style5, lv_color_make(0x00, 0x00, 0x00));	
	lv_style_set_shadow_color(&style5, lv_color_make(0x00, 0x00, 0x00));
	lv_style_set_border_color(&style5, lv_color_make(0x00, 0x00, 0x00));
	lv_style_set_outline_color(&style5, lv_color_make(0x00, 0x00, 0x00));
	lv_style_set_radius(&style5,0);
	page8_obj = lv_obj_create(lv_scr_act());//
	cur_obj = page8_obj;
	lv_obj_set_size(page8_obj, SCALE_WIDTH, SCALE_HIGH);
	lv_obj_add_style(page8_obj, &style5, 0);

	lv_obj_t *list1;
	list1 = lv_list_create(page8_obj);
	lv_obj_set_size(list1, LV_PCT(100), LV_PCT(100));
    lv_obj_t * btn,*list_text;

    list_text = lv_list_add_text(list1, "pause");


    btn = lv_list_add_btn(list1, NULL, "1.wav");
	lv_group_add_obj(group8_golop,btn);
	lv_obj_add_event_cb(btn, play_wav_handler, LV_EVENT_KEY, NULL);

    btn = lv_list_add_btn(list1, NULL, "2.wav");
	lv_group_add_obj(group8_golop,btn);
	lv_obj_add_event_cb(btn, play_wav_handler, LV_EVENT_KEY, NULL);
	



}



void lv_page_init(){
		uvc_open = 0;		
		enable_video_usb_to_lcd(0);	

//	lv_page_main_menu_config();
//	lv_page_rec_config();
//	lv_page_photo_config();
//	lv_page_wifi_config();
	//lv_page_setting_config();
//	lv_page_playback_photo_config();
//	lv_page_playback_rec_config();
//	lv_page_usb_config();
//	lv_page_game_config();	
//	lv_page_wav_config();
}

extern const unsigned char test_mode[7830];
void lv_page_select(uint8_t page)
{
	uint8_t name[16];

	struct lcdc_device *lcd_dev;
	struct vpp_device *vpp_dev;
	
	lcd_dev = (struct lcdc_device *)dev_get(HG_LCDC_DEVID);	
	vpp_dev = (struct vpp_device *)dev_get(HG_VPP_DEVID);
	
	page_cur = page;
	printf("page_cur:%d\r\n",page);
	if(page == 0){
		lcd_info.lcd_p0p1_state = 2;
		lcdc_set_video_en(lcd_dev,0);
		vpp_close(vpp_dev);
		video_decode_mem  = video_psram_mem;
		video_decode_mem1 = video_psram_mem;
		video_decode_mem2 = video_psram_mem;
		lcdc_set_rotate_mirror(lcd_dev,0,LCD_ROTATE_90);
		jpg_dec_scale_del();
		set_lcd_photo1_config(SCALE_WIDTH,SCALE_HIGH,0);
		jpg_decode_scale_config();
		memcpy(video_psram_mem1,main_demo,sizeof(main_demo));
		jpg_decode_to_lcd((uint32)video_psram_mem1,960,480,SCALE_WIDTH,SCALE_HIGH);
		lcdc_set_video_en(lcd_dev,1);
		page_num = 0;
		
		if(cur_obj){
			lv_obj_del(cur_obj);
			lv_group_del(group_cur);
			cur_obj = NULL;
		}
		lv_page_main_menu_config();		
		//lv_scr_load_anim(page0_obj, LV_SCR_LOAD_ANIM_MOVE_RIGHT, 500, 0, false);
		lv_indev_set_group(indev_keypad, group0_golop);
	}else if(page == 1){
		lcdc_set_video_en(lcd_dev,0);
		video_decode_mem  = video_decode_config_mem;
		video_decode_mem1 = video_decode_config_mem1;
		video_decode_mem2 = video_decode_config_mem2;
		//video_decode_mem  = video_psram_mem;
		//video_decode_mem1 = video_psram_mem1;
		//video_decode_mem2 = video_psram_mem2;		
		jpg_dec_scale_del();
		set_lcd_photo1_config(160,120,0);
		jpg_decode_scale_config();
		rahmen_open = 0;
		vpp_set_ifp_en(vpp_dev,0);		
		vpp_open(vpp_dev);
		lcd_info.lcd_p0p1_state = 1;
		os_sleep_ms(200);
		
		lcdc_set_video_en(lcd_dev,1);
		uvc_start = 0;
		rec_open  = 0;
		if(cur_obj){
			lv_obj_del(cur_obj);
			lv_group_del(group_cur);
			cur_obj = NULL;
		}
		lv_page_rec_config();			


		stream* src;
		resolution_parm priv = {
			.dvp_h = gui_cfg.dvp_h,
			.dvp_w = gui_cfg.dvp_w,
			.rec_h = gui_cfg.rec_h,
			.rec_w = gui_cfg.rec_w,
		};
		photo_msg.out0_h = gui_cfg.rec_h;
		photo_msg.out0_w = gui_cfg.rec_w;
		src = jpeg_stream_init();
		//发命令,内部去修改分辨率
		stream_self_cmd_func(src,SET_MJPEG_RESOLUTION_PARM_CMD,(uint32_t)&priv);
		jpeg_stream_deinit();
		os_sleep_ms(50);	

		//lv_scr_load_anim(page1_obj, LV_SCR_LOAD_ANIM_OUT_LEFT, 1000, 0, false);
		lv_indev_set_group(indev_keypad, group1_golop);
		
	}else if(page == 2){
		lcdc_set_video_en(lcd_dev,0);
		rahmen_open = 0;
		vpp_set_ifp_en(vpp_dev,0);
		vpp_open(vpp_dev);
		lcd_info.lcd_p0p1_state = 1;
		os_sleep_ms(200);
		lcdc_set_video_en(lcd_dev,1);
		if(cur_obj){
			lv_obj_del(cur_obj);
			lv_group_del(group_cur);
			cur_obj = NULL;
		}
		lv_page_photo_config();		
		//lv_scr_load_anim(page2_obj, LV_SCR_LOAD_ANIM_MOVE_TOP, 1000, 0, false);
		lv_indev_set_group(indev_keypad, group2_golop);
	}else if(page == 3){
		lcd_info.lcd_p0p1_state = 2;
		lcdc_set_video_en(lcd_dev,0);
		
		vpp_close(vpp_dev);
		video_decode_mem  = video_psram_mem;
		video_decode_mem1 = video_psram_mem;
		video_decode_mem2 = video_psram_mem;
		jpg_dec_scale_del();
		set_lcd_photo1_config(SCALE_WIDTH,SCALE_HIGH,0);
		jpg_decode_scale_config();
		memcpy(video_psram_mem1,menu_wifi,sizeof(menu_wifi));
		jpg_decode_to_lcd((uint32)video_psram_mem1,848,480,SCALE_WIDTH,SCALE_HIGH);
		lcdc_set_video_en(lcd_dev,1);		
		if(cur_obj){
			lv_obj_del(cur_obj);
			lv_group_del(group_cur);
			cur_obj = NULL;
		}
		lv_page_wifi_config();

		//lv_scr_load_anim(page3_obj, LV_SCR_LOAD_ANIM_FADE_OUT, 1000, 0, false);
		lv_indev_set_group(indev_keypad, group3_golop);	
	}else if(page == 4){
		lcdc_set_video_en(lcd_dev,0);
		video_decode_mem  = video_decode_config_mem;
		video_decode_mem1 = video_decode_config_mem;
		video_decode_mem2 = video_decode_config_mem;	
		jpg_dec_scale_del();
		set_lcd_photo1_config(320,240,0);
		jpg_decode_scale_config();

		jpeg_file_get(name,1,"JPEG");
		sprintf((char *)name_rec_photo,"%s%s","0:DCIM/",name);
		printf("name_rec_photo:%s\r\n",name_rec_photo);
		jpeg_photo_explain(name_rec_photo);
		lcd_info.lcd_p0p1_state = 2;
		lcdc_set_video_en(lcd_dev,1);
		vpp_close(vpp_dev);
		if(cur_obj){
			lv_obj_del(cur_obj);
			lv_group_del(group_cur);
			cur_obj = NULL;
		}
		lv_page_playback_photo_config();
		//lv_scr_load_anim(page5_obj, LV_SCR_LOAD_ANIM_OVER_LEFT, 1000, 0, false);		
		lv_indev_set_group(indev_keypad, group5_golop);	
	}else if(page == 5){
		lcdc_set_video_en(lcd_dev,0);
		video_decode_mem  = video_decode_config_mem;
		video_decode_mem1 = video_decode_config_mem1;
		video_decode_mem2 = video_decode_config_mem2;	
		jpg_dec_scale_del();
		set_lcd_photo1_config(320,240,0);
		jpg_decode_scale_config();
		
		
		jpeg_file_get(name,1,"AVI");
		sprintf((char *)name_rec_photo,"%s%s","0:DCIM/",name);
		rec_playback_thread_init(name_rec_photo);
		lcd_info.lcd_p0p1_state = 2;
		lcdc_set_video_en(lcd_dev,1);
		vpp_close(vpp_dev);		
		if(cur_obj){
			lv_obj_del(cur_obj);
			lv_group_del(group_cur);
			cur_obj = NULL;
		}
		lv_page_playback_rec_config();		
//		lv_scr_load_anim(page6_obj, LV_SCR_LOAD_ANIM_MOVE_LEFT, 1000, 0, false);
		lv_indev_set_group(indev_keypad, group6_golop);		
	}else if(page == 6){
		lcd_info.lcd_p0p1_state = 0;
		lcdc_set_video_en(lcd_dev,1);
		vpp_close(vpp_dev);
		if(list_setting_children){
			lv_obj_del(list_setting_children);
			list_setting_children = NULL;
		}
		if(cur_obj){
			lv_obj_del(cur_obj);
			lv_group_del(group_cur);
			cur_obj = NULL;
		}		
		lv_page_setting_config();
		//lv_scr_load_anim(page4_obj, LV_SCR_LOAD_ANIM_FADE_ON, 0, 0, false);		
		lv_indev_set_group(indev_keypad, group4_golop);		
	}else if(page == 7){
		//lcd_info.lcd_p0p1_state = 0;

		lcd_info.lcd_p0p1_state = 1;		
	

		
		lcdc_set_video_en(lcd_dev,1);
		vpp_close(vpp_dev);
		
		if(cur_obj){
			lv_obj_del(cur_obj);
			lv_group_del(group_cur);
			cur_obj = NULL;
		}
		lv_page_game_config();
		//lv_scr_load_anim(page7_obj, LV_SCR_LOAD_ANIM_MOVE_TOP, 0, 0, false);
		lv_indev_set_group(indev_keypad, group7_golop);
	}else if(page == 8){
		lcd_info.lcd_p0p1_state = 2;
		//lcdc_set_video_en(lcd_dev,0);
		
		vpp_close(vpp_dev);
		spi_video_run = 1;
		//jpg_dec_scale_del();
		lcdc_set_rotate_mirror(lcd_dev,1,LCD_ROTATE_90);
		set_lcd_photo1_config(SCALE_WIDTH,SCALE_HIGH,0);
		//os_sleep_ms(100);
		//lcdc_set_video_en(lcd_dev,1);
		if(cur_obj){
			lv_obj_del(cur_obj);
			lv_group_del(group_cur);
			cur_obj = NULL;
		}
		
		lv_page_spi_config();

		lv_indev_set_group(indev_keypad, group9_golop);	
	}
}

void play_wav_page()
{
	struct lcdc_device *lcd_dev;
	struct vpp_device *vpp_dev;
	lcd_dev = (struct lcdc_device *)dev_get(HG_LCDC_DEVID);	
	vpp_dev = (struct vpp_device *)dev_get(HG_VPP_DEVID);
	lcd_info.lcd_p0p1_state = 0;
	lcdc_set_video_en(lcd_dev,1);
	vpp_close(vpp_dev);		
	lv_scr_load_anim(page8_obj, LV_SCR_LOAD_ANIM_MOVE_LEFT, 1000, 0, false);
	lv_indev_set_group(indev_keypad, group8_golop);


}
