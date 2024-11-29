#ifndef __HALI_LIST_NODE_H__
#define __HALI_LIST_NODE_H__
#include "halibaduo_lib.h"
#include "halibaduo.h"


enum INSERT_TYPE {
	LED_TYPE = 0,
	BUTTON_TYPE = 1,
};

struct G_TX_Double_link{
    uint8_t is_init:1;
    uint8_t reserve:7;
}__attribute__((packed));
struct G_TX_Double_link tx_double_link;

typedef struct Double_link_list{
	struct G_TX_Button *button;
    struct G_TX_LED *led;
    /* if you want add then add member in there */

	struct Double_link_list *prev;
	struct Double_link_list *next;
}Double_link_list_t;
extern struct Double_link_list *tx_dlink_head;
extern struct Double_link_list *tx_dlink_tail;
/*  head->prev -> tail     tail->next -> head */


void double_link_init(void);
struct Double_link_list* double_button_link_insert(struct Double_link_list *head, struct Double_link_list * tail, enum INSERT_TYPE type, void *data);


#endif