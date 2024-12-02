#ifndef __HALI_WIFI_H__
#define __HALI_WIFI_H__
#include "halibaduo_lib.h"
#include "halibaduo.h"
#include "hali_list_node.h"



struct G_TX_WIFI {
    uint8_t is_connected:1;
    uint8_t reserve:7;
}__attribute__((packed));
extern struct G_TX_WIFI g_wifi;

// void hali_sys_sta_scan(void); // use it， open and midify it 


#endif