#ifndef _HUGEIC_GPIO_V4_H_
#define _HUGEIC_GPIO_V4_H_
#include "hal/gpio.h"

#ifdef __cplusplus
extern "C" {
#endif

#define HGGPIO_V4_MAX_PINS            (16)

struct hggpio_v4 {
    struct gpio_device dev;
    uint32 hw;
	uint32 comm_irq_num;
    int32 pin_id[HGGPIO_V4_MAX_PINS];
    gpio_irq_hdl irq_hdl[HGGPIO_V4_MAX_PINS];
    uint32 pin_num[2];
    uint8 irq_num;
};


int32 hggpio_v4_attach(uint32 dev_id, struct hggpio_v4 *gpio);

#ifdef __cplusplus
}
#endif


#endif

