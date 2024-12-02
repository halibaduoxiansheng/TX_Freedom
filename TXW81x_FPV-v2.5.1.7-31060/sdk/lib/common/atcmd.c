#include "sys_config.h"
#include "basic_include.h"
#include "hal/netdev.h"
#include "lib/atcmd/libatcmd.h"
#include "lib/umac/ieee80211.h"
#include "lib/bus/xmodem/xmodem.h"
#include "lib/lmac/lmac_def.h"
#if BLE_SUPPORT
#include "lib/ble/ble_demo.h"
#include "lib/ble/ble_def.h"
#endif

#ifdef CONFIG_UMAC4
#include "lwip/ip_addr.h"
#include "lwip/icmp.h"
#include "lwip/apps/lwiperf.h"
#endif

#include "syscfg.h"

int32 sys_atcmd_loaddef(const char *cmd, char *argv[], uint32 argc)
{
    syscfg_loaddef();
    mcu_reset();
    return 0;
}

int32 sys_atcmd_goto_boot(const char *cmd, char *argv[], uint32 argc)
{
	os_printf("system goto boot\r\n");
	
    system_goto_boot();
	
    return 0;
}

int32 sys_atcmd_reset(const char *cmd, char *argv[], uint32 argc)
{
    atcmd_ok;

    if (argc >= 1) {
        uint32 run_addr=0, reset_usb=0, param = 0;
        disable_irq();
        mcu_watchdog_feed();
        if (argc >= 1) run_addr = os_atoh(argv[0]);
        if (argc >= 2) reset_usb = os_atoh(argv[1]);
        if (argc >= 3) param = os_atoh(argv[2]);
        mcu_watchdog_feed();
//        os_printf("reset addr=%08x, rst_usb=%d, param=%d\r\n", run_addr, reset_usb, param);
        if (reset_usb) {
            pmu_clr_direct_run_pengding2();
        } else {
            pmu_set_direct_run_pengding2();
        }
        
        ((void (*)(uint32))run_addr)(param);
    } else {
        mcu_reset();
    }
    
    return 0;
}

int32 sys_atcmd_jtag(const char *cmd, char *argv[], uint32 argc)
{
    jtag_map_set(1);
    atcmd_ok;
    return 0;
}

int32 sys_syscfg_dump_hdl(const char *cmd, char *argv[], uint32 argc)
{
    void syscfg_dump(void);
    syscfg_dump();
    return 0;
}

#ifdef CONFIG_UMAC4
int32 sys_atcmd_ping(const char *cmd, char *argv[], uint32 argc) //need: #define LWIP_RAW 1
{
    int32 loop_cnt = 10;
    int32 pkt_size = 32;
    if(argc > 0){
        if(argc > 1) loop_cnt = os_atoi(argv[1]);
        if(argc > 2) pkt_size = os_atoi(argv[2]);
        lwip_ping(argv[0], pkt_size, loop_cnt);
    }
    return 0;
}

int32 sys_atcmd_icmp_mntr(const char *cmd, char *argv[], uint32 argc)
{
    struct netdev *ndev;
    if(argc == 2){
        ndev = (struct netdev *)dev_get(HG_WIFI0_DEVID + os_atoi(argv[0]));
        if(ndev){
            netdev_ioctl(ndev, NETDEV_IOCTL_ENABLE_ICMPMNTR, os_atoi(argv[1]), 0);
            atcmd_ok;
        }else{
            atcmd_err("invalid input");
        }
    }else{
        atcmd_err("invalid input");
    }
    return 0;
}

int32 sys_atcmd_iperf2(const char *cmd, char *argv[], uint32 argc)
{
    char *mode = NULL;

    if(argc > 0){
        mode = argv[0];
        if(os_strncmp(argv[0], "c", 1) == 0 || os_strncmp(argv[0], "C", 1) == 0) {
            os_printf("%s:iperf2 TCP CLIENT mode,remote IP:%s,port:%d,time:%d\n",
                __FUNCTION__,argv[1],os_atoi(argv[2]), os_atoi(argv[3]));
            sys_lwiperf_tcp_client_start(argv[1], os_atoi(argv[2]), os_atoi(argv[3]));
        } else if (os_strncmp(argv[0], "s", 1) == 0 || os_strncmp(argv[0], "S", 1) == 0) {
            os_printf("%s:iperf2 TCP Server mode,port:%d\n",__FUNCTION__,os_atoi(argv[1]));
            sys_lwiperf_tcp_server_start(os_atoi(argv[1]));
        } else {
            os_printf("Unknow iperf mode:%s\n",mode);
        }
    }
    return 0;
}

int32 sys_wifi_atcmd_set_channel(const char *cmd, char *argv[], uint32 argc)
{
    int32 chan = 0, chan_max;

    if (argc == 1 && argv[0][0] == '?') {
        atcmd_resp("%d", ieee80211_conf_get_channel(sys_cfgs.wifi_mode));
    } else if (argc == 1) {
        chan = os_atoi(argv[0]);
#ifdef TXW4002ACK803
        chan_max = 16;
#else
        chan_max = 13;
#endif
        if ((chan < 1) || (chan > chan_max)) {
            atcmd_printf("+CHANNEL: ERROR, INVALID CHANNEL %d\r\n", chan);
            atcmd_error;
            return 0;
        }

        if (sys_cfgs.wifi_mode == WIFI_MODE_AP) {
            ieee80211_conf_set_channel(WIFI_MODE_AP, chan);
            sys_cfgs.channel = ieee80211_conf_get_channel(WIFI_MODE_AP);
        } else if (sys_cfgs.wifi_mode == WIFI_MODE_STA || sys_cfgs.wifi_mode == WIFI_MODE_APSTA) {
            ieee80211_conf_set_channel(WIFI_MODE_STA, chan);
            sys_cfgs.channel = ieee80211_conf_get_channel(WIFI_MODE_STA);
        }
        atcmd_ok;
        syscfg_save();
    }
    return 0;
}

int32 sys_wifi_atcmd_set_encrypt(const char *cmd, char *argv[], uint32 argc)
{
    if (argc == 1 && argv[0][0] == '?') {
        atcmd_resp("%d", sys_cfgs.key_mgmt == WPA_KEY_MGMT_PSK);
    } else if (argc == 1) {
        if ('1' == argv[0][0]) {
            sys_cfgs.key_mgmt = WPA_KEY_MGMT_PSK;
            ieee80211_conf_set_keymgmt(sys_cfgs.wifi_mode, sys_cfgs.key_mgmt);
            atcmd_ok;
            syscfg_save();
        } else if ('0' == argv[0][0]) {
            sys_cfgs.key_mgmt = WPA_KEY_MGMT_NONE;
            ieee80211_conf_set_keymgmt(sys_cfgs.wifi_mode, sys_cfgs.key_mgmt);
            atcmd_ok;
            syscfg_save();
        } else {
            atcmd_error;
            os_printf("encrypt atcmd err\r\n");
        }
    }
    return 0;
}

int32 sys_wifi_atcmd_set_ssid(const char *cmd, char *argv[], uint32 argc)
{
    if (argc == 1 && argv[0][0] == '?') {
        atcmd_resp("%s", sys_cfgs.ssid);
    } else if (argc == 1) {
        os_memset(sys_cfgs.bssid, 0, 6);
        os_strncpy(sys_cfgs.ssid, argv[0], SSID_MAX_LEN);
        ieee80211_conf_set_bssid(sys_cfgs.wifi_mode, NULL);
        ieee80211_conf_set_ssid(sys_cfgs.wifi_mode, sys_cfgs.ssid);
        if (os_strlen(sys_cfgs.passwd) > 0) {
            wpa_passphrase(sys_cfgs.ssid, sys_cfgs.passwd, sys_cfgs.psk);
        }
        ieee80211_conf_set_psk(sys_cfgs.wifi_mode, sys_cfgs.psk);
        atcmd_ok;
        os_printf("set new ssid:%s\r\n", sys_cfgs.ssid);
        syscfg_save();
    }
    return 0;
}

int32 sys_wifi_atcmd_set_key(const char *cmd, char *argv[], uint32 argc)
{
    if (argc == 1 && argv[0][0] == '?') {
        atcmd_resp("%s", sys_cfgs.passwd);
    } else if (argc == 1) {
        // psk need 8 bytes at less
        if (os_strlen(argv[0]) < 8) {
            atcmd_error;
            os_printf("psk need 8 bytes at less\r\n");
        } else {
            os_strncpy(sys_cfgs.passwd, argv[0], PASSWD_MAX_LEN);
            wpa_passphrase(sys_cfgs.ssid, sys_cfgs.passwd, sys_cfgs.psk);
            ieee80211_conf_set_psk(sys_cfgs.wifi_mode, sys_cfgs.psk);
            atcmd_ok;
            os_printf("set new key:%s\r\n", sys_cfgs.passwd);
            syscfg_save();
        }
    }
    return 0;
}

int32 sys_wifi_atcmd_set_wifimode(const char *cmd, char *argv[], uint32 argc)
{
    if (argc == 1 && argv[0][0] == '?') {
        atcmd_resp("%s", sys_cfgs.wifi_mode == WIFI_MODE_AP ? "ap" : (sys_cfgs.wifi_mode == WIFI_MODE_APSTA ? "apsta" : "sta"));
    } else if (argc == 1) {
        if (os_strcasecmp(argv[0], "ap") == 0 && sys_cfgs.wifi_mode != WIFI_MODE_AP) {
            sys_cfgs.wifi_mode = WIFI_MODE_AP;
            ieee80211_iface_stop(WIFI_MODE_STA);
            wificfg_flush(WIFI_MODE_AP);
            netdev_set_wifi_mode((struct netdev *)dev_get(HG_WIFI0_DEVID), WIFI_MODE_AP);
            ieee80211_iface_start(WIFI_MODE_AP);
        } else if (os_strcasecmp(argv[0], "sta") == 0 && sys_cfgs.wifi_mode != WIFI_MODE_STA) {
            sys_cfgs.wifi_mode = WIFI_MODE_STA;
            ieee80211_iface_stop(WIFI_MODE_AP);
            wificfg_flush(WIFI_MODE_STA);
            netdev_set_wifi_mode((struct netdev *)dev_get(HG_WIFI0_DEVID), WIFI_MODE_STA);
            ieee80211_iface_start(WIFI_MODE_STA);
        } else if (os_strcasecmp(argv[0], "apsta") == 0 && sys_cfgs.wifi_mode != WIFI_MODE_APSTA) {
            sys_cfgs.wifi_mode = WIFI_MODE_APSTA;
            wificfg_flush(WIFI_MODE_AP);
            netdev_set_wifi_mode((struct netdev *)dev_get(HG_WIFI0_DEVID), WIFI_MODE_AP);
            ieee80211_iface_start(WIFI_MODE_AP);
            wificfg_flush(WIFI_MODE_STA);
            netdev_set_wifi_mode((struct netdev *)dev_get(HG_WIFI0_DEVID), WIFI_MODE_STA);
            ieee80211_iface_start(WIFI_MODE_STA);
        }
        atcmd_ok;
        os_printf("set wifi mode:%s\r\n", argv[0]);
        syscfg_save();
    }
    return 0;
}

int32 sys_wifi_atcmd_loaddef(const char *cmd, char *argv[], uint32 argc)
{
    syscfg_loaddef();
    mcu_reset();
    return 0;
}

int32 sys_wifi_atcmd_scan(const char *cmd, char *argv[], uint32 argc)
{
    if (argc == 2) {
        struct ieee80211_scandata scan;
        os_memset(&scan, 0, sizeof(scan));
        scan.chan_bitmap = 0xffff;
        scan.scan_cnt = os_atoi(argv[0]);
        scan.scan_time = os_atoi(argv[1]);
        ieee80211_scan(sys_cfgs.wifi_mode, 1, &scan);
    } else {
        ieee80211_scan(sys_cfgs.wifi_mode, 1, NULL);
    }
    atcmd_ok;
    return 0;
}

int32 sys_wifi_atcmd_pair(const char *cmd, char *argv[], uint32 argc)
{
    uint32 magic = os_atoi(argv[0]);
    ieee80211_pairing(sys_cfgs.wifi_mode, magic);
    atcmd_ok;
    return 0;
}

int32 sys_wifi_atcmd_aphide(const char *cmd, char *argv[], uint32 argc)
{
    if (argc == 1 && argv[0][0] == '?') {
        atcmd_resp("%d", sys_cfgs.ap_hide);
    } else if (argc == 1) {
        sys_cfgs.ap_hide = os_atoi(argv[0]);
        ieee80211_conf_set_aphide(sys_cfgs.wifi_mode, sys_cfgs.ap_hide);
        atcmd_ok;
        syscfg_save();
    }
    return 0;
}

int32 sys_wifi_atcmd_hwmode(const char *cmd, char *argv[], uint32 argc)
{
    if (argc == 1 && argv[0][0] == '?') {
        atcmd_resp("%d", sys_cfgs.wifi_hwmode);
    } else if (argc == 1) {
        sys_cfgs.wifi_hwmode = os_atoi(argv[0]);
        ieee80211_conf_set_hwmode(sys_cfgs.wifi_mode, sys_cfgs.wifi_hwmode);
        atcmd_ok;
        syscfg_save();
    }
    return 0;
}

int32 sys_ble_atcmd_blenc(const char *cmd, char *argv[], uint32 argc)
{
#if BLE_SUPPORT
    extern void *g_ops;

    uint8 mode = 0;
    struct lmac_ops *lops = (struct lmac_ops *)g_ops;
    struct bt_ops *bt_ops = (struct bt_ops *)lops->btops;

    if (argc == 1) {
        mode = os_atoi(argv[0]);
        switch (mode) {
            case 0:
                if (ble_demo_stop(bt_ops)) {
                    atcmd_error;
                } else {
                    os_printf("\n\nble close \r\n\n");
                }
                break;
            case 1:
            case 2:
            case 3:
			/*
                if (ble_demo_start(bt_ops, mode - 1)) {
                    atcmd_error;
                } else {
                    os_printf("\n\nset ble mode = %d \r\n\n", mode);
                }
			*/
                break;
            default:
                break;
        }
    } 
#endif
    return 0;
}

int32 sys_wifi_atcmd_ft(const char *cmd, char *argv[], uint32 argc)
{
#ifdef CONFIG_IEEE80211R
    struct ieee80211_ft_param ft;
    uint8 ifidx = (sys_cfgs.wifi_mode == WIFI_MODE_APSTA ? WIFI_MODE_STA : sys_cfgs.wifi_mode);

    os_memset(&ft, 0, sizeof(ft));
    str2mac(argv[0], ft.bssid_new);
    os_printf("FT_start: target_bssid= "MACSTR" argc= %d\r\n", MAC2STR(ft.bssid_new), argc);
    ieee80211_conf_set_ft(ifidx, &ft);
    atcmd_ok;
#endif
    return 0;
}

int32 sys_wifi_atcmd_passwd(const char *cmd, char *argv[], uint32 argc)
{
#ifdef CONFIG_SAE
    uint8 ifidx = (sys_cfgs.wifi_mode == WIFI_MODE_APSTA ? WIFI_MODE_STA : sys_cfgs.wifi_mode);
    //ieee80211_conf_set_passwd(ifidx, argv[0]);//too late, interface set
    atcmd_ok;
#endif
    return 0;
}

int32 sys_ble_atcmd_set_coexist_en(const char *cmd, char *argv[], uint32 argc)
{
#if BLE_SUPPORT
    extern void *g_ops;
    uint8 coexist, dec_duty;

    struct lmac_ops *lops = (struct lmac_ops *)g_ops;
    struct bt_ops *bt_ops = (struct bt_ops *)lops->btops;

    if (argc == 1 && argv[0][0] == '?') {
        atcmd_resp("coexist,dec_duty");
    } else if (argc == 2) {
        coexist  = os_atoi(argv[0]);
        dec_duty = os_atoi(argv[1]);
        if (ble_set_coexist_en(bt_ops, coexist, dec_duty)) {
            atcmd_error;
            return 0;
        }
        atcmd_ok;
    } 
#endif
    return 0;
}
#endif

#if WIFI_REPEATER_SUPPORT
int32 sys_wifi_atcmd_set_rssid(const char *cmd, char *argv[], uint32 argc)
{
    if (argc == 1 && argv[0][0] == '?') {
        atcmd_resp("%s", sys_cfgs.r_ssid);
    } else if (argc == 1) {
        sys_cfgs.cfg_init = 1;
        os_strncpy(sys_cfgs.r_ssid, argv[0], SSID_MAX_LEN);
        wpa_passphrase(sys_cfgs.r_ssid, sys_cfgs.r_passwd, sys_cfgs.r_psk);
        atcmd_ok;
        syscfg_save();
    }
    return 0;
}

int32 sys_wifi_atcmd_set_rkey(const char *cmd, char *argv[], uint32 argc)
{
    if (argc == 1 && argv[0][0] == '?') {
        atcmd_resp("%s", sys_cfgs.r_passwd);
    } else if (argc == 1) {
        // psk need 8 bytes at less
        if (os_strlen(argv[0]) < 8) {
            atcmd_error;
            atcmd_printf("need 8 bytes at less\r\n");
        } else {
            sys_cfgs.cfg_init = 1;
            sys_cfgs.r_key_mgmt = sys_cfgs.key_mgmt;
            os_strncpy(sys_cfgs.r_passwd, argv[0], PASSWD_MAX_LEN);
            wpa_passphrase(sys_cfgs.r_ssid, sys_cfgs.r_passwd, sys_cfgs.r_psk);
            atcmd_ok;
            syscfg_save();
        }
    }
    return 0;
}
#endif

int32 sys_wifi_atcmd_reboot_test_mode(const char *cmd, char *argv[], uint32 argc)
{
    if (argc == 1 && argv[0][0] == '1') {
        system_reboot_test_mode();
        atcmd_ok;
        mcu_reset();
    } else {
        system_reboot_normal_mode();
        atcmd_ok;
        mcu_reset();
    }
    return 0;
}
