#include "hali_led.h"
#include "hali_button.h"




struct Double_link_list *tx_dlink_head = NULL;
struct Double_link_list *tx_dlink_tail = NULL;
uint8_t button_structure_size = 0;

void double_link_init(void)
{
	if (tx_double_link.is_init == 0) {
		tx_dlink_head = (struct Double_link_list *)malloc(sizeof(struct Double_link_list));
		tx_dlink_tail = (struct Double_link_list *)malloc(sizeof(struct Double_link_list));

		tx_dlink_head->prev = tx_dlink_tail;
		tx_dlink_head->next = NULL;

		tx_dlink_tail->next = tx_dlink_head;
		tx_dlink_tail->prev = NULL;
		tx_double_link.is_init = 1;
	} else {
		// printf("we already init double link list\r\n");
	}
}


void double_link_deinit(void) /* Regardless of type， all deinit */
{
	if (tx_double_link.is_init == 0) {
		printf("double link list not init\r\n");
	} else {
		struct Double_link_list *temp = tx_dlink_head->next;
		while(temp) {
			if (temp->next) {
				temp = temp->next;
				free(temp->prev);
				temp->prev = NULL;
			} else {
				free(temp);
				temp = NULL;
			}
		}
		if (tx_dlink_head)
			free(tx_dlink_head);
		tx_dlink_head = NULL;
		tx_double_link.is_init = 0;
	}
}

/**
 * head is nothing
 */
struct Double_link_list* double_button_link_insert(struct Double_link_list *head, struct Double_link_list * tail, enum INSERT_TYPE type, void *data)
{
	struct Double_link_list *temp = head;
	struct Double_link_list *node = NULL;

	/* is this first node add to list */
	if (head->next == NULL && tail->prev == NULL) { 
		node = (struct Double_link_list*)malloc(sizeof(struct Double_link_list)); // the new add node
		if (node == NULL) {
			printf("malloc node failed\r\n");
			return NULL;
		}
		head->next = node;
		tail->prev = node;
		node->prev = head;
		node->next = tail;
	} else {
		node = (struct Double_link_list*)malloc(sizeof(struct Double_link_list)); // the new add node
		while(temp->next != tail) { // find the last one
			temp = temp->next;
		}
		temp->next = node;
		tail->prev = node;
		node->next = tail;
		node->prev = temp;
	}

	node->type = type;
	/**
	 * XXX just apply pointer self room, we need apply room for this stature
	 */
	if (type == LED_TYPE) {
		node->led = (struct G_TX_LED *)malloc(sizeof(struct G_TX_LED)); // never failed,if failed, just die
		node->led = (struct G_TX_LED *)data;
	}
	else if (type == BUTTON_TYPE) {
		node->button = (struct G_TX_BUTTON *)malloc(button_structure_size); // 无奈之举！！！ss
		node->button = (struct G_TX_BUTTON *)data;
	}
	return node;
}



