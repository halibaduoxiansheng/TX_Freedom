#include "typesdef.h"
#include "devid.h"
#include "sys_config.h"
#include "osal/irq.h"
#include "osal/string.h"
#include "dev/csi/hgdvp.h"
#include "g_sensor.h"
#include "../../lib/lvgl/src/misc/lv_math.h"
#include "hali_gsensor.h"
#include "hal/i2c.h"
#include "list.h"
#include "lwip/err.h"
#include "lwip/sockets.h"
#include "lwip/netdb.h"
#include "lwip/sys.h"
#include "lwip/ip_addr.h"
#include "lwip/tcpip.h"
#include "osal/semaphore.h"
#include "osal/mutex.h"
#include "osal/task.h"
#include "osal/sleep.h"
#include "osal/timer.h"
#include "osal/work.h"
#include "lib/umac/umac.h"
#include "hal/dvp.h"
#include "lib/video/dvp/jpeg/jpg.h"
#include "hal/jpeg.h"
#include "syscfg.h"
#include "hal/gpio.h"
#include "dev/adc/hgadc_v0.h"
#include "hali_wifi.h"
#include <stdio.h>



struct i2c_device *g_sensor_iic;

#define GSENSOR_PRT                printf
#define GSENSOR_WARN               printf
#define GSENSOR_FATAL              printf

#define GSENSOR_TMR_DURATION  10
#define GSENSOR_DATA_CONV(x) ((x) < 0?((-(x)) | 0x200):(x))

//#define GSENSOR_GMA301	1
#define GSENSOR_SC7A20	1
#define UINT8 int8
#define UINT16 int32
#define u8 int8

static int X1,Y1,Z1;
static int j=0;

//static DD_HANDLE i2c_gsensor = DD_HANDLE_UNVALID;
//static UINT8 i2c_salve_id = 0;
//static I2C_OP_ST i2c_gsensor_operater;
//static beken_timer_t g_gsensor_timer;
struct G_TX_Gsensor g_tx_sensor;

uint8_t gsensor_offline_flag;

static void _get_xyz(void *param);

int (*gensor_correction)(int*,int*,int*) = NULL;

#if 0
static int gsensor_correct(int *x,int *y,int *z)
//int gsensor_correct(int *x,int *y,int *z)

{
	int txyz;
	static int32 counter = 0;
	counter++;
	if(counter >= 5)
	{
		counter = 0;
		//os_printf("i4_gsensor_correct x:%d y:%d z:%d\n", *x, *y, *z);	//tuoluo
	}
	//os_printf("i4_gsensor_correct x:%d y:%d z:%d >>", *x, *y, *z);	//tuoluo
	switch(1)
	{
		case 0:
		{
			txyz = -*x;
			*x = *y;
			*y = txyz;
		}
		break;
		case 1:		//ew37
		{
			txyz = -*x;
			*x = *y;
			*y = txyz;
			//os_printf("i4_gsensor_correct_after x:%d y:%d z:%d\n", *x, *y, *z);	//tuoluo

		}break;
		case 2:
		{
			txyz = -*x;
			*x = *z;
			*z = txyz;
		}break;
		case 3:
		{
			//0x14
			txyz = *x;
			*x = *y;
			*y = txyz;	
			os_printf("i4_gsensor_correct_after x:%d y:%d z:%d\n", *x, *y, *z);	//tuoluo
			
		}break;
		case 4:
		{
			txyz = *x;
			*x = *z;
			*z = txyz;		
		}break;
		case 5:	//findB
		{
			txyz = -*y;
			*y = *z;
			*z = txyz;		
			os_printf("i4_gsensor_correct_after x:%d y:%d z:%d\n", *x, *y, *z);	//tuoluo
		}break;
		case 6:
		{
			//0x17
			txyz = -*y;
			*y = *x;
			*x = txyz;				
		}break;
		case 7:
		{
			txyz = *y;
			*y = *x;
			*x = txyz;				
		}break;
		case 8:
		{
			txyz = *y;
			*y = *z;
			*z = txyz;				
		}break;
		case 9:
		{
			txyz = -*z;
			*z = *x;
			*x = txyz;				
		}break;
		case 10:
		{
			txyz = -*z;
			*z = *y;
			*y = txyz;				
		}break;
		case 11:
		{
			txyz = *z;
			*z = *x;
			*x = txyz;				
		}break;
		case 12:
		{
			txyz = *z;
			*z = *y;
			*y = txyz;				
		}break;
		default:
		 break;

	}
	return 0;
}
#endif

#define M_PI 3.14159265358979323846

// yz  zy xy yx xz zx
uint8_t get_gsensor_angle(int ax, int ay, int az)
{
	// printf("========================= 1 ===================================\r\n");
	float pitch = 0.0f;
    // 计算俯仰角
    pitch = atan2(ax, sqrt(ay * ay + az * az)) * 180.0 / M_PI;

    // 打印结果
    // printf("Roll: %.2f degrees\n", *roll);
	if (pitch < 0) {
		pitch = -pitch;
	}
    // printf("Pitch: %d degrees\n", (uint8_t)pitch);
	return (uint8_t)pitch;
}



void gsonsor_conv2hali(int X, int Y, int Z)
{
	uint32_t x = 0, y = 0, z = 0;
	int tX, tY, tZ;

	tX = X;
	tY = Y;
	tZ = Z;
	if(gensor_correction){
		gensor_correction(&tX, &tY, &tZ);
		//GSENSOR_PRT(" gensor_correction111******");
	}
	x = GSENSOR_DATA_CONV(tX);
	y = GSENSOR_DATA_CONV(tY);
	z = GSENSOR_DATA_CONV(tZ);

	g_tx_sensor.gsensorData = (x<< 20 | y<<10 | z);
}

static void gsensor_i2c_write(UINT8 addr, UINT8* data, UINT8 len)
{
	//i2c_gsensor_operater.salve_id = i2c_salve_id;
	//i2c_gsensor_operater.op_addr = addr;
	UINT8  u8Buf[1] = {0};

	u8Buf[0] = addr;	
	if(i2c_write(g_sensor_iic, u8Buf,1, data,len)<0)
	{
		GSENSOR_PRT("i2c write is error ******");
	}
}

static void gsensor_i2c_read(UINT8 addr, UINT8* data, UINT8 len)
{
	//i2c_gsensor_operater.salve_id = i2c_salve_id;
	//i2c_gsensor_operater.op_addr = addr;
	UINT8  u8Buf[1] = {0};

	u8Buf[0] = addr;
	if(i2c_read(g_sensor_iic, (int8*)u8Buf,1, data,len)<0)
	{
		printf("i2c read error ********");
	}
}


/* static void gsensor_timer_configure(void)
{
	OSStatus result;	
    result = rtos_init_timer(&g_gsensor_timer,
                            GSENSOR_TMR_DURATION,
                            _get_xyz,
                            (void *)0);
    ASSERT(kNoErr == result);
	
    result = rtos_start_timer(&g_gsensor_timer);
    ASSERT(kNoErr == result);
}

static void gsensor_timer_unconfig(void)
{
	OSStatus ret;
	if(rtos_is_timer_init(&g_gsensor_timer))
	{
	    if (rtos_is_timer_running(&g_gsensor_timer)) 
		{
	        ret = rtos_stop_timer(&g_gsensor_timer);
			ASSERT(kNoErr == ret);
	    }

	    ret = rtos_deinit_timer(&g_gsensor_timer);
		ASSERT(kNoErr == ret);
	}
} */

#if (GSENSOR_GMA301 == 1)

static void _get_xyz(void *param)
{	
	int X, Y, Z = 0;
	u8 read_buf[6] = {0x00, 0x00, 0x00, 0x00, 0x00, 0x00};
	gsensor_i2c_read((0x14 | 0x80), read_buf, 6);
	X = (read_buf[1] << 8)| read_buf[0];  //
	Y = (read_buf[3] << 8) | read_buf[2];
	Z = (read_buf[5] << 8) | read_buf[4];

	GSENSOR_PRT("X:%02X Y:%02X Z:%02X\r\n", X, Y, Z);	
	gsonsor_conv2hali(X, Y, Z);
}

int gsensor_init(void)
{
	char buffer[16] = {0};
	int trynum = 0;
	
	i2c_salve_id = 0x18;
	//Read the STADR register (12h) and check the value should be 0x55h
	for(trynum = 0; trynum < 3; trynum++){
		gsensor_i2c_read(0x12, buffer, 1);
		if(buffer[0] == 0x55){
			GSENSOR_PRT("gsensor gma301 ready\r\n");
			break;
		}
	}
	if(trynum >= 3){
		GSENSOR_PRT("gensor gma301 not ready\r\n");
		return -1;
	}
	//Write 0x52 to the PD register (21h). This will set the RST bit which reset the sensor
	buffer[0] = 0x52;
	gsensor_i2c_write(0x21, buffer, 1);
	//Write the 5-byte sequence, 0x02, 0x12, 0x02, 0x82 and 0x02, to the ACTR register (00h)
	buffer[0] = 0x02; buffer[1] = 0x12; buffer[2] = 0x02; buffer[3] = 0x82; buffer[4] = 0x02;
	gsensor_i2c_write(0x21, buffer, 5);

	//Write 0x28 to the MISC2 register (1Fh).
	buffer[0] = 0x28;
	gsensor_i2c_write(0x1F, buffer, 1);

	//Write 0x8F to the AFEM(0Ch) register.
	buffer[0] = 0x8F;
	gsensor_i2c_write(0x0C, buffer, 1);
	
	//Write 0x06 to the ACTR(00h) register. 
	buffer[0] = 0x06;
	gsensor_i2c_write(0x00, buffer, 1);

	
	GSENSOR_PRT("gensor gma301 init ok\r\n");

	return 0;
}

#elif (GSENSOR_SC7A20 == 1)


#define cAccDropLen	(2)
#define cAccBufPayLen	(1 << 3)
#define cAccBufLen	(cAccDropLen+cAccBufPayLen)
int AccData_Last[3][cAccBufLen];
int AccData_Drop[3][cAccDropLen];

void usb_print(uint8_t *buffer, uint32_t length)
{
	int cur = 0;
	
	if(!buffer){
		return;
	}

	for(; cur< length; cur++){
		if(cur % 16 == 0){
			printf("\r\n");
		}
		printf("0x%02x ", buffer[cur]);

	}
	
	printf("\r\n");
}

//泰芯平台有问题，左移8位直接强转会有问题，必须�?要临时变量来做，谨记这个大坑
int16_t convert_v(uint8_t *v)
{
	uint16_t tmp_v;
	
	tmp_v= (v[1]);
	tmp_v = ((tmp_v <<8) | v[0]);
	return  (int16_t)tmp_v;
}

extern struct sensor_ol sensor_ols;

static void _get_xyz(void *param)
{	
	int16_t X, Y, Z = 0, i;
	u8 read_buf[6] = {0x00, 0x00, 0x00, 0x00, 0x00, 0x00};
	static UINT8 bInitAccData = 0;
	int ACCSum[3] = {0};
	int8 addr_buf = (0x28 | 0x80);

	while(1){
		if(g_wifi.is_connected){
			os_sleep_ms(50);
			bInitAccData = 0;
			continue;
		}

		if(sensor_ols.offline_flag)
		{
			os_sleep_ms(50);
			GSENSOR_PRT("sen_off\n");
			continue;
		}

		if(gsensor_offline_flag == 1)
		{	
			os_sleep_ms(50);
			GSENSOR_PRT("gsen_off\n");
			continue;
		}
		os_memset(read_buf, 0, sizeof(read_buf));
		os_memset(ACCSum, 0, sizeof(ACCSum));

		//gsensor_i2c_read((0x28 | 0x80), read_buf, 6);
		i2c_read(g_sensor_iic, (int8*)&addr_buf, 1, (int8*)read_buf, 6);
		//usb_print(read_buf, 6);

		X = convert_v(read_buf);
		Y = convert_v(read_buf+2);
		Z = convert_v(read_buf+4);
		//GSENSOR_PRT("X:%d,Y:%d,Z:%d\t\t	===X1:%d,Y1:%d,Z:%d\n",X,Y,Z, X>>6, Y>>6, Z>>6);

		// Acc filter
		if(bInitAccData==0){
			for(i = 0; i < cAccBufLen; i++)
			{
				AccData_Last[0][i] = X;
				AccData_Last[1][i] = Y;
				AccData_Last[2][i] = Z;
			}
			bInitAccData = 1;
		}else{
			for(i = 0; i < (cAccBufLen-1); i++){
				AccData_Last[0][i] = AccData_Last[0][i+1];
				AccData_Last[1][i] = AccData_Last[1][i+1];
				AccData_Last[2][i] = AccData_Last[2][i+1];
			}
			AccData_Last[0][cAccBufLen-1] = X;
			AccData_Last[1][cAccBufLen-1] = Y;
			AccData_Last[2][cAccBufLen-1] = Z;
		}

		ACCSum[0] = 0;
		ACCSum[1] = 0;
		ACCSum[2] = 0;
		AccData_Drop[0][0] = AccData_Drop[0][1] = X;
		AccData_Drop[1][0] = AccData_Drop[1][1] = Y;
		AccData_Drop[2][0] = AccData_Drop[2][1] = Z;

		for(i = 0; i < cAccBufLen; i++){
			ACCSum[0] += AccData_Last[0][i];
			AccData_Drop[0][0] = min(AccData_Drop[0][0], AccData_Last[0][i]);
			AccData_Drop[0][1] = max(AccData_Drop[0][1], AccData_Last[0][i]);

			ACCSum[1] += AccData_Last[1][i];
			AccData_Drop[1][0] = min(AccData_Drop[1][0], AccData_Last[1][i]);
			AccData_Drop[1][1] = max(AccData_Drop[1][1], AccData_Last[1][i]);

			ACCSum[2] += AccData_Last[2][i];
			AccData_Drop[2][0] = min(AccData_Drop[2][0], AccData_Last[2][i]);
			AccData_Drop[2][1] = max(AccData_Drop[2][1], AccData_Last[2][i]);
		}
		X = ((ACCSum[0]-AccData_Drop[0][0]-AccData_Drop[0][1])/cAccBufPayLen) >> 6;
		Y = ((ACCSum[1]-AccData_Drop[1][0]-AccData_Drop[1][1])/cAccBufPayLen) >> 6;
		Z = ((ACCSum[2]-AccData_Drop[2][0]-AccData_Drop[2][1])/cAccBufPayLen) >> 6;

		//GSENSOR_PRT("X:%d \tY:%d \tZ:%d\r\n", X, Y, Z);
		gsonsor_conv2hali(X, Y, Z);
		os_sleep_ms(5);
	}//while end
	 
}


#define CHIPID_SC7A20 0x0f

static void _mcu_task1()
{
	 int8 buffer[16] = {0};
	 while(1)
	 {
        gsensor_i2c_read(CHIPID_SC7A20, buffer, 1);
   	    GSENSOR_PRT("bbbbbb is %d",buffer[0]);
	    os_sleep_ms(2000);
	 }
}

int gsensor_init(void)
{
	int8 buffer[16] = {0};
	int trynum = 0;
	
	//i2c_salve_id = 0x18; //0x18:low; 0x19:high
	
	//Read the STADR register (12h) and check the value should be 0x55h
	//gensor_correction=gsensor_correct;	//tuoluo_correct err!!!
	for(trynum = 0; trynum < 3; trynum++){
		gsensor_i2c_read(CHIPID_SC7A20, buffer, 1);
		GSENSOR_PRT("kkkkkk is 0x:%x",buffer[0]);
		if(buffer[0] == 0x11){
			GSENSOR_PRT("gsensor sc7a20 ready\r\n");
			break;
		}
	}
	//void *thread;
	//csi_kernel_task_new((k_task_entry_t)_mcu_task1, "gsensor_init", NULL, 9, 0, NULL, 1024, &thread);
	if(trynum >= 3){
		GSENSOR_PRT("gensor sc7a20 not ready\r\n");
		return -1;
	}

#if 0
	//close SDO	
	buffer[0] = 0x05;
	gsensor_i2c_write(0x1E, buffer, 1); //æå¼æä½æéï¼?0x1E å¯å­å¨å 0x05
	gsensor_i2c_read(0x57, buffer, 1); //è¯»å 0x57 å¯å­å¨å½åéç½?
	buffer[0]= buffer[0]|0x80; //SDO_PU ç½? 1
	gsensor_i2c_write(0x57, buffer, 1); //æä½ SDO_PU ä½ï¼0x57 å¯å­å¨åå¥éç½?
	buffer[0] = 0x00;
	gsensor_i2c_write(0x1E, buffer, 1);

	buffer[0] = 0x97;
	gsensor_i2c_write(0x20, buffer, 1);
	buffer[0] = 0x77;
	gsensor_i2c_write(0x20, buffer, 1);

	buffer[0] = 0x88;
	gsensor_i2c_write(0x23, buffer, 1);

#endif
	//close SDO
#if 0
	buffer[0] = 0x05;
	gsensor_i2c_write(0x1E, buffer, 1); //æå¼æä½æéï¼?0x1E å¯å­å¨å 0x05
	gsensor_i2c_read(0x57, buffer, 1); //è¯»å 0x57 å¯å­å¨å½åéç½?
	buffer[0]= buffer[0]|0x80; //SDO_PU ç½? 1
	gsensor_i2c_write(0x57, buffer, 1); //æä½ SDO_PU ä½ï¼0x57 å¯å­å¨åå¥éç½?
	buffer[0] = 0x00;
	gsensor_i2c_write(0x1E, buffer, 1);
#endif
	//start sensor
	buffer[0] = 0x97; //0x9f
	gsensor_i2c_write(0x20, buffer, 1);

	buffer[0] = 0x04; //0x04
	gsensor_i2c_write(0x21, buffer, 1);
	buffer[0] = 0x88;//0x88
	gsensor_i2c_write(0x23, buffer, 1);

	GSENSOR_PRT("gensor sc7a20 init ok\r\n");

	return 0;
}


#endif
//static void *thread;

int hali_gsensor_init(int32_t dev_id)
{
	void *thread_gs;
    UINT32 status, oflag;
	
	//oflag = I2C_DEF_DIV;
	//static _Gsensor_Adpt_ *p_gsensor_cmd = NULL;
	int i,j;
	uint8_t buf[5];
	uint8_t ack;
     GSENSOR_PRT("-----------------");
     gsensor_offline_flag = 1;
	//uninit first for multi call init
	//g_sensor_iic = (struct i2c_device *)dev_get(HG_I2C2_DEVID);
	g_sensor_iic = (struct i2c_device *)dev_get(dev_id);
	printf("g_sensor_init start,iic init:%x\r\n",(int)g_sensor_iic);
	//
	i2c_open(g_sensor_iic, IIC_MODE_MASTER, IIC_ADDR_7BIT, 0);	//must open after set baudrate!!!
	i2c_set_baudrate(g_sensor_iic,120000UL);
	//i2c_set_baudrate(g_sensor_iic,100000UL);

	i2c_ioctl(g_sensor_iic,IIC_SDA_OUTPUT_DELAY,20);	
	i2c_ioctl(g_sensor_iic,IIC_FILTERING,20);
	//
	i2c_ioctl(g_sensor_iic,IIC_SET_DEVICE_ADDR, 0x18);

	//add
	i2c_ioctl(g_sensor_iic,IIC_SDA_OUTPUT_DELAY,20);	
	i2c_ioctl(g_sensor_iic,IIC_STRONG_OUTPUT,1);
	//init gsensor
	
	if(gsensor_init() < 0){
		GSENSOR_PRT("gsenor init failed\r\n");
		gsensor_offline_flag = 1;
		return -1;
	}
	gsensor_offline_flag = 0;
	//init gsensor timer
	//GSENSOR_PRT("gsenor creat_get_xyz\r\n");
	//gsensor_timer_configure();

	return 0;	
}

void hali_gsensor_start(void){
	void *thread_gs;
	printf("hali_gsensor_start thread start\r\n");
	csi_kernel_task_new((k_task_entry_t)_get_xyz, "hali_gsensor_init", NULL, 9, 0, NULL, 1024, &thread_gs);
	return;
}
void hali_gsensor_stop(void){
	gsensor_offline_flag = 1;
	os_sleep_ms(20);
	return;
}


extern unsigned char sensor_correct_flag;
static int gsensor_correct(int *x, int *y, int *z)
{
	int txyz;
	if(sensor_correct_flag)
	{
        if(sensor_correct_flag == 2)
		{
			//jingxiang+fanzhuan
			txyz = *y;
			*y = -*z;
			*z = txyz;
		}
		else
		{
			//zheng
			txyz = -*y;
			*y = *z;
			*z = txyz;
		}
	}
	return 0;
}

void hali_gsensor_correction_callback(int (*callback)(int*,int*,int*))
{
	gensor_correction = callback;
	GSENSOR_PRT("register gsensor correction\r\n");
} 


void hali_gsensor_task_run(void)
{
    g_tx_sensor.is_open = 1;
    
    if(g_tx_sensor.is_open) { 
		os_printf("Support GENSOR\r\n");
		
		hali_gsensor_init(HG_I2C2_DEVID);
        hali_gsensor_start();
		
		hali_gsensor_correction_callback(gsensor_correct);
	} else {
		os_printf("Not Support GENSOR\r\n");
	}
}