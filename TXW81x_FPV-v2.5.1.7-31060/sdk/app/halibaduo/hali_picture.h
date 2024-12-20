#ifndef __HALI_PICTURE_H__
#define __HALI_PICTURE_H__
#include "halibaduo_lib.h"
#include "halibaduo.h"
#include "hali_list_node.h"



#define MAX_CLIENT_NUM 4
struct G_TX_PIC {
    uint8_t open_flag:1;
    uint8_t have_client:1; // hava remote client connect
    uint8_t client_num:3;
    uint8_t client_index:3;

    int sockfd;
    struct sockaddr_in addr;
	uint16_t img_port;	/* image port*/
    stream *s;

    struct os_mutex mutex;
};
struct G_TX_PIC *tx_pic;
extern struct G_TX_PIC pic_client[MAX_CLIENT_NUM];



void hali_picture_register(void);

void hali_pic_thread_start(void);


void hali_video_open(void);
void hali_video_close(void);


#endif