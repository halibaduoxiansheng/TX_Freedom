/**
 * Unified tools
 */
#include "halibaduo.h"
#include "halibaduo_lib.h"
#include "hali_list_node.h"
#include "hali_network.h"




struct sensor_ol sensor_ols;

uint8_t hali_sys_port_get_mac(uint8_t *mac)
{
	extern struct sys_config sys_cfgs;
	
	os_memcpy(mac, sys_cfgs.mac, 6);
	return 0;
}

uint8_t hali_sys_port_set_license(void *buf, uint32_t len)
{
    if (len > sizeof(sys_cfgs.license)) {
        return 1;
    }
	memcpy(sys_cfgs.license, buf, len);
	syscfg_save();
	return 0;
}

uint8_t hali_sys_port_get_license(void *buf, uint32_t len)
{
    if (len < sizeof(sys_cfgs.license)) {
        return 1;
    }
	memcpy(buf,sys_cfgs.license,len);
	return 0;
}

uint8_t hali_sys_get_auto_gen_license(struct cProLic *lic)
{
	uint8_t mac[6] = {0};
	
	hali_sys_port_get_mac(mac);
	getlic10_frommac("12345678", mac, (char *)lic->lic);
	os_strcpy(lic->sn, "12345678");

	return 0;
}

