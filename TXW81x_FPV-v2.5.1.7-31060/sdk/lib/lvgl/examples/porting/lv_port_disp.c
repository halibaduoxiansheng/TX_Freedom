/**
 * @file lv_port_disp_templ.c
 *
 */

/*Copy this file as "lv_port_disp.c" and set this value to "1" to enable content*/
#if 1

/*********************
 *      INCLUDES
 *********************/
#include "sys_config.h"
#include "tx_platform.h"
#include "list.h"
#include "dev.h"
#include "typesdef.h"
#include "lv_port_disp.h"
#include <stdbool.h>
#include "osal/semaphore.h"
#include "osal/mutex.h"
#include "lib/lcd/lcd.h"

extern struct os_mutex m2m1_mutex;
/*********************
 *      DEFINES
 *********************/
#ifndef MY_DISP_HOR_RES
    #warning Please define or replace the macro MY_DISP_HOR_RES with the actual screen width, default value 320 is used for now.
    #define MY_DISP_HOR_RES    320
#endif

#ifndef MY_DISP_VER_RES
    #warning Please define or replace the macro MY_DISP_HOR_RES with the actual screen height, default value 240 is used for now.
    #define MY_DISP_VER_RES    240
#endif

/**********************
 *      TYPEDEFS
 **********************/

/**********************
 *  STATIC PROTOTYPES
 **********************/
static void disp_init(void);

static void disp_flush(lv_disp_drv_t * disp_drv, const lv_area_t * area, lv_color_t * color_p);
//static void gpu_fill(lv_disp_drv_t * disp_drv, lv_color_t * dest_buf, lv_coord_t dest_width,
//        const lv_area_t * fill_area, lv_color_t color);

/**********************
 *  STATIC VARIABLES
 **********************/

/**********************
 *      MACROS
 **********************/

/**********************
 *   GLOBAL FUNCTIONS
 **********************/
uint8_t osd_menu565_buf[SCALE_HIGH*SCALE_WIDTH*2] __attribute__ ((aligned(4),section(".psram.src")));;
uint8_t *posd_buf;

//static lv_color_t buf_3_1[MY_DISP_HOR_RES * MY_DISP_VER_RES]__attribute__ ((aligned(4),section(".psram.src")));;            /*A screen sized buffer*/
//static lv_color_t buf_3_2[MY_DISP_HOR_RES * MY_DISP_VER_RES]__attribute__ ((aligned(4),section(".psram.src")));;            /*Another screen sized buffer*/
//	  static lv_color_t *buf_3_1; 		   /*A screen sized buffer*/
//	  static lv_color_t *buf_3_2; 		   /*Another screen sized buffer*/

void lv_port_disp_init(void)
{
    /*-------------------------
     * Initialize your display
     * -----------------------*/
    disp_init();
    /*-----------------------------
     * Create a buffer for drawing
     *----------------------------*/
	memset(osd_menu565_buf,0,sizeof(osd_menu565_buf));
    /**
     * LVGL requires a buffer where it internally draws the widgets.
     * Later this buffer will passed to your display driver's `flush_cb` to copy its content to your display.
     * The buffer has to be greater than 1 display row
     *
     * There are 3 buffering configurations:
     * 1. Create ONE buffer:
     *      LVGL will draw the display's content here and writes it to your display
     *
     * 2. Create TWO buffer:
     *      LVGL will draw the display's content to a buffer and writes it your display.
     *      You should use DMA to write the buffer's content to the display.
     *      It will enable LVGL to draw the next part of the screen to the other buffer while
     *      the data is being sent form the first buffer. It makes rendering and flushing parallel.
     *
     * 3. Double buffering
     *      Set 2 screens sized buffers and set disp_drv.full_refresh = 1.
     *      This way LVGL will always provide the whole rendered screen in `flush_cb`
     *      and you only need to change the frame buffer's address.
     */

    /* Example for 1) */
    static lv_disp_draw_buf_t draw_buf_dsc_1;
    static lv_color_t buf_1[MY_DISP_HOR_RES * 10];                          /*A buffer for 10 rows*/
    lv_disp_draw_buf_init(&draw_buf_dsc_1, buf_1, NULL, MY_DISP_HOR_RES * 10);   /*Initialize the display buffer*/

    /* Example for 2) */
//    static lv_disp_draw_buf_t draw_buf_dsc_2;
//    static lv_color_t buf_2_1[MY_DISP_HOR_RES * 10];                        /*A buffer for 10 rows*/
//    static lv_color_t buf_2_2[MY_DISP_HOR_RES * 10];                        /*An other buffer for 10 rows*/
//    lv_disp_draw_buf_init(&draw_buf_dsc_2, buf_2_1, buf_2_2, MY_DISP_HOR_RES * 10);   /*Initialize the display buffer*/

    /* Example for 3) also set disp_drv.full_refresh = 1 below*/
//    static lv_disp_draw_buf_t draw_buf_dsc_3;
//    static lv_color_t buf_3_1[MY_DISP_HOR_RES * MY_DISP_VER_RES];            /*A screen sized buffer*/
//    static lv_color_t buf_3_2[MY_DISP_HOR_RES * MY_DISP_VER_RES];            /*Another screen sized buffer*/
//	  static lv_color_t *buf_3_1; 		   /*A screen sized buffer*/
//	  static lv_color_t *buf_3_2; 		   /*Another screen sized buffer*/

//	buf_3_1 = (uint8*)malloc_psram(MY_DISP_HOR_RES * MY_DISP_VER_RES*2);
//	buf_3_2 = (uint8*)malloc_psram(MY_DISP_HOR_RES * MY_DISP_VER_RES*2);
//  lv_disp_draw_buf_init(&draw_buf_dsc_3, buf_3_1, buf_3_2,
//                          MY_DISP_VER_RES * LV_VER_RES_MAX);   /*Initialize the display buffer*/

    /*-----------------------------------
     * Register the display in LVGL
     *----------------------------------*/

    static lv_disp_drv_t disp_drv;                         /*Descriptor of a display driver*/
    lv_disp_drv_init(&disp_drv);                    /*Basic initialization*/

    /*Set up the functions to access to your display*/

    /*Set the resolution of the display*/
    disp_drv.hor_res = MY_DISP_HOR_RES;
    disp_drv.ver_res = MY_DISP_VER_RES;

    /*Used to copy the buffer's content to the display*/
    disp_drv.flush_cb = disp_flush;

    /*Set a display buffer*/
    disp_drv.draw_buf = &draw_buf_dsc_1;

    /*Required for Example 3)*/
    //disp_drv.full_refresh = 1;

    /* Fill a memory array with a color if you have GPU.
     * Note that, in lv_conf.h you can enable GPUs that has built-in support in LVGL.
     * But if you have a different GPU you can use with this callback.*/
    //disp_drv.gpu_fill_cb = gpu_fill;

    /*Finally register the driver*/
    lv_disp_drv_register(&disp_drv);
}

/**********************
 *   STATIC FUNCTIONS
 **********************/

/*Initialize your display and the required peripherals.*/
static void disp_init(void)
{
    /*You code here*/
}

volatile bool disp_flush_enabled = true;

/* Enable updating the screen (the flushing process) when disp_flush() is called by LVGL
 */
void disp_enable_update(void)
{
    disp_flush_enabled = true;
}

/* Disable updating the screen (the flushing process) when disp_flush() is called by LVGL
 */
void disp_disable_update(void)
{
    disp_flush_enabled = false;
}

typedef struct
{
    __IO uint32 DMA_CON;
    __IO uint32 DMA_SAIE;
    __IO uint32 DMA_DATA;
    __IO uint32 DMA_SADR;
    __IO uint32 DMA_TADR;
    __IO uint32 DMA_DLEN;
    __IO uint32 DMA_ISIZE;
} M2M_DMA_TypeDef;
#include "hal/dma.h"
extern struct dma_device *m2mdma;
void hw_blkcpy(uint32_t src,uint32_t src_w,uint32_t dest,uint32_t dest_w,uint32_t cpy_w,uint32_t cpy_h){

	M2M_DMA_TypeDef *p_dma;
	p_dma = ((M2M_DMA_TypeDef    *) 0x4002121c);
	p_dma->DMA_CON = 2<<1;
	p_dma->DMA_SADR = src;
	p_dma->DMA_TADR = dest;
	p_dma->DMA_DLEN = ((cpy_h-1)<<20)|(cpy_w-1);
	p_dma->DMA_ISIZE= (dest_w<<16)|(src_w<<0);	
	p_dma->DMA_CON |= BIT(0);
	while(p_dma->DMA_CON & BIT(0));
	
}


/*Flush the content of the internal buffer the specific area on the display
 *You can use DMA or any hardware acceleration to do this operation in the background but
 *'lv_disp_flush_ready()' has to be called when finished.*/
uint8_t disp_updata = 0;
static void disp_flush(lv_disp_drv_t * disp_drv, const lv_area_t * area, lv_color_t * color_p)
{
	
	//uint32_t itk;
	//uint32_t jtk;
	//uint32_t ptk;
	//uint32_t w_l,h_l;
	lv_color_t *p_16;
	//uint8_t *pt;
	//uint32_t flags;
#if 1
	p_16 = (lv_color_t*)osd_menu565_buf;
    if(disp_flush_enabled) {
        /*The most simple case (but also the slowest) to put all pixels to the screen one-by-one*/
		
        int32_t x;
        int32_t y;
        for(y = area->y1; y <= area->y2; y++) {
            for(x = area->x1; x <= area->x2; x++) {
                /*Put a pixel to the display. For example:*/
                /*put_px(x, y, *color_p)*/
				p_16[y*MY_DISP_HOR_RES + x] = *color_p;
                color_p++;
            }
        }
    }
	//printf("draw[%d %d]===>[%d %d]\r\n",area->x1,area->y1,area->x2,area->y2);
	disp_updata = 1;
//	for(h_l = 0;h_l < MY_DISP_VER_RES;h_l++){
//		for(w_l = 0;w_l < MY_DISP_HOR_RES;w_l++){
//			printf("%04x ",p_16[h_l*MY_DISP_HOR_RES + w_l]);
//		}
//		printf("\r\n");
//	}
#else
//	printf("draw[%d %d]===>[%d %d]\r\n",area->x1,area->y1,area->x2,area->y2);
//	printf("[%d]write:%x\r\n",os_jiffies(),color_p);

	os_mutex_lock(&m2m1_mutex,osWaitForever);
	if (!(((uint32_t)color_p >= SRAM_BASE) && ((uint32_t)color_p < (SRAM_BASE+0x48000)))){
		csi_dcache_clean_range(color_p, (area->x2 - area->x1+1)*(area->y2-area->y1+1)*sizeof(lv_color_t) );
	}
	flags = disable_irq();	
	
	hw_blkcpy(color_p,(area->x2 - area->x1+1)*sizeof(lv_color_t),osd_menu565_buf+(area->y1 * MY_DISP_HOR_RES)*sizeof(lv_color_t)+area->x1*sizeof(lv_color_t),MY_DISP_HOR_RES*2,(area->x2 - area->x1+1)*sizeof(lv_color_t),(area->y2-area->y1+1));
	enable_irq(flags);
#if 0
	pt = (uint8_t *)color_p;
	ptk = 0;

	printf("src:\r\n");
	for(jtk = 0;jtk < (area->y2-area->y1+1);jtk++){
		for(itk = 0;itk<((area->x2 - area->x1+1)*sizeof(lv_color_t));itk++){
			printf("%02x",pt[ptk]);
			ptk++;
		}
		printf("\r\n");
	}

	printf("dst:\r\n");
	ptk = 0;
	for(jtk = 0;jtk < 320;jtk++){
		for(itk = 0;itk<(240*2);itk++){
			printf("%02x",osd_menu565_buf[ptk]);
			ptk++;
		}
		printf("\r\n");
	}

#endif
	//os_printf("m2m1_mutex:%x   %x\r\n",m2m1_mutex,m2m1_mutex.magic);
	os_mutex_unlock(&m2m1_mutex);
	//os_printf("");
	disp_updata = 1;

#endif
    /*IMPORTANT!!!
     *Inform the graphics library that you are ready with the flushing*/
    lv_disp_flush_ready(disp_drv);
}





/*OPTIONAL: GPU INTERFACE*/

/*If your MCU has hardware accelerator (GPU) then you can use it to fill a memory with a color*/
//static void gpu_fill(lv_disp_drv_t * disp_drv, lv_color_t * dest_buf, lv_coord_t dest_width,
//                    const lv_area_t * fill_area, lv_color_t color)
//{
//    /*It's an example code which should be done by your GPU*/
//    int32_t x, y;
//    dest_buf += dest_width * fill_area->y1; /*Go to the first line*/
//
//    for(y = fill_area->y1; y <= fill_area->y2; y++) {
//        for(x = fill_area->x1; x <= fill_area->x2; x++) {
//            dest_buf[x] = color;
//        }
//        dest_buf+=dest_width;    /*Go to the next line*/
//    }
//}


#else /*Enable this file at the top*/

/*This dummy typedef exists purely to silence -Wpedantic.*/
typedef int keep_pedantic_happy;
#endif
