#include "sys_config.h"
#include "typesdef.h"
#include "lib/video/dvp/cmos_sensor/csi.h"
#include "tx_platform.h"
#include "list.h"
#include "dev.h"
#include "hal/i2c.h"


#if DEV_SENSOR_XCG532


SENSOR_INIT_SECTION static const unsigned char XCG532InitTable[CMOS_INIT_LEN]=
{
	0x03,0x00,
	0x35,0xF0,
	0x57,0x63,
	0x58,0x04,
	0x59,0xB8,
	0x65,0x01,
	0x60,0x00,
	0x61,0x00,
	0x62,0x00,
	0x06,0x07,
	0x07,0xBB,
	0x14,0x00,
	0x15,0x0F,
	0x16,0x02,
	0x17,0xDF,
	0x1D,0x0A,
	0x35,0x50,
	0x55,0x52,
	
	0x03,0x00,
	0x05,0x03,
	0x3D,0xB8,
	0x3E,0x08,
	0x3F,0x04,
	0x40,0x46,
	0x41,0x54,
	0x42,0xA0,
	0x45,0x13,
	
	0x5C,0x00,
	0x96,0xA4,
	0xBC,0x00,
	0x03,0x01,
	0x05,0xCF,
	0x06,0xB0,
	0x0A,0xA4,
	0x2D,0x03,
	0x2E,0x20,
	0x2F,0x05,
	0x30,0xA2,
	0x35,0x03,
	0x36,0x20,
	0x37,0x05,
	0x38,0xA2,
	0x39,0x07,
	0x3A,0xA2,
	0x63,0x5F,
	0xA3,0x00,
	0xA4,0x02,
	0xA5,0x03,
	0xA6,0x04,
	0xA7,0x05,
	0xA8,0x08,
	0xA9,0x2A,
	0xAA,0x10,
	0xCF,0x00,
	0xD0,0x00,
	0xD1,0xD0,
	0xD2,0x00,
	0xD3,0x70,
	0xD5,0x00,
	0xD6,0x20,
	0xD7,0x40,
	0xD8,0x80,
	0xD9,0xF0,
	0xDA,0x00,
	0xDB,0x20,
	0xDC,0x46,
	0xDD,0x86,
	0xDE,0xFF,
	
	0x03,0x02,
	0x04,0x00,
	0x05,0x0B,
	0x06,0x07,
	0x07,0xBC,
	0x08,0x00,
	0x09,0x0F,
	0x0A,0x07,
	0x0B,0xB2,
	0x0C,0x00,
	0x0D,0xE6,
	0x0E,0x01,
	0x0F,0x13,
	0x10,0x07,
	0x11,0xB4,
	0x12,0x07,
	0x13,0xB6,
	0x14,0x07,
	0x15,0xB8,
	0x16,0x07,
	0x17,0xBA,
	0x1F,0x00,
	0x20,0x79,
	0x21,0x00,
	0x22,0xC9,
	0x23,0x01,
	0x24,0x78,
	0x25,0x03,
	0x26,0x1B,
	0x27,0x00,
	0x28,0x7A,
	0x29,0x00,
	0x2A,0xC8,
	0x2B,0x01,
	0x2C,0x79,
	0x2D,0x03,
	0x2E,0x1A,
	0x2F,0x00,
	0x30,0x1E,
	0x31,0x00,
	0x32,0x5F,
	0x33,0x00,
	0x34,0x64,
	0x35,0x02,
	0x36,0xFE,
	0x37,0x03,
	0x38,0x17,
	0x39,0x00,
	0x3A,0xE5,
	0x3B,0x00,
	0x3C,0x00,
	0x3D,0x00,
	0x3E,0x28,
	0x4F,0x07,
	0x50,0x26,
	0x51,0x07,
	0x52,0xBC,
	0x54,0x00,
	0x55,0x69,
	0x56,0x00,
	0x57,0x7E,
	0x58,0x00,
	0x59,0xE1,
	0x5C,0x01,
	0x5D,0x7D,
	0x5E,0x03,
	0x5F,0x1B,
	0x67,0x02,
	0x68,0xFE,
	0x69,0x03,
	0x6A,0x17,
	0xA8,0x00,
	0xA9,0x09,
	0xAA,0x0D,
	0xBC,0x00,
	0xBD,0x7E,
	0xBE,0x00,
	0xBF,0xC6,
	0xC0,0x01,
	0xC1,0x7D,
	0xC2,0x02,
	0xC3,0xFD,
	0xC4,0x07,
	0xC5,0xB8,
	0xC6,0x07,
	0xC7,0xBA,
	0xC8,0x03,
	0xC9,0x11,
	0xCA,0x03,
	0xCB,0x15,
	
	0x03,0x03,
	0x2B,0x07,
	0x2C,0x10,
	0x2D,0xF0,
	0x2E,0x02,
	0x2F,0x02,
	0x30,0x40,
	0x31,0x01,
	0x32,0xF4,
	0x33,0x02,
	0x34,0x6E,
	0x35,0x27,
	0x36,0x2D,
	0x37,0x47,
	0x38,0x8D,
	0x39,0x01,
	0x3A,0x00,
	0x3B,0x41,
	0x3C,0x34,
	0x3D,0x54,
	0x3E,0x80,
	0x3F,0x48,
	0x40,0xA7,
	0x41,0x36,
	0x42,0x34,
	0x55,0x04,
	0x5A,0x00,
	0x5B,0xE1,
	0x5C,0x00,
	0x67,0xC8,
	0x68,0x21,
	0x6B,0x40,
	0x6D,0x8A,
	
	0x83,0x0C,
	0x86,0x20,
	0x87,0x20,
	0x88,0x20,
	0x89,0x20,
	
	0x8B,0x14,
	0xB1,0x40,
	0xB2,0xC0,
	0xD0,0x5E,
	0xD1,0x55,
	0xD2,0x4B,
	0xD3,0x45,
	0xD4,0x49,
	0xD5,0x51,
	0xD6,0x56,
	
	0x03,0x04,
	0x04,0x00,
	0x05,0x00,
	0x06,0x00,
	0x07,0x01,
	0x08,0x02,
	0x09,0x04,
	0x0A,0x06,
	0x0B,0x08,
	0x0C,0x0B,
	0x0D,0x11,
	0x0E,0x18,
	0x0F,0x1F,
	0x10,0x27,
	0x11,0x36,
	0x12,0x44,
	0x13,0x50,
	0x14,0x5C,
	0x15,0x83,
	0x16,0xA2,
	0x17,0xBD,
	0x18,0xD5,
	0x19,0xEB,
	0x1A,0xFF,
	0x7A,0x28,
	
	0x03,0x07,
	0x51,0x0F,
	0x52,0x19,
	0x53,0x26,
	0x54,0x3A,
	0x55,0x4C,
	0x56,0x56,
	0x57,0x60,
	0x58,0x6A,
	0x59,0x74,
	0x5A,0x7E,
	0x5B,0x88,
	0x5C,0x92,
	0x5D,0x9C,
	0x5E,0xA6,
	0x5F,0xB0,
	0x60,0xBA,
	0x61,0xC4,
	0x62,0xCE,
	0x63,0xD8,
	0x64,0xDE,
	0x65,0xE0,
	0x66,0xE2,
	0x67,0xE4,
	0x68,0xE6,
	0x69,0xE8,
	0x6A,0xEB,
	0x6B,0xED,
	0x6C,0xEE,
	0x6D,0xF0,
	0x6E,0xF2,
	0x6F,0xF5,
	0x70,0xFA,
	0x71,0xFF,
	
	0x03,0x08,
	0x79,0x90,
	
	0x03,0x09,
	0x1C,0x20,
	0x1D,0x20,
	0x1E,0x20,
	0x1F,0x5A,
	0x20,0x5A,
	0x21,0x5A,
	0x22,0x20,
	0x23,0x20,
	0x24,0x20,
	0x25,0x5A,
	0x26,0x5A,
	0x27,0x5A,
	0x28,0x5D,
	0x29,0xFF,
	0x2A,0xFF,
	0x2B,0x5F,
	0x2C,0x5F,
	0x2D,0x00,
	0x2E,0x00,
	0x2F,0x00,
	0x30,0x26,
	0x31,0x26,
	0x32,0x40,
	0x33,0x40,
	0x34,0x40,
	0x35,0x40,
	0x36,0x40,
	0x37,0x06,
	0x38,0x06,
	0x39,0x06,
	0x3A,0x08,
	0x3B,0x0B,
	0x3C,0x1F,
	0x3D,0x1F,
	0x3E,0x1F,
	0x3F,0x1F,
	0x40,0x1F,
	0x41,0x00,
	0x42,0x10,
	0x43,0x30,
	0x44,0x40,
	0x45,0x5F,
	0x46,0x3F,
	0x47,0x34,
	0x48,0x33,
	0x49,0x3B,
	0x4A,0x2A,
	0x4B,0x2A,
	0x4C,0x04,
	0x4D,0x04,
	0x4E,0x04,
	0x4F,0x04,
	0x50,0x04,
	0x51,0x00,
	0x52,0x00,
	0x53,0x00,
	0x54,0x00,
	0x55,0x00,
	0x56,0x00,
	0x57,0x00,
	0x58,0x00,
	0x59,0x00,
	0x5A,0x00,
	0x5B,0x00,
	0x5C,0x00,
	0x5D,0x00,
	0x5E,0x00,
	0x5F,0x00,
	0x60,0x00,
	0x61,0x00,
	0x62,0x00,
	0x63,0x00,
	0x64,0x00,
	0x65,0x14,
	0x66,0x17,
	0x67,0x18,
	0x68,0x1D,
	0x69,0x00,
	0x6A,0x08,
	0x6B,0x08,
	0x6C,0x06,
	0x6D,0x06,
	0x6E,0x00,
	0x75,0x0A,
	0x76,0x0A,
	0x77,0x00,
	0x78,0x00,
	0x79,0x00,
	0x7A,0x00,
	0x7B,0x2B,
	0x7C,0x19,
	0x7D,0x19,
	0x7E,0x19,
	0x7F,0x03,
	0x80,0x03,
	0x81,0x50,
	0x82,0x38,
	0x83,0x38,
	0x84,0x28,
	0x85,0x04,
	0x86,0x00,
	0x8C,0x80,
	0x8D,0x80,
	0x8E,0x80,
	0x8F,0x80,
	0x90,0x80,
	0x91,0x80,
	0x92,0x04,
	0x93,0x04,
	0x94,0x04,
	0x95,0x04,
	0x96,0x04,
	0x97,0x04,
	0x98,0x04,
	0x99,0x04,
	0x9A,0x04,
	0x9B,0x04,
	0xA1,0x01,
	0xA2,0x03,
	0xA3,0x05,
	0xA4,0x06,
	0xA5,0x20,
	0xA6,0x20,
	0xA7,0x00,
	0xA8,0x00,
	0xA9,0x00,
	0xAA,0x00,
	0xAB,0x08,
	0xAC,0x08,
	0xAD,0x30,
	0xAE,0x40,
	0xAF,0x40,
	0xB0,0x30,
	0xB1,0x40,
	0xB3,0xE0,
	0xB4,0xD0,
	0xB5,0xD0,
	0xB6,0xD0,
	0xB7,0xD0,
	0xB9,0x00,
	0xBA,0x00,
	0xBB,0x00,
	0xBC,0x00,
	0xBD,0x00,
	0xBE,0x00,
	0xBF,0x3C,
	0xC0,0x3C,
	0xC1,0x3C,
	0xC2,0x9B,
	0xC3,0x9B,
	0xC4,0x9B,
	0xC5,0x80,
	0xC6,0x80,
	0xC7,0x80,
	0xC8,0x8C,
	0xC9,0x8C,
	0xCA,0x8C,
	0xCB,0x3A,
	0xCC,0x3A,
	0xCD,0x3A,
	0xCE,0x8E,
	0xCF,0x8E,
	0xD0,0x8E,
	0xD1,0x82,
	0xD2,0x82,
	0xD3,0x82,
	0xD4,0x96,
	0xD5,0x96,
	0xD6,0x96,
	0xD7,0x38,
	0xD8,0x38,
	0xD9,0x38,
	0xDA,0x02,
	0xDB,0x02,
	0xDC,0x02,
	0xDD,0x02,
	0xDE,0x0B,
	0xDF,0x16,
	0xE0,0x02,
	0xE1,0x05,
	0xE2,0x08,
	0xE3,0x16,
	0xE4,0x20,
	0xE5,0x20,
	0xE6,0x10,
	0xE7,0x20,
	0xE8,0x40,
	0xE9,0x60,
	0xEA,0x60,
	0xEB,0x80,
	0xEC,0x04,
	0xED,0x04,
	0xEE,0x04,
	0xEF,0x04,
	0xF0,0x06,
	0xF1,0x08,
	0xF2,0x00,
	0xF3,0x00,
	0xF4,0x02,
	0xF5,0x7E,
	0xF6,0x17,
	0xF7,0x1C,
	0xF8,0xFF,
	0xF9,0xFF,
	0xFA,0xFF,
	0xFB,0xFF,
	0xFC,0xFF,
	0xFD,0xFF,
	
	0x03,0x0D,
	0x04,0x34,
	0x05,0x5A,
	0x06,0x60,
	0x07,0x22,
	0x08,0x25,
	0x09,0x1F,
	0x0A,0x84,
	0x0B,0x00,
	0x0C,0x82,
	0x0D,0x03,
	0x0E,0x00,
	0x0F,0x01,
	0x10,0x1F,
	0x11,0x25,
	0x12,0x1A,
	0x37,0x18,
	0x38,0x18,
	0x39,0x18,
	0x3A,0x0B,
	0x3B,0x00,
	0x3C,0x00,
	0x3D,0x1C,
	0x3E,0x1C,
	0x3F,0x1C,
	0x40,0x05,
	0x41,0x00,
	0x42,0x00,
	0x44,0x00,
	0x45,0x00,
	0x46,0x00,
	0x47,0x00,
	0x48,0x00,
	0x49,0x20,
	0x4A,0x10,
	
	0x03,0x0E,
	0x07,0x20,
	0x09,0x00,
	0x0A,0x02,
	0x0B,0xE7,
	0x0C,0x02,
	0x0D,0xE7,
	0x0E,0x02,
	0x0F,0xEA,
	0x10,0x00,
	0x11,0x00,
	0x12,0x0C,
	0x13,0x00,
	0x14,0x2E,
	0x15,0xA0,
	0x16,0x00,
	0x17,0x2E,
	0x18,0xA0,
	0x38,0x70,
	0x39,0x68,
	0x3A,0x68,
	0x3B,0x70,
	0x3C,0x68,
	0x3D,0x68,
	0x3E,0x00,
	0x3F,0x01,
	0x40,0x72,
	0x41,0x00,
	0x42,0x02,
	0x43,0xE7,
	0x44,0x00,
	0x45,0x0B,
	0x46,0x9C,
	0x47,0x00,
	0x48,0x17,
	0x49,0x38,
	0x50,0x80,
	0x51,0x08,
	0x52,0x08,
	0x53,0x10,
	0x57,0x82,
	0x58,0x7C,
	0x59,0x7E,
	0x5A,0x84,
	0x5B,0x81,
	0x5C,0x84,
	0x5D,0x4A,
	0x5E,0x78,
	0x5F,0x87,
	0x60,0x80,
	0x61,0x80,
	0x62,0x08,
	0x63,0x08,
	0x6A,0x01,
	0x6B,0x73,
	0x6C,0x05,
	0x6D,0xCE,
	0x6E,0x17,
	0x6F,0x38,
	0x70,0x00,
	0x71,0x2E,
	0x72,0x70,
	0x73,0x00,
	0x74,0xA7,
	0x75,0x6F,
	0x81,0x90,
	0x82,0x80,
	
	
	0x03,0x09,
	0xDA,0x08,
	0xDB,0x08,
	0xDC,0x08,
	0xDD,0x08,
	0xDE,0x0B,
	0xDF,0x16,
	
	
	0x03,0x0E,
	0x57,0x80,
	0x58,0x80,
	0x59,0x80,
	0x5A,0x80,
	0x5B,0x80,
	0x5C,0x80,
	
	
	0x03,0x03,
	0x2C,0x10,
	0x2D,0xF0,
	0x2E,0x02,
	0x2F,0x02,
	0x30,0x40,
	0x31,0x01,
	0x32,0xF4,
	0x33,0x02,
	0x34,0x6E,
	0x35,0x27,
	
	0x03,0x03,
	0x36,0x2D,
	0x37,0x4C,
	0x38,0x6F,
	0x39,0x01,
	0x3A,0x00,
	0x3B,0x41,
	0x3C,0x34,
	0x3D,0x54,
	0x3E,0x73,
	0x3F,0x3C,
	0x40,0xA7,
	0x41,0x3E,
	0x42,0x34,
	
	
	
	0x03,0x00,
	0x55,0x42,
	0x60,0xC0,
	0x61,0x90,
	0x62,0xFF,
	
	


	-1,-1,
};

extern struct i2c_device *iic_test;

static void XCG532_rotate(uint32 r)
{

}



uint32 XCG532_hvblank(int8 dh,int8 dv)
{

}

SENSOR_OP_SECTION const _Sensor_Adpt_ xcg532_cmd= 
{
	.typ = 1, //YUV
	.pixelw = 1280,
	.pixelh= 720,
	.hsyn = 1,
	.vsyn = 1,
	.rduline = 0,//
	.rawwide = 1,//10bit
	.colrarray = 2,//0:_RGRG_ 1:_GRGR_,2:_BGBG_,3:_GBGB_
	.init = (uint8 *)XCG532InitTable,
	.rotate_adapt = {0},
	//.hvb_adapt = {0x6a,0x12,0x6a,0x12},
	. mclk = 24000000,
	.p_fun_adapt = {XCG532_rotate,XCG532_hvblank,NULL},
	//.p_xc7016_adapt = NULL,	
};

const _Sensor_Ident_ xcg532_init=
{
	0x41,0x64,0x65,0x01,0x01,0x00
};



#endif


