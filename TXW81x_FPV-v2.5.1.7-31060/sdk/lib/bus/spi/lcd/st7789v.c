#include "lib/lcd/lcd.h"

#if LCD_ST7789V_EN

#define CMD(x)    {LCD_CMD,x}
#define DAT(x)    {LCD_DAT,x}
#define DLY(x)    {DELAY_MS,x}
#define END		{LCD_TAB_END,LCD_TAB_END}

uint8_t st7789_register_init_tab[][2] = {

    //Sleep Out
    CMD(    0x11),
	DLY(    0x64),
    //TEON,and Not consist of HBlanking
    CMD(    0x35),
    DAT(    0x00),

    //Set Tear Scanline,when display 0th line,the TE output
    CMD(    0x44),
    DAT(    0x00),
    DAT(    0x00),

    //65K-color RGB interface,and 18bit/pixel
    CMD(    0x3A),
    DAT(    0x66),       //   18bit/pixel                 DB[6:4]

	CMD(    0x21),

	CMD(	0xB0),
	DAT(	0x11),        //RGB mode		 
	DAT(	0xF4),        //6bit bus width    666 mode    set RIM=1
 

    CMD(    0xB1),
    DAT(    0xe0),         //RGB hv mode,vsync low active,hsync low active
    DAT(    0x05),         //vbp
    DAT(    0x14),		 //hbp


    //Porch Setting(set VBlank),back porch 8,front porch 8
    CMD(    0xB2),
    DAT(    0x08),          //bpa
    DAT(    0x08),
    DAT(    0x00),
    DAT(    0x22),
    DAT(    0x22),

    //Gate Control
    CMD(    0xB7),
	DAT(	0x35),
	
	//-----------------Power Setting------------------
	CMD(	0xBB),
	DAT(	0x27),
	
	CMD(	0xC0),
	DAT(	0x2C),
	
	CMD(	0xC2),
	DAT(	0x01),
	
	CMD(	0xC6),
	DAT(	0x18),
	
	CMD(	0xC6),
	DAT(	0x0F),
	
	CMD(	0xC4),
	DAT(	0x20),
	
	CMD(	0xC3),
	DAT(	0x10),
	
	CMD(	0xCA),
	DAT(	0x0F),
	
	CMD(	0xD0),
	DAT(	0xA4),
	DAT(	0xA1),
	
	//-----------------Gamma Setting--------------------
	CMD(	0xE0),
	DAT(	0xD0),
	DAT(	0x00),
	DAT(	0x03),
	DAT(	0x09),
	DAT(	0x13),
	DAT(	0x1C),
	DAT(	0x3A),
	DAT(	0x55),
	DAT(	0x48),
	DAT(	0x18),
	DAT(	0x12),
	DAT(	0x0E),
	DAT(	0x20),
	DAT(	0x1E),
	
	CMD(	0xE1),
	DAT(	0xD0),
	DAT(	0x00),
	DAT(	0x03),
	DAT(	0x09),
	DAT(	0x05),
	DAT(	0x25),
	DAT(	0x3A),
	DAT(	0x55),
	DAT(	0x50),
	DAT(	0x3D),
	DAT(	0x1C),
	DAT(	0x1D),
	DAT(	0x21),
	DAT(	0x1E),
	
	
	CMD(	0x36),
	DAT(	0xC0),
	
	DLY(	0X0F),

	CMD(    0x11),
	DLY(    0x64),
    //Display on
    CMD(    0x29),
	DLY(    0X05),
    //Memory Write
    END
};

lcddev_t  lcdstruct = {
    .name = "st7789",
    .lcd_bus_type = LCD_BUS_RGB,
    .bus_width = LCD_BUS_WIDTH_6,
    .color_mode = LCD_MODE_666,
    .scan_mode = LCD_ROTATE_90,//rotate 90
    .te_mode = 0xff,//te mode, 0xff:disable
    .colrarray = 0,//0:_RGB_ 1:_RBG_,2:_GBR_,3:_GRB_,4:_BRG_,5:_BGR_
    .pclk = 15000000,
    .even_order = 0,
    .odd_order = 0,
    .screen_w = 240,
    .screen_h = 320,
    .video_x  = 0,
    .video_y  = 0,
    .video_w  = 240,
    .video_h  = 320,
	.osd_x = 0,
	.osd_y = 0,
	.osd_w = 240, // 0 : value will set to video_w  , use for 4:3 LCD +16:9 sensor show UPDOWN BLACK
	.osd_h = 320, // 0 : value will set to video_h  , use for 4:3 LCD +16:9 sensor show UPDOWN BLACK
	.init_table = st7789_register_init_tab,

    .pclk_inv = 1,
    
    .vlw = 1,// 0,
    .vbp = 0x04,// 12,
    .vfp = 8,// 12,
    .hlw = 4,// 1,
    .hbp = 0x3c,//14,
    .hfp = 12,//13,

	.de_en  = 1,
	.vs_en	= 1,
	.hs_en	= 1,
    .de_inv = 0,
    .hs_inv = 0,
    .vs_inv = 0,

};


#endif
