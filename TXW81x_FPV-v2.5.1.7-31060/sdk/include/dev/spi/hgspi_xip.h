#ifndef _HGSPI_XIP_H_
#define _HGSPI_XIP_H_
#include "hal/spi.h"

#ifdef __cplusplus
extern "C" {
#endif

enum hgsdio20_flags {
    hgspi_xip_flags_ready,
    hgspi_xip_flags_suspend,
};

struct hgspi_xip {
    struct spi_device       dev;
    uint32                  hw;
    
    uint32                  flags;
#ifdef CONFIG_SLEEP
    uint32                  regs[25];
#endif    
};

struct hgcqspi {
    //struct qspi_device      dev;
    void                   *hw;
    uint32                  irq_num;
    //qspi_irq_hdl            irq_hdl;
    uint32                  irq_data;
    uint32                  opened;
    uint32                  flags;
};


struct hgxip_flash_custom_read
{
    uint8_t dummys; //最大31,内部默认有24个dummys
    uint8_t cmd;
    uint16_t size; 
    uint32_t addr;
    uint8_t *buf;
};

enum MSROM_FUNC
{
    MSROM_MEMSET,
    MSROM_MEMCPY,
    MSROM_MEMCMP,
    MSROM_STRCASECMP,
    MSROM_QSPI_CMD_BUSY_WAIT = MSROM_STRCASECMP, 
    MSROM_STRNCASECMP,
    MSROM_HIGHPASS_FILTER_100HZ_ASM = MSROM_STRNCASECMP,
    MSROM_QSPI_XIP_ERASE,
    MSROM_QSPI_XIP_READ,
    MSROM_QSPI_XIP_WRITE,
    MSROM_QSPI_XIP_OPT_ENTER,
    MSROM_QSPI_XIP_OPT_EXIT,
    MSROM_QSPI_ENTER_XIP_MODE,
    MSROM_QSPI_EXIT_XIP_MODE,
    MSROM_QSPI_STIG,
    MSROM_OSPI_PSRAM_MRR,
    MSROM_OSPI_PSRAM_MRW,
    MSROM_OSPI_STIG,
};

int32 hgspi_xip_attach(uint32 dev_id, struct hgspi_xip *p_spi);
uint32_t get_msrom_func(uint32_t func_code);

#ifdef __cplusplus
}
#endif

#endif /* _HGSPI_V1_H_ */

