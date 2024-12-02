#ifndef _HAL_SHA_H_
#define _HAL_SHA_H_


struct sha_dev
{
    struct dev_obj dev;
};


enum SHA_CALC_FLAGS{
	SHA_CALC_LAST_DATA       = BIT(0),
	SHA_CALC_SHA256          = BIT(1),
	SHA_CALC_SHA384          = BIT(2),
	SHA_CALC_SHA512          = BIT(3),
};


struct sha_hal_ops
{
    struct devobj_ops ops;
    int32 (*calc)(struct sha_dev *dev, uint8 input[], uint32 len, enum SHA_CALC_FLAGS flags);
    int32 (*read)(struct sha_dev *dev, uint8 output[], uint32 timeout);
    int32 (*ioctl)(struct sha_dev *dev, uint32 cmd, void *args);
    int32 (*requset_irq)(struct sha_dev *dev, void *irq_handle, void *args);
    int32 (*release_irq)(struct sha_dev *dev);
};


int32 sha_calc(struct sha_dev *dev, uint8 input[], uint32 len, enum SHA_CALC_FLAGS flags);
int32 sha_read(struct sha_dev *dev, uint8 output[], uint32 timeout);
int32 sha_ioctl(struct sha_dev *dev, uint32 cmd, void *args);
int32 sha_requset_irq(struct sha_dev *dev, void *irq_handle, void *args);
int32 sha_release_irq(struct sha_dev *dev);


#endif
