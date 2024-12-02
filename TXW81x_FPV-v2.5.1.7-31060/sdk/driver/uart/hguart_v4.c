/**
 * @file hguart_v4.c
 * @author bxd
 * @brief simple uart
 * @version 
 * TXW81X
 * @date 2023-08-02
 * 
 * @copyright Copyright (c) 2023
 * 
 */
#include "typesdef.h"
#include "list.h"
#include "errno.h"
#include "dev.h"
#include "osal/irq.h"
#include "osal/semaphore.h"
#include "osal/mutex.h"
#include "osal/string.h"
#include "hal/uart.h"
#include "dev/uart/hguart_v4.h"
#include "hguart_v4_hw.h"


#define SIMPLE_UART_LOCK(mutex, flag)\
	do{\
		if(flag){\
			os_mutex_lock(mutex, osWaitForever);\
		}\
	}while(0);

#define SIMPLE_UART_UNLOCK(mutex, flag)\
	do{\
		if(flag){\
			os_mutex_unlock(mutex);\
		}\
	}while(0);



/**********************************************************************************/
/*                        UART LOW LAYER FUNCTION                                 */
/**********************************************************************************/

static int32 hguart_v4_set_dma(struct hguart_v4 *dev, uint32 enable)
{

    if (enable) {
        dev->use_dma = 1;
    } else {
        dev->use_dma = 0;
    }

    return RET_OK;
}


static int32 hguart_v4_dma_rx_config(struct hguart_v4_hw *p_uart, uint8 status)
{
    uint32 _dmacon = p_uart->DMACON;
	uint32 flag = 0;

    if (status) {
        _dmacon = 0x5;
    } else {
        _dmacon = 0;
    }

	/*!
	 * fix: kick 2 times to counteract an unnecessary rx dma done
	 */
	if (p_uart->CON & LL_SIMPLE_UART_CON_DMA_IE) {
		p_uart->CON &=~ LL_SIMPLE_UART_CON_DMA_IE;
		flag = 1;
        //printf("<%x>", *(uint32 *)(0x40004b70));
	}
	
    p_uart->DMACON = _dmacon;
	
	__NOP();__NOP();__NOP();__NOP();
    
    //printf("<%x>", *(uint32 *)(0x40004b70));

	//clear rx done pending
	p_uart->CON |= LL_SIMPLE_UART_CON_CLRDMAPEND;

	//kick again
	p_uart->DMACON = _dmacon;
	
	__NOP();__NOP();__NOP();__NOP();
    
    //printf("<%x>", *(uint32 *)(0x40004b70));

	//clear rx done pending
	p_uart->CON |= LL_SIMPLE_UART_CON_CLRDMAPEND;

	//printf("<%x>", *(uint32 *)(0x40004b70));

	if (flag) {
		flag = 0;
		p_uart->CON |= LL_SIMPLE_UART_CON_DMA_IE;
	}

    return 0;
}

static int32 hguart_v4_dma_tx_config(struct hguart_v4_hw *p_uart, uint8 status)
{
    uint32 _dmacon = p_uart->DMACON;

    if (status) {
        _dmacon = 0xA;
    } else {
        _dmacon = 0;
    }

    p_uart->DMACON = _dmacon;

    return 0;
}


static int32 hguart_v4_set_time_out(struct hguart_v4_hw *p_uart, uint32 time_bit, uint32 enable)
{

    if (enable) {
        p_uart->CON |= LL_SIMPLE_UART_CON_TO_EN;

        p_uart->TOCON = LL_SIMPLE_UART_TOCON(time_bit);
    } else {
        p_uart->CON &=~ LL_SIMPLE_UART_CON_TO_EN;
        p_uart->TOCON = 0;
    }


    return RET_OK;
}


/**********************************************************************************/
/*                          UART ATTCH FUNCTION                                   */
/**********************************************************************************/
static int32 hguart_v4_open(struct uart_device *uart, uint32 baudrate) {

    struct hguart_v4    *dev = (struct hguart_v4 *)uart;
    struct hguart_v4_hw *hw  = (struct hguart_v4_hw *)dev->hw;

    if (dev->opened) {
        return RET_OK;
    }

    /* pin config */
    if (pin_func(dev->dev.dev.dev_id , 1) != RET_OK) {
        return RET_ERR;
    }

    /* reg config */
    hw->BAUD = (peripheral_clock_get(HG_APB0_PT_UART4) / baudrate) - 1;
    hw->CON  = LL_SIMPLE_UART_CON_UARTEN;

    dev->opened     = 1;
    dev->irq_dma_rx = 0;
    dev->irq_dma_tx = 0;
    dev->use_dma    = 0;

    return RET_OK;
}

static int32 hguart_v4_close(struct uart_device *uart) {

    struct hguart_v4    *dev = (struct hguart_v4 *)uart;
    struct hguart_v4_hw *hw  = (struct hguart_v4_hw *)dev->hw;

    if (!dev->opened) {
        return RET_OK;
    }

    irq_disable(dev->irq_num       );
    pin_func(dev->dev.dev.dev_id, 0);
    hw->CON &= ~ LL_SIMPLE_UART_CON_UARTEN;

    dev->opened     = 0;
    dev->irq_dma_rx = 0;
    dev->irq_dma_tx = 0;
    dev->use_dma    = 0;

    return RET_OK;
}

static int32 hguart_v4_putc(struct uart_device *uart, int8 value) {

    struct hguart_v4    *dev = (struct hguart_v4 *)uart;
    struct hguart_v4_hw *hw  = (struct hguart_v4_hw *)dev->hw;

    if (!dev->opened) {
        return RET_ERR;
    }

	SIMPLE_UART_LOCK(&dev->mutex_tx, dev->debug_uart);

    if (dev->opened && (hw->CON & LL_SIMPLE_UART_CON_UARTEN)) {
        while(!(hw->CON & LL_SIMPLE_UART_CON_TXBUFEMPTY));
        hw->DATA = value;
		SIMPLE_UART_UNLOCK(&dev->mutex_tx, dev->debug_uart);
        return RET_OK;
    } else {
		SIMPLE_UART_UNLOCK(&dev->mutex_tx, dev->debug_uart);
        return -EIO;
    }
}

static uint8 hguart_v4_getc(struct uart_device *uart) {

    struct hguart_v4    *dev = (struct hguart_v4 *)uart;
    struct hguart_v4_hw *hw  = (struct hguart_v4_hw *)dev->hw;

    if (!dev->opened) {
        return RET_ERR;
    }

	SIMPLE_UART_LOCK(&dev->mutex_rx, dev->debug_uart);
	
    while(!(hw->CON & LL_SIMPLE_UART_CON_RXBUFNOTEMPTY));
    hw->CON |= LL_SIMPLE_UART_CON_CLRRXDONE;

	SIMPLE_UART_UNLOCK(&dev->mutex_rx, dev->debug_uart);
	
    return hw->DATA;
}

static int32 hguart_v4_puts(struct uart_device *uart, uint8 *buf, uint32 size) {

    struct hguart_v4    *dev = (struct hguart_v4 *)uart;
    struct hguart_v4_hw *hw  = (struct hguart_v4_hw *)dev->hw;

    uint32 i = 0;

    if (!dev->opened) {
        return RET_ERR;
    }

	SIMPLE_UART_LOCK(&dev->mutex_tx, dev->debug_uart);

    if (dev->use_dma) {
		if (dev->debug_uart) {
			//enable uart 1Byte tx done irq
			hw->CON |= LL_SIMPLE_UART_CON_UARTTXIE;

			dev->p_tx_buf 	   = (uint8 *)buf;
			dev->tx_total_byte = size;
			dev->tx_cur_byte   = 0;

			//printf("len:%d\r\n", dev->tx_total_byte);

			//send 1Byte to trigger 1Byte tx done irq
			hw->DATA = buf[0];
		
			os_sema_down(&dev->sema_tx, osWaitForever);

			//disable uart 1Byte tx done irq
			hw->CON &=~ LL_SIMPLE_UART_CON_UARTTXIE;
		} else {
	        for (i = 0; i < size; i++) {
	            hguart_v4_putc(uart, buf[i]);
	        }
		}
    } else {
        for (i = 0; i < size; i++) {
            hguart_v4_putc(uart, buf[i]);
        }
    }

	SIMPLE_UART_UNLOCK(&dev->mutex_tx, dev->debug_uart);

    return RET_OK;
}

static int32 hguart_v4_gets(struct uart_device *uart, uint8 *buf, uint32 size) {

    struct hguart_v4 *dev = (struct hguart_v4 *)uart;
    struct hguart_v4_hw *hw  = (struct hguart_v4_hw *)dev->hw;
    uint32 i = 0;

    if (!dev->opened) {
        return RET_ERR;
    }

	SIMPLE_UART_LOCK(&dev->mutex_rx, dev->debug_uart);

    if (dev->use_dma) {
        hw->DMAADR = (uint32)buf;
        hw->DMALEN = size;
        hguart_v4_dma_rx_config(hw, 1);
    } else {
        for (i = 0; i < size; i++) {
            hguart_v4_getc(uart);
        }
    }

	SIMPLE_UART_UNLOCK(&dev->mutex_rx, dev->debug_uart);
	
    return i;
}

static int32 hguart_v4_ioctl(struct uart_device *uart, enum uart_ioctl_cmd ioctl_cmd, uint32 param1, uint32 param2) {

    int32  ret_val = RET_OK;
    struct hguart_v4    *dev = (struct hguart_v4 *)uart;

    if ((!dev->opened)) {
        return RET_ERR;
    }

    switch (ioctl_cmd) {
        case (UART_IOCTL_CMD_USE_DMA):
            ret_val = hguart_v4_set_dma(dev, param1);
            break;
        case (UART_IOCTL_CMD_SET_TIME_OUT):
            ret_val = hguart_v4_set_time_out((struct hguart_v4_hw *)dev->hw, param1, param2);
            break;
		case (UART_IOCTL_CMD_DISABLE_DEBUG_SELECTION):
			dev->debug_uart = (param1) ? (1) : (0);
			ret_val = RET_OK;
			break;
        default:
            ret_val = -ENOTSUPP;
            break;
    }

    return ret_val;
}

/* interrupt handler */
static void hguart_v4_irq_handler(void *data) {

    struct hguart_v4    *dev = (struct hguart_v4 *)data;
    struct hguart_v4_hw *hw  = (struct hguart_v4_hw *)dev->hw;

    if ((hw->CON & LL_SIMPLE_UART_CON_UARTTXIE) && (hw->CON & LL_SIMPLE_UART_CON_TXDONE)) {
		hw->CON |= LL_SIMPLE_UART_CON_CLRTXDONE;
		
		dev->tx_cur_byte++;
		//printf("cur len:%d\r\n", dev->tx_cur_byte);
		if (dev->tx_cur_byte == dev->tx_total_byte) {
			//printf("up\r\n");
			os_sema_up(&dev->sema_tx);
			//diable uart tx 1byte done irq
			hw->CON &=~ LL_SIMPLE_UART_CON_UARTTXIE;
		} else {
	 		hw->DATA = dev->p_tx_buf[dev->tx_cur_byte];
		}   
    }

    if ((hw->CON & LL_SIMPLE_UART_CON_UARTRXIE) && (hw->CON & LL_SIMPLE_UART_CON_RXBUFNOTEMPTY)) {
        hw->CON |= LL_SIMPLE_UART_CON_CLRRXDONE;
        if (dev->irq_hdl) {
            dev->irq_hdl(UART_IRQ_FLAG_RX_BYTE, dev->irq_data, hw->DATA, 0);
        }
    }

    if ((hw->CON & LL_SIMPLE_UART_CON_FERRIE) && (hw->CON & LL_SIMPLE_UART_CON_FERR)) {
        hw->CON |= LL_SIMPLE_UART_CON_CLRFERR;
        if (dev->irq_hdl) {
            dev->irq_hdl(UART_IRQ_FLAG_FRAME_ERR, dev->irq_data, 0, 0);
        }
    }

    //UART4/5 TIMEOUT来了之后，DMA DONE也会起来，故DMA DONE中断之前要判断是否TIMEOUT
    if (!(hw->CON & LL_SIMPLE_UART_CON_TO_PENDING)) {
        if ((hw->CON & LL_SIMPLE_UART_CON_DMA_IE) && (hw->CON & LL_SIMPLE_UART_CON_DMAPEND)) {
            hw->CON |= LL_SIMPLE_UART_CON_CLRDMAPEND;
            if (dev->irq_hdl) {
                if (dev->irq_dma_rx) {
                    dev->irq_hdl(UART_IRQ_FLAG_DMA_RX_DONE, dev->irq_data, hw->DMACNT, 0);
                } else {
                    dev->irq_hdl(UART_IRQ_FLAG_DMA_TX_DONE, dev->irq_data, hw->DMACNT, 0);
                }
            }
        }
    } else {
        if ((hw->CON & LL_SIMPLE_UART_CON_TO_IE) && (hw->CON & LL_SIMPLE_UART_CON_TO_PENDING)) {
            hw->CON |= (LL_SIMPLE_UART_CON_CLRTOPEND | LL_SIMPLE_UART_CON_CLRDMAPEND);
            if (dev->irq_hdl) {
                dev->irq_hdl(UART_IRQ_FLAG_TIME_OUT, dev->irq_data, hw->DMACNT, 0);
            }
        }
    }
}

/* request interrupt */
static int32 hguart_v4_request_irq(struct uart_device *uart, uart_irq_hdl irqhdl, uint32 irq_flag, uint32 data) {

    struct hguart_v4    *dev = (struct hguart_v4 *)uart;
    struct hguart_v4_hw *hw  = (struct hguart_v4_hw *)dev->hw;

    if (!dev->opened) {
        return RET_ERR;
    }

    dev->irq_hdl  = irqhdl;
    dev->irq_data = data  ;
    //request_irq(dev->irq_num, hguart_v4_irq_handler, dev);


    if (irq_flag & UART_IRQ_FLAG_RX_BYTE) {
        hw->CON |= LL_SIMPLE_UART_CON_UARTRXIE;
    }

    if (irq_flag & UART_IRQ_FLAG_FRAME_ERR) {
        hw->CON |= LL_SIMPLE_UART_CON_FERRIE;
    }

    if (irq_flag & UART_IRQ_FLAG_DMA_RX_DONE) {
        hw->CON |= LL_SIMPLE_UART_CON_DMA_IE;
        dev->irq_dma_tx = 0;
        dev->irq_dma_rx = 1;
    }

    if (irq_flag & UART_IRQ_FLAG_DMA_TX_DONE) {
        hw->CON |= LL_SIMPLE_UART_CON_DMA_IE;
        dev->irq_dma_tx = 1;
        dev->irq_dma_rx = 0;
    }

    if (irq_flag & UART_IRQ_FLAG_TIME_OUT) {
        hw->CON  |= LL_SIMPLE_UART_CON_TO_IE;
    }


    //irq_enable(dev->comm_irq_num);

    return RET_OK;
}

static int32 hguart_v4_release_irq(struct uart_device *uart, uint32 irq_flag) {

    struct hguart_v4    *dev = (struct hguart_v4 *)uart;
    struct hguart_v4_hw *hw  = (struct hguart_v4_hw *)dev->hw;

    if (!dev->opened) {
        return RET_ERR;
    }

    if (irq_flag & UART_IRQ_FLAG_RX_BYTE) {
        hw->CON &= ~ LL_SIMPLE_UART_CON_UARTRXIE;
    }

    if (irq_flag & UART_IRQ_FLAG_FRAME_ERR) {
        hw->CON &= ~ LL_SIMPLE_UART_CON_FERRIE;
    }

    if (irq_flag & UART_IRQ_FLAG_DMA_RX_DONE) {
        hw->CON &=~ LL_SIMPLE_UART_CON_DMA_IE;
    }

    if (irq_flag & UART_IRQ_FLAG_TIME_OUT) {
        hw->CON  &=~ LL_SIMPLE_UART_CON_TO_IE;
    }

    return RET_OK;
}

static const struct uart_hal_ops uart_v4_ops = {
    .open        = hguart_v4_open,
    .close       = hguart_v4_close,
    .getc        = hguart_v4_getc,
    .putc        = hguart_v4_putc,
    .gets        = hguart_v4_gets,
    .puts        = hguart_v4_puts,
    .ioctl       = hguart_v4_ioctl,
    .request_irq = hguart_v4_request_irq,
    .release_irq = hguart_v4_release_irq,
};

int32 hguart_v4_attach(uint32 dev_id, struct hguart_v4 *uart) {
    
    uart->irq_data        = 0;
    uart->irq_hdl         = NULL;
    uart->opened          = 0;
    uart->irq_dma_rx      = 0;
    uart->irq_dma_tx      = 0;
    uart->use_dma         = 0;
	uart->debug_uart      = 0;
	uart->p_tx_buf		  = NULL;
	uart->tx_cur_byte     = 0;
	uart->tx_total_byte   = 0;
    uart->dev.dev.ops     = (const struct devobj_ops *)&uart_v4_ops;

	os_sema_init(&uart->sema_tx, 0);
	os_mutex_init(&uart->mutex_rx);
	os_mutex_init(&uart->mutex_tx);
	request_irq(uart->irq_num, hguart_v4_irq_handler, uart);
    irq_enable(uart->comm_irq_num);

    dev_register(dev_id, (struct dev_obj *)uart);
    return RET_OK;
}

