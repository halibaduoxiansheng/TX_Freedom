#ifndef __CSKY_EVENT_H_
#define __CSKY_EVENT_H_
#include "csi_kernel.h"

#ifdef __cplusplus
extern "C" {
#endif

struct os_event {
    uint32 magic;
    k_event_handle_t    hdl;
};

#ifdef __cplusplus
}
#endif

#endif


