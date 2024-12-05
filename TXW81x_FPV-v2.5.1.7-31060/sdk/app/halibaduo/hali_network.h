#ifndef __HALI_NETWORK_H__
#define __HALI_NETWORK_H__
#include "halibaduo_lib.h"
#include "halibaduo.h"
#include "hali_list_node.h"


#define CPRO_INFO_SIZE 32
struct cProLic{
	char sn[CPRO_INFO_SIZE];
	char lic[144];
}__attribute__((__packed__));


void hali_network_register(void);

void hali_network_thread_start(void);


#endif