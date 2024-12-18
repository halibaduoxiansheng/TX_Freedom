#include "hali_button.h"



struct TX_BUTTON_Thd {
    void *thread;
    uint16_t stack_size;
    char stack_name[15];
    uint8_t priority;
    uint16_t interval;
    void *args;

    void (*trd_func)(void);
};
struct TX_BUTTON_Thd button_thd;

struct G_TX_Button tx_button_0; /* the first  button */

enum {
    BUTTON_IDLE = 0,
    BUTTON_PRESS = 1,
    BUTTON_SHORT_PRESS = 2,
    BUTTON_LONG_PRESS = 3,
};

void hali_button_init(struct G_TX_Button *button)
{
    double_link_init(); /* init double link list Thread Safety*/

    struct Double_link_list *list = double_button_link_insert(tx_dlink_head, tx_dlink_tail, BUTTON_TYPE, button);
    if (list == NULL) {
        printf("button add failed\r\n");
        double_link_deinit();
    }
}

/**
 * 开始没有使用指针 button 导致副本变化 SB了...
 */
void button_func_register(struct G_TX_Button *button, void (*short_press_func)(void), void (*long_press_func)(void))
{
    if (short_press_func != NULL) {
        button->short_press_func = short_press_func;
    }

    if (long_press_func != NULL) {
        // printf("long press func register\r\n");
        button->long_press_func = long_press_func;
    }
}


void hali_button_register(void)
{
    memset(&tx_button_0, 0, sizeof(struct G_TX_Button));
    tx_button_0 = (struct G_TX_Button) {
        .check_level = 1,
        .button_id = 0,
        .basic_unit = 1,
        .debounce_time = 2,
        .active_level = 1,
        .button_level = 0,
        .button_io = PA_6,
        .short_press_time = 50,
        .long_press_time = 2200, // TODO 自己去感觉时间?相当不好
        .state = BUTTON_IDLE,
        .wait_time = 30,
    };
    extern void hali_long_press_func(void);
    extern void hali_short_press_func(void);
    button_func_register(&tx_button_0, hali_short_press_func, hali_long_press_func);

    /* if you want add button ,please imitate the above */

    hali_button_init(&tx_button_0);
}

uint16_t hali_button_getRealTime(struct G_TX_Button *button) {
    return button->press_ticks * button->basic_unit;
}

void hali_button_hander(struct Double_link_list *target) // 5ms 
{
    // printf("%s:%d\r\n", __FUNCTION__, __LINE__);
    if (target == NULL) {
        return;
    }
    struct G_TX_Button *button = target->button;
    if (button == NULL) {
        return;
    }

    if (!button->check_level) {
        printf("we lost the button control power\r\n");
        os_sleep_ms(1000);
        return;
    }
    os_sleep_ms(button->basic_unit);

    uint8_t read_gpio_level = gpio_get_val(button->button_io);

    if (button->press_ticks != 0 && read_gpio_level != button->active_level) {
        printf("button->press_ticks is %d\r\n", button->press_ticks);
    }

    if (read_gpio_level != button->button_level) { /*button level have change*/
        button->button_level = read_gpio_level;
        button->press_ticks = 0;
        button->release_ticks = 0;
    } else if (button->button_level == button->active_level) { // press
        // printf("have press\r\n");
        button->press_ticks++; // start Timing
        if (button->press_ticks >= button->debounce_time) { 
            // printf("we have press ok\r\n");
            button->is_press = 1;
        }
    } else if (button->button_level != button->active_level) { // release
        // printf("release button\r\n");
        button->release_ticks++;
        if (button->release_ticks >= button->wait_time) {
            button->is_press = 0;
            button->press_ticks = 0;
            button->release_ticks = 0;
            button->state = BUTTON_IDLE;
            button->short_press_count = 0;
        }
    }

    if (button->flag) { // resume
        printf("resume\r\n");
        button->flag = !button->flag;
        button->is_press = 0;
        button->press_ticks = 0;
        button->release_ticks = 0;
        button->state = BUTTON_IDLE;
        button->short_press_count = 0;
        return;
    }

    // TODO 需要验证能否正常工作
    /**
     * read_gpio_level == button->active_level
     */
    // printf("button->state is %d\r\n", button->state);
    switch (button->state) {
	case BUTTON_IDLE:
        if (button->is_press) {
            // printf("we can sure , we input the press state\r\n");
            button->state = BUTTON_PRESS;
        }
        break;
    case BUTTON_PRESS:
        // printf("ready to check\r\n");
        if (hali_button_getRealTime(button) >= button->short_press_time) {
            if (button->button_level != button->active_level) { // It's called a short press when you release it.
                if (button->release_ticks >= button->debounce_time) {
                    button->state = BUTTON_SHORT_PRESS;
                    printf("we can sure ,is short press\r\n");
                    button->short_press_count++;
                }
            }
        }
        // printf("hali_button_getRealTime(button) is %d\r\n", hali_button_getRealTime(button));
        if (hali_button_getRealTime(button) >= button->long_press_time) { 
            button->state = BUTTON_LONG_PRESS;
            break;
        }
        break;
    case BUTTON_SHORT_PRESS:  // just press and then release ,you can input there
        button->short_press_count++;
        if (button->short_press_count >= 1) {
            printf("already short press if you release button\r\n");
        }
        if (button->short_press_func != NULL && button->release_ticks >= button->debounce_time) { // XXX double check, we need delete these code?
            button->state = BUTTON_IDLE;
            button->flag = 1;
            button->short_press_func();
        }
        
        break;
    case BUTTON_LONG_PRESS:
        printf("long press");
        // if time is ok, then func is called,not need to release button
        if (button->long_press_func != NULL) {
            button->state = BUTTON_IDLE;
            printf("long press func start\r\n");
            button->long_press_func();
        }
        button->state = BUTTON_IDLE;
        button->flag = 1;
        break;
	default:
		button->state = 0; //reset
		break;
	}
}

static void hali_button_thread(void *arg)
{
    struct Double_link_list *target = NULL;
    for (;;button_thd.interval) {
        for (target = tx_dlink_head->next; target != tx_dlink_tail; target = target->next) { 
            if (target->type == BUTTON_TYPE) {
                hali_button_hander(target);
            }
        }
    }
}


void hali_button_ticks(void)
{
    void *thread;
    memset(&button_thd, 0, sizeof(struct TX_BUTTON_Thd));
    memcpy(button_thd.stack_name, "button_task", strlen("led_task"));
    button_thd = (struct TX_BUTTON_Thd) {
        .priority = 9,
        .stack_size = 1024,
        .trd_func = hali_button_thread,
        .interval = 200,
        .args = NULL,
    };
    printf("button task ready to run\r\n");
    csi_kernel_task_new((k_task_entry_t)button_thd.trd_func, button_thd.stack_name, button_thd.args, button_thd.priority, 0, NULL, button_thd.stack_size, &thread);
}
