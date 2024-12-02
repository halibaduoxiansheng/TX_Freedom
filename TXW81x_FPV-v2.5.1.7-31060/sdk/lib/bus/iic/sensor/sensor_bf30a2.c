#include "sys_config.h"
#include "typesdef.h"
#include "lib/video/dvp/cmos_sensor/csi.h"
#include "tx_platform.h"
#include "list.h"
#include "dev.h"
#include "hal/i2c.h"



#if DEV_SENSOR_BF30A2
SENSOR_INIT_SECTION static const unsigned char bf30a2InitTable[CMOS_INIT_LEN]=
{
	0x12,0x00,//MTK:20 ZX:10 RDA:40
	0x15,0x80,
	0x6b,0x51,  //71
	0x04,0x00,  //0x20  0x05
	0x06,0x26,
	0x08,0x07,
	0x1c,0x12,
	0x1e,0x26,
	0x1f,0x01,   //0x02
	0x20,0x20,
	0x21,0x20,
	0x34,0x02,
	0x35,0x02,
	0x36,0x21,
	0x37,0x13,
	0xca,0x03,
	0xcb,0x22,
	0xcc,0x89,
	0xcd,0x4c,
	0xce,0xcb,
	//0xcf,0xf0,   //0x90
	0xa0,0x8e,
	0x01,0x1b,
	0x02,0x1d,
	0x13,0x08,
	0x87,0x13,
	0x8a,0x33,
	0x8b,0x08,
	0x70,0x0f,//2f 0f
	0x71,0x47,//40
	0x72,0x7f,//0a
	0x73,0x62,
	0x74,0xa2,
	0x75,0xbf,
	0x76,0x24,
	0x77,0xff,//0xcc
	0x40,0x32,
	0x41,0x28,
	0x42,0x26,
	0x43,0x1d,
	0x44,0x1a,
	0x45,0x14,
	0x46,0x11,
	0x47,0x0f,
	0x48,0x0e,
	0x49,0x0d,
	0x4B,0x0c,
	0x4C,0x0b,
	0x4E,0x0a,
	0x4F,0x09,
	0x50,0x09,
	0x24,0x55,
	0x25,0x36,
	0x80,0x00,
	0x81,0x20,
	0x82,0x40,
	0x83,0x30,  
	0x84,0x50,
	0x85,0x30,
	0x86,0xD8,
	0x89,0x45,
	0x8f,0x81,
	0x91,0xff,
	0x92,0x08,
	0x94,0x82,
	0x95,0xfd,
	0x9a,0x20,
	0x9e,0xbc,
	0xf0,0x86,
	0x51,0x06,
	0x52,0x25,
	0x53,0x2b,
	0x54,0x0F,
	0x57,0x2A,
	0x58,0x22,
	0x59,0x29,
	0x23,0x33,
	0xa0,0x8f,
	0xa1,0x93,
	0xa2,0x0f,
	0xa3,0x2a,
	0xa4,0x08,
	0xa5,0x26,
	0xa7,0x80,
	0xa8,0x80,
	0xa9,0x1e,
	0xaa,0x19,
	0xab,0x18,
	0xae,0x50,
	0xaf,0x04,
	0xc8,0x10,
	0xc9,0x15,
	0xd3,0x0c,
	0xd4,0x16,
	0xee,0x06,
	0xef,0x04,
	0x55,0x33,//34
	0x56,0x90,//9c
	0xb1,0x58,//98 58(现用) 2c
	0xb2,0x58,//98 58(现用) 2c 
	0xf1,0x6b,
	0xb3,0xc4,
	0xb4,0x0C,
	0x00,0x4c,//flip[2] mirror[3] 40 4c
	0x13,0x07,
	0xcf,0xd0,



	-1,-1
			//switch direction
			//0x1e,0x30,//00:normal	10:IMAGE_V_MIRROR	 

};

extern struct i2c_device *iic_test;


static void bf30a2_rotate(uint32 r)
{
	unsigned char buf[2];
	buf[0] = 0x1e;
	//buf[1] = Sensor_ReadRegister(buf,u8AddrLength,u8DataLength);
	//buf[1] &=~(3<<4);
	buf[1] = (r<<4)|0x00;
	//i2c_sensor_write(iic_test,buf,1,1,0x42,0x43);
	i2c_write(iic_test,(int8 *)buf,1,(int8 *)&buf[1],1);

}



uint32 bf30a2_hvblank(int8 dh,int8 dv)
{
#define HBLANK_BASE	0x00UL
#define VBLANK_BASE	0x00UL
		uint32 i;
		int32 h = (int32)HBLANK_BASE + dh; if(h < 0) h = 0;
		int32 v = (int32)VBLANK_BASE + dv; if(v < 0) v = 0;
		const uint8 t[][2] = {
			{0x2a,(h >> 8) << 4 },
			{0x2b,h & 0xff},
			{0x92,v & 0xff},
			{0x93,v >> 8},
			{0xe3,0x00},
			{0xe4,0},
		};


	for(i=0;i<6;i++)
		i2c_write(iic_test,(int8 *)&t[i][0],1,(int8 *)&t[i][1],1);
		//i2c_sensor_write(iic_test,(uint8 *)&t[i][0],1,1,0x42,0x43);


	return (h<<16)|v;
}

SENSOR_OP_SECTION const _Sensor_Adpt_ bf30a2_cmd= 
{
	.typ = 1, //YUV
	.pixelw = 240,
	.pixelh= 320,
	.hsyn = 1,
	.vsyn = 1,
	.rduline = 0,//
	.rawwide = 1,//10bit
	.colrarray = 2,//0:_RGRG_ 1:_GRGR_,2:_BGBG_,3:_GBGB_
	.init = (uint8 *)bf30a2InitTable,
	.rotate_adapt = {0},
	//.hvb_adapt = {0xde,0x24,0xde,0x24},
	. mclk = 40000000,    //40
	.p_fun_adapt = {bf30a2_rotate,bf30a2_hvblank,NULL},

};

const _Sensor_Ident_ bf30a2_init=
{
	0x3b,0xdc,0xdd,0x01,0x01,0xfc,//bf3
};



#endif
