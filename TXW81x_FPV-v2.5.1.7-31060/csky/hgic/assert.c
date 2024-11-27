#include "typesdef.h"
#include "osal/string.h"
#include "csi_core.h"

__bobj uint8_t assert_holdup;
void assert_internal(const char *__function, unsigned int __line, const char *__assertion)
{
    int i = 0;

    disable_print(0);
    if (assert_holdup) {
        mcu_watchdog_timeout(0); //disable watchdog
        jtag_map_set(1);
    }

    do {
        os_printf(KERN_ERR"assertation \"%s\" failed: function: %s, line %d\r\n", __assertion, __function, __line);
        for (i = 0; i < 20000000; i++);
    } while (assert_holdup);

    mcu_reset();
}

