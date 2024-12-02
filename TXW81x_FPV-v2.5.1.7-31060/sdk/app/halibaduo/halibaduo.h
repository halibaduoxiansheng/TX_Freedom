/**
 * all of halibaduo lib is open , you can use it in your project, you just need see the .h file and modify it some where 
 */
#ifndef __HALIBADUO_H__
#define __HALIBADUO_H__
#include "halibaduo_lib.h"
#include "hali_network.h"


struct sensor_ol
{
	uint8_t timeout;
	uint8_t offline_flag; // 0 ，还有摄像头在插着
	uint8_t auto_check_cnt;
	uint8_t online_type;
};

struct TX_Original{
    uint8_t tx_flag:1; /*0: take your own project 1:take original project*/
};
struct TX_Original tx_orl;






/* Timer unified structure */
struct G_TX_Timer{
    uint8_t is_work:1;
    uint8_t timer_id:1;
    uint8_t is_repeat:1;
    uint8_t reserve:5;

    void* (*timer_task)(void*);
}__attribute__((packed));



/**
 * @brief set license to cache
 * @param buf license structure data
 * @param len license data length
 */
uint8_t hali_sys_port_set_license(void *buf, uint32_t len);

uint8_t hali_sys_port_get_license(void *buf, uint32_t len);

uint8_t hali_sys_get_auto_gen_license(struct cProLic *lic);

uint8_t hali_sys_port_get_mac(uint8_t *mac);

extern struct sensor_ol sensor_ols;

#endif