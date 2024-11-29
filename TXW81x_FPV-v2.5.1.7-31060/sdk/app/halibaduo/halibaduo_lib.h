/**
 * use this lib to include all need header file
 * and in there write which Project we need to compile and run
 */
#ifndef __HALIBADUO_LIB_H__
#define __HALIBADUO_LIB_H__


// this way will let 
#include "stdio.h"
#include "stdint.h"
#include "string.h"
#include "devid.h"
#include "typesdef.h"
#include "syscfg.h"
#include "sys_config.h"
#include "list.h"
#include "lwip/err.h"
#include "lwip/sockets.h"
#include "lwip/netdb.h"
#include "lwip/sys.h"
#include "lwip/ip_addr.h"
#include "osal/semaphore.h"
#include "osal/mutex.h"
#include "osal/irq.h"
#include "osal/work.h"
#include "osal/task.h"
#include "osal/sleep.h"
#include "osal/timer.h"
#include "chip/txw81x/pin_names.h"
#include "chip/txw81x/io_function.h"
#include "hal/gpio.h"
#include "stdarg.h"
#include "lib/video/dvp/jpeg/jpg.h"
#include "event.h"
#include <frame.h>
#include <rtp.h>
#include "spook_config.h"
#include "socket_module.h"
#include "dev/csi/hgdvp.h"









// Write project choose in there
// =====================================================================================================================
#define HALI_PROJECT_1  1
#define HALI_DEFAULT_OEM        "i4season"//"github.com/halibaduoxiansheng" /*Original Equipment Manufacturer*/
#define HALI_DEFAULT_VER        "0.0.1"                         /*version*/
#define HALI_DEFAULT_PRO        "PROJECT_1"                     /*project name*/
#define HALI_AP_PREFIX 		    "Soulear-"//"UseeEar-"
#define HALI_AP_PASSWORD		""
// =====================================================================================================================


#endif // HALIBADUO_LIB_H





