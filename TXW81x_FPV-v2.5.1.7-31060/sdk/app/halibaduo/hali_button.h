#ifndef _HALI_BUTTON_H_
#define _HALI_BUTTON_H_
#include "halibaduo_lib.h"
#include "hali_list_node.h"
#include "halibaduo.h"



/* Button unified structure */
struct G_TX_Button {
    uint8_t check_level:1; /* Do you need to read the status of the current button? */
    uint8_t button_id:1;
    uint8_t is_press:1;
    uint8_t button_level:1;
    uint8_t active_level:1;
    uint8_t flag:1; /* have active short press or long press or something */
    uint8_t reserve:2;

    
    uint8_t basic_unit; /* basic unit of time -> ms*/
    uint16_t short_press_time; /* ticks * basic_unit to contrast */
    uint16_t long_press_time; 
    uint16_t wait_time;
    uint8_t button_io;
    uint8_t debounce_time; /*must debounce_time < short_press_time < long_press_time */
    

    uint8_t state;
    uint16_t press_ticks;
    uint8_t release_ticks;

    uint8_t short_press_count:3;
    uint8_t reserve_1:5;

    void (*short_press_func)(void);
    void (*long_press_func)(void);

    // uint8_t button_name[10]; // if you want debug ,you can choose open it
}__attribute__((packed));

/**
 * button register
 */
void hali_button_register(void);
/**
 * Traverse the buttons one by one to judge
 */
void hali_button_ticks(void);



#endif