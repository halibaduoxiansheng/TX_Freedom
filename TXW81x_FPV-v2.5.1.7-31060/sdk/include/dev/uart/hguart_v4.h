#ifndef _HGUART_V4_H
#define _HGUART_V4_H

#ifdef __cplusplus
extern "C" {
#endif


/** @brief Simple uart operating handle structure
  * @{
  */
struct hguart_v4 {
    struct uart_device   dev     ;
    uint32               hw      ;
    uart_irq_hdl         irq_hdl ;
    uint32               irq_data;
	uint32 				 tx_total_byte;
	uint32 				 tx_cur_byte;
	uint8				*p_tx_buf;
	struct os_semaphore  sema_tx;
	struct os_mutex      mutex_tx;
	struct os_mutex      mutex_rx;
    uint16               irq_num ;
    uint16               comm_irq_num;
    uint16               opened    :1,
                         use_dma   :1,
                         irq_dma_tx:1,
                         irq_dma_rx:1,
						 debug_uart:1;
};


int32 hguart_v4_attach(uint32 dev_id, struct hguart_v4 *uart);


#ifdef __cplusplus
}
#endif

#endif