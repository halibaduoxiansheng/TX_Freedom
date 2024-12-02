#include "hali_ota.h"
#include "../../include/lib/ota/fw.h"

#define UPGRADE_MAGIC 0x66778899


struct G_TX_Ota g_ota;

struct firmwareHeader
{
	int32_t magic;	 /*Firmware Magic*/
	uint8_t md5[32]; /*firmware md5*/
	int32_t size;	 /*firmware size*/
} __attribute__((__packed__));

typedef struct bkSoc_UpgradeCtx_t
{
	uint8_t have_init;
	uint8_t *wr_buf;
	uint16_t wr_last_len;
	uint32 flash_address;
	uint32 flash_len;
	uint8_t *wr_tmp_buf;

	uint16_t seqno_init; // 总序号的指 给到ota的初始值
	uint16_t seqno_data; // fireware seqno(从 seqno_init开始)
	struct firmwareHeader fw_header;
	int32_t rcv_size;
	uint8_t upgrade_ok;
} bkSoc_UpgradeCtx;
bkSoc_UpgradeCtx bkUpgrade = {.have_init = 0};

uint8_t hali_ota_handle_event(int event)
{
	if (event == OP_FIRM_BEGIN)
	{
		if (!g_ota.is_inited) {
			memset(&g_ota, 0, sizeof(g_ota));
			g_ota.offset = 0; // emphasize
		}
#if DVP_EN
		void *dvp = (void *)dev_get(HG_DVP_DEVID);
		if (dvp)
		{
			dvp_close(dvp);
		}
#endif

#if USB_EN
		SYSCTRL_REG_OPT(sysctrl_usb20_clk_close());
#endif
		delay_ms(200);
	}
	else if (event == OP_FIRM_DATA) 
	{
		mcu_watchdog_feed();
	}
	else if (event == OP_FIRM_END)
	{
		mcu_watchdog_feed();
		printf("reveive all ota data finish\r\n");
	}
	return 0;
}

uint8_t bkapi_upgrade_init(uint16_t seq_num)
{
	uint32 status;

	if (bkUpgrade.have_init == 1)
	{
		os_printf("upgrade have init!!! something wrong\r\n");
		if (bkUpgrade.seqno_init != seq_num)
		{
			os_printf("new seqno:%d/%d upgrade init\r\n", bkUpgrade.seqno_init, seq_num);
		}
	}

	bkUpgrade.wr_buf = NULL;
	bkUpgrade.wr_tmp_buf = NULL;
	bkUpgrade.wr_last_len = 0;
	bkUpgrade.seqno_init = seq_num;
	bkUpgrade.seqno_data = 0;
	bkUpgrade.upgrade_ok = 0;
	bkUpgrade.have_init = 1;

	return 0;
}

/**
 * @seq_num : must be zero
 * @param page : data buffer (去除 协议头的 开始位置)
 * @param len : data length (above len)
 */
int bkapi_upgrade_data(uint16_t seq_num, char *page, uint32 len)
{
	struct firmwareHeader *fhead = NULL;
	char *pay = NULL;
	uint32 paylen;
	int res = 0;

	if (!page || !len)
	{
		return 0;
	}
	if (bkUpgrade.have_init == 0)
	{ // to be sure is inited
		return -1;
	}
	fhead = &(bkUpgrade.fw_header);
	pay = page;
	paylen = len;

	// 双重保证 为ota的start帧后的第二帧
	if ((seq_num == (bkUpgrade.seqno_init + 1)) && (g_ota.flag == 0))
	{
		if (g_ota.flag == 1)
		{
			return 0;
		}
		g_ota.flag = 1;
		os_printf("first upgrade data:%d\r\n", seq_num);
		bkUpgrade.seqno_data = seq_num;
		// init firmware struct
		if (len < sizeof(struct firmwareHeader))
		{
			os_printf("upgrade head wrong:%d\r\n", len);
			return -2;
		}
		os_memcpy(fhead, page, sizeof(struct firmwareHeader));
		if (fhead->magic != UPGRADE_MAGIC)
		{
			os_printf("firmare invaild[0x%x]\r\n", fhead->magic);
			return -3;
		}

		pay += sizeof(struct firmwareHeader); // pay 从此是从 firmwareHeader 后的开始 (只有第一次会发送 暂时只使用两个 size 和 magic)
		paylen -= sizeof(struct firmwareHeader);
	}
	else if (seq_num != (bkUpgrade.seqno_data + 1))
	{ // 帧没按顺序发 掉了帧
		// return successl just send ack to peer  may be disorder
		os_printf("data seq wrong:%d/%d\r\n", seq_num, bkUpgrade.seqno_data);
		return 0;
	}
	if (paylen > FLASH_WRITE_MAX_SIZE)
	{
		os_printf("data too big:%d\r\n", len);
		return -4;
	}

	if (bkUpgrade.rcv_size + paylen == fhead->size)
	{ // last received data
		os_printf("firmware last part receive\r\n");
		if (libota_write_fw(fhead->size, g_ota.offset, pay, paylen))
		{
			os_printf("firmware last write failed\r\n");
			return -5;
		}
		os_printf("firmware wirte finish check it\r\n");
		return 0;
	}
	else if (bkUpgrade.rcv_size + paylen > fhead->size)
	{ // error
		os_printf("firmware size attack:[%d/%d]\r\n", bkUpgrade.rcv_size + paylen, fhead->size);
		return -8;
	}
	else
	{ // normal
		res = libota_write_fw(fhead->size, g_ota.offset, pay, paylen);
		if (res)
		{
			os_printf("libota_write_fw is error is %d!!!", res);
			return -5;
		}
		else
		{
			bkUpgrade.rcv_size += paylen;
			bkUpgrade.seqno_data = seq_num;
			g_ota.offset += paylen;
			os_printf("firmware wirte successful[%d:%d/%d]\r\n", bkUpgrade.seqno_data, bkUpgrade.rcv_size, bkUpgrade.fw_header.size);
		}
	}
	return 0;
}
