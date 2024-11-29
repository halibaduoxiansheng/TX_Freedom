#ifndef __PSRAM_CFG
#define __PSRAM_CFG

/**********************************************************************************
该文件主要为了配置psram的
————PSRAM_DEF:定义了psram初始化的文件名,内部会进行psram的初始化
————PSRAM_SELECT:是选择了哪个psram的参数文件信息,所以要从PSRAM_DEF中选择

注意:该文件只要修改PSRAM_SELECT的值,其他不要修改,不然可能会生成失败
***********************************************************************/
#define PSRAM_DEF(name)	name
#define PSRAM_SELECT(name)	name##select
enum psram_cfg_enum
{
	PSRAM_DEF(NONE),
    PSRAM_DEF(2MByte),
    PSRAM_DEF(4MByte),
    PSRAM_DEF(8MByte),
#if 1
	PSRAM_SELECT(4MByte), 
#else 
    PSRAM_SELECT(8MByte), /* if you using the development board, choose this */
#endif
};


#endif