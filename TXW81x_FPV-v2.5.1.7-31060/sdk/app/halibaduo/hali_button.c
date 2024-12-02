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
    double_link_init(); /* init double link list Thraed Safety*/

    struct Double_link_list *list = double_button_link_insert(tx_dlink_head, tx_dlink_tail, BUTTON_TYPE, button);
    if (list == NULL) {
        printf("button add failed\r\n");
        double_link_deinit();
    }
}

void button_func_register(struct G_TX_Button button, void (*short_press_func)(void), void (*long_press_func)(void))
{
    if (short_press_func != NULL) {
        button.short_press_func = short_press_func;
    }

    if (long_press_func != NULL) {
        button.long_press_func = long_press_func;
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
        .active_level = 0,
        .button_level = 1,
        .button_io = PA_6,
        .short_press_time = 500,
        .long_press_time = 2500,
        .state = BUTTON_IDLE,
        .wait_time = 1000,
    };
    extern void hali_long_press_func(void);
    extern void hali_short_press_func(void);
    button_func_register(tx_button_0, hali_short_press_func, hali_long_press_func);

    /* if you want add button ,please imitate the above */

    hali_button_init(&tx_button_0);
}

uint16_t hali_button_getRealTime(struct G_TX_Button *button) {
    return button->press_ticks * button->basic_unit;
}

void hali_button_hander(struct Double_link_list *target) // 5ms 
{
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

    uint8_t read_gpio_level = gpio_get_val(button->button_io);

    if (read_gpio_level != button->button_level) {
        button->button_level = read_gpio_level;
        button->press_ticks = 0;
        button->release_ticks = 0;
    } else if (button->button_level == button->active_level) { // press
        button->press_ticks++; // start Timing
        if (button->press_ticks >= button->debounce_time) {
            button->is_press = 1;
        }
    } else if (button->button_level != button->active_level) { // release
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
    switch (button->state) {
	case BUTTON_IDLE:
        if (button->is_press) {
            button->state = BUTTON_PRESS;
        }
        break;
    case BUTTON_PRESS:
        if (hali_button_getRealTime(button) >= button->short_press_time) {
            if (button->button_level != button->active_level) { // It's called a short press when you release it.
                if (button->release_ticks >= button->debounce_time) {
                    button->state = BUTTON_SHORT_PRESS;
                    button->short_press_count++;
                }
            }
        }
        if (hali_button_getRealTime(button) >= button->long_press_time) { 
            button->state = BUTTON_LONG_PRESS;
        }
        break;
    case BUTTON_SHORT_PRESS: 
        if (button->short_press_count >= 1) {
            printf("short press");
        }
        if (button->short_press_func != NULL) {
            button->short_press_func();
        }
        button->state = BUTTON_IDLE;
        button->flag = 1;
        break;
    case BUTTON_LONG_PRESS:
        printf("long press");
        if (button->long_press_func != NULL) {
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
            hali_button_hander(target);
        }
    }
}


void hali_button_ticks(void)
{
    memset(&button_thd, 0, sizeof(struct TX_BUTTON_Thd));
    memcpy(button_thd.stack_name, "button_task", strlen("led_task"));
    button_thd = (struct TX_BUTTON_Thd) {
        .priority = 9,
        .stack_size = 512,
        .trd_func = hali_button_thread,
        .interval = 200,
        .args = NULL,
    };
    csi_kernel_task_new((k_task_entry_t)button_thd.trd_func, button_thd.stack_name, button_thd.args, button_thd.priority, 0, NULL, button_thd.stack_size, &button_thd.thread);
}
