#ifndef __HALI_OTA_H__
#define __HALI_OTA_H__
#include "halibaduo_lib.h"
#include "halibaduo.h"
#include "hali_list_node.h"

#define FLASH_WRITE_MAX_SIZE 1024

enum {
    OP_FIRM_BEGIN = 0,
    OP_FIRM_DATA = 1,
    OP_FIRM_END = 2,
};

struct G_TX_Ota {
	uint8_t is_inited:1;
	uint8_t is_running:1;
	uint8_t is_finish:1;
	uint8_t flag:1;
	uint8_t reserve:4;

	int offset;
}__attribute__((__packed__));

uint8_t hali_ota_handle_event(int event);

uint8_t bkapi_upgrade_init(uint16_t seq_num);
int bkapi_upgrade_data(uint16_t seq_num, char *page, uint32 len);

extern struct G_TX_Ota g_ota;

#endif