#include "sys_config.h"
#include "typesdef.h"
#include "list.h"
#include "dev.h"
#include "devid.h"
#include "osal/string.h"
#include "osal/semaphore.h"
#include "osal/mutex.h"
#include "osal/irq.h"
#include "osal/task.h"
#include "osal/sleep.h"
#include "osal/timer.h"
#include "hal/gpio.h"
#include "hal/uart.h"
#include "hal/netdev.h"
#include "lib/common/common.h"
#include "lib/umac/ieee80211.h"
#include "lib/umac/umac.h"
#include "lib/syscfg/syscfg.h"
#include "lib/atcmd/libatcmd.h"
#include "lwip/ip_addr.h"
#include "lwip/netdb.h"
#include "syscfg.h"
#include "osal/work.h"

#ifndef QC_STA_NAME
#define QC_STA_NAME  "BGN_test"
#endif

#ifndef QC_STA_PW
#define QC_STA_PW    "12345678"
#endif

#ifndef QC_SCAN_TIME
#define QC_SCAN_TIME	  200
#endif

#ifndef QC_SCAN_CNT
#define QC_SCAN_CNT	      10
#endif

#ifndef QC_SCAN_CHANNEL
#define QC_SCAN_CHANNEL   0x010
#endif

#define SYSCFG_WIFI_MODE(mode) ((mode) == WIFI_MODE_STA ? "sta" : ((mode) == WIFI_MODE_AP ? "ap" : "apsta"))

struct sys_config sys_cfgs = {
    .cfg_ver       = CFG_VERSION_NUM,
    .default_wifi_mode     = WIFI_MODE_AP,
    .channel       = CHANNEL_DEFAULT,
    .beacon_int    = 100,
    .dtim_period   = 1,
    .bss_max_idle  = 300,
    .key_mgmt      = WPA_KEY_MGMT_NONE,
    .ipaddr        = IP_ADDR_DEFAULT,
    .netmask       = NET_MASK_DEFAULT,
    .gw_ip         = GW_IP_DEFAULT,
    .dhcpd_startip = DHCP_START_IP_DEFAULT,
    .dhcpd_endip   = DHCP_END_IP_DEFAULT,
    .dhcpd_lease_time = 3600,
    .dhcpd_en      = 1,
    .dhcpc_en      = 1,
    .ble_pair_status = 0,//ble 默认是0,没有配网,设置为1的时候,代表已经配过网络
    .wireless_paircode = 0,
};

int32 syscfg_save(void)
{
    return syscfg_write(&sys_cfgs, sizeof(sys_cfgs));
}

extern uint8 sta_ps[8][6];
void syscfg_dump(void)
{
    _os_printf("SYSCFG\r\n");
    _os_printf("  mode:%s, channel:%d, key_mgmt:%x\r\n", 
        SYSCFG_WIFI_MODE(sys_cfgs.wifi_mode), sys_cfgs.channel, sys_cfgs.key_mgmt);
    _os_printf("  bssid:"MACSTR", mac:"MACSTR"\r\n", MAC2STR(sys_cfgs.bssid), MAC2STR(sys_cfgs.mac));
    _os_printf("  ssid:%s, passwd:%s\r\n",  sys_cfgs.ssid, sys_cfgs.passwd);
    _os_printf("  bss_max_idle:%d, beacon_int:%d, ack_tmo:%d, dtim_period:%d\r\n", 
        sys_cfgs.bss_max_idle, sys_cfgs.beacon_int, sys_cfgs.ack_tmo, sys_cfgs.dtim_period);
}


#ifdef CONFIG_UMAC4
void qc_wifi_config(void)
{
    wifi_create_station(QC_STA_NAME,QC_STA_PW,WPA_KEY_MGMT_PSK);
}

int32 wifi_qc_scan(uint8 ifidx)
{
    int32 ret = 0;
    uint8 bss_num = 0;
    uint8 *bss_data;
    struct hgic_bss_info* bss_map;
    struct ieee80211_scandata scan_param;
    bss_data = malloc(32*sizeof(struct hgic_bss_info));
    scan_param.chan_bitmap = QC_SCAN_CHANNEL;
    scan_param.scan_time = QC_SCAN_TIME;
    scan_param.scan_cnt =  QC_SCAN_CNT;
    ieee80211_scan(ifidx,1,&scan_param);


    //ieee80211_scan(ifidx,0,NULL);
    os_sleep_ms(QC_SCAN_TIME*QC_SCAN_CNT+10);
    ret = ieee80211_get_bsslist((struct hgic_bss_info *)bss_data, 32);
    for (bss_num = 0;bss_num < 32;bss_num++) {
        bss_map = (struct hgic_bss_info *)(bss_data + bss_num*sizeof(struct hgic_bss_info));
        os_printf("[%d]===>%s\r\n",bss_num,bss_map->ssid);
        if (! strcasecmp( (const char *)bss_map->ssid, QC_STA_NAME ) ) {
            free(bss_data);
            return 1;
        }
    }


    free(bss_data);
    return 0;
}

int get_rssi_msg(uint8_t *sta,char* ifname)
{
    int ret = - 70;
    struct ieee80211_stainfo stainfo;
    if(sys_cfgs.wifi_mode == WIFI_MODE_STA) {
        ret = ieee80211_conf_get_stainfo(WIFI_MODE_STA,0,NULL,&stainfo);
        if (ret == 0) {
            ret = stainfo.rssi; 
        } else {
            ret = -70;
        }
    }
    return ret;
}

void wifi_create_ap(char *ssid,char *password,int key_mode,int channel)
{
    uint8 key[32];
    ieee80211_conf_set_channel(WIFI_MODE_AP, channel);
    ieee80211_conf_set_ssid(WIFI_MODE_AP, (uint8*)ssid);
    ieee80211_conf_set_keymgmt(WIFI_MODE_AP, key_mode);
    if (key_mode != WPA_KEY_MGMT_NONE) {
        wpa_passphrase((uint8*)ssid, password, key);
        ieee80211_conf_set_psk(WIFI_MODE_AP, key);
    }
}


void wifi_create_station(char *ssid,char *password,int key_mode)
{
    uint8 key[32];
    ieee80211_conf_set_ssid(WIFI_MODE_STA, (uint8*)ssid);
    ieee80211_conf_set_keymgmt(WIFI_MODE_STA, key_mode);
    if (key_mode != WPA_KEY_MGMT_NONE) {
        wpa_passphrase((uint8*)ssid, password, key);
        ieee80211_conf_set_psk(WIFI_MODE_STA, key);
    }
}


int32 wificfg_flush(uint8 ifidx)
{
    if (!IS_ZERO_ADDR(sys_cfgs.mac)) {
        ieee80211_conf_set_mac(ifidx, sys_cfgs.mac);
    }
    ieee80211_conf_set_channel(ifidx, sys_cfgs.channel);
    ieee80211_conf_set_beacon_int(ifidx, sys_cfgs.beacon_int);
    ieee80211_conf_set_dtim_int(ifidx, sys_cfgs.dtim_period);
    ieee80211_conf_set_bss_max_idle(ifidx, sys_cfgs.bss_max_idle);
    ieee80211_conf_set_ssid(ifidx, sys_cfgs.ssid);
    ieee80211_conf_set_keymgmt(ifidx, sys_cfgs.key_mgmt);
    ieee80211_conf_set_psk(ifidx, sys_cfgs.psk);
    ieee80211_conf_set_psdata_cnt(ifidx,40);
    return 0;
}

void sta_ps_mode_enter(uint16 aid)
{
}

void sta_ps_mode_exit(uint16 aid)
{
}

void aid_to_mac(uint16 aid, uint8* mac)
{
    struct ieee80211_stainfo stainfo;
    ieee80211_conf_get_stainfo(WIFI_MODE_AP,aid,NULL,&stainfo);
    memcpy(mac,stainfo.addr,6);
}

#else

//hgics configs.
struct umac_config umac_cfg;
struct umac_config *sys_get_umaccfg()
{
    struct umac_config *cfg = &umac_cfg;
    int hg0_sz = 0;
    uint8 channel = 0 ;
    cfg->bss_bw = 8;
    cfg->tx_mcs = 7;
    cfg->primary_chan = 1;
    cfg->chan_cnt = 2;
    cfg->chan_list[0] = 9020;
    cfg->chan_list[1] = 9100;
    if (sys_cfgs.wifi_mode == WIFI_MODE_STA) {
        hg0_sz += (int)os_sprintf(cfg->hg0, "update_config=1\n" \
                                  "network={\n" \
                                  "proto=WPA RSN\n"\
                                  "key_mgmt=WPA-PSK\n" \
                                  "pairwise=TKIP CCMP\n" \
                                  "group=TKIP CCMP\n" \
                                 );
        hg0_sz += (int)os_sprintf(&cfg->hg0[hg0_sz], "ssid=\"%s\"\n", "BGN_test");
        hg0_sz += (int)os_sprintf(&cfg->hg0[hg0_sz], "psk=\"%s\"\n", "12345678");
        hg0_sz += (int)os_strcpy(&cfg->hg0[hg0_sz], "}\n");
        _os_printf("cfg->hg0:%s\r\n", cfg->hg0);
    } else {
        hg0_sz += (int)os_sprintf(cfg->hg0, "country_code=CN\n");
        hg0_sz += (int)os_sprintf(&cfg->hg0[hg0_sz], "ssid=%s\n", sys_cfgs.ssid);
        if (sys_cfgs.channel == 0) {

        } else {
            channel = sys_cfgs.channel;
        }
        hg0_sz += (int)os_sprintf(&cfg->hg0[hg0_sz], "channel=%d\n", channel);
        if (sys_cfgs.key_mgmt == WPA_KEY_MGMT_NONE) {
            hg0_sz += (int)os_strcpy(&cfg->hg0[hg0_sz],
                                     "wpa=0\n" \
                                     "hw_mode=g\n"\
                                    );
        } else {
            hg0_sz += (int)os_sprintf(&cfg->hg0[hg0_sz], "wpa_passphrase=%s\n", sys_cfgs.key);
            hg0_sz += (int)os_strcpy(&cfg->hg0[hg0_sz],
                                     "wpa=2\n" \
                                     "wpa_key_mgmt=WPA-PSK\n" \
                                     "wpa_pairwise=CCMP\n" \
                                     "hw_mode=g\n"\
                                     "ieee80211n=1\n" \
                                     "ht_capab=\n"\
                                    );
        }
    }
    return cfg;
}

//save hgics configs into system.
int sys_save_umaccfg(struct umac_config *cfg)
{
    return 0;
}

void sta_ps_mode_enter(char *addr)
{
}

void sta_ps_mode_exit(char *addr)
{
}

void aid_to_mac(uint16 aid, uint8* mac)
{
}

#endif

void syscfg_set_default_val()
{
    sysctrl_efuse_mac_addr_calc(sys_cfgs.mac);
    if (IS_ZERO_ADDR(sys_cfgs.mac)) {
        os_random_bytes(sys_cfgs.mac, 6);
        sys_cfgs.mac[0] &= 0xfe;
        os_printf("use random mac "MACSTR"\r\n", MAC2STR(sys_cfgs.mac));
    }
    os_sprintf(sys_cfgs.ssid,"%s%02x%02x%02x",SSID_DEFAULT,sys_cfgs.mac[5],sys_cfgs.mac[4],sys_cfgs.mac[3]);
    os_sprintf(sys_cfgs.passwd,"%s","12345678");
#ifdef CONFIG_UMAC4
    wpa_passphrase(sys_cfgs.ssid, sys_cfgs.passwd, sys_cfgs.psk);
#else
    os_strcpy(sys_cfgs.key, "12345678");
#endif
}

uint8 get_sys_cfgs_ble_pair_status()
{
    return sys_cfgs.ble_pair_status;
}

