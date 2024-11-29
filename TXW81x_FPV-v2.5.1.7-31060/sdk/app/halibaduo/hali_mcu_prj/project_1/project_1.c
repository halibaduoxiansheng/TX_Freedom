/**
 * Readers please follow the example of this project to reconstruct the project
 */
#include "halibaduo_lib.h"

#if (HALI_PROJECT_1 == 1)
#include "project_1.h"
#include "halibaduo.h"
#include "hali_button.h"
#include "hali_list_node.h"
#include "hali_energy.h"
#include "hali_led.h"







void hali_print_ver(void)
{
    hali_pf("==================\r\n");
    hali_pf("OEM: %s\r\n", HALI_DEFAULT_OEM);
    hali_pf("VER: %s\r\n", HALI_DEFAULT_VER);
    hali_pf("PRO: %s\r\n", HALI_DEFAULT_PRO);
    hali_pf("==================\r\n");
}

/**
 * every project gpio set in here
 */
static void hali_gpio_init(void)
{
    gpio_iomap_input(tx_power.charging_io, GPIO_DIR_INPUT);	// USB_DET
    gpio_iomap_input(tx_button_0.button_io, GPIO_IOMAP_INPUT); //power_key
    //gpio_set_mode(GPIO_POWER_KEY, GPIO_PULL_UP, GPIO_PULL_LEVEL_100K); // 

    // gpio_iomap_input(GPIO_CHARG_IN, GPIO_DIR_INPUT); // CHRG

    gpio_iomap_output(tx_power.mcu_io, GPIO_IOMAP_OUTPUT);    	 //mcu control 
	gpio_set_val(tx_power.mcu_io, 0);

    gpio_iomap_output(red_led.led_io, GPIO_IOMAP_OUTPUT); // red and freen led     
    gpio_iomap_output(green_led.led_io, GPIO_IOMAP_OUTPUT);
    gpio_iomap_output(camera_led.led_io, GPIO_IOMAP_OUTPUT);
    gpio_set_val(red_led.led_io, 0);
    // gpio_set_val(GPIO_LED_GREEN, 0);
    gpio_set_val(green_led.led_io, 0);
    gpio_set_val(camera_led.led_io, 0);
    
    hali_pf("gpio set over\n");
}

/**
 * see hali_access_main func, that is only place
 */
static void hali_init(void)
{
    hali_button_register();
    hali_led_register();
    hali_energy_register();

    hali_gpio_init();
}

/**
 * Notice: powerOn and powerOff func name do not change if you ad a new project
 */
void hali_powerOn(void) 
{
    tx_power.is_powerOn = 1;
    tx_power.is_powerOff = 0; 
}

void hali_powerOff(void)
{
    //
    tx_power.is_powerOn = 0;
    tx_power.is_powerOff = 1;
}


void hali_powerButton_program(void)
{
    hali_button_ticks();
}


void hali_led_program(void)
{
    hali_led_ticks();
}

/*开机：
开机：
	充电中：
		未充满：
			wifi未连接：绿灯慢闪、红灯常亮
			wifi已连接：绿灯常亮、红灯常亮
		已充满：
			wifi未连接：绿灯慢闪、红灯熄灭
			wifi已连接：绿灯常亮、红灯熄灭
	非充电中：
		非低电：
			wifi未连接：绿灯慢闪、红灯熄灭
			wifi已连接：绿灯常亮、红灯熄灭
		低电：
			wifi未连接：绿灯慢闪、红灯快闪
			wifi已连接：绿灯常亮、红灯快闪
关机：
	充电中：
		未充满：绿灯熄灭，红灯常亮
		已充满：红、绿熄灭
	非充电中：
		红、绿灯熄灭
*/
static void led_func(void) // 50ms
{
    
}

/* =====  the following is the thread function  ===== */
static void _mcu_task(void *arg)
{
    static uint8_t batter_get_time_num = 0;
		
	for(;;os_sleep_ms(50))
	{   
		batter_get_time_num++;
		if(batter_get_time_num >= 50)
		{
            batter_get_time_num = 0;
			// i4GetBatter();
		}
	}
}

static void _led_task(void *arg)
{
   hali_led_program();
}

static void _startup_task(void *arg)
{
    // i4TimerInit(); // every timer process in this
	hali_powerButton_program();        
}


static void hali_thread_task(void)
{
	void *thread0;
	void *thread1;
    void *thread2;
	
	os_printf("csi_kernel_task_new _mcu_task and _led_task and _startup_task start\r\n");

	csi_kernel_task_new((k_task_entry_t)_mcu_task		, "mcu_task_new",     NULL, 9, 0, NULL, 512, &thread0);
	csi_kernel_task_new((k_task_entry_t)_led_task		, "led_task_new",     NULL, 9, 0, NULL, 512, &thread1);
    csi_kernel_task_new((k_task_entry_t)_startup_task	, "startup_task_new", NULL, 9, 0, NULL, 2048, &thread2);
	
	os_printf("csi_kernel_task_new _mcu_task and _led_task and _startup_task end\r\n");
}


void hali_access_main(void)
{
    hali_print_ver();
    hali_init();
    hali_thread_task();
}


#endif /*end hali_project_1*/
