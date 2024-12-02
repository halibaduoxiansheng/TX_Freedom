#include "typesdef.h"
#include "list.h"
#include "errno.h"
#include "dev.h"
#include "hal/dma.h"

int32 dma_pause(struct dma_device *dma, uint32 ch)
{
    if (dma && ((const struct dma_hal_ops *)dma->dev.ops)->pause) {
        return ((const struct dma_hal_ops *)dma->dev.ops)->pause(dma, ch);
    }
    return RET_ERR;
}

int32 dma_resume(struct dma_device *dma, uint32 ch)
{
    if (dma && ((const struct dma_hal_ops *)dma->dev.ops)->resume) {
        return ((const struct dma_hal_ops *)dma->dev.ops)->resume(dma, ch);
    }
    return RET_ERR;
}


void dma_memcpy(struct dma_device *dma, void *dst, const void *src, uint32 n)
{
	uint8 dma_buf[32];
	uint8_t *s,*d;
	uint8_t *s1,*d1,*s2,*d2;
	uint32_t i = 0;
	uint32 addr;
    ASSERT(dma && ((const struct dma_hal_ops *)dma->dev.ops)->xfer);
	
    struct dma_xfer_data xfer_data;
	if(n <= 32){
		s1 = (uint8_t *)src;
		d1 = (uint8_t *)dst;
		for(i = 0;i < n;i++){
			d1[i] = s1[i];
		}
		return;
	}


	s1 = (uint8_t *)src;
	d1 = (uint8_t *)dst;
	for(i = 0;i < 16;i++){        //处理头
		dma_buf[i] = s1[i];
	}


	s2 = (uint8_t *)src+n-16;
	d2 = (uint8_t *)dst+n-16;
	for(i = 0;i < 16;i++){        //处理头
		dma_buf[i+16] = s2[i];
	}


	
	
	n = n - 32;
	s = (uint8_t *)src+16;
	d = (uint8_t *)dst+16;


    xfer_data.dest              = (uint32)d;
    xfer_data.src               = (uint32)s;
    xfer_data.element_per_width = DMA_SLAVE_BUSWIDTH_1_BYTE;
    xfer_data.element_num       = n;
    xfer_data.dir               = ((((uint32)dst) < SRAM_BASE) || (((uint32)src) < SRAM_BASE)) ? DMA_XFER_DIR_M2D : DMA_XFER_DIR_M2M;
    xfer_data.src_addr_mode     = DMA_XFER_MODE_INCREASE;
    xfer_data.dst_addr_mode     = DMA_XFER_MODE_INCREASE;
    xfer_data.dst_id            = 0;
    xfer_data.src_id            = 0;
    xfer_data.irq_hdl           = NULL;
	addr = (uint32)s;
	addr = addr&CACHE_CIR_INV_ADDR_Msk;
	s = (uint8*)addr;
	addr = (uint32)d;
	addr = addr&CACHE_CIR_INV_ADDR_Msk;
	d = (uint8*)addr;//&CACHE_CIR_INV_ADDR_Msk;
    sys_dcache_clean_range((void *)s, (int32_t)s2-(int32_t)s);           //sram->psram
	sys_dcache_clean_invalid_range((void *)d, (int32_t)d2-(int32_t)d);	//psram cache invalid  //最后一行可能没有无效化	



	
//    xfer_data.irq_data          = 0;
    ((const struct dma_hal_ops *)dma->dev.ops)->xfer(dma, &xfer_data);

	for(i = 0;i < 16;i++){        //处理头
		d1[i] = dma_buf[i];
	}
	for(i = 0;i < 16;i++){        //处理尾
		d2[i] = dma_buf[i+16];
	}
}


void dma_memset(struct dma_device *dma, void *dst, uint8 c, uint32 n)
{
    uint8 val = c;
	uint8_t *d,*d1,*d2;
	uint32_t i = 0;
	uint32 addr;

	if(n <= 32){
		d1 = (uint8_t *)dst;
		for(i = 0;i < n;i++){
			d1[i] = val;
		}
		return;
	}	
	
	d1 = (uint8_t *)dst;
	d2 = (uint8_t *)dst+n-16;


	n = n - 32;
	d = (uint8_t *)dst+16;


	ASSERT(dma && ((const struct dma_hal_ops *)dma->dev.ops)->xfer);
	struct dma_xfer_data xfer_data;
	xfer_data.dest				= (uint32)d;
	xfer_data.src				= (uint32)&val;
	xfer_data.element_per_width = DMA_SLAVE_BUSWIDTH_1_BYTE;
	xfer_data.element_num		= n;
	xfer_data.dir				= (((uint32)dst) < SRAM_BASE) ? DMA_XFER_DIR_M2D : DMA_XFER_DIR_M2M;
	xfer_data.src_addr_mode 	= DMA_XFER_MODE_RECYCLE;
	xfer_data.dst_addr_mode 	= DMA_XFER_MODE_INCREASE;
	xfer_data.dst_id			= 0;
	xfer_data.src_id			= 0;
	xfer_data.irq_hdl			= NULL;
	//	  xfer_data.irq_data		  = 0;

	addr = (uint32)d;
	addr = addr&CACHE_CIR_INV_ADDR_Msk;
	d = (uint8*)addr;//&CACHE_CIR_INV_ADDR_Msk;	
	sys_dcache_clean_invalid_range((void *)d, (int32_t)d2-(int32_t)d);
	
    

    ((const struct dma_hal_ops *)dma->dev.ops)->xfer(dma, &xfer_data);
    
	for(i = 0;i < 16;i++){        //处理头
		d1[i] = val;
	}
	for(i = 0;i < 16;i++){        //处理尾
		d2[i] = val;
	}    
}

#if ((defined(TXW81X)))
void dma_blkcpy(struct dma_device *dma , struct dma_blkcpy_cfg *cfg)
{
    ASSERT(dma && ((const struct dma_hal_ops *)dma->dev.ops)->xfer);
    ASSERT(cfg->blk_width <= cfg->src_width);
    ASSERT(cfg->blk_width <= cfg->dst_width);
    struct dma_xfer_data xfer_data;
    xfer_data.dest              = (uint32)cfg->dest;
    xfer_data.src               = (uint32)cfg->src;
    xfer_data.element_per_width = DMA_SLAVE_BUSWIDTH_1_BYTE;
    xfer_data.element_num       = cfg->src_width * cfg->blk_height;
    xfer_data.dir               = (((uint32)cfg->dest) < SRAM_BASE) ? DMA_XFER_DIR_M2D : DMA_XFER_DIR_M2M;
    xfer_data.src_addr_mode     = DMA_XFER_MODE_BLKCPY;
    xfer_data.dst_addr_mode     = DMA_XFER_MODE_BLKCPY;
    xfer_data.dst_id            = 0;
    xfer_data.src_id            = 0;
    xfer_data.blk_width         = cfg->blk_width;
    xfer_data.blk_height        = cfg->blk_height;
    xfer_data.src_width         = cfg->src_width;
    xfer_data.dst_width         = cfg->dst_width;
    xfer_data.irq_hdl           = NULL;
//    xfer_data.irq_data          = 0;

    sys_dcache_clean_range((void *)cfg->src,  cfg->src_width * cfg->blk_height);

    sys_dcache_clean_invalid_range((void *)cfg->dest, cfg->dst_width * cfg->blk_height);

    ((const struct dma_hal_ops *)dma->dev.ops)->xfer(dma, &xfer_data);
}
#endif

int32 dma_xfer(struct dma_device *dma, struct dma_xfer_data *data)
{
    if (dma && ((const struct dma_hal_ops *)dma->dev.ops)->xfer) {
        return ((const struct dma_hal_ops *)dma->dev.ops)->xfer(dma, data);
    }
    return RET_ERR;
}

int32 dma_status(struct dma_device *dma, uint32 ch)
{
    if (dma && ((const struct dma_hal_ops *)dma->dev.ops)->get_status) {
        return ((const struct dma_hal_ops *)dma->dev.ops)->get_status(dma, ch);
    }
    return RET_ERR;
}

int32 dma_stop(struct dma_device *dma, uint32 ch)
{
    if (dma && ((const struct dma_hal_ops *)dma->dev.ops)->stop) {
        return ((const struct dma_hal_ops *)dma->dev.ops)->stop(dma, ch);
    }
    return RET_ERR;
}

int32 dma_ioctl(struct dma_device *dma, uint32 cmd, int32 param1, int32 param2)
{
    if (dma && ((const struct dma_hal_ops *)dma->dev.ops)->ioctl) {
        return ((const struct dma_hal_ops *)dma->dev.ops)->ioctl(dma, cmd, param1, param2);
    }
    return RET_ERR;
}
