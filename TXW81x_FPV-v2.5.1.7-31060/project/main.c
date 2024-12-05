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
#include "osal/work.h"
#include "hal/gpio.h"
#include "hal/uart.h"
#include "lib/common/common.h"
#include "lib/common/sysevt.h"
#include "lib/syscfg/syscfg.h"
#include "lib/lmac/lmac.h"
#include "lib/skb/skbpool.h"
#include "lib/atcmd/libatcmd.h"
#include "lib/bus/xmodem/xmodem.h"
#include "lib/net/dhcpd/dhcpd.h"
#include "lib/umac/ieee80211.h"
#include "lib/umac/umac.h"
#include "lib/common/atcmd.h"
#include "lwip/err.h"
#include "lwip/sockets.h"
#include "lwip/netdb.h"
#include "lwip/sys.h"
#include "lwip/ip_addr.h"
#include "lwip/tcpip.h"
#include "netif/ethernetif.h"
#include "syscfg.h"
#include "lib/net/eloop/eloop.h"
#include "speedTest/speedTest.h"

#include "update/ota.h"
#include "dhcpd_eloop/dhcpd_eloop.h"
#include "sta_interface/sta_interface.h"
#include "ota.h"
#include "lib/heap/sysheap.h"
#include "spook.h"
#include "remote_control.h"
#include "lib/sdhost/sdhost.h"
#include "lib/ble/ble_def.h"
#include "lib/common/dsleepdata.h"
#include "dns_eloop/dns_eloop.h"

#include "custom_mem/custom_mem.h"
#include "lib/video/dvp/jpeg/jpg.h"
#include "audio_app/audio_adc.h"
#include "audio_app/audio_dac.h"
#include "stream_frame.h"
#include "test_demo/test_demo.h"
#include "atcmd.c"
#include "keyWork.h"
#include "../sdk/include/lib/ble/ble_demo.h"
#include "../app/halibaduo/halibaduo.h"
#include "../app/halibaduo/hali_wifi.h"
#include "../app/halibaduo/hali_energy.h"

extern uint8_t get_psram_status();

struct system_status sys_status;
extern uint32 srampool_start;
extern uint32 srampool_end;
static struct os_work main_wk;
uint8_t connect_led = 0;
uint8_t mac_adr[6];
void *g_ops = NULL;

uint8_t qc_mode = 0;
void delay_us(uint32 n);
int32 wifi_qc_scan(uint8 ifidx);

struct hgic_atcmd_normal {
    struct atcmd_dataif dataif;
};


struct hgic_atcmd_normal *atcmd_uart_normal = NULL;


#ifdef CONFIG_UMAC4 /* is access */
int32 sys_wifi_event(uint8 ifidx, uint16 evt, uint32 param1, uint32 param2)
{
    switch (evt) {
        case IEEE80211_EVENT_SCAN_START:
            os_printf("inteface%d: start scanning ...\r\n", ifidx);
            break;
        case IEEE80211_EVENT_SCAN_DONE:
            os_printf("inteface%d: scan done!\r\n", ifidx);
            break;
        case IEEE80211_EVENT_CONNECT_START:
            os_printf("inteface%d: start connecting ...\r\n", ifidx);
            break;
        case IEEE80211_EVENT_CONNECTED:
            os_printf("inteface%d: sta "MACSTR" connected\r\n", ifidx, MAC2STR((uint8 *)param1));
            break;
        case IEEE80211_EVENT_DISCONNECTED:
            os_printf("inteface%d: sta "MACSTR" disconnected\r\n", ifidx, MAC2STR((uint8 *)param1));
            break;
        case IEEE80211_EVENT_RSSI:
            //os_printf("inteface%d rssi: %d\r\n", ifidx, param1);
            break;
        case IEEE80211_EVENT_NEW_BSS:
            os_printf("inteface%d find new bss: "MACSTR"-%s\r\n", ifidx, MAC2STR((uint8 *)param1), (uint8 *)param2);
            break;
        default:
            break;
    }
    return RET_OK;
}
#endif

__init static void sys_cfg_load()
{
    /* order system global structure apply room */
    struct sys_config *sys_cfgs_tmp = (struct sys_config*)malloc(sizeof(struct sys_config));

    if(sys_cfgs_tmp) /*apply succuess*/
    {
        memcpy(sys_cfgs_tmp,&sys_cfgs,sizeof(struct sys_config));
    }

    /* read flash content, storage in sys_cfgs */
    if (syscfg_init(&sys_cfgs, sizeof(sys_cfgs)) == RET_OK) {
        os_printf("old cfg_ver:%d\n",sys_cfgs.cfg_ver); 
		if(sys_cfgs.cfg_ver == CFG_VERSION_NUM) { /* same ver ! */
			goto sys_cfg_load_end;
		}
		sys_cfgs.cfg_ver = CFG_VERSION_NUM;  //change version to same as flash version
    }

    if(sys_cfgs_tmp)
    {
        memcpy(&sys_cfgs,sys_cfgs_tmp,sizeof(struct sys_config)); /*Clear sys_cfgs*/
    }
    os_printf("use default params(%x).\r\n",sys_cfgs.cfg_ver);
    syscfg_set_default_val();
    syscfg_save(); /* save to falsh */

sys_cfg_load_end:
    if(sys_cfgs_tmp)
    {
        free(sys_cfgs_tmp);
    }
    else
    {
        os_printf("%s:%d err,malloc sys_config err\n",__FUNCTION__,__LINE__);
    }
}

void user_io_preconfig();
void user_protocol();


__weak void user_io_preconfig()
{

}

__weak void user_protocol()
{
    spook_init();
}

__weak void user_hardware_config()
{

}


__weak uint8_t set_qc_mode_io()
{
	return 255;
}

void sys_mode_confirm()
{
	if(qc_mode){
		sys_cfgs.wifi_mode = WIFI_MODE_STA;
        extern void qc_wifi_config();
        qc_wifi_config();
	}else{
		sys_cfgs.wifi_mode = sys_cfgs.default_wifi_mode;
	}	
}

uint8_t qc_ret = 0;
uint8_t mode_io_1 = 0;
uint8_t io_dect = 0;


//period 100ms
__weak int32 is_qc_mode(uint8_t mode_io)
{
	int32 io_direct,io_direct1,io_direct2,io_direct3;
	io_direct = 0;
	gpio_iomap_input(mode_io, GPIO_DIR_INPUT);
	
	io_direct1 = gpio_get_val(mode_io);
	delay_us(5000);       //delay 5ms
	io_direct2 = gpio_get_val(mode_io);
	delay_us(5000);       //delay 5ms
	io_direct3 = gpio_get_val(mode_io);
	
	if((io_direct1 == io_direct2)&&(io_direct3 == io_direct2)){
		io_direct = io_direct2;
		delay_us(45000);  //delay 45ms
	}else if((io_direct1 == io_direct2)&&(io_direct3 != io_direct2)){
		io_direct = io_direct1;
		delay_us(40000);  //delay 40ms		
	}else if((io_direct1 != io_direct2)&&(io_direct3 == io_direct2)){
		io_direct = io_direct3;
		delay_us(50000);  //delay 50ms		
	}
	
	if(gpio_get_val(mode_io) == io_direct){
		return 0;
	}
	
	delay_us(50000);      //delay 50ms
	if(gpio_get_val(mode_io) != io_direct){		
		return 0;
	}	

	delay_us(50000);      //delay 50ms
	if(gpio_get_val(mode_io) == io_direct){
		return 0;
	}

	delay_us(50000);      //delay 50ms
	if(gpio_get_val(mode_io) != io_direct){
		return 0;
	}
	//check 200ms,all correct,return true
	return 1;
	
}

void wifi_qc_mode_inspect()
{
#if (NET_TO_QC == 1)
	uint8_t wifi_qc_mode_io;
	wifi_qc_mode_io = set_qc_mode_io();
	if(wifi_qc_mode_io != 255){
		if(is_qc_mode(wifi_qc_mode_io)){
			qc_mode = 1;
		}else{
			qc_mode = 0;
		}	
	}else{
		qc_mode = 0;
	}
#endif
}


static int32 atcmd_normal_write(struct atcmd_dataif *dataif, uint8 *buf, int32 len)
{
    int32 i = 0;
    for(i = 0;i < len;i++){
        _os_printf("%c",buf[i]);
    }
    return 0;
}


void user_sta_add(char *addr)
{
	connect_led++;
	memcpy(mac_adr,addr,6);	
	os_printf("user_sta_add:%x %x %x %x %x %x\r\n",addr[0],addr[1],addr[2],addr[3],addr[4],addr[5]);

#if TX_AUTO_BLE
	if(ieee80211_conf_get_stacnt(sys_cfgs.wifi_mode) > 0)
	{
		struct lmac_ops *lops = NULL;
		struct bt_ops *bt_ops = NULL;
		if (g_ops) {
			lops = (struct lmac_ops *)g_ops;
		} 
		if (lops->btops) {
    		bt_ops = (struct bt_ops *)lops->btops;
		}
		tx_ble_stop(bt_ops);
	}
#endif
}

void user_sta_del(char *addr){
	connect_led--;
	memset(mac_adr,0,6); 
	os_printf("user_sta_del:%x %x %x %x %x %x\r\n",addr[0],addr[1],addr[2],addr[3],addr[4],addr[5]);
#if TX_AUTO_BLE
	if(ieee80211_conf_get_stacnt(sys_cfgs.wifi_mode) == 0)
	{
   	 	struct lmac_ops *lops = (struct lmac_ops *)g_ops;
    	struct bt_ops *bt_ops = (struct bt_ops *)lops->btops;
		tx_ble_init(bt_ops);
	}
#endif
}


#if TX_AUTO_BLE
void tx_ble_auto_for_project(void) 
{
	struct lmac_ops *lops = NULL;
	struct bt_ops *bt_ops = NULL;
	extern void *g_ops;
	
	if (tx_power.is_powerOn) {	
		lops = (struct lmac_ops *)g_ops;
		bt_ops = (struct bt_ops *)lops->btops;
		tx_ble_init(bt_ops); // open ble
	} else {
		if (g_ops) {
			lops = (struct lmac_ops *)g_ops;
		}
		if (lops->btops) {
			bt_ops = (struct bt_ops *)lops->btops;
			tx_ble_stop(bt_ops);
		}
	}
}
#endif

void sta_ps_mode_enter(uint16 aid);
void sta_ps_mode_exit(uint16 aid);
void aid_to_mac(uint16 aid, uint8* mac);
sysevt_hdl_res sysevt_wifi_event(uint32 event_id, uint32 data, uint32 priv){
    uint8 mac[6];
    switch(event_id&0xffff){
        case SYSEVT_WIFI_DISCONNECT:
            user_sta_del((char *)mac);
			aid_to_mac((uint16)data,mac);
            g_wifi.is_connected = 0;
            break;
        case SYSEVT_WIFI_CONNECTTED:
            user_sta_add((char *)mac);
			aid_to_mac((uint16)data,mac);
            g_wifi.is_connected = 1;
            break;
		case SYSEVT_WIFI_STA_DISCONNECT:
            user_sta_del((char *)mac);
			aid_to_mac((uint16)data,mac);
            g_wifi.is_connected = 0;
			break;
		case SYSEVT_WIFI_STA_CONNECTTED:
            user_sta_add((char *)mac);	
			aid_to_mac((uint16)data,mac);		
            g_wifi.is_connected = 1;
			break;			
		case SYSEVT_WIFI_STA_PS_START:
			//sta_ps_mode_enter((uint16)data);
            // printf("sta into ps mode\r\n"); // dormancy mode
			break;
		case SYSEVT_WIFI_STA_PS_END:	
			//sta_ps_mode_exit((uint16)data);
            // printf("sta put of ps mode\r\n"); // 
			break;
		case SYSEVT_WIFI_SCAN_DONE:
			os_printf("scan down.......\r\n");
			break;
        default:
            os_printf("no this event(%x)...\r\n",event_id);
            break;
    }
    return SYSEVT_CONTINUE;
}

__init static void sys_wifi_start_acs(void *ops){
	int32 ret;
	struct lmac_acs_ctl acs_ctl;
    if(sys_cfgs.wifi_mode == WIFI_MODE_AP){
        if(sys_cfgs.channel == 0) {
            acs_ctl.enable     = 1;
            acs_ctl.scan_ms    = WIFI_ACS_SCAN_TIME;;
            acs_ctl.chn_bitmap = WIFI_ACS_CHAN_LISTS;
            
            ret = lmac_start_acs(ops, &acs_ctl, 1);  //阻塞式扫描
            if(ret != RET_ERR) {
                sys_cfgs.channel = ret;
            }
        }
    }

}

__init static void sys_wifi_parameter_init(void *ops)
{
    lmac_set_rf_pwr_level(ops, WIFI_RF_PWR_LEVEL);
#if WIFI_FEM_CHIP != LMAC_FEM_NONE
    lmac_set_fem(ops, WIFI_FEM_CHIP);   //初始化FEM之后，不能进行RF档位选择！
#endif
    lmac_set_rts(ops, WIFI_RTS_THRESHOLD);
    lmac_set_retry_cnt(ops, WIFI_TX_MAX_RETRY, WIFI_RTS_MAX_RETRY);
    lmac_set_txpower(ops, WIFI_TX_MAX_POWER);
    lmac_set_supp_rate(ops, WIFI_TX_SUPP_RATE);
    lmac_set_max_sta_cnt(ops, WIFI_MAX_STA_CNT);
    lmac_set_mcast_dup_txcnt(ops, WIFI_MULICAST_RETRY);
    lmac_set_max_ps_frame(ops, WIFI_MAX_PS_CNT);
    lmac_set_tx_duty_cycle(ops, WIFI_TX_DUTY_CYCLE);
#if WIFI_SSID_FILTER_EN
    lmac_set_ssid_filter(ops, sys_cfgs.ssid, strlen(sys_cfgs.ssid));
#endif
#if WIFI_PREVENT_PS_MODE_EN
    lmac_set_prevent_ps_mode(ops, WIFI_PREVENT_PS_MODE_EN);
#endif

#ifdef RATE_CONTROL_SELECT
    //lmac_rate_ctrl_mcs_mask(ops, 0);
    lmac_rate_ctrl_type(ops, RATE_CONTROL_SELECT);
#endif
//使用小电流时，就不使用增大发射功率的功率表
#if (WIFI_RF_PWR_LEVEL != 1) && (WIFI_RF_PWR_LEVEL != 2)
    uint8 gain_table[] = {
        125, 125, 105, 100, 85, 85, 64, 64,     // NON HT OFDM
        125, 105, 105, 85,  85, 64, 64, 64,     // HT
        80,  80,  80,  80,                      // DSSS
    };
    lmac_set_tx_modulation_gain(ops, gain_table, sizeof(gain_table));
#endif
}

__init static void sys_wifi_test_mode_init(void *ops)
{
    uint8 default_gain_table[] = {          //gain默认值
        64, 64, 64, 64, 64, 64, 64, 64,     //OFDM
        64, 64, 64, 64, 64, 64, 64, 64,     //HT
        64, 64, 64, 64,                     //DSSS
    };

    lmac_set_tx_modulation_gain(ops, default_gain_table, sizeof(default_gain_table));
#if WIFI_FEM_CHIP != LMAC_FEM_NONE
    lmac_set_fem(ops, WIFI_FEM_CHIP);   //初始化FEM之后，不能进行RF档位选择！
#endif
}

__init static void sys_wifi_init()
{
    void *ops;
    struct lmac_init_param lparam;

#if DCDC_EN
    pmu_dcdc_open();
#endif
    lparam.rxbuf      = WIFI_RX_BUFF_ADDR;
    lparam.rxbuf_size = WIFI_RX_BUFF_SIZE;
    ops = lmac_bgn_init(&lparam);
    // enter wifi test mode
    if(system_is_wifi_test_mode()) {
        sys_wifi_test_mode_init(ops);
        return;
    }
    
    lmac_set_aggcnt(ops,0);
    lmac_set_rx_aggcnt(ops,0);

#if BLE_SUPPORT
	g_ops = ops;
	ble_ll_init(ops);
#endif
    
#ifdef CONFIG_UMAC4

    struct ieee80211_initparam param;
    os_memset(&param, 0, sizeof(param));
    param.vif_maxcnt = 2;
    param.sta_maxcnt = 2;
    param.bss_maxcnt = 2;
    param.bss_lifetime  = 300; //300 seconds
    param.no_rxtask = 1;
    param.evt_cb = sys_wifi_event;
    ieee80211_init(&param);
    ieee80211_support_txw80x(ops);

    sys_wifi_parameter_init(ops);
    ieee80211_iface_create_ap(WIFI_MODE_AP, IEEE80211_BAND_2GHZ);
    ieee80211_iface_create_sta(WIFI_MODE_STA, IEEE80211_BAND_2GHZ);
    
#if NET_TO_QC == 1
	qc_mode = wifi_qc_scan(WIFI_MODE_STA);
#endif
	
	wificfg_flush(WIFI_MODE_STA);
	sys_mode_confirm();
	sys_wifi_start_acs(ops);
	wificfg_flush(WIFI_MODE_AP);
#else
	sys_mode_confirm();
    umac_init();
    umac_add_txw80x(ops);
    sys_wifi_parameter_init(ops);
	sys_wifi_start_acs(ops);
    if (sys_cfgs.wifi_mode == WIFI_MODE_AP) {
        hapd_init();
        hapd_start("hg0");
    } else {
        wpas_init();
        wpas_start("hg0");
    }
#endif

    uint8 txq[][8] = {
        {0x00, 0x00, 0x01, 0x00, 0x02, 0x00, 0x01, 0x00,},
        {0x00, 0x00, 0x01, 0x00, 0x02, 0x00, 0x01, 0x01,},
        {0x00, 0x00, 0x01, 0x00, 0x02, 0x00, 0x01, 0x02,},
        {0x00, 0x00, 0x01, 0x00, 0x02, 0x00, 0x01, 0x03,},
    };


    ieee80211_conf_set_wmm_param( WIFI_MODE_AP, 0xf0, ( struct ieee80211_wmm_param *)&txq[0]);
    ieee80211_conf_set_wmm_param( WIFI_MODE_AP, 0xf1, ( struct ieee80211_wmm_param *)&txq[1]);
    ieee80211_conf_set_wmm_param(WIFI_MODE_AP, 0xf2, ( struct ieee80211_wmm_param *)&txq[2]);
    ieee80211_conf_set_wmm_param(WIFI_MODE_AP, 0xf3, ( struct ieee80211_wmm_param *)&txq[3]);
}

__init static void sys_dhcpd_start()
{
    //使用eloop机制去实现dhcp,所以要在lwip初始化完成并且eloop启动才能使用
    struct dhcpd_param param;
    os_memset(&param, 0, sizeof(param));
    param.start_ip   = sys_cfgs.dhcpd_startip;
    param.end_ip     = sys_cfgs.dhcpd_endip;
    param.netmask    = sys_cfgs.netmask;
    param.router     = sys_cfgs.gw_ip;
    param.dns1       = sys_cfgs.gw_ip;
    param.lease_time = sys_cfgs.dhcpd_lease_time;
    if (dhcpd_start_eloop("w0", &param)) {
        os_printf("dhcpd start error\r\n");
    }
    dns_start_eloop("w0");
}

__init static void sys_network_init(void)
{
    ip_addr_t ipaddr, netmask, gw;
    struct netdev *ndev;
	int offset = sys_cfgs.wifi_mode == WIFI_MODE_STA?WIFI_MODE_STA:WIFI_MODE_AP;
    tcpip_init(NULL, NULL);

    ndev = (struct netdev *)dev_get(HG_WIFI0_DEVID + offset - 1);
    if (ndev) {
        ipaddr.addr  = sys_cfgs.ipaddr;
        netmask.addr = sys_cfgs.netmask;
        gw.addr      = sys_cfgs.gw_ip;
        lwip_netif_add(ndev, "w0", &ipaddr, &netmask, &gw);
        lwip_netif_set_default(ndev);
        if (sys_cfgs.wifi_mode == WIFI_MODE_STA && sys_cfgs.dhcpc_en) {
            lwip_netif_set_dhcp(ndev, 1);
        }
        os_printf("add w0 interface!\r\n");
    }else{
        os_printf("**not find wifi device**\r\n");
    }
}

extern u8_t netif_num;
void close_wifi(void)
{
	struct netdev *ndev;

	if (sys_cfgs.wifi_mode == WIFI_MODE_AP)
	{
		ndev = (struct netdev *)dev_get(HG_WIFI1_DEVID);
	}
	else
	{
		ndev = (struct netdev *)dev_get(HG_WIFI0_DEVID);
	}

	if (ndev)
	{
		lwip_netif_set_dhcp(ndev, 0);
		os_sleep_ms(1);
		lwip_netif_remove(ndev);
		netif_num--;
	}
}

void open_wifi(void)
{
	struct netdev *ndev;
	ip_addr_t ipaddr, netmask, gw;

	if (sys_cfgs.wifi_mode == WIFI_MODE_AP)
	{
		ndev = (struct netdev *)dev_get(HG_WIFI1_DEVID);
		//wificfg_flush(WIFI_MODE_AP);
		wifi_create_ap((char*)sys_cfgs.ssid, sys_cfgs.passwd, WPA_KEY_MGMT_NONE, sys_cfgs.channel);
	}
	else
	{
		ndev = (struct netdev *)dev_get(HG_WIFI0_DEVID);
		//wificfg_flush(WIFI_MODE_STA);
		// wifi_create_station("BGN_test", "12345678", WPA_KEY_MGMT_PSK);
	}

	if (ndev)
	{
		ipaddr.addr  = sys_cfgs.ipaddr;
		netmask.addr = sys_cfgs.netmask;
		gw.addr      = sys_cfgs.gw_ip;
		lwip_netif_add(ndev, "w0", &ipaddr, &netmask, &gw);
		lwip_netif_remove_register(ndev);
		lwip_netif_set_default(ndev);

		if (sys_cfgs.wifi_mode == WIFI_MODE_STA && sys_cfgs.dhcpc_en)
		{
			lwip_netif_set_dhcp(ndev, 1);
		}

		if (sys_cfgs.wifi_mode == WIFI_MODE_AP)
		{
			_os_printf("dhcpd start.....\r\n");
			sys_dhcpd_start();
		}

		os_printf("add w0 interface!\r\n");
	}
	else
	{
		os_printf("**not find wifi device**\r\n");
	}
}


void sys_wifi_close_open_thread(){
	uint8 wifi_action = 0;
	while(1){
		os_sleep_ms(30000);
		
		if(wifi_action){
			wifi_action = 0;
			_os_printf("open wifi..............\r\n");
			open_wifi();
		}else{
			wifi_action = 1;
			_os_printf("close wifi..............\r\n");
			close_wifi();
		}

	}
}

/*
 *	wifi_exchange_mode:  WIFI_MODE_AP or WIFI_MODE_STA
 */
__init static void sys_net_workmode_exchange(uint8  wifi_exchange_mode)
{	
	struct netdev *ndev;
	ip_addr_t ipaddr, netmask, gw;
	if(wifi_exchange_mode == sys_cfgs.wifi_mode){
		return;
	}
	
#ifdef CONFIG_UMAC4
    if(sys_cfgs.wifi_mode == WIFI_MODE_AP){
        ndev = (struct netdev *)dev_get(HG_WIFI1_DEVID);
    }else{
        ndev = (struct netdev *)dev_get(HG_WIFI0_DEVID);
    }
#else
    ndev = (struct netdev *)dev_get(HG_WIFI0_DEVID);
#endif	
	if (ndev){
		lwip_netif_remove(ndev);		
	}


	sys_cfgs.wifi_mode = wifi_exchange_mode;
#ifdef CONFIG_UMAC4
	if(sys_cfgs.wifi_mode == WIFI_MODE_AP){
		ndev = (struct netdev *)dev_get(HG_WIFI1_DEVID);
		//wificfg_flush(WIFI_MODE_AP);
		wifi_create_ap("HG_TEST","12345678",WPA_KEY_MGMT_NONE,5);
	}else{
		ndev = (struct netdev *)dev_get(HG_WIFI0_DEVID);
		//wificfg_flush(WIFI_MODE_STA);
		wifi_create_station("BGN_test","12345678",WPA_KEY_MGMT_PSK);
	}
#else
	ndev = (struct netdev *)dev_get(HG_WIFI0_DEVID);
#endif

	if(ndev){
        ipaddr.addr  = sys_cfgs.ipaddr;
        netmask.addr = sys_cfgs.netmask;
        gw.addr      = sys_cfgs.gw_ip;
        lwip_netif_add(ndev, "w0", &ipaddr, &netmask, &gw);
		lwip_netif_remove_register(ndev);
        lwip_netif_set_default(ndev);
        if (sys_cfgs.wifi_mode == WIFI_MODE_STA && sys_cfgs.dhcpc_en) {
            lwip_netif_set_dhcp(ndev, 1);
        }
		if(sys_cfgs.wifi_mode == WIFI_MODE_AP){
			sys_dhcpd_start();
		}

        os_printf("add w0 interface!\r\n");	
	}else{
        os_printf("**not find wifi device**\r\n");
	}
}


__init ip_addr_t sys_network_get_ip(void){
	return lwip_netif_get_ip2("w0");
}

/********************************************
应用相关的网络应用,eventLoop、默认一些socket
的监听等
********************************************/
__init static void app_network_init()
{
    #define ELOOP_TASK_HEAP 2048
    #define ELOOP_TASK_PRI  10
    //不需要保存的handle用局部变量,需要保存需要用全局
    k_task_handle_t eloop_task_handle;
    eloop_init ();  
    csi_kernel_task_new((k_task_entry_t)user_eloop_run, "eloop_run", NULL, ELOOP_TASK_PRI, 0, NULL, ELOOP_TASK_HEAP, &eloop_task_handle);
    os_sleep_ms(1);
    if (sys_cfgs.wifi_mode == WIFI_MODE_AP) { //AP
        sys_dhcpd_start();
    }
    ota_Tcp_Server();
    set_global_ota_num(pmu_get_boot_code_pos());
    os_printf("ota num:%d\tversion:%d\n",get_global_ota_num(),get_boot_svn_version());
    #if NET_TO_QC == 1
        if (sys_cfgs.wifi_mode == WIFI_MODE_STA){
            sta_send_udp_msg_init();
        }
    #endif

#if USB_EN || JPG_EN
    user_protocol();
#endif


#if SDH_EN && FS_EN   && OPENDML_EN
    extern void recv_record_Server(int port);
    recv_record_Server(43210);

#endif


#ifdef CONFIG_UMAC4
    #if BLE_PAIR_NET == 1
        //配网仅仅支持station模式
        if(sys_cfgs.wifi_mode == WIFI_MODE_STA)
        {
			//关闭wifi
			ieee80211_iface_stop(WIFI_MODE_STA);
			ieee80211_iface_stop(WIFI_MODE_AP);
            //启动蓝牙配网
            //没有配过网络,先进行网络配置
            if(!get_sys_cfgs_ble_pair_status())
            {
                ble_reset_pair_network(38, 1);
            }
            //否则直接发送小无线
            else
            {
                ble_reset_pair_network(38, NULL);
            }

        }
    #endif
#endif




}


uint8 vcam_en()
{
    uint8 ret = TRUE;
#if VCAM_EN
	pmu_vcam_dis();
	os_sleep_ms(1);
    pmu_set_vcam_vol(VCAM_VOL_2V80);
    pmu_vcam_lc_en();
    pmu_vcam_oc_detect_dis();
    pmu_vcam_oc_int_dis();
    pmu_vcam_discharge_dis();
    pmu_vcam_pg_dis();
#ifdef VCAM_33
    pmu_set_vcam_vol(VCAM_VOL_3V25);
    pmu_vcam_en();
    os_sleep_ms(1);
    pmu_vcam_pg_en();
#else
    pmu_vcam_en();
    os_sleep_ms(1);
#endif    
//    sys_reset_pending_clr();
    pmu_vcam_lc_dis();
#ifndef VCAM_33
    pmu_vcam_oc_detect_en();
#endif
    if(PMU_VCAM_OC_PENDING){
        return FALSE;
    }
    pmu_vcam_oc_detect_dis();
    pmu_vcam_oc_int_dis();
    pmu_lvd_oe_en();
#endif
    return ret;
}


void hardware_init(uint8 vcam)
{
	//gpio_set_val(PC_7,1);
	//gpio_iomap_output(PC_7,GPIO_IOMAP_OUTPUT);
    if(vcam == FALSE)
	{
		os_printf("vcam err\n");
        return;
	}



    
    //需要workqueue支持
    stream_work_queue_start();
	#if KEY_MODULE_EN == 1
	keyWork_init(10);
	#endif




#if JPG_EN
  //jpg_cfg(HG_JPG1_DEVID,VPP_DATA0);
    #if 1//SD_SAVE
		extern void jpg_cfg(uint8 jpgid,enum JPG_SRC_FROM src_from);
        jpg_cfg(HG_JPG0_DEVID,VPP_DATA0);
    #endif
#endif
        
#if DVP_EN
	bool csi_ret;
    bool csi_cfg();
    csi_ret = csi_cfg();
#endif



#if LCD_EN
	void lcd_module_run();	
	lcd_module_run();
#endif

#if DVP_EN
    bool csi_open();
	if(csi_ret)
    	csi_open();
#endif

#if SDH_EN && FS_EN
    extern bool fatfs_register();
    sd_open();
    fatfs_register();
#endif

#if SD_SAVE
	void sd_save_thread_start();
    sd_save_thread_start();
#endif


#if AUDIO_EN
	audio_adc_init();
    
#endif

#if AUDIO_DAC_EN
    audio_da_init();
#endif
    

#if USB_EN
    void hg_usb_test(void);
    hg_usb_test();
#endif

#if LCD_EN
	void lvgl_init();
	lvgl_init();
#endif

	//user_hardware_config();
}

static int32 main_loop(struct os_work *work)
{
    static int8 print_interval = 0;
    if (print_interval++ >= 5) {
        uint32 sysheap_freesize(struct sys_heap *heap);
        os_printf("ip:%x  freemem:%d\r\n", lwip_netif_get_ip2("w0").addr,sysheap_freesize(&sram_heap));
        print_interval = 0;
    }

    #ifdef PSRAM_HEAP
        print_custom_psram();
    #endif

    	print_custom_sram();

	os_printf("freemem:%d\r\n", sysheap_freesize(&sram_heap));
    os_run_work_delay(&main_wk, 1000);
	return 0;
}


#ifdef PSRAM_HEAP
    #define CUSTOM_SIZE (5*1024) 
    
#else

	/**********************************************************************
	 * 设置空间默认值(实际根据需求需要修改SYS_HEAP_SIZE以及CUSTOM_SIZE的值
	 * 这里给的默认值只是图传功能,如果是额外增加其他功能,比如录卡等,需要
	 * 自定义
	 * 
	 * 
	 * usb默认给113K
	 * DVP默认给60K
	***********************************************************************/
	#if USB_EN == 1
		#define CUSTOM_SIZE (113*1024) 
	#elif DVP_EN == 1
		#define CUSTOM_SIZE (60*1024)  
	#else
		#define CUSTOM_SIZE (5*1024)
	#endif
#endif

sysevt_hdl_res sysevt_ble_event(uint32 event_id, uint32 data, uint32 priv){
    uint8 mac[6];
    switch(event_id & 0xffff){		
		case SYSEVT_BLE_CONNECTED:
			printf("scan SYSEVT_BLE_CONNECTED.......\r\n");
			printf("ble connected");
			break;
		case SYSEVT_BLE_DISCONNECT:	
			printf("scan SYSEVT_BLE_DISCONNECT.......\r\n");
			break;
		case SYSEVT_BLE_NETWORK_CONFIGURED:
			printf("scan SYSEVT_BLE_NETWORK_CONFIGURED.......\r\n");
			break;
        default:
            printf("no this event(%x)...\r\n", event_id);
            break;
    }
    return SYSEVT_CONTINUE;
}

void tx_sys_init(void)
{
    uint8 vcam;
    vcam = vcam_en();
    // user_io_preconfig();
    sys_event_init(32);
    sys_event_take(SYS_EVENT(SYS_EVENT_WIFI, 0),sysevt_wifi_event,0);
    sys_event_take(SYS_EVENT(SYS_EVENT_BLE, 0),sysevt_ble_event,0);
    sys_atcmd_init();

    sys_cfgs.wifi_mode = WIFI_MODE_STA;

    sys_wifi_init();
    // enter wifi test mode
    if(system_is_wifi_test_mode()) {
        system_reboot_normal_mode();
    } else {
        sys_network_init();
        //dsleep_test_init();
        //udp_kalive_init("192.168.1.100", 60002, SYSTEM_SLEEP_TYPE_SRAM_WIFI, NULL);
#if 1
        hardware_init(vcam);
#endif
        app_network_init();
        mcu_watchdog_timeout(20);
        mcu_watchdog_feed();

        close_wifi();
        open_wifi();

        OS_WORK_INIT(&main_wk, main_loop, 0);
        os_run_work_delay(&main_wk, 1000);
    }
}


int main(void)
{
    uint32 sysheap_freesize(struct sys_heap *heap);
    os_printf("freemem:%d\r\n",sysheap_freesize(&sram_heap));

	#ifdef PSRAM_HEAP
		while(!get_psram_status())
		{
			os_printf("psram no ready:%d\n",get_psram_status());
			os_sleep_ms(1000);
			
		}
	#endif
	//sys_watchdog_pre_init();

	#ifdef PSRAM_HEAP
		#ifdef CUSTOM_PSRAM_SIZE
			#if CUSTOM_PSRAM_SIZE > 0
			{
				void *custom_buf = (void*)os_malloc_psram(CUSTOM_PSRAM_SIZE);
				custom_mem_psram_init(custom_buf,CUSTOM_PSRAM_SIZE);
				print_custom_psram();
			}
			#endif
		#endif
	#endif

    #ifdef CUSTOM_SIZE
        #if CUSTOM_SIZE > 0
        {
            void *custom_buf = (void*)os_malloc(CUSTOM_SIZE);
            custom_mem_init(custom_buf,CUSTOM_SIZE);
            print_custom_sram();
        }
        #endif
    #endif



    //do_global_ctors();
    //wifi_qc_mode_inspect();
    //sys_watchdog_pre_init();

    
    skbpool_init(SKB_POOL_ADDR, SKB_POOL_SIZE, 80, 0);
    sys_cfg_load();

    if (tx_orl.tx_flag) {
        tx_sys_init();
    } else {
        hali_access_main(); /*every each project use this to access*/
    }

    
    pmu_clr_deadcode_pending();
    return 0;
}

