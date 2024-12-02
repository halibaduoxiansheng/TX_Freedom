/**
  ******************************************************************************
  * @file    User/xxx.c
  * @author  HUGE-IC Application Team
  * @version V1.0.0
  * @date    01-08-2023
  * @brief   Main program body
  ******************************************************************************
  * @attention
  *
  * <h2><center>&copy; COPYRIGHT 2018 HUGE-IC</center></h2>
  *
  *
  *
  ******************************************************************************
  */
#include "typesdef.h"
#include "errno.h"
#include "list.h"
#include "dev.h"
#include "hal/sha.h"



/*
    brief:         
    flags: ->   使用SHA_CALC_LAST_DATA来结束输入产生输出。
*/
int32 sha_calc(struct sha_dev *dev, uint8 input[], uint32 len, enum SHA_CALC_FLAGS flags)
{
    if (dev && ((const struct sha_hal_ops *)dev->dev.ops)->calc) {
        return ((const struct sha_hal_ops *)dev->dev.ops)->calc(dev,input,len,flags);
    }
    return RET_ERR;
}

/*
    brief:      读取时请确保sha_calc执行成功
*/
int32 sha_read(struct sha_dev *dev, uint8 output[], uint32 timeout)
{
    if (dev && ((const struct sha_hal_ops *)dev->dev.ops)->read) {
        return ((const struct sha_hal_ops *)dev->dev.ops)->read(dev,output,timeout);
    }
    return RET_ERR;
}

int32 sha_ioctl(struct sha_dev *dev,uint32 cmd,void *args)
{
    if(dev && ((const struct sha_hal_ops *)dev->dev.ops)->ioctl) {
        return ((const struct sha_hal_ops *)dev->dev.ops)->ioctl(dev,cmd,args);
    }
    return RET_ERR;
}

int32 sha_requset_irq(struct sha_dev *dev,void *irq_handle,void *args)
{
    if(dev && ((const struct sha_hal_ops *)dev->dev.ops)->requset_irq) {
        return ((const struct sha_hal_ops *)dev->dev.ops)->requset_irq(dev,irq_handle,args);
    }
    return RET_ERR;
}

int32 sha_release_irq(struct sha_dev *dev)
{
    if(dev && ((const struct sha_hal_ops *)dev->dev.ops)->release_irq) {
        return ((const struct sha_hal_ops *)dev->dev.ops)->release_irq(dev);
    }
    return RET_ERR;
}
