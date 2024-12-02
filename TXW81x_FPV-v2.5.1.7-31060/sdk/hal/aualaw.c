#include "typesdef.h"
#include "list.h"
#include "errno.h"
#include "dev.h"
#include "hal/aualaw.h"


int32 aualaw_open(struct aualaw_device *aualaw) {

    if(aualaw) {
        return ((const struct aualaw_hal_ops *)aualaw->dev.ops)->open(aualaw);
    }

    return RET_ERR;
}

int32 aualaw_close(struct aualaw_device *aualaw) {

    if(aualaw) {
        return ((const struct aualaw_hal_ops *)aualaw->dev.ops)->close(aualaw);
    }

    return RET_ERR;
}

int32 aualaw_encode(struct aualaw_device *aualaw, void* dat_buf, uint32 bytes, void* result_buf) {

    if(aualaw) {
        return ((const struct aualaw_hal_ops *)aualaw->dev.ops)->encode(aualaw, dat_buf, bytes, result_buf);
    }

    return RET_ERR;
}

int32 aualaw_decode(struct aualaw_device *aualaw, void* dat_buf, uint32 bytes, void* result_buf) {

    if(aualaw) {
        return ((const struct aualaw_hal_ops *)aualaw->dev.ops)->decode(aualaw, dat_buf, bytes, result_buf);
    }

    return RET_ERR;
}

int32 aualaw_ioctl(struct aualaw_device *aualaw, enum aualaw_ioctl_cmd ioctl_cmd, uint32 param1, uint32 param2) {

    if(aualaw) {
        return ((const struct aualaw_hal_ops *)aualaw->dev.ops)->ioctl(aualaw, ioctl_cmd, param1, param2);
    }

    return RET_ERR;
}

int32 aualaw_request_irq(struct aualaw_device *aualaw, enum aualaw_irq_flag irq_flag, aualaw_irq_hdl irq_hdl, uint32 irq_data) {

    if(aualaw) {
        return ((const struct aualaw_hal_ops *)aualaw->dev.ops)->request_irq(aualaw, irq_flag, irq_hdl, irq_data);
    }

    return RET_ERR;
}

int32 aualaw_release_irq(struct aualaw_device *aualaw, enum aualaw_irq_flag irq_flag) {

    if(aualaw) {
        return ((const struct aualaw_hal_ops *)aualaw->dev.ops)->release_irq(aualaw, irq_flag);
    }

    return RET_ERR;
}

