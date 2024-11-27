#include "typesdef.h"
#include "errno.h"
#include "osal/irq.h"
#include "devid.h"
#include "dev/lcdc/hglcdc.h"
#include "osal/string.h"

struct hglcdc_hw
{
    __IO uint32 LCDCON;   		//0x00
    __IO uint32 LCD_IFCON;         //0x04
    __IO uint32 LCD_BAUD;         	//0x08
    __IO uint32 LCD_CMD;         	//0x0C
    __IO uint32 LCD_DATA;         	//0x10
    __IO uint32 LCD_LEN;       	//0x14
    __IO uint32 LCD_IFSTA;       	//0x18
    __IO uint32 LCD_VSYNCON;    	//0x1C
    __IO uint32 LCD_HSYNCON;      	//0x20
    __IO uint32 LCD_WINCON;    	//0x24
    __IO uint32 LCD_VISIBLE_WIN;   //0x28
    __IO uint32 LCD_VISIBLE_START; //0x2C		
    __IO uint32 ALPHA; 		//0x30	
    __IO uint32 PICTURE_SIZE;      //0x34
    __IO uint32 OSD0_DMA_STADR; 	//0x38	
    __IO uint32 OSD0_LUTDMA_STADR; //0x3C	
    __IO uint32 OSD0_WORD_LEN; 	//0x40	
    __IO uint32 OSD0_WINCON; 	//0x44	
    __IO uint32 OSD0_START; 	//0x48		
    __IO uint32 VIDEO_YDMA_STADR; 	//0x4C	
    __IO uint32 VIDEO_UDMA_STADR; 	//0x50	
    __IO uint32 VIDEO_VDMA_STADR; 	//0x54
    __IO uint32 VIDEO_WINCON; 	//0x58	
    __IO uint32 VIDEO_START; 	//0x5C
    __IO uint32 ROTATE_PICTURE0_YDMA_STADR; //0x60
    __IO uint32 ROTATE_PICTURE0_UDMA_STADR; //0x64
    __IO uint32 ROTATE_PICTURE0_VDMA_STADR; //0x68
    __IO uint32 ROTATE_PICTURE1_YDMA_STADR; //0x6C
    __IO uint32 ROTATE_PICTURE1_UDMA_STADR; //0x70
    __IO uint32 ROTATE_PICTURE1_VDMA_STADR; //0x74
	__IO uint32 ROTATE_PICTURE0_START; //0x78
	__IO uint32 ROTATE_PICTURE0_WINCON; //0x7C
	__IO uint32 ROTATE_PICTURE1_START; //0x80
	__IO uint32 ROTATE_PICTURE1_WINCON; //0x84
    __IO uint32 ROTATE_OUTBUF_LINE_NUM; //0x88
    __IO uint32 CCM_COEF0; 		//0x8C
    __IO uint32 CCM_COEF1; 		//0x90
    __IO uint32 CCM_COEF2; 		//0x94
    __IO uint32 CCM_COEF3; 		//0x98
    __IO uint32 GAMMA_R_STADR; 	//0x9C 
    __IO uint32 GAMMA_G_STADR; 	//0xA0 
    __IO uint32 GAMMA_B_STADR; 	//0xA4 
    __IO uint32 OSD_ENC_SADR; 		//0xA8
    __IO uint32 OSD_ENC_TADR; 		//0xAC 
    __IO uint32 OSD_ENC_RLEN; 		//0xB0 
    __IO uint32 OSD_ENC_DLEN; 		//0xB4
    __IO uint32 OSD_ENC_IDENT0; 	//0xB8
    __IO uint32 OSD_ENC_IDENT1; 	//0xBC 
    __IO uint32 OSD_ENC_TRANS0; 	//0xC0
    __IO uint32 OSD_ENC_TRANS1; 	//0xC4 
    __IO uint32 TIMEOUTCON; 	//0xC8 
	
};


lcdc_irq_hdl lcdcirq_vector_table[LCD_IRQ_NUM];
volatile uint32  lcdcirq_dev_table[LCD_IRQ_NUM];

struct hglcdc_hw *lcd_glo;

void irq_lcdc_enable(struct lcdc_device *p_lcdc,uint8 mode,uint8 irq){
	struct hglcdc *lcdc_hw = (struct hglcdc*)p_lcdc; 
	struct hglcdc_hw *hw  = (struct hglcdc_hw *)lcdc_hw->hw;
	if(mode){
		hw->LCD_IFCON |= BIT(irq+28);
	}else{
		hw->LCD_IFCON &= ~BIT(irq+28);
	}
}

void LCDC_IRQHandler_action(void *p_lcdc)
{
	uint32 sta = 0;
	uint8 loop;
	struct hglcdc *lcdc_hw = (struct hglcdc*)p_lcdc; 
	struct hglcdc_hw *hw  = (struct hglcdc_hw *)lcdc_hw->hw;
	sta = hw->LCD_IFSTA;
	for(loop = 0;loop < LCD_IRQ_NUM;loop++){
		if(sta&BIT(loop)){
			hw->LCD_IFSTA = BIT(loop);
			if(lcdcirq_vector_table[loop] != NULL){
				lcdcirq_vector_table[loop] (loop,lcdcirq_dev_table[loop],0);
			}

		}
	}
}



int32 lcdcirq_register(struct lcdc_device *p_lcdc,uint32 irq, lcdc_irq_hdl isr, uint32 dev_id){
	struct hglcdc *lcdc_hw = (struct hglcdc*)p_lcdc; 	
	struct hglcdc_hw *hw  = (struct hglcdc_hw *)lcdc_hw->hw;
	request_irq(lcdc_hw->irq_num, LCDC_IRQHandler_action, p_lcdc);
	
	irq_lcdc_enable(p_lcdc, 1, irq);
	lcdcirq_vector_table[irq] = isr;
	lcdcirq_dev_table[irq] = dev_id;
	hw->LCD_IFSTA |= BIT(irq);
	os_printf("lcdcirq1_register:%d %x  %x\r\n",irq,(uint32)lcdcirq_vector_table[irq],(uint32)isr);
	return 0;
}


int32 lcdcirq_unregister(struct lcdc_device *p_lcdc,uint32 irq){
	struct hglcdc *lcdc_hw = (struct hglcdc*)p_lcdc;	
	struct hglcdc_hw *hw  = (struct hglcdc_hw *)lcdc_hw->hw;
	irq_lcdc_enable(p_lcdc, 0, irq);
	lcdcirq_vector_table[irq] = NULL;
	lcdcirq_dev_table[irq] = 0;
	hw->LCD_IFSTA |= BIT(irq);
	return 0;
}

static int32 hglcdc_ioctl(struct lcdc_device *p_lcdc, enum lcdc_ioctl_cmd ioctl_cmd, uint32 param1, uint32 param2)
{
	int32  ret_val = RET_OK;
	uint32 h,w;
	uint32 x,y;
	uint8 pixel_dot_num = 0;
	uint8 vs_en,hs_en,de_en,vs_inv,hs_inv,de_inv,clk_inv;
	struct hglcdc *lcdc_hw = (struct hglcdc*)p_lcdc;	
	struct hglcdc_hw *hw  = (struct hglcdc_hw *)lcdc_hw->hw;
	switch(ioctl_cmd){
		case LCDC_SET_TIMEOUT_INF:
			if(param1){
				if(param2 < 4){
					hw->TIMEOUTCON &= ~(0x3<<1);
					hw->TIMEOUTCON |= (param2<<1);
				}
				hw->TIMEOUTCON |= BIT(0);
			}else{
				hw->TIMEOUTCON &= ~BIT(0);
			}
		break;
	
		case LCDC_SET_AUTO_KICK_EN:
			if(param1){
				hw->LCDCON |= BIT(28);
			}else{
				hw->LCDCON &= ~BIT(28);
			}			
		break;
	
		case LCDC_SET_GAMMA_SATURATION_EN:
			if(param1){
				hw->LCDCON |= BIT(27);
			}else{
				hw->LCDCON &= ~BIT(27);
			}

			if(param2){
				hw->LCDCON |= BIT(21);
			}else{
				hw->LCDCON &= ~BIT(21);
			}
		break;

		case LCDC_SET_GAMMA_SATURATION_VAL:
			if(param1 <= 0x10){
				hw->LCDCON &= ~(0x1f<<22);
				hw->LCDCON |= (param1<<22);
			}

			if(param2 <= 0x1f){
				hw->LCDCON &= ~(0x1f<<16);
				hw->LCDCON |= (param2<<16);
			}			
		break;

		case LCDC_SET_CCM_EN:
			if(param1){
				hw->LCDCON |= BIT(14);
			}else{
				hw->LCDCON &= ~BIT(14);
			}

		break;
		
		case LCDC_SET_COLOR_MODE:
			hw->LCD_IFCON &= ~(3<<3);
			if(LCD_MODE_565 == param1){
				hw->LCD_IFCON |= (2<<3);
			}else if(LCD_MODE_666 == param1){
				hw->LCD_IFCON |= (1<<3);
			}else if(LCD_MODE_888 == param1){
				hw->LCD_IFCON |= (0<<3);
			}
		break;
			
		case LCDC_SET_BUS_MODE:
			hw->LCD_IFCON &= ~(7<<5);
			if(LCD_BUS_WIDTH_6 == param1){
				hw->LCD_IFCON |= (0<<5);
			}else if(LCD_BUS_WIDTH_8 == param1){
				hw->LCD_IFCON |= (1<<5);
			}else if(LCD_BUS_WIDTH_9 == param1){
				hw->LCD_IFCON |= (2<<5);
			}else if(LCD_BUS_WIDTH_12 == param1){
				hw->LCD_IFCON |= (3<<5);
			}else if(LCD_BUS_WIDTH_16 == param1){
				hw->LCD_IFCON |= (4<<5);
			}else if(LCD_BUS_WIDTH_18 == param1){
				hw->LCD_IFCON |= (5<<5);
			}else if(LCD_BUS_WIDTH_24 == param1){
				hw->LCD_IFCON |= (6<<5);
			}
		break;
			
		case LCDC_SET_INTERFACE_MODE:
			hw->LCD_IFCON &= ~(3<<8);
			if(LCD_BUS_RGB == param1){
				hw->LCD_IFCON |= (0<<8);
			}else if(LCD_BUS_I80 == param1){
				hw->LCD_IFCON |= (1<<8);
			}else if(LCD_BUS_I68 == param1){
				hw->LCD_IFCON |= (2<<8);
			}
		break;

		case LCDC_SET_COLRARRAY:
			hw->LCD_IFCON &= ~(7<<0);
			if(param1 < 6)
				hw->LCD_IFCON |= (param1<<0);
		break;

		case LCDC_SET_LCD_VAILD_SIZE:
			pixel_dot_num = param2;
			h = param1&0xffff;
			w = (param1>>16)&0xffff;
			hw->LCD_WINCON &= ~(0X7FF<<16);
			hw->LCD_WINCON &= ~(0X1FFF<<0);
			hw->LCD_WINCON |= ((h-1)<<16);
			hw->LCD_WINCON |= ((w*pixel_dot_num - 1)<<0);
		break;
		case LCDC_SET_LCD_VISIBLE_SIZE:
			pixel_dot_num = param2;
			h = param1&0xffff;
			w = (param1>>16)&0xffff;			
			hw->LCD_VISIBLE_WIN &= ~(0X7FF<<16);
			hw->LCD_VISIBLE_WIN &= ~(0X7FF<<0);
			hw->PICTURE_SIZE &= ~(0X7FF<<16);
			hw->PICTURE_SIZE &= ~(0X7FF<<0);
			hw->LCD_VISIBLE_WIN |= ((h-1)<<16);
			hw->LCD_VISIBLE_WIN |= ((w*pixel_dot_num - 1)<<0);
			hw->PICTURE_SIZE |= ((h-1)<<16);
			hw->PICTURE_SIZE |= ((w-1)<<0);	
			
			hw->LCD_LEN	   = h * w * pixel_dot_num - 1;
		break;

		case LCDC_SET_SIGNAL_CONFIG:
			vs_en  = ((param1&BIT(0))>>0);
			hs_en  = ((param1&BIT(1))>>1);
			de_en  = ((param1&BIT(2))>>2);
			vs_inv = ((param1&BIT(3))>>3);
			hs_inv = ((param1&BIT(4))>>4);
			de_inv = ((param1&BIT(5))>>5);
			clk_inv= ((param1&BIT(6))>>6);

			if(vs_en == 1){
				hw->LCD_IFCON |= (1<<10);
				if(vs_inv == 1){
					hw->LCD_IFCON |= (1<<13);
				}else{
					hw->LCD_IFCON &= ~(1<<13);
				}
			}else{
				hw->LCD_IFCON &= ~(1<<10);
			}

			if(hs_en == 1){
				hw->LCD_IFCON |= (1<<11);
				if(hs_inv == 1){
					hw->LCD_IFCON |= (1<<14);
				}else{
					hw->LCD_IFCON &= ~(1<<14);
				}		
			}else{
				hw->LCD_IFCON &= ~(1<<11);
			}

			if(de_en == 1){
				hw->LCD_IFCON |= (1<<12);
				if(de_inv == 1){
					hw->LCD_IFCON |= (1<<15);
				}else{
					hw->LCD_IFCON &= ~(1<<15);
				}
			}else{
				hw->LCD_IFCON &= ~(1<<12);
			}	

			if(clk_inv == 1){
				hw->LCD_IFCON |= (1<<16);
			}else{
				hw->LCD_IFCON &= ~(1<<16);
			}			
		break;
		case LCDC_SET_MCU_SIGNAL_CONFIG:
			hw->LCD_IFCON &= ~(param1<<13);
			hw->LCD_IFCON |= (param1<<13);
		break;
		case LCDC_SET_INVALID_LINE:
			hw->LCD_IFCON &= ~(0x1f<<23);
			if(param1 < 0x20)
				hw->LCD_IFCON |= (param1<<23);		
		break;
			
		case LCDC_SET_VALID_DOT:
			hw->LCD_VISIBLE_START = 0;
			
			hw->LCD_VISIBLE_START |= ((param2)<<16);
			hw->LCD_VISIBLE_START |= ((param1)<<0);
		break;

		case LCDC_SET_HLW_VLW:
			hw->LCD_HSYNCON = 0;
			hw->LCD_HSYNCON |= (param1<<16);
			hw->LCD_HSYNCON |= ((0)<<0);	
			
			hw->LCD_VSYNCON = 0;
			hw->LCD_VSYNCON |= (param2<<16);
			hw->LCD_VSYNCON |= ((0)<<0);
		break;
		
		case LCDC_SET_VIDEO_BIG_ENDIAN:
			if(param1)
				hw->LCD_IFCON &= ~(1<<22);
			else
				hw->LCD_IFCON |= (1<<22);
		break;
			
		case LCDC_SET_VIDEO_SIZE:
			hw->VIDEO_WINCON = 0;
			hw->VIDEO_WINCON |= ((param1-1)<<0);
			hw->VIDEO_WINCON |= ((param2-1)<<16);
		break;

		case LCDC_SET_P0_ROTATE_Y_SRC_ADDR:	
			hw->ROTATE_PICTURE0_YDMA_STADR = param1;
		break;

		case LCDC_SET_P0_ROTATE_U_SRC_ADDR:	
			hw->ROTATE_PICTURE0_UDMA_STADR = param1;
		break;

		case LCDC_SET_P0_ROTATE_V_SRC_ADDR:	
			hw->ROTATE_PICTURE0_VDMA_STADR = param1;
		break;

		case LCDC_SET_P1_ROTATE_Y_SRC_ADDR:	
			hw->ROTATE_PICTURE1_YDMA_STADR = param1;
		break;

		case LCDC_SET_P1_ROTATE_U_SRC_ADDR:		
			hw->ROTATE_PICTURE1_UDMA_STADR = param1;
		break;

		case LCDC_SET_P1_ROTATE_V_SRC_ADDR:	
			hw->ROTATE_PICTURE1_VDMA_STADR = param1;
		break;

		case LCDC_SET_ROTATE_P0_UP:
			if(param1){
				hw->LCDCON |= BIT(10);
			}else{
				hw->LCDCON &= ~BIT(10);
			}
		break;

		case LCDC_SET_P0P1_ROTATE_START_ADDR:
			x = param1&0xffff;
			y = (param1>>16)&0xffff;
			hw->ROTATE_PICTURE0_START = x|(y<<16);
			x = param2&0xffff;
			y = (param2>>16)&0xffff;			
			hw->ROTATE_PICTURE1_START = x|(y<<16);
		break;

		case LCDC_SET_ROTATE_LINE_BUF_NUM:
			hw->ROTATE_OUTBUF_LINE_NUM = param1;
		break;		

		case LCDC_SET_ROTATE_LINE_BUF_Y:
			hw->VIDEO_YDMA_STADR = param1;
		break;

		case LCDC_SET_ROTATE_LINE_BUF_U:
			hw->VIDEO_UDMA_STADR = param1;
		break;

		case LCDC_SET_ROTATE_LINE_BUF_V:
			hw->VIDEO_VDMA_STADR = param1;
		break;

		case LCDC_SET_ROTATE_MIRROR:
			if(param1){
				hw->LCDCON |= BIT(13);	
			}else{
				hw->LCDCON &= ~BIT(13);	
			}
			if(param2 == LCD_ROTATE_0){
				hw->LCDCON &= ~BIT(11);
				hw->LCDCON &= ~BIT(12);
			}
			if(param2 == LCD_ROTATE_90){
				hw->LCDCON |= BIT(11);
				hw->LCDCON &= ~BIT(12);
			}else if(param2 == LCD_ROTATE_180){
				hw->LCDCON &= ~BIT(11);
				hw->LCDCON |= BIT(12);		
			}else if(param2 == LCD_ROTATE_270){
				hw->LCDCON |= BIT(11);
				hw->LCDCON |= BIT(12);		
			}

		break;
		case LCDC_SET_ROTATE_SET_SIZE:
			h = param1&0xffff;
			w = (param1>>16)&0xffff;			
			hw->ROTATE_PICTURE0_WINCON = 0;
			hw->ROTATE_PICTURE0_WINCON |= ((h-1)<<16);
			hw->ROTATE_PICTURE0_WINCON |= ((w-1)<<0);
			h = param2&0xffff;
			w = (param2>>16)&0xffff;			
			hw->ROTATE_PICTURE1_WINCON = 0;
			hw->ROTATE_PICTURE1_WINCON |= ((h-1)<<16);
			hw->ROTATE_PICTURE1_WINCON |= ((w-1)<<0);

		break;
		
		case LCDC_SET_VIDEO_MODE:
			hw->LCDCON &= ~(3<<4);
			hw->LCDCON |= (param1<<4);
		break;

		case LCDC_SET_VIDEO_START_ADDR:
			x = param1&0xffff;
			y = (param1>>16)&0xffff;	
			hw->VIDEO_START = 0;
			hw->VIDEO_START |= ((y)<<16);
			hw->VIDEO_START |= ((x)<<0);
		break;
		
		case LCDC_SET_VIDEO_EN:
			if(param1){
				hw->LCDCON |= BIT(1);
			}else{
				hw->LCDCON &= ~BIT(1);
			}
		break;
			
		case LCDC_SET_OSD_SIZE:
			w = param1&0xffff;
			h = (param1>>16)&0xffff;			
			hw->OSD0_WINCON = 0;
			hw->OSD0_WINCON |= ((w-1)<<0);
			hw->OSD0_WINCON |= ((h-1)<<16);
		break;

		case LCDC_SET_OSD_START_ADDR:
			hw->OSD0_START = 0;	
			hw->OSD0_START |= ((param1)<<16);
			hw->OSD0_START |= ((param2)<<0);	
		break;

		case LCDC_SET_OSD_LUTDMA_ADDR:
			hw->OSD0_LUTDMA_STADR = param1;
		break;
		
		case LCDC_SET_OSD_DMA_ADDR:
			hw->OSD0_DMA_STADR = param1;
		break;
		
		case LCDC_SET_OSD_DMA_LEN:
			hw->OSD0_WORD_LEN = param1/4;
		break;

		case LCDC_SET_OSD_FORMAT:
			hw->LCDCON &= ~(3<<6);
			if(OSD_RGB_256 == param1){
				hw->LCDCON |= (0<<6);
			}else if(OSD_RGB_565 == param1){
				hw->LCDCON |= (1<<6);
			}else if(OSD_RGB_888 == param1){
				hw->LCDCON |= (2<<6);
			}			
		break;
		case LCDC_SET_OSD_ALPHA:
			hw->ALPHA &= ~(0x1ff<<0);
			hw->ALPHA |= (param1<<0);
		break;
		
		case LCDC_SET_ROTATE_P0_P1_EN:
			if(param1)
				hw->LCDCON |= BIT(8);
			else
				hw->LCDCON &= ~BIT(8);

			if(param2)
				hw->LCDCON |= BIT(9);
			else
				hw->LCDCON &= ~BIT(9);			
		break;
		
		case LCDC_SET_OSD_ENC_HEAD:
			hw->OSD_ENC_IDENT0 = param1;
			hw->OSD_ENC_IDENT1 = param2;
		break;

		case LCDC_SET_OSD_ENC_DIAP:
			hw->OSD_ENC_TRANS0 = param1;
			hw->OSD_ENC_TRANS1 = param2;
		break;
		
		case LCDC_SET_OSD_EN:
			if(param1)
				hw->LCDCON |= (1<<2); 
			else
				hw->LCDCON &= ~(1<<2);
		break;
			
		case LCDC_SET_OSD_ENC_SRC_ADDR:
			hw->OSD_ENC_SADR = param1;
		break;
			
		case LCDC_SET_OSD_ENC_DST_ADDR:
			hw->OSD_ENC_TADR = param1;
		break;
		
		case LCDC_SET_OSD_ENC_SRC_LEN:
			hw->OSD_ENC_RLEN = param1/4;
		break;

		case LCDC_GET_OSD_ENC_DST_LEN:
			ret_val = hw->OSD_ENC_DLEN*4;
		break;	

		case LCDC_SET_OSD_ENC_START:
			hw->LCDCON |= BIT(3);
		break;	

		case LCDC_MCU_CPU_WRITE:
			hw->LCD_IFCON &= ~BIT(17); // LCD_CS==0

			//mcu的命令,DC的io拉低
			if(!param2)
			{
				hw->LCD_IFCON &= ~BIT(18); // LCD_DC==0,tx cmd
			}
			//mcu的data,DC的io拉高
			else
			{
				hw->LCD_IFCON |= BIT(18);  // LCD_DC==1,tx data
			}	
			hw->LCD_IFCON |= BIT(19);  // LCD_CMD_WR=1

			hw->LCD_CMD = param1;
			while (hw->LCD_IFSTA & BIT(17));
			//hw->LCD_IFCON |= BIT(18);
			//os_sleep_ms(1);
			hw->LCD_IFCON |= BIT(17);
		break;	


		case LCDC_MCU_CPU_READ:
		{
			uint8_t cmd = param2>>16;
			uint8_t len = param2 & 0xff;
			uint8_t read_cmd;
			uint8_t *read_buf = (uint8_t*)param1;
			uint32_t baud_tmp = hw->LCD_BAUD;

			uint32_t len_tmp = hw->LCD_LEN;
			if(baud_tmp %2 == 0)
			{
				hw->LCD_BAUD = baud_tmp + 1;
			}
			hw->LCD_IFCON &= ~BIT(17);// LCD_CS==0
			hw->LCD_LEN = len-1;
			hw->LCD_IFCON &= ~BIT(18); // LCD_DC==0,tx cmd
			hw->LCD_IFCON &= ~BIT(19); // LCD_CMD_WR=0
			hw->LCD_CMD = cmd;
			for (int i = 0; i < len; i++)
			{
				while ((hw->LCD_IFSTA & BIT(18)) == 0)
				{
				}; // wait read data valid
				//data[i] = hw->LCD_CMD;
				read_cmd = hw->LCD_CMD;
				//printf("cmd:%X\n",read_cmd);
				*read_buf = read_cmd;
				read_buf++;
			}
			hw->LCD_IFCON |= BIT(17); // LCD_CS==1

			hw->LCD_LEN = len_tmp;
			hw->LCD_BAUD = baud_tmp;
		}
			
		break;

		case LCDC_SET_START_RUN:
			hw->LCD_IFCON &= ~BIT(17); // LCD_CS==0
			hw->LCD_IFCON |= (1<<20);				
		break;
		
		default:
			os_printf("NO LCDC IOCTL:%d\r\n",ioctl_cmd);
			ret_val = -ENOTSUPP;
		break;
	}

	
	return ret_val;
}

static int32 hglcdc_set_baudrate(struct lcdc_device *p_lcdc,uint32 baudrate){
	struct hglcdc *lcdc_hw = (struct hglcdc*)p_lcdc;
	struct hglcdc_hw *hw  = (struct hglcdc_hw *)lcdc_hw->hw;
	uint32 baud = 0;
	baud = system_clock_get()/baudrate;
	_os_printf("lcd baud:%d\r\n",baud);
	hw->LCD_BAUD = baud;
	return 0;
}


static int32 hglcdc_init(struct lcdc_device *p_lcdc){
	struct hglcdc *lcdc_hw = (struct hglcdc*)p_lcdc;	
	struct hglcdc_hw *hw  = (struct hglcdc_hw *)lcdc_hw->hw;
	//SCHED->BW_STA_CYCLE = 60000000;
	//SCHED->CTRL_CON      |=BIT(1);
	SYSCTRL->CLK_CON4      |= BIT(29)|BIT(30);
	lcd_glo = hw;
	pin_func(HG_LCDC_DEVID,1);
	hw->LCD_IFCON = 0x80000;
	hw->LCDCON = 0; 

	return 0;
}

static int32 hglcdc_open(struct lcdc_device *p_lcdc){
	struct hglcdc *lcdc_hw = (struct hglcdc*)p_lcdc;	
	struct hglcdc_hw *hw  = (struct hglcdc_hw *)lcdc_hw->hw;
	hw->LCDCON |= (1<<0); 
	irq_enable(lcdc_hw->irq_num);
	return 0;
}

static int32 hglcdc_close(struct lcdc_device *p_lcdc){
	struct hglcdc *lcdc_hw = (struct hglcdc*)p_lcdc;	
	struct hglcdc_hw *hw  = (struct hglcdc_hw *)lcdc_hw->hw;
	hw->LCDCON &= ~(1<<0); 
	irq_disable(lcdc_hw->irq_num);
	return 0;
}




static const struct lcdc_hal_ops dev_ops = {
	.init        = hglcdc_init,
	.baudrate    = hglcdc_set_baudrate,
    .open        = hglcdc_open,
    .close       = hglcdc_close,
    .ioctl       = hglcdc_ioctl,
    .request_irq = lcdcirq_register,
    .release_irq = lcdcirq_unregister,
};


int32 hglcdc_attach(uint32 dev_id, struct hglcdc *lcdc){
    lcdc->opened          = 0;
    lcdc->use_dma         = 0;
    lcdc->irq_hdl                   = NULL;
    lcdc->irq_data                  = 0;
	lcdc->dev.dev.ops = (const struct devobj_ops *)&dev_ops;
    irq_disable(lcdc->irq_num);
    dev_register(dev_id, (struct dev_obj *)lcdc);	
	return 0;
}


