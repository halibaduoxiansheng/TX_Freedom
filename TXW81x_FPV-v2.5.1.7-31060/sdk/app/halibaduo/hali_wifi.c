#include "hali_wifi.h"


#define MAX_WIFI_LIST_NUM 50
#define MACSTR_0	"%02x%02x%02x%02x%02x%02x"



struct G_TX_WIFI g_wifi;
















#if 0 // if you want use it ,you can open it and midify it to use ,it is very easy
/**
 * Scan surrounding wifi at once, need some time to finish
 */
void hali_sys_sta_scan(void)
{
    struct ieee80211_scandata scan_param;
    int32 ret = 0;
    uint8_t bss_num = 0;
    uint8_t *bss_data;
    struct hgic_bss_info *bss_map;
    bss_data = malloc(32*sizeof(struct hgic_bss_info));
    uint8_t *buff = os_malloc(1024);
    os_memset(bss_data, 0, 32*sizeof(struct hgic_bss_info));
    os_memset(&scan_param, 0, sizeof(scan_param));
    scan_param.scan_time = 50;
    scan_param.scan_cnt  = 2;

    os_printf("AP SCAN START ...\r\n");

    scan_param.chan_bitmap = 0x7;       // 1,2,3
    ieee80211_scan(WIFI_MODE_STA, 1, &scan_param);
    os_sleep_ms(600);

    printf("abcdefg\r\n");

    scan_param.chan_bitmap = 0x7 << 3;  // 4,5,6
    ieee80211_scan(WIFI_MODE_STA, 1, &scan_param);
    os_sleep_ms(600);

    scan_param.chan_bitmap = 0x7 << 6;  // 7,8,9
    ieee80211_scan(WIFI_MODE_STA, 1, &scan_param);
    os_sleep_ms(600);

    scan_param.chan_bitmap = 0x7 << 9;  // 10,11,12
    ieee80211_scan(WIFI_MODE_STA, 1, &scan_param);
    os_sleep_ms(600);

    scan_param.chan_bitmap = 0x7 << 12; // 13,14
    ieee80211_scan(WIFI_MODE_STA, 1, &scan_param);
    os_sleep_ms(600);

    os_printf("AP SCAN DONE\r\n");

    if (buff) {
        ieee80211_status(buff, 1024);
        printf("%s\n",buff);
        os_free(buff);
    }
     ret = ieee80211_get_bsslist((struct hgic_bss_info *)bss_data, 32);
     for (bss_num = 0; bss_num < 32; bss_num++) {
        bss_map = (struct hgic_bss_info *)(bss_data + bss_num*sizeof(struct hgic_bss_info));
        if(bss_map->bssid[0] == 0 && bss_map->bssid[1] == 0 && bss_map->bssid[2] == 0 
                && bss_map->bssid[3] == 0 && bss_map->bssid[4] == 0 && bss_map->bssid[5] == 0){
            printf("scan end\r\n");
            break;
        }
        os_printf("[%d]%s encrypt: %d signal: %d freq: %d\r\n",bss_num,bss_map->ssid, bss_map->encrypt,
                    bss_map->signal, bss_map->freq);

        for(int j = 0;j <= sta_list_index; j++)
		{
			char t_mac[MAX_WIFI_LIST_NUM] = {0};
			sprintf(t_mac, MACSTR_0, MAC2STR(bss_map->bssid));
			if (strncmp(wifi_list_mac[j], t_mac, 12) == 0) {
				printf("this ssid is exist -> (%s)\r\n", wifi_list[j].ssid);
				break;
			}

            // FIXME modify it start here 
            if(strlen(sta_list[bss_num]) == 0) // add this info 
            {
                if (strlen(bss_map->ssid) != 0) {
                    sta_list_index_change(bss_num);
                } else {
                    break;
                }

                sprintf(wifi_list_mac[bss_num], MACSTR_0, MAC2STR(bss_map->bssid));
                memcpy(sta_list[bss_num], bss_map->ssid, strlen(bss_map->ssid));
                memcpy(wifi_list[bss_num].ssid, sta_list[bss_num], strlen(bss_map->ssid));

                if (bss_map->encrypt) {
                    wifi_list[bss_num].havepasswd = 1;
                } else {
                    wifi_list[bss_num].havepasswd = 0;
                }
                wifi_list[bss_num].channel = get_wifi_channel(bss_map->freq);
                wifi_list[bss_num].power = bss_map->signal;

                /*print check*/
                printf("\n============add wifi list info===============================\r\n");
                printf("add a new ssid:(%s)\r\n",sta_list[bss_num]);
                printf("the mac is "MACSTR_0"\r\n",MAC2STR(bss_map->bssid));
                printf("ssid: %s\r\n", wifi_list[bss_num].ssid);
                printf("havepasswd: %d\r\n", wifi_list[bss_num].havepasswd);
                printf("channel: %d\r\n", wifi_list[bss_num].channel);
                printf("power: %d\r\n", wifi_list[bss_num].power);
            }

		}
    }
     if(bss_data)
        free(bss_data);
}
#endif