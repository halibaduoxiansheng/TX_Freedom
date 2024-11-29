#ifndef __HALI_LED_H__
#define __HALI_LED_H__

#include "halibaduo.h"
#include "halibaduo_lib.h"
#include "hali_list_node.h"

struct cProLed{
	uint8_t led				:4; /*max 15 leds*/
	uint8_t opType			:4; /*OP_GET/OP_SET*/
	uint8_t ledStatus		;	/* on/off/blink/breath*/
	uint8_t value 			; 	/*motot led first gear:led1 2:led2 3:led3*/
}__attribute__((__packed__));


/* Led unified structure */
struct G_TX_LED{
    uint8_t led_show:1; /* Lighting responds to operations and changes dynamically */
    uint8_t led_id:1;
    uint8_t is_blink:1;
    uint8_t blink_count:1;
    uint8_t active_level:1;
    uint8_t led_level:1;
    uint8_t need_level:1;
    uint8_t is_light:1; /* just blink mode use and change */


    uint8_t basic_unit; /* basic unit of time  -> ms*/
    uint16_t brignt_time; // ms
    uint16_t dark_time;

    uint8_t state;

    uint8_t bright_ticks;
    uint8_t dark_ticks;

    uint8_t led_io;

    void (*turn_on)(struct G_TX_LED*);
    void (*turn_off)(struct G_TX_LED*);
    uint8_t (*read_level)(struct G_TX_LED*);
    void (*set_light)(struct G_TX_LED*);

    // uint8_t led_name[10]; // if you want debug ,you can choose open it
}__attribute__((packed));

/**
 * @brief  register led object
 */
void hali_led_register(void);

/**
 * @brief  set led mode , if someone arg you do not use,you can choose input 0
 * @param  led object
 * @param  is_blink: 1:blink,0:not blink （just set this is 1, or we will not check blink_count）
 * @param  blink_count: 
 * @param  basic_unit: basic unit of time  -> ms
 * @param  brignt_time: brightness time  -> ms
 * @param  dark_time: dark time  -> ms
 * @param  need_light   >=1: should to light  0: should not
 */
void hali_set_linght_mode(struct G_TX_LED *param1, uint8_t param2, ...);

void hali_led_ticks(void);

uint8_t hali_appLibLedCallBack(struct cProLed* led); /* the fun of led set from app */

extern struct G_TX_LED red_led;
extern struct G_TX_LED green_led;
extern struct G_TX_LED camera_led;


#endif