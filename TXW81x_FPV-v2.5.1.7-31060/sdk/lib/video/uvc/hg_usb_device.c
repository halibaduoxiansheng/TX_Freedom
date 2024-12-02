
#include "sys_config.h"
#include "typesdef.h"
#include "list.h"
#include "dev.h"
#include "devid.h"
#include "osal/string.h"
#include "osal/semaphore.h"
#include "osal/mutex.h"
#include "osal/msgqueue.h"
#include "osal/irq.h"
#include "osal/task.h"
#include "osal/sleep.h"
#include "tx_platform.h"

#include "hal/usb_device.h"
#include "lib/usb/usb_device_wifi.h"
#include "lib/usb/usb_device_mass.h"
#include "jpgdef.h"
#include "osal/work.h"
#include "osal/event.h"
#include "dev/usb/hgusb20_v1_dev_api.h"
#include "dev/usb/hgusb_dev_tbl.h"
#include "hal/gpio.h"
#include "dev/usb/uvc_host.h"
#include "lib/video/uvc/hg_usb_device.h"
#include "osal/mutex.h"
#include "lib/sdhost/sdhost.h"
#include "video_app_usb.h"

#if 0

#define USB_TEST_WIFI           1
#define USB_TEST_AUDIO          0


struct hg_usb_device_test {
#if USB_TEST_WIFI

    //正常host不需要使用
    #if USB_HOST_EN
    int8   rx_buf[4];   /* usb rx buffer reserved 4byte for no overflow control */
    int8   tx_buf[4];

    #else
    int8   rx_buf[512*16+4];   /* usb rx buffer reserved 4byte for no overflow control */
    int8   tx_buf[512*16];
    #endif
#endif
#if USB_TEST_AUDIO
    int8   rx_buf[512*4+4];
    int8   tx_buf[512*4];
#endif
    int32  ready;
    uint32 total_tx_len;
    uint32 total_rx_len;
    
    struct os_mutex    tx_lock;
	struct os_semaphore    sem;
    struct usb_device *dev;
    struct os_task state_task;
    struct os_task scsi_task;
} usb_test;
#endif
struct hg_usb_device_test usb_test;

#if 1
static void usb_bus_irq_test(uint32 irq, uint32 param1, uint32 param2, uint32 param3)
{
    switch (irq) {
        case USB_DEV_RESET_IRQ: 
            os_printf("reset\r\n");
			os_sema_up(&usb_test.sem);
            //usb_device_wifi_read(usb_test.dev, usb_test.rx_buf, sizeof(usb_test.rx_buf));
            usb_test.ready = 1;
            break;
        case USB_DEV_SUSPEND_IRQ: break;
        case USB_DEV_RESUME_IRQ: break;
        case USB_DEV_SOF_IRQ: break;
        case USB_DEV_CTL_IRQ: break;
        case USB_EP_RX_IRQ: 
            //os_printf("rx=%d\r\n", param3);
            usb_test.total_rx_len += param3;
			if(usb_test.ready)
				os_sema_up(&usb_test.sem);
            break;
        case USB_EP_TX_IRQ: 
            //os_printf("tx_ok\r\n");
            //os_mutex_unlock(&usb_test.tx_lock);
            //usb_test.ready = 1;
            usb_test.total_tx_len += param3;
            break;
        default:
            break;
    }
}

uint32_t scsi_count = 0;
extern struct sdh_device *sdh_test;
void usb_scsi_rqu_deal() {
	
	if(get_cbw()) {
		scsi_count++;
		os_mutex_lock(&sdh_test->lock,osWaitForever);
		scsi_cmd_analysis();
		os_mutex_unlock(&sdh_test->lock);
	} 
    usb_device_mass_read(usb_test.dev, usb_test.rx_buf, sizeof(usb_test.rx_buf));
}


void usb_dev_thread() {
    usb_bulk_init();
    init_usb_disk_buf();
	while(1){
		os_sema_down(&usb_test.sem, osWaitForever);
        //_os_printf("os_sema_count end is %d\r\n",os_sema_count(&usb_test.sem));
		//ui进入usb模式已经一些sd卡处理
		//enter_usb_mode();
		//_os_printf("T");
		usb_scsi_rqu_deal();

        //usb_device_mass_write(usb_test.dev, usb_test.rx_buf, usb_test.total_rx_len);
        //os_printf("usb_dev_thread rx %u  tx %u\r\n",usb_test.total_rx_len,usb_test.total_tx_len);
        usb_test.total_rx_len = 0;
        usb_test.total_tx_len = 0;
        //else{
		//	if(chktime == 2){
		//		if(get_tf_state() == SD_READ || get_tf_state() == SD_WRITE)
		//			sd_StopTran_Semaphore(&sdc_dev);	
//
		//		sd_IsOnLine_Semaphore(&sdc_dev);
		//	
		//	}
		//}
	}//
}


static void hg_usb_test_state(void *argument)
{
    os_printf("hg_usb_test_state running ...\r\n");
    while (1) {
        os_sleep(5);
        os_printf("RX/TX Speed:%dKB/s, %dKB/s\r\n",
                  (usb_test.total_rx_len / 1024) / 5,
                  (usb_test.total_tx_len / 1024) / 5);
        usb_test.total_rx_len = 0;
        usb_test.total_tx_len = 0;
    }
}






struct os_semaphore     global_delay_sem;
//struct test_start         global_start;
k_task_handle_t global_delay_test_handle;
k_task_handle_t global_uvc_handle;





#if 0
//需要查找有没有足够bank才能去kick
void delay_kick(void *d)
{
    global_start.dev = NULL;
    global_start.buf = NULL;
    global_start.len = 0;
    while(1)
    {
        os_sema_down(&global_delay_sem, osWaitForever); 
        if(global_start.dev)
        {
            os_sleep_ms(1);
            //_os_printf("d:%d\n",krhino_sys_tick_get()-time);
            //time = krhino_sys_tick_get();

            usb_uvc_rx_kick_dma_start(global_start.dev,(uint32)global_start.buf,global_start.len);

        }
    }
}
#endif

extern void uvc_user2(void *d);
int32 usb_host_uvc_ioctl(struct usb_device *p_usb_d, uint32 cmd, uint32 param1, uint32 param2);

void hg_usb_disable()
{
    usb_device_request_irq(usb_test.dev, NULL, 0);

}

uint8 uvc_ioctl_index(uint8 uvc_idx){
    uint8 msgbuf[1];
    uint8* pt;

    struct usb_device *dev;
    dev = usb_test.dev;
    pt = msgbuf;
    pt[0] = uvc_idx;
    return usb_host_uvc_ioctl(dev,USB_HOST_IO_CMD_SET_IDX,(uint32)msgbuf[0],0);   
}




k_task_handle_t uvcavi_handle;
extern void uvc_avi_thread(void *d);
extern void uvc_user3(void *d);
extern void uvc_user();
struct uvc_user_arg uvc_arg;
void usb_hub_device_insert(struct hgusb20_dev *p_dev);
int enum_deal= 0;
extern int usb_dma_irq_times;
static void usb_host_enum_task(void *argument)
{
    struct hgusb20_dev *p_dev = (struct hgusb20_dev *)argument;
    while (1) {
        os_sema_down(&p_dev->usb_os_msg->ep0_sema, osWaitForever);                              //收到connect信号，开始枚举        
        bool usb_uvc_host_enum(struct hgusb20_dev *p_dev);
        usb_uvc_host_enum(p_dev);
		enum_deal = 1;
    }
}



struct usb_connect_workqueue
{
    struct os_work wk;
    void *arg;
};

int32 usb_iso_device_connect_det_loop(struct os_work *work)
{
    struct usb_connect_workqueue *usb_connect_work = (struct usb_connect_workqueue*)work;
    struct hgusb20_dev *p_dev = (struct hgusb20_dev *)usb_connect_work->arg;
	static uint32_t count_iso = 0;

	_os_printf("enum_deal:%d  count_iso:%d  usb_dma_irq_times:%d\r\n",enum_deal,count_iso,usb_dma_irq_times);
	if(enum_deal)
    {
		if(count_iso == usb_dma_irq_times)
        {
            os_printf("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!%s\n",__FUNCTION__);
			hgusb20_host_reset_phy(p_dev);	
			enum_deal = 0;
		}
		count_iso = usb_dma_irq_times;
	}
	os_run_work_delay(work, 2000);
    return 0;
}
void usb_iso_device_connect_det(void *argument){
    struct hgusb20_dev *p_dev = (struct hgusb20_dev *)argument;
	int count_iso = 0;
	while(1){
		_os_printf("enum_deal:%d  count_iso:%d  usb_dma_irq_times:%d\r\n",enum_deal,count_iso,usb_dma_irq_times);
		if(enum_deal){
			if(count_iso == usb_dma_irq_times){
				hgusb20_host_reset_phy(p_dev);	
				enum_deal = 0;
			}
			count_iso = usb_dma_irq_times;
		}
		os_sleep_ms(2000);
	}
}

void usb_host_task_init(struct hgusb20_dev *p_dev)
{
    static struct usb_connect_workqueue usb_connect_work;
    os_sema_init(&p_dev->usb_os_msg->ep0_sema, 0);
	os_sema_init(&p_dev->usb_os_msg->hub_sema, 0);
	os_sema_init(&p_dev->usb_os_msg->hub_finish_sema, 0);
    OS_TASK_INIT((const uint8 *)"USB_ENUM", &p_dev->usb_os_msg->ep0_task,
                 usb_host_enum_task, (uint32)p_dev, OS_TASK_PRIORITY_BELOW_NORMAL, 2048);
	
    OS_TASK_INIT((const uint8 *)"USB_HUB", &p_dev->usb_os_msg->ep0_hub_task,
                 usb_hub_device_insert, (uint32)p_dev, OS_TASK_PRIORITY_BELOW_NORMAL, 1024);	
	
    //OS_TASK_INIT((const uint8 *)"USB_DISCONN", &p_dev->usb_os_msg->ep0_usb_connect_task,usb_iso_device_connect_det, (uint32)p_dev, OS_TASK_PRIORITY_BELOW_NORMAL, 1024);	
    usb_connect_work.arg = (void*)p_dev;
    OS_WORK_INIT(&usb_connect_work.wk, usb_iso_device_connect_det_loop, 0);
    os_run_work_delay(&usb_connect_work.wk, 1000);
}

void uvc_user4(void *d);
void hg_usb_test(void)
{
#if USB_HOST_EN
    os_printf("hg_usb20_test init2 \r\n");
    os_sema_init(&global_delay_sem, 0);

    //csi_kernel_task_new((k_task_entry_t)delay_kick, "delay_kick", 0, 40, 0, NULL, 512,&global_delay_test_handle);
    //os_sleep_ms(1000);
    usb_test.dev = (struct usb_device *)dev_get(HG_USBDEV_DEVID);
    if (usb_test.dev) {
        usb_host_task_init((struct hgusb20_dev *)usb_test.dev);
        if (!usb_device_open(usb_test.dev, NULL)) {
            _os_printf("%s:%d\n",__FUNCTION__,__LINE__);
            uint32 usb_host_bus_irq(uint32 irq, uint32 param1, uint32 param2, uint32 param3);
			
            usb_device_request_irq(usb_test.dev, usb_host_bus_irq, (int32)usb_test.dev);
        }
    }
    uvc_sema_init();
#if         TEST_UVC_DEBUG
    csi_kernel_task_new((k_task_entry_t)uvc_user2, "uvc_user2", usb_test.dev, 15, 0, NULL, 1024,&global_uvc_handle);
#else
	//csi_kernel_task_new((k_task_entry_t)uvc_user, "uvc_user", usb_test.dev, 15, 0, NULL, 1024,&global_uvc_handle);
    #if LCD_EN == 1
    extern void my_user(void *d);
    //csi_kernel_task_new((k_task_entry_t)my_user, "uvc_user4", usb_test.dev, 15, 0, NULL, 1024,&global_uvc_handle);
    #else
    //csi_kernel_task_new((k_task_entry_t)uvc_user, "uvc_user", usb_test.dev, 15, 0, NULL, 1024,&global_uvc_handle);
		#ifndef PSRAM_HEAP
		usb_jpeg_stream_init();
		#endif
    #endif
#endif
 

    //uvc_user2();
#else

	os_printf("hg_usb20_test init \r\n");
	usb_test.dev = (struct usb_device *)dev_get(HG_USBDEV_DEVID);
	_os_printf("usb_test.dev add:%x\r\n",(unsigned int)usb_test.dev);
	//struct hgusb20_dev *p_dev = (struct hgusb20_dev *)usb_test.dev;
	//if(!os_mutex_init(&p_dev->tx_lock)) {
	//	  _os_printf("failed mutex init\r\n");
	//}
	os_sema_init(&usb_test.sem, 0);
	//_os_printf("os_sema_count start is %d\r\n",os_sema_count(&usb_test.sem));
	////mass_ep_init(usb_test.dev);
	if (usb_test.dev) {
		if (!usb_device_mass_open(usb_test.dev)) 
		{
			usb_device_mass_auto_tx_null_pkt_disable(usb_test.dev);
			usb_device_request_irq(usb_test.dev, (usbdev_irq_hdl)usb_bus_irq_test, (int32)usb_test.dev);
			////mass_ep_init(usb_test.dev);
			//os_printf("hg_usb20_test start \r\n");
////
			//csi_kernel_task_new((k_task_entry_t)usb_dev_thread, "scsi_task", NULL, 9, 0, NULL, 1024, &usb_test.scsi_task);
			//csi_kernel_task_new((k_task_entry_t)usb_disk_write_thread, "sd_task", NULL, 9, 0, NULL, 4096, &usb_test.sd_task);
			OS_TASK_INIT("scsi_task",&usb_test.scsi_task, usb_dev_thread, NULL, OS_TASK_PRIORITY_NORMAL, 2048);//1024也可
			//OS_TASK_INIT("sd_task",&usb_test.sd_task, usb_disk_write_thread, NULL, OS_TASK_PRIORITY_NORMAL, 4096);
//
		}
	}

#endif

    
}
#endif





