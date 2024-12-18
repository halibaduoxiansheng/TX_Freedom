#include "hali_network.h"
#include "csi_kernel.h"
#include "hali_energy.h"
#include "hali_ota.h"
#include "hali_led.h"
#include "hali_picture.h"
#include "hali_wifi.h"


enum Con_Type{
    CON_TCP = 1,
    CON_UDP = 2,
};

enum{
	DEV_TYPE_BK7231U_V1 = 1,
	DEV_TYPE_BK7231U_V5 = 5,
};

struct G_TX_Gsensor {
    uint8_t open:1;
    uint8_t reserve:7;
};
struct G_TX_Gsensor tx_gsr;

struct G_TX_License {
    uint8_t lic_done:1;
    uint8_t lic_auto_gen:1;
    uint8_t reserve:6;
};
struct G_TX_License g_lic;


enum{
	EVT_TYPE_EAR = 1,
	EVT_TYPE_EAR_V2	= 2,	
};

enum {
	CPRO_DEVINFO_GET 	= 1,
	CPRO_LIC_GET = 2,
	CPRO_LIC_SET = 3,
	CPRO_OPEN_VIDEO = 4,
	CPRO_CLOSE_VEIDEO = 5,
	CPRO_UPDATE_START = 6,
	CPRO_UPDATE_DATA = 7,
	CPRO_UPDATE_END = 8,
	CPRO_EVENT_NOTIFY = 9,
	CPRO_LED_CONTROL = 10,
	CPRO_NAK_HANDLE = 11,
	CPRO_COMMON_CONTROL = 12, //add by zhangwei 20210714
	CPRO_CAMERACONFALL_GET = 13,
	CPRO_CAMERACONF_SET = 14,
	CPRO_NOTIFYPORT_SET = 15,
	CPRO_EXPOSURE_GET = 16,
	CPRO_EXPOSURE_SET = 17,
	CPRO_PARAMETER_GET = 18,
	CPRO_PARAMETER_SET = 19,
	CPRO_CHANG_EVENT_PORT = 20,
	CPRO_LOWPOWERMODE = 21,
	CPRO_OPEN_VIDEO_GRAB = 22,
	CPRO_UPDATEMCU_START = 23,
	CPRO_UPDATEMCU_DATA = 24,
	CPRO_UPDATEMCU_END = 25,
	CPRO_DATA_SET = 26,
	CPRO_RECORD_STATUS_SYNC = 27,

};

#define HALI_BUF_SIZE 1024
#define MAGIC_HEADER 0xffeeffee
struct G_TX_NET { // use IPV4 
    uint8_t is_inited:1;
    uint8_t type:3;
    uint8_t reserve:4;

    int socket;
    uint16_t port;
    struct in_addr addr;

    uint8_t priority;

    uint16_t interval;
    uint8_t buffer[HALI_BUF_SIZE];

    void *thread; /* one object , one thread */
    uint16_t stack_size; /* Bytes +4 */

    uint8_t name[10];
    
    void (*thread_func)(void *);
}__attribute__((packed));
struct G_TX_NET tx_net_0;
struct G_TX_NET tx_net_1;
struct G_TX_NET tx_net_2;

struct cProDevInfo{ /* although many member variables are redundant, but in order to adapt, we should keep it */
	uint8_t type;
	uint8_t vendor[CPRO_INFO_SIZE];
	uint8_t product[CPRO_INFO_SIZE];
	uint8_t version[16];	
	uint8_t ssid[CPRO_INFO_SIZE];
	uint8_t mac[6];
	uint8_t gsensor			:1;
	uint8_t isLowPowerOff	:7;
	uint8_t isCharge 		:1;
	uint8_t battery			:7;
	uint8_t capacity; //add by zhangwei 20210714
	uint8_t workMode; //add by zhangwei 20210728 for c3 work mode;
	int8_t motorOnoff; //add by zhangwei 20210728 for c3 work mode;
	uint8_t havecamera_control: 1;
	uint8_t havechangeport: 1;
	uint8_t ishaveLowPowerMode: 1;
	uint8_t usedbyotherapp: 1;
	uint8_t timeset: 1;
	uint8_t haveaudio: 1;
	uint8_t recordStatusSync: 1;
	uint8_t reserved2: 1;
	uint8_t reserved[2];
	uint8_t camerastatus :4;
	uint8_t picchangeid :4;
}__attribute__((__packed__));

struct eventSetEar{
	uint8_t type;
	uint8_t isCharge 		:1;
	uint8_t battery			:7;
	uint8_t isSensorOk		:1;
	uint8_t isLowPowerOff	:7;
	uint8_t workMode;		//add by zhangwei 20210728 for ypc c3 mode must > 1
	int8_t motorOnOff;		//add by zhangwei 20210729 for ypc c3 motor on off notify
	uint8_t picbutton  :4;
	uint8_t videobutton :4;
	uint8_t zoomdown :4;
	uint8_t zoomup :4;
	uint8_t mac[2];
	uint8_t frozen:4; 	//frozee button
	uint8_t mirror:4;	//mirror button
	uint8_t reserverd[7];
}__attribute__((__packed__));

volatile uint16_t lseqNo = 0;


/**
 * write yourself protocol in there
 */
struct cProHeader {
    int32_t	 	head;	/*protocol magic*/ // CPRO_BASIC_MAGIC
	uint16_t 	seqNo;
	uint16_t 	cid; /*Connection ID*/
	int8_t 		reFlag;	/* return flag 0: ok !=0 something error */
    int8_t 		ackNeed;	/* command */
	uint16_t 	len;  /* body data size */
};
#define CPRO_HDR_SIZE sizeof(struct cProHeader)


/**
 * protocol func write here, if user want add some protocol or modify somewhere , is there
 */
static uint8_t app_deal_set_license(uint8_t *buffer, int size) // param0: body data, param1: body data size
{
    uint8_t ret = 0;
    if (buffer == NULL || size <= 0) {
        printf("the args form set license is NULL or less than 0\r\n");
        return 1;
    }
    struct cProLic *t_lic = (struct cProLic *)buffer;
    memset(t_lic, 0, sizeof(struct cProLic));

    ret = hali_sys_port_set_license((void *)t_lic, (uint32_t)sizeof(struct cProLic)); /* set license to cache */
    if (ret == 1) {
        return 2;
    }

    return 0;
}

static uint8_t app_deal_get_licnese(uint8_t *buffer, int *size) // param0: body data, param1: rev all size
{
    uint8_t ret = 0;
    if (buffer == NULL || *size <= 0) {
        printf("the args form set license is NULL or less than 0\r\n");
        return 1;
    }
    struct cProLic *t_lic = (struct cProLic *)buffer;
    memset(t_lic, 0, sizeof(struct cProLic));

    if (g_lic.lic_done) { /* license already set */
        memcpy(t_lic, sys_cfgs.license, sizeof(struct cProLic));
    } else {
        if (g_lic.lic_auto_gen) {
            ret = hali_sys_get_auto_gen_license(t_lic);
            memcpy(sys_cfgs.license, t_lic, sizeof(struct cProLic));
            g_lic.lic_done = 1;
            syscfg_save();
        } else {
            ret = hali_sys_port_get_license((void*)t_lic, (uint32_t)sizeof(struct cProLic));
            if (ret == 1) {
                printf("struct of cProLic is invail\r\n");
                return 2;
            } else { /* get license success */
                printf("OK=>SN:%s!\r\n", t_lic->sn);
            }
            g_lic.lic_done = 1;
        }
    }
    *size = sizeof(struct cProLic);
    return 0;
}

static uint8_t app_deal_get_devinfo(uint8_t *buffer, int *size, struct sockaddr_in *addr) // param0: data buffer, param1: rev all size param2: client addr pointer
{
    if (buffer == NULL || *size < 0 || addr == NULL ) {
        printf("FUN:%s -> someone of args is invail\r\n",__FUNCTION__);
        return 1;
    }
    
    struct cProDevInfo *info = (struct cProDevInfo*)buffer;
    memset(info, 0, sizeof(struct cProDevInfo));

    /* fill in local information */
    info->type = DEV_TYPE_BK7231U_V5;
    memcpy(info->vendor, HALI_DEFAULT_OEM, strlen(HALI_DEFAULT_OEM));
    memcpy(info->version, HALI_DEFAULT_VER, strlen(HALI_DEFAULT_VER));
    memcpy(info->product, HALI_DEFAULT_PRO, strlen(HALI_DEFAULT_PRO));
    memcpy(info->ssid, HALI_AP_PREFIX, strlen(HALI_AP_PREFIX));
    memcpy(info->mac, sys_cfgs.mac, sizeof(sys_cfgs.mac));
    info->gsensor = tx_gsr.open;
    // info->capacity = // TODO 待看哪里需要
    info->battery = tx_power.tx_battery;
    info->isCharge = tx_power.is_charging;
    info->isLowPowerOff = tx_power.need_remind_battery;

    /* not use now */
    info->haveaudio = 0; /* audio flag */
    info->recordStatusSync = 0; /* recoder flag */

    // info->usedbyotherapp = // TODO 

    *size = sizeof(struct cProDevInfo);
    pic_client_info_exist_check(addr);

    return 0;
}

static uint8_t app_deal_upgrade(uint8_t cid, uint8_t *buffer, int size) // param0: request ID, param1: rev all data,param2: rev all data size
{
    if (buffer == NULL || size <= sizeof(struct cProHeader) || cid < 0) {
        printf("someone args is invail,please check it\r\n");
        return 1;
    }

    int ret = 0;
    struct cProHeader *prohdr = (struct cProHeader *)buffer;

    if (cid == CPRO_UPDATE_START) {
        uint16_t sSize = FLASH_WRITE_MAX_SIZE;
        memcpy(buffer + sizeof(struct cProHeader), &sSize, sizeof(uint16_t));
        hali_ota_handle_event(OP_FIRM_BEGIN);
        return (bkapi_upgrade_init(prohdr->seqNo) < 0 ? 1 : 0);
    } else if (cid == CPRO_UPDATE_DATA) {
        hali_ota_handle_event(OP_FIRM_DATA);
        ret = bkapi_upgrade_data(prohdr->seqNo, buffer + sizeof(struct cProHeader), buffer - sizeof(struct cProHeader));
		return (ret < 0 ? -ret : 0);
    } else { // end
        g_ota.is_finish = 1;
		hali_ota_handle_event(OP_FIRM_END); 
    }

    return 0;
}

static uint8_t app_deal_control_led(uint8_t *buffer, int *size)
{
    uint8_t ret = 0;
    if (buffer == NULL || *size < 0) {
        printf("led control func receive invail args \r\n");
        return 1;
    }
    struct cProLed *led = (struct cProLed *)buffer; /* reveive data to modify local led status */
    ret = hali_appLibLedCallBack(led);
    return ret;
}

static uint8_t app_deal_nak_handle(uint8_t *buffer, int size)
{
    if (buffer == NULL || size < 0) {
        printf("app_deal_nak_handle error\r\n");
        return 1;
    }
    printf("===== not support this command now (11) =====\r\n");
    return 0;
}

static uint8_t app_deal_common_control(uint8_t *buffer, int *size)
{
    if (buffer == NULL || *size < 0) {
        printf("app_deal_common_control error\r\n");
        return 1;
    }
    printf("===== not support this command now (12) =====\r\n");
    return 0;
}

static uint8_t app_recoder_status_set(uint8_t *buffer, int *size)
{
    if (buffer == NULL || *size < 0) {
        printf("app_recoder_status_set error\r\n");
        return 1;
    }
    printf("===== not support this command now (27) =====\r\n");
    return 0;
}

// TODO 出图卡顿问题 十分有可能出现在这个地方
static int app_deal_open_video(int sockfd, struct sockaddr_in *addr, uint8_t *payload, uint8_t force_grab)
{
	uint16_t port = 0;
	struct jpg_device *jpeg_dev;
	
	if(!addr){
		return 1;
	}
	
	if(tx_pic->open_flag == 0) {
		
    } else {
		if(tx_camera_offline_check() == 0)
		{
			hali_video_close();	
            tx_pic->open_flag = 0;
		}
	}
	
	__disable_irq();
	g_wifi.connect_sock = sockfd;
    pic_client_info_exist_check(addr);
	if(payload){
		os_memcpy(&port, payload, sizeof(uint16_t));
		g_wifi.port = htons(port);
	}
	__enable_irq();

	printf("pic port:%d\r\n", g_wifi.port);	

	if(tx_camera_offline_check() == 0)
	{
		jpg_recfg(0);
		jpg_start(0);
		hali_video_open();
        tx_pic->open_flag = 1;
	}

	return 0;
}

uint8_t app_deal_close_video(struct sockaddr_in *addr)
{
    if (addr == NULL) {
        printf("app_deal_close_video error\r\n");
        return 1;
    }
    pic_client_info_delete(addr);
}


static void _get_mac_from_cache(char *mac)
{
	memcpy(mac, sys_cfgs.mac, sizeof(sys_cfgs.mac));
}


// TODO this place should encode
void hali_demo_thread_func_0(void *arg)
{
    if (arg == NULL) {
        while(1) {
            os_sleep_ms(3000);
            printf("no args working\r\n");
        }
    }
    struct G_TX_NET *net = (struct G_TX_NET *)arg;
    fd_set rdset;
    int ret = 0;
    struct timeval tv = {0, 200000};
    for(;; os_sleep_ms(net->interval)) {
        if (!net->is_inited && g_wifi.is_connected) {
            struct sockaddr_in _addr;
            _addr.sin_family = AF_INET;
            _addr.sin_addr.s_addr = inet_addr(INADDR_ANY); /* Accept connection requests from any available network interface */
            _addr.sin_port = htons(net->port); /* 16-bit data in host byte order is converted to network byte order. */

            /* auto choose suitable protocol */
            net->socket = socket(AF_INET, net->type, 0); 
            if (net->socket < 0) {
                printf("socket create failed!\r\n");
                os_sleep_ms(500);
                net->is_inited = 0;
                continue;
            }
            ret = bind(net->socket, (struct sockaddr *)&_addr, sizeof(struct sockaddr));
            if (ret == -1) {
                printf("bind failed!\r\n");
                if (net->socket) {
                    close(net->socket);
                    net->socket = 0;
                }
                os_sleep_ms(500);
                net->is_inited = 0;
                continue;
            }

            net->is_inited = 1; /* if code can run to there, mean everything is normal */
        } else {
            mcu_watchdog_feed();
            os_sleep_ms(500);
            continue;
        }

        if (g_wifi.is_connected) {
            FD_ZERO(&rdset);
            FD_SET(net->socket, &rdset); // if you add a socket, you should add there

            ret = select(net->socket+1, &rdset, NULL, NULL, &tv);  // read  ==0: timeout <0: error >0:  data ready
            if (ret < 0) {
                printf("select failed\r\n");
                os_sleep_ms(500); // TODO 
                net->is_inited = 0;
                continue;
            } else if (ret == 0) {
                continue;
            }

            if (FD_ISSET(net->socket, &rdset)) {
                // hendle request ready
                struct sockaddr_in client_addr;
                int rev_len = 0;
                socklen_t addr_len = 0;

                struct cProHeader *header; /* receive header */
                struct cProBody *body; /* receive body */
                rev_len = recvfrom(net->socket, net->buffer, sizeof(net->buffer), 0, (struct sockaddr *)&client_addr, &addr_len); /* keep client addr for the next snedto */

                struct cProHeader *rev_header_demo = (struct cProHeader *)net->buffer;
                
                if (rev_header_demo->head != MAGIC_HEADER) {
                    printf("bad magic header\r\n");
                    return -1;
                }
                
                // private protocol
                int send_len = 0; /* send size after analyze data */
                switch (rev_header_demo->cid) 
                {
                    // TODO the following func need to be accomplish 
                    case CPRO_LIC_SET:
                        rev_header_demo->reFlag = app_deal_set_license(net->buffer + CPRO_HDR_SIZE, rev_len - CPRO_HDR_SIZE);
                        rev_header_demo->len = 0;
                        send_len = CPRO_HDR_SIZE; /* no body data, just send header back */
                        break;
                    case CPRO_LIC_GET:
                        rev_header_demo->reFlag = app_deal_get_licnese(net->buffer + CPRO_HDR_SIZE, &rev_len);
                        rev_header_demo->len = rev_len; /* license size */
                        send_len = CPRO_HDR_SIZE + rev_len; /* header + send our license back*/
                        break;
                    case CPRO_DEVINFO_GET:
                        rev_header_demo->reFlag = app_deal_get_devinfo(net->buffer + CPRO_HDR_SIZE, &rev_len, &client_addr);
                        rev_header_demo->len = rev_len;
                        send_len = CPRO_HDR_SIZE + rev_len;
                        break;
                    case CPRO_UPDATE_START:
                    case CPRO_UPDATE_DATA:
                    case CPRO_UPDATE_END:
                        rev_header_demo->reFlag = app_deal_upgrade(rev_header_demo->cid, net->buffer, rev_len);
                        if (rev_header_demo->cid == CPRO_UPDATE_START) {
                            rev_header_demo->len = sizeof(uint16_t);
                        } else {
                            rev_header_demo->len = 0;
                        }
                        send_len = CPRO_HDR_SIZE + rev_header_demo->len;
                        break;
                    case CPRO_LED_CONTROL:
                        rev_header_demo->reFlag = app_deal_control_led(net->buffer + CPRO_HDR_SIZE, &rev_len);
                        send_len = CPRO_HDR_SIZE + rev_header_demo->len;
                        break;
                    case CPRO_NAK_HANDLE:
                        rev_header_demo->reFlag = app_deal_nak_handle(net->buffer + CPRO_HDR_SIZE, rev_len - CPRO_HDR_SIZE);
                        send_len = CPRO_HDR_SIZE;
                        rev_header_demo->len = 0;
                        break;
                        /*  !!! change rev_header_demo->len to the body data size */
                    case CPRO_COMMON_CONTROL:
                        rev_header_demo->reFlag = app_deal_common_control(net->buffer + CPRO_HDR_SIZE, &rev_header_demo->len);
                        send_len = rev_header_demo->len + CPRO_HDR_SIZE;
                        break;
                    case CPRO_RECORD_STATUS_SYNC:
                        rev_header_demo->reFlag = app_recoder_status_set(net->buffer + CPRO_HDR_SIZE, &rev_header_demo->len);
                        send_len = rev_header_demo->len + CPRO_HDR_SIZE;
                        break;
                    default: 
                        printf("invail cid:%d\r\n", rev_header_demo->cid);
                        rev_header_demo->reFlag = 2; /* mean this cid is not exists */
                        send_len = rev_len;
                        break;
                }
                sendto(net->socket, net->buffer, send_len, 0, (struct sockaddr *)&client_addr, addr_len);
                memset(net, 0, sizeof(struct G_TX_NET));
            }
        } else {
            os_sleep_ms(500);
        }   
    }
}

void hali_demo_thread_func_1(void *arg)
{
    if (arg == NULL) {
        while(1) {
            os_sleep_ms(3000);
            printf("no args working\r\n");
        }
    }
    struct G_TX_NET *net = (struct G_TX_NET *)arg;
    fd_set rdset;
    int ret = 0;
    struct timeval tv = {0, 200000};
    for(;; os_sleep_ms(net->interval)) {
        if (!net->is_inited && g_wifi.is_connected) {            
            struct sockaddr_in _addr;

            _addr.sin_family = AF_INET;
            _addr.sin_addr.s_addr = inet_addr(INADDR_ANY); /* Accept connection requests from any available network interface */
            _addr.sin_port = htons(net->port); /* 16-bit data in host byte order is converted to network byte order. */

            /* auto choose suitable protocol */
            net->socket = socket(AF_INET, net->type, 0); 
            if (net->socket < 0) {
                printf("socket create failed!\r\n");
                os_sleep_ms(500);
                net->is_inited = 0;
                continue;
            }
            ret = bind(net->socket, (struct sockaddr *)&_addr, sizeof(struct sockaddr));
            if (ret == -1) {
                printf("bind failed!\r\n");
                if (net->socket) {
                    close(net->socket);
                    net->socket = 0;
                }
                os_sleep_ms(500);
                net->is_inited = 0;
                continue;
            }

            net->is_inited = 1; /* if code can run to there, mean everything is normal */
        } else {
            mcu_watchdog_feed();
            os_sleep_ms(500);
            continue;
        }

        if (g_wifi.is_connected) {
            FD_ZERO(&rdset);
            FD_SET(net->socket, &rdset); // if you add a socket, you should add there

            ret = select(net->socket+1, &rdset, NULL, NULL, &tv);  // read  ==0: timeout <0: error >0:  data ready
            if (ret < 0) {
                printf("select failed\r\n");
                os_sleep_ms(500);
                net->is_inited = 0;
                continue;
            } else if (ret == 0) {
                continue;
            }

            if (FD_ISSET(net->socket, &rdset)) {
                // hendle request ready
                struct sockaddr_in client_addr;
                int rev_len = 0;
                socklen_t addr_len = 0;

                struct cProHeader *header; /* receive header */
                struct cProBody *body; /* receive body */
                rev_len = recvfrom(net->socket, net->buffer, sizeof(net->buffer), 0, (struct sockaddr *)&client_addr, &addr_len); /* keep client addr for the next snedto */

                struct cProHeader *rev_header_demo = (struct cProHeader *)net->buffer;
                
                if (rev_header_demo->head != MAGIC_HEADER) {
                    printf("bad magic header\r\n");
                    return -1;
                }
                
                // private protocol
                int send_len = 0; /* send size after analyze data */
                switch (rev_header_demo->cid) 
                {
                    // TODO the following func need to be accomplish 
                    case CPRO_OPEN_VIDEO:
                    case CPRO_OPEN_VIDEO_GRAB:
                        rev_header_demo->reFlag = app_deal_open_video(net->socket, &client_addr, net->buffer + CPRO_HDR_SIZE, (rev_header_demo->cid == CPRO_OPEN_VIDEO ? 0 : 1));
                        rev_header_demo->len = 0;
                        send_len = rev_header_demo->len + CPRO_HDR_SIZE;
                        break;
                    case CPRO_CLOSE_VEIDEO:
                        rev_header_demo->reFlag = app_deal_close_video(&client_addr);
                        rev_header_demo->len = 0;
                        send_len = rev_header_demo->len + CPRO_HDR_SIZE;
                        break;
                    case CPRO_NAK_HANDLE:
                        rev_header_demo->reFlag = app_deal_nak_handle(net->buffer + CPRO_HDR_SIZE, rev_len);
                        send_len = CPRO_HDR_SIZE;
                        rev_header_demo->len = 0;
                        break;
                    default: 
                        printf("invail cid:%d\r\n", rev_header_demo->cid);
                        rev_header_demo->reFlag = 2; /* mean this cid is not exists */
                        send_len = rev_len;
                        break;
                }
                sendto(net->socket, net->buffer, send_len, 0, (struct sockaddr *)&client_addr, addr_len);
                memset(net, 0, sizeof(struct G_TX_NET));
            }   
        } else {
            os_sleep_ms(500);
        }
    }
}

void hali_demo_thread_func_2(void *arg)
{
    if (arg == NULL) {
        while(1) {
            os_sleep_ms(3000);
            printf("no args working\r\n");
        }
    }
    struct G_TX_NET *net = (struct G_TX_NET *)arg;
    int ret = 0;
    for (;; os_sleep_ms(net->interval)) {
        if (!net->is_inited && g_wifi.is_connected) {
            struct sockaddr_in _addr;

            _addr.sin_family = AF_INET;
            _addr.sin_addr.s_addr = inet_addr(INADDR_ANY); /* Accept connection requests from any available network interface */
            _addr.sin_port = htons(net->port); /* 16-bit data in host byte order is converted to network byte order. */

            /* auto choose suitable protocol */
            net->socket = socket(AF_INET, net->type, 0); 
            if (net->socket < 0) {
                printf("socket create failed!\r\n");
                os_sleep_ms(500);
                net->is_inited = 0;
                continue;
            }

            net->is_inited = 1; /* if code can run to there, mean everything is normal */
        } else {
            mcu_watchdog_feed();
            os_sleep_ms(500);
            continue;
        }

        if (g_wifi.is_connected) {
            uint8_t response[128] = {0}, tmac[6] = {0};	
            struct sockaddr_in addr;	
            struct cProHeader *prohdr = (struct cProHeader *)response;
            struct eventSetEar *evtset = (struct eventSetEar *)(response+CPRO_HDR_SIZE);
            uint8_t status;

            evtset->type = EVT_TYPE_EAR_V2;

            if(g_wifi.is_connected == 0) {
                return 0;
            }
            //sensor status
            evtset->isSensorOk = !sensor_ols.offline_flag;
            
            prohdr->cid = CPRO_EVENT_NOTIFY;
            prohdr->head = MAGIC_HEADER;
            prohdr->len = sizeof(struct eventSetEar);
            prohdr->ackNeed = 0;
            prohdr->seqNo = lseqNo++;
            prohdr->reFlag = 0;

            
            _get_mac_from_cache(tmac);
            evtset->mac[0] = tmac[4];
            evtset->mac[1] = tmac[5];

            // addr.sin_family = AF_INET;
            // addr.sin_port = htons(pctxd->port);	
            memcpy(&addr.sin_addr, &net->addr, sizeof(net->addr));
            sendto(net->socket, (void *)response, CPRO_HDR_SIZE + prohdr->len, 0,
                (struct sockaddr *)&addr, sizeof(struct sockaddr_in));
        } else {
            os_sleep_ms(500);
        }
    }
}

void hali_thread_func_register(struct G_TX_NET *net)
{
    if (net == &tx_net_0) {
        net->thread_func = hali_demo_thread_func_0;
    } else if (net == &tx_net_1) {
        net->thread_func = hali_demo_thread_func_1;
    } else if (net == &tx_net_2) {
        net->thread_func = hali_demo_thread_func_2;
    } else {
        printf("this is big problem \r\n");
    }
}

void hali_network_init(struct G_TX_NET *net)
{
    if (net == NULL) {
        printf("network init failed, because of net is NULL\r\n");
    }

    hali_thread_func_register(net);
}

void hali_network_register(void)
{
    memset(&tx_net_0, 0, sizeof(struct G_TX_NET));
    memcpy(tx_net_0.name, "net_0", strlen("net_0"));
    tx_net_0 = (struct G_TX_NET) {
        .is_inited = 0,
        .interval = 200,
        .priority = 9,
        .stack_size = 1024,
        .type = CON_UDP,
        .port = 10005,
    };

    memset(&tx_net_1, 0, sizeof(struct G_TX_NET));
    memcpy(tx_net_1.name, "net_1", strlen("net_1"));
    tx_net_1 = (struct G_TX_NET) {
        .is_inited = 0,
        .interval = 200,
        .priority = 9,
        .stack_size = 1024,
        .type = CON_UDP,
        .port = 10006,
    };

    memset(&tx_net_2, 0, sizeof(struct G_TX_NET));
    memcpy(tx_net_2.name, "net_2", strlen("net_2"));
    tx_net_2 = (struct G_TX_NET) {
        .is_inited = 0,
        .interval = 2000,
        .priority = 9,
        .stack_size = 1024,
        .type = CON_UDP,
        .port = 10007,
    };
    // add thread ,please add there
    
    hali_network_init(&tx_net_0);
    hali_network_init(&tx_net_1);
    hali_network_init(&tx_net_2);
}

void hali_network_thread_start(void)
{
    void *thread_0, *thread_1, *thread_2;
    printf("net task ready to run\r\n");

    // TODO 为什么？ 不能使用 tx_net_0.thread
    // csi_kernel_task_new((k_task_entry_t)tx_net_0.thread_func, tx_net_0.name, NULL, tx_net_0.priority, 0, NULL, tx_net_0.stack_size, &tx_net_0.thread);
    csi_kernel_task_new((k_task_entry_t)tx_net_0.thread_func, tx_net_0.name, (void*)&tx_net_0, tx_net_0.priority, 0, NULL, tx_net_0.stack_size, &thread_0); // this is ok? why?
    csi_kernel_task_new((k_task_entry_t)tx_net_1.thread_func, tx_net_1.name, (void*)&tx_net_1, tx_net_1.priority, 0, NULL, tx_net_1.stack_size, &thread_1);
    csi_kernel_task_new((k_task_entry_t)tx_net_2.thread_func, tx_net_2.name, (void*)&tx_net_2, tx_net_2.priority, 0, NULL, tx_net_2.stack_size, &thread_2);
}
