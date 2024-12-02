#include "sys_config.h"
#include "typesdef.h"
#include "errno.h"
#include "list.h"
#include "dev.h"
#include "devid.h"
#include "osal/task.h"
#include "osal/sleep.h"
#include "osal/string.h"
#include "osal/irq.h"
#include "hal/dma.h"
#include "hal/crc.h"
#include "lib/common/common.h"
#include "lib/heap/sysheap.h"

extern void *krhino_mm_alloc(size_t size, void *caller);
extern void  krhino_mm_free(void *ptr);

__bobj uint64 cpu_loading_tick;
#ifdef M2M_DMA
__bobj struct dma_device *m2mdma;
#endif

void cpu_loading_print(uint8 all, struct os_task_info *tsk_info, uint32 size)
{
    uint32 i = 0;
    uint32 diff_tick = 0;
    uint32 irq_time;
    uint32 count;
    uint64 jiff = os_jiffies();

    if(tsk_info == NULL) return;
    count = os_task_runtime(tsk_info, size);
    diff_tick = DIFF_JIFFIES(cpu_loading_tick, jiff);
    cpu_loading_tick = jiff;

    irq_time = irq_status();
    os_printf("---------------------------------------------------\r\n");
    os_printf("Task Runtime Statistic, interval:%dms\r\n", diff_tick);
    os_printf("PID     Name            %%CPU(Time)    Stack  Prio \r\n", diff_tick);
    os_printf("---------------------------------------------------\r\n");
    if(irq_time > 0){
        os_printf("SYS IRQ: %d%%\r\n", 100 * os_msecs_to_jiffies(irq_time/1000) / diff_tick);
        os_printf("---------------------------------------------------\r\n");
    }
    for (i = 0; i < count; i++) {
        if (tsk_info[i].time > 0 || all) {
            os_printf("%2d     %-12s\t%2d%%(%6d)   %4d  %2d (%p)\r\n",
                      tsk_info[i].id,
                      tsk_info[i].name ? tsk_info[i].name : (const uint8 *)"----",
                      (tsk_info[i].time * 100) / diff_tick,
                      tsk_info[i].time,
                      tsk_info[i].stack * 4,
                      tsk_info[i].prio,
                      tsk_info[i].arg);
        }
    }
    os_printf("---------------------------------------------------\r\n");
}

int strncasecmp(const char *s1, const char *s2, int n)
{
    size_t i = 0;

    for (i = 0; i < n && s1[i] && s2[i]; i++) {
        if (s1[i] == s2[i] || s1[i] + 32 == s2[i] || s1[i] - 32 == s2[i]) {
        } else {
            break;
        }
    }
    return (i != n);
}

int strcasecmp(const char *s1, const char *s2)
{
    while (*s1 || *s2) {
        if (*s1 == *s2 || *s1 + 32 == *s2 || *s1 - 32 == *s2) {
            s1++; s2++;
        } else {
            return -1;
        }
    }
    return 0;
}

#ifdef M2M_DMA
void hw_memcpy(void *dest, const void *src, uint32 size)
{
    if (dest && src) {
        if (m2mdma && size > 45) {
#ifdef MEM_TRACE
#ifdef PSRAM_HEAP
            struct sys_heap *heap = sysheap_valid_addr(&psram_heap, dest) ? &psram_heap : &sram_heap;
#else
            struct sys_heap *heap = &sram_heap;
#endif
            int32 ret = sysheap_of_check(heap, dest, size);
            if (ret == -1) {
                //os_printf("%s: WARING: OF CHECK 0x%x\r\n", dest, __FUNCTION__);
            } else {
                if (!ret) {
                    os_printf("check addr fail: %x, size:%d \r\n", dest, size);
                }
                ASSERT(ret == 1);
            }
#endif
            dma_memcpy(m2mdma, dest, src, size);
        } else {
            os_memcpy(dest, src, size);
        }
    }
}

void hw_memcpy0(void *dest, const void *src, uint32 size)
{
    if (m2mdma && size > 45) {
#ifdef MEM_TRACE
#ifdef PSRAM_HEAP
        struct sys_heap *heap = sysheap_valid_addr(&psram_heap, dest) ? &psram_heap : &sram_heap;
#else
        struct sys_heap *heap = &sram_heap;
#endif
        int32 ret = sysheap_of_check(heap, dest, size);
        if (ret == -1) {
            //os_printf("%s: WARING: OF CHECK 0x%x\r\n", dest, __FUNCTION__);
        } else {
            if (!ret) {
                os_printf("check addr fail: %x, size:%d \r\n", dest, size);
            }
            ASSERT(ret == 1);
        }
#endif
        dma_memcpy(m2mdma, dest, src, size);
    } else {
        os_memcpy(dest, src, size);
    }
}

void hw_memset(void *dest, uint8 val, uint32 n)
{
    if (dest) {
        if (m2mdma && n > 12) {
#ifdef MEM_TRACE
#ifdef PSRAM_HEAP
            struct sys_heap *heap = sysheap_valid_addr(&psram_heap, dest) ? &psram_heap : &sram_heap;
#else
            struct sys_heap *heap = &sram_heap;
#endif
            int32 ret = sysheap_of_check(heap, dest, n);
            if (ret == -1) {
                //os_printf("%s: WARING: OF CHECK 0x%x\r\n", dest, __FUNCTION__);
            } else {
                if (!ret) {
                    os_printf("check addr fail: %x, size:%d \r\n", dest, n);
                }
                ASSERT(ret == 1);
            }
#endif
            dma_memset(m2mdma, dest, val, n);
        } else {
            os_memset(dest, val, n);
        }
    }
}
#endif

void *os_memdup(const void *ptr, uint32 len)
{
    void *p;
    if (!ptr || len == 0) {
        return NULL;
    }
    p = os_malloc(len);
    if (p) {
        hw_memcpy(p, ptr, len);
    }
    return p;
}


int32 os_random_bytes(uint8 *data, int32 len)
{
    int32 i = 0;
    int32 seed;
#ifdef TXW4002ACK803
    seed = csi_coret_get_value() ^ (csi_coret_get_value() << 8) ^ (csi_coret_get_value() >> 8);
#else
    seed = csi_coret_get_value() ^ sysctrl_get_trng() ^ (sysctrl_get_trng() >> 8);
#endif
    for (i = 0; i < len; i++) {
        seed = seed * 214013L + 2531011L;
        data[i] = (uint8)(((seed >> 16) & 0x7fff) & 0xff);
    }
    return 0;
}

uint32 hw_crc(enum CRC_DEV_TYPE type, uint8 *data, uint32 len)
{
    uint32 crc = 0xffff;
    struct crc_dev_req req;
    struct crc_dev *crcdev = (struct crc_dev *)dev_get(HG_CRC_DEVID);
    if (crcdev) {
        req.type = type;
        req.data = data;
        req.len  = len;
        ASSERT((uint32)data % 4 == 0); // crc模块数据地址必须4字节对齐检查
        crc_dev_calc(crcdev, &req, &crc, 0);
    } else {
        os_printf("no crc dev\r\n");
        crc = (uint32)os_jiffies();
    }
    return crc;
}

