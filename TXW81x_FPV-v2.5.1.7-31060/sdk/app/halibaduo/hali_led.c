#include "hali_led.h"
#include "hali_energy.h"
#include "hali_wifi.h"

enum {
    LED_IDLE = 0,   
    LED_CHECK = 1,
    LED_LIGHT_CHECK = 2,
    LED_DARK_CHECK = 3,
};


struct G_TX_LED red_led;
struct G_TX_LED green_led;
struct G_TX_LED camera_led;

/**
 * All button events are placed in this thread
 */
struct TX_LED_Thd {
    void *thread;
    uint16_t stack_size;
    char stack_name[15];
    uint8_t priority;
    uint16_t interval;
    void *args;

    void (*trd_func)(void*);
};
struct TX_LED_Thd led_thd;
struct TX_LED_Thd led_check_thd;

enum{
	OP_GET = 0,
	OP_SET = 1,
};

enum {
    OP_LED_OFF = 0,
    OP_LED_ON = 1,
};
uint8_t hali_appLibLedCallBack(struct cProLed* led) // led_callback
{	
	if(led == NULL)
	{
		return 0;
	}
	if(led->led == 1) // Negotiation confirmed as 1
	{
		if(led->opType == OP_GET)
		{
			//get led status
			if(tx_power.is_powerOn)
			{
				led->ledStatus = OP_LED_ON;
				return led->value;
			} else {
				led->ledStatus = OP_LED_OFF;
				//  led_per_set = 100;//80;
				led->value = 0;
				return 0;
			} 
			//os_printf("OP_GET:LED_ID:%d ,CTRL:%d ,STATUS:%d ,VALUE:%d .\r\n",led->led ,led->opType , led->ledStatus, led->value);
		}
		else if (led->opType == OP_SET)  //led->opType == OP_SET or other
		{
		   	if(led->ledStatus == OP_LED_ON)
			{
				//led on			
				if(sensor_ols.offline_flag == 0) // sensor is online
				{
                    // XXX
				} else {
                    return 1;
                }
			}
			else
			{
				//led off
				led->ledStatus = OP_LED_OFF;
				if(sensor_ols.offline_flag == 0) // sensor is online
				{
                    // XXX
				} else {
                    return 1;
                }
			}
		}
        else {
            printf("our firmware version is not support (%d)\r\n", led->opType);
            return 1;
        }

	}
	return 0;
}



inline uint8_t gpio_set_val_0(struct G_TX_LED *led) {
    return gpio_set_val(led->led_io, led->active_level);
}

inline uint8_t gpio_set_val_1(struct G_TX_LED *led) {
    return gpio_set_val(led->led_io, !led->active_level);
}

inline uint8_t gpio_set_val_2(struct G_TX_LED *led) {
    return gpio_set_val(led->led_io, !led->need_level);
}

inline uint8_t gpio_get_val_0(struct G_TX_LED *led) {
    return gpio_get_val(led->led_io);
}



void hali_led_init(struct G_TX_LED *led)
{
    if (led == NULL) {
        printf("hali_led_init failed,this is a NULL arg\r\n");
    }
    led->turn_on = gpio_set_val_0(led);
    led->turn_off = gpio_set_val_1(led);
    led->read_level = gpio_get_val_0(led);
    led->set_light = gpio_set_val_2(led);

    double_link_init();

    struct Double_link_list *list = double_button_link_insert(tx_dlink_head, tx_dlink_tail, LED_TYPE, led);
    if (list == NULL) {
        printf("hali_led_init failed,double_button_link_insert failed\r\n");
        double_link_deinit();
    }
}

void hali_led_register(void)
{
    memset(&red_led, 0, sizeof(red_led));
    memset(&green_led, 0, sizeof(green_led));
    memset(&camera_led, 0, sizeof(camera_led));

    red_led = (struct G_TX_LED) {
        .led_show = 1,
        .led_io = PA_4,
        .active_level = 1,
        .led_id = 0,
        .state = LED_IDLE,
        .basic_unit = 1,
    };

    green_led = (struct G_TX_LED) {
        .led_show = 1,
        .led_io = PA_5,
        .active_level = 1,
        .led_id = 1,
        .state = LED_IDLE,
        .basic_unit = 1,
    };

    camera_led = (struct G_TX_LED) {
        .led_show = 1,
        .led_io = PA_3,
        .active_level = 1,
        .led_id = 2,
        .state = LED_IDLE,
        .basic_unit = 1,
    };

    hali_led_init(&red_led);
    hali_led_init(&green_led);
    hali_led_init(&camera_led);
}


// void hali_set_linght_mode(struct G_TX_LED *led, uint8_t is_blink, uint8_t blink_count, uint8_t basic_unit, uint8_t brignt_time, uint8_t dark_time)
// such as you want close all led -> hali_set_linght_mode(led, 0)
void hali_set_linght_mode(struct G_TX_LED *param1, uint8_t param2, ...) 
{
    va_list args;
    va_start(args, param2); // init args

    if (param1 == NULL) {
        printf("hali_set_linght_mode failed,this is a NULL arg\r\n"); 
    }

    if (param2 >= 1) {
        if (param2 >= 1) {
            uint8_t param3 = va_arg(args, uint8_t);  // Get the first variable parameter
            uint8_t param4 = va_arg(args, uint8_t); 
            uint8_t param5 = va_arg(args, uint8_t); 
            uint8_t param6 = va_arg(args, uint8_t); 
            if (param3 > 0 && param4 > 0 && param5 > 0 && param6 > 0) {
                param1->is_blink = 1;
                param1->blink_count = param3;
                param1->basic_unit = param4;
                param1->brignt_time = param5;
                param1->dark_time = param6;
                param1->need_level = !param1->read_level(param1);
            } else {
                printf("hali_set_linght_mode failed,some on args is invail\r\n");
            }
        } else if (param2 == 0) { // not blink
            uint8_t param7 = va_arg(args, uint8_t);     
            param1->is_blink = 0;
            if (param7 == 0) {
                param1->need_level = !param1->active_level;
            } else {
                param1->need_level = param1->active_level;
            }
        }
    }
}

static uint16_t hali_led_getLightTime(struct G_TX_LED *led) {
    return led->bright_ticks * led->basic_unit;
}

static uint16_t hali_led_getDarkTime(struct G_TX_LED *led) {
    return led->dark_ticks * led->basic_unit;
}


void hali_led_hander(struct Double_link_list *target)
{
    if (target == NULL) {
        return;
    }
    struct G_TX_LED *led = target->led;
    if (led == NULL) {
        return;
    }

    if (!led->led_show) { 
        printf("we lost the led control power\r\n");
        os_sleep_ms(1000);
        return;
    }

    led->led_level = led->read_level(led);

    if (led->is_blink && led->blink_count > 0) {
        if (led->led_level == led->active_level) { // light now then start ticks
            led->bright_ticks++;
            led->dark_ticks = 0;
            led->is_light = 1;
        } else {
            led->bright_ticks = 0;
            led->dark_ticks++;
            led->is_light = 0;
        }
    }

    if (led->led_level != led->need_level) { // mean led mode should change
         if (led->is_blink) {
            switch(led->state) {
                case LED_IDLE:
                    led->state = LED_CHECK;
                    break;
                case LED_CHECK:
                    // start ticks base on current light level
                    if (led->is_light) {
                        led->state = LED_LIGHT_CHECK;
                    } else {
                        led->state = LED_DARK_CHECK;
                    }
                    break;
                case LED_LIGHT_CHECK:
                     if (hali_led_getLightTime(led) >= led->brignt_time) {
                            led->need_level = !led->need_level;
                            led->dark_ticks = 0;
                            led->turn_off(led);
                            if (led->blink_count != 66) {
                                led->blink_count--;
                            }
                     }
                     led->state = LED_IDLE;
                     break;
                case LED_DARK_CHECK:
                     if (hali_led_getDarkTime(led) >= led->dark_time) {
                            led->need_level = !led->need_level;
                            led->bright_ticks = 0;
                            led->turn_on(led);
                     }
                     led->state = LED_IDLE;
                     break;
                default:
                    led->state = LED_IDLE;
                    break;
            }
         } else { // not blink
            led->set_light(led);
         }
    } else { // 
        return;
    }
}

/*开机：
: this is Example requirements
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
#define LED_NOT_BLINK   0
#define LED_IS_BLINK    1
#define LED_NEED_LINGHT 1
#define LED_NEED_DARK   0
/// please use above frame, you just need put your needs in it (the function is hali_set_linght_mode)
void hali_led_define_youself(void)
{
    mcu_watchdog_feed();
    static uint8_t have_define = 0;
    if (have_define == 0) {
        csi_kernel_task_new((k_task_entry_t)led_check_thd.trd_func, led_check_thd.stack_name, led_check_thd.args, led_check_thd.priority, 0, NULL, led_check_thd.stack_size, &led_check_thd.thread);
        have_define = 1;
    }
}


static void hali_led_thread(void *arg)
{
    struct Double_link_list *target = NULL;
    for (;;os_sleep_ms(led_thd.interval)) {
        for (target = tx_dlink_head->next; target != tx_dlink_tail; target = target->next) {
            hali_led_hander(target);
        }
    }
}

static void hali_led_check_thread(void *args)
{
	struct TX_LED_Thd *led_ck = NULL;
    if (args) {
        led_ck = (struct TX_LED_Thd *)args;
    } else {
        printf("if print this , mean have something problem\r\n");
        return ;
    }
    for (;;os_sleep_ms(led_ck->interval)) {
        if (tx_power.is_powerOn) { // power on 
            if (tx_power.is_charging) { // power on + is charging
                if (tx_power.is_full) { // power on + is charging + full
                    if (!g_wifi.is_connected) { // power on + is charging + full + wifi not connected
                        hali_set_linght_mode(&green_led, LED_IS_BLINK, 66, 1, 500, 500);
                        hali_set_linght_mode(&red_led, LED_NOT_BLINK, LED_NEED_DARK);
                    } else {  // power on + is charging + full + wifi connected
                        hali_set_linght_mode(&green_led, LED_NOT_BLINK, LED_NEED_LINGHT);
                        hali_set_linght_mode(&red_led, LED_NOT_BLINK, LED_NEED_DARK);
                    }
                } else { //power on + is charging + not full
                    if (!g_wifi.is_connected) { // power on + is charging + not full + wifi not connected
                        hali_set_linght_mode(&green_led, LED_IS_BLINK, 66, 1, 500, 500);
                        hali_set_linght_mode(&red_led, LED_NOT_BLINK, LED_NEED_LINGHT);
                    } else {  // power on + is charging + not full + wifi connected
                        hali_set_linght_mode(&green_led, LED_NOT_BLINK, LED_NEED_LINGHT);
                        hali_set_linght_mode(&red_led, LED_NOT_BLINK, LED_NEED_LINGHT);
                    }
                }
            } else { // poweron + not charging
                if (tx_power.need_remind_battery) { // power on + not charging + low battery
                    if (g_wifi.is_connected) { // poweron + not charging + low battery + wifi connected
                        hali_set_linght_mode(&green_led, LED_NOT_BLINK, LED_NEED_LINGHT);
                        hali_set_linght_mode(&red_led, LED_IS_BLINK, 66, 1, 250, 250);
                    } else { // poweron  + not charging + low battery + wifi not connected
                        hali_set_linght_mode(&green_led, LED_IS_BLINK, 66, 1, 500, 500);
                        hali_set_linght_mode(&red_led, LED_IS_BLINK, 66, 1, 250, 250);
                    }
                } else { // power on + not charging + not low battery
                    if (g_wifi.is_connected) { // poweron + not charging + not low battery + wifi connected
                        hali_set_linght_mode(&green_led, LED_NOT_BLINK, LED_NEED_LINGHT);
                        hali_set_linght_mode(&red_led, LED_NOT_BLINK, LED_NEED_DARK);
                    } else { // poweron  + not charging + not low battery + wifi not connected
                        hali_set_linght_mode(&green_led, LED_IS_BLINK, 1, 66, 500, 500);
                        hali_set_linght_mode(&red_led, LED_NOT_BLINK, LED_NEED_DARK);
                    }
                }
            }
        } else { // power off
            if (tx_power.is_charging) { // power off + is charging
                if (tx_power.is_full) { // power off + is charging + full
                    hali_set_linght_mode(&green_led, LED_NOT_BLINK, LED_NEED_DARK);
                    hali_set_linght_mode(&red_led, LED_NOT_BLINK, LED_NEED_DARK);
                } else { // power off + is charging + not full
                    hali_set_linght_mode(&green_led, LED_NOT_BLINK, LED_NEED_DARK);
                    hali_set_linght_mode(&red_led, LED_NOT_BLINK, LED_NEED_LINGHT);
                }
            } else { // power off + not charging
                hali_set_linght_mode(&green_led, LED_NOT_BLINK, LED_NEED_DARK);
                hali_set_linght_mode(&red_led, LED_NOT_BLINK, LED_NEED_DARK);
            }
        }
    }
}

void hali_led_ticks(void)
{
    mcu_watchdog_feed();
    memset(&led_thd, 0, sizeof(struct TX_LED_Thd));
    memcpy(led_thd.stack_name, "led_task", strlen("led_task"));
    led_thd = (struct TX_LED_Thd) {
        .priority = 9,
        .stack_size = 512,
        .trd_func = hali_led_thread,
        .interval = 200,
        .args = NULL,
    };

    memset(&led_check_thd, 0, sizeof(struct TX_LED_Thd));
    memcpy(led_check_thd.stack_name, "led_check_thd", strlen("led_check_thd"));
    led_check_thd = (struct TX_LED_Thd) {
        .priority = 9,
        .stack_size = 512,
        .trd_func = hali_led_check_thread,
        .interval = 400,
        .args = NULL,
    };
    
    printf("led task start\r\n");
    csi_kernel_task_new((k_task_entry_t)led_thd.trd_func, led_thd.stack_name, led_thd.args, led_thd.priority, 0, NULL, led_thd.stack_size, &led_thd.thread);
}