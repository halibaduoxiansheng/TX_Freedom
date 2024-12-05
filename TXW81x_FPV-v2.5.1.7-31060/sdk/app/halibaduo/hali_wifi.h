#ifndef __HALI_WIFI_H__
#define __HALI_WIFI_H__
#include "halibaduo_lib.h"
#include "halibaduo.h"
#include "hali_list_node.h"



struct G_TX_WIFI {
    uint8_t is_connected:1;
    uint8_t mac_num:4; // wifi need what num mac num to Splicing
    uint8_t have_inited:1;
    uint8_t reserve:2;

    int connect_sock;
    // struct sockaddr_in addr;
    uint16_t port;

    uint8_t ssid[32];
    uint8_t password[32];
}__attribute__((packed));
extern struct G_TX_WIFI g_wifi;

// void hali_sys_sta_scan(void); // use it， open and midify it 


void hali_wifiInfo_register(void *cfg);

#endif