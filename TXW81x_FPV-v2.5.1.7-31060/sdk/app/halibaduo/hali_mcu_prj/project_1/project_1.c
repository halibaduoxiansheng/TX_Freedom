/**
 * Readers please follow the example of this project to reconstruct the project
 * 
 * 项目还可以想一想优化一下  -> 比如 1.容易移植 2.容易扩展 3.容易维护
 */
#include "../../halibaduo_lib.h"

#if (HALI_PROJECT_1 == 1)
#include "project_1.h"
#include "halibaduo.h"
#include "hali_button.h"
#include "hali_list_node.h"
#include "hali_energy.h"
#include "hali_led.h"
#include "hali_wifi.h"







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
	extern struct G_TX_Button tx_button_0;
    gpio_iomap_input(tx_button_0.button_io, GPIO_IOMAP_INPUT); //power_key

    gpio_iomap_output(tx_power.mcu_io, GPIO_IOMAP_OUTPUT);    	 //mcu control 
	gpio_set_val(tx_power.mcu_io, 0);

    gpio_iomap_output(red_led.led_io, GPIO_IOMAP_OUTPUT); // red and freen led     
    gpio_iomap_output(green_led.led_io, GPIO_IOMAP_OUTPUT);
    gpio_iomap_output(camera_led.led_io, GPIO_IOMAP_OUTPUT);
    
    gpio_set_val(red_led.led_io, 0);
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
    hali_network_register();
    hali_picture_register();
    hali_wifiInfo_register((void*)&sys_cfgs);

    hali_gpio_init();
}

/**
 * Notice: powerOn and powerOff func name do not change if you ad a new project
 * hali_powerOn and hali_powerOff will used by hali_energy.c 
 */

void hali_powerOn(void) 
{
    printf("power On\r\n");
    powerOn_mcu();

    hali_set_linght_mode_3(&camera_led, LED_NOT_BLINK, LED_NEED_LINGHT); /*this led maybe will dark*/

    tx_sys_init(); // system init
    hali_gsensor_task_run();

#if TX_AUTO_BLE
	extern void tx_ble_auto_for_project(void);
	tx_ble_auto_for_project();
#endif
    tx_power.is_powerOn = 1; /*please put these code in the last place~*/
    tx_power.is_powerOff = 0;
}

void hali_powerOff(void)
{
    printf("power Off\r\n");
    tx_power.is_powerOn = 0;
    tx_power.is_powerOff = 1;
    powerOff_mcu();

#if TX_AUTO_BLE
	extern void tx_ble_auto_for_project(void);
	tx_ble_auto_for_project();
#endif
    if (tx_power.is_charging) { // this is must be have
        mcu_reset();
    }
}

void hali_long_press_func(void)
{
    if (tx_power.is_powerOn) {
        hali_powerOff();
    } else {
        hali_powerOn();
    }
}

void hali_short_press_func(void)
{
    printf("short press func do\r\n");
}


static void hali_energy_program(void)
{
    hali_energy_ticks();
}

static void hali_powerButton_program(void)
{
    hali_button_ticks();
}


static void hali_led_program(void)
{
    hali_led_ticks();
    hali_led_define_youself();
}

static void hali_net_program(void)
{
    hali_network_thread_start();
}

static void hali_pic_program(void)
{
    hali_pic_thread_start();
}



/* =====  the following is the thread function  ===== */
static void _energy_task(void)
{
    hali_energy_program();
}
static void _led_task(void)
{   
    hali_led_program();
}

static void _button_task(void)
{
	hali_powerButton_program();        
}

static void _net_task(void)
{
    hali_net_program();
}

static void _pic_task(void)
{
    hali_pic_program();
}

static void hali_thread_task(void)
{
    _energy_task();
    _button_task();
    _led_task(); // TODO 
    _net_task();
    _pic_task();
}

void bug_demo(void)
{
    extern uint8_t button_structure_size;
    button_structure_size = sizeof(struct G_TX_Button);
}

void hali_access_main(void)
{
    hali_print_ver();
    bug_demo();
    hali_init();
    hali_thread_task();
}


#endif /*end hali_project_1*/
