#include "flash_read_demo.h"

extern struct os_mutex *get_syscfg_lock();
uint8_t flash_read_uuid_demo()
{
    uint8_t id[64] = {0};
    struct hgxip_flash_custom_read flash_param;
    struct os_mutex *mutex = get_syscfg_lock();
    struct syscfg_info info;
    struct spi_nor_flash *flash;
    if (syscfg_info_get(&info)) {
        return -ENXIO;
    }

    //这里默认flash1和flash2是同一个,这里就不做判断
    flash = info.flash1;
    //设置读取flash的参数命令
    flash_param.dummys = 8;
    flash_param.cmd = 0x4b; //flash读取id的命令
    flash_param.size = 64;  //id正常是3byte,如果超过3byte,则会循环读取
    flash_param.addr = 0;
    flash_param.buf = id;
    os_mutex_lock(mutex, osWaitForever);
    spi_nor_open(flash);
    spi_nor_custom_read(flash, (uint32_t)&flash_param);
    spi_nor_close(flash);
    os_mutex_unlock(mutex);

    for(int i=0;i<64;i++)
    {
        if(i%16 == 0)
        {
            _os_printf("\r\n");
        }
        _os_printf("%02X ",id[i]);
    }
    _os_printf("\r\n");
    return 0;
}