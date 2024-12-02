#ifndef __OS_EVENT_H
#define __OS_EVENT_H

#ifdef __cplusplus
extern "C" {
#endif

enum OS_EVENT_WMODE{
	OS_EVENT_WMODE_AND,   //all bit has been set.
	OS_EVENT_WMODE_OR,    //any bit has been set.
	OS_EVENT_WMODE_CLEAR, //clear bit after exit.
};

struct os_event;

int32 os_event_init(struct os_event *evt);
int32 os_event_del(struct os_event *evt);
int32 os_event_set(struct os_event *evt, uint32 flags, uint32 *rflags);
int32 os_event_clear(struct os_event *evt, uint32 flags, uint32 *rflags);
int32 os_event_get(struct os_event *evt, uint32 *rflags);
int32 os_event_wait(struct os_event *evt, uint32 flags, uint32 *rflags, uint32 mode, int32 timeout);

#ifdef __cplusplus
}
#endif

#ifdef __CSKY__
#include "osal/csky/event.h"
#endif

#ifndef osWaitForever
#define osWaitForever 0xFFFFFFFFu
#endif
#endif

