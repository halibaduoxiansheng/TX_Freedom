/*****************************************************************************
* Module    : usb
* File      : usb_dev_mass.h
* Author    : 
* Function  : USB mass������һЩ����
*****************************************************************************/
#ifndef USB_DEV_s_H
#define USB_DEV_mass_H

#ifdef __cplusplus
 extern "C" {
#endif
#define USB_DISK_BUF_COUNT 1
#define USB_DISK_BUF_SIZE 512
typedef struct 
{

	uint32_t bufSize;		//不变,USB_DISK_BUF_SIZE
	uint32_t count;			//写入扇区的数量
	uint32_t lba;				//扇区偏移
	uint16_t isFree;		 //是否空闲
	uint16_t type;		 //1:是写   2:是读
	//uint8_t 	usbbuf[USB_DISK_BUF_SIZE];//改呀
	uint8_t 	*usbbuf;//改呀
	struct os_semaphore sem;
}usb_disk_buf;

int32 usb_device_mass_open(struct usb_device *p_usb_d);
int32 usb_device_mass_close(struct usb_device *p_usb_d);
int32 usb_device_mass_auto_tx_null_pkt_disable(struct usb_device *p_usb_d);
int32 usb_device_mass_auto_tx_null_pkt_enable(struct usb_device *p_usb_d);
int32 usb_device_mass_write(struct usb_device *p_usb_d, int8 *buff, uint32 len);
int32 usb_device_mass_read(struct usb_device *p_usb_d, int8 *buff, uint32 len);
void mass_ep_init(struct usb_device *p_usb_d);
int8_t get_cbw(void);
int32_t scsi_cmd_analysis(void);
void usb_bulk_init(void);
void clr_usb_disk();
void usb_disk_write_thread(void *d);
void init_usb_disk_buf();
//int8_t init_usb_disk_buf(usb_disk_buf **disk);
//void clr_usb_disk(usb_disk_buf **disk);
#ifdef __cplusplus
}
#endif


#endif
