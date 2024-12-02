#include "hali_energy.h"

struct G_TX_Power tx_power;


int hali_energy_adc_func(struct G_TX_Power *power)
{
    int adc_value = 0;
    power->global_hgadc_value = (struct hgadc_v0*)dev_get(HG_ADC0_DEVID);
    adc_get_value(power->global_hgadc_value, power->adc_io, &adc_value);
    return adc_value;
}

uint8_t hali_energy_charge_func(struct G_TX_Power *power)
{
    return (gpio_get_val(power->charging_io) == power->power_charging_level);
}

static int hali_energy_bat_func(struct G_TX_Power *power)
{
    static const int ADC_MAX_VALUE = 4096;  // 12-bit ADC 分辨率
    static const int REF_VOLTAGE = 2700;    // 参考电压（单位：mV）

    int cur_v = 0;
    int cur_sum = 0;
    int cur_max = 0;
    int cur_min = ADC_MAX_VALUE;

    // 采样10次，去除最大值和最小值后的平均值
    for (int i = 0; i < 10; i++)
    {
        cur_v = power->get_adc_value(power);

        // 更新最小值和最大值
        if (cur_v < cur_min) {
            cur_min = cur_v;
        }
        if (cur_v > cur_max) {
            cur_max = cur_v;
        }

        cur_sum += cur_v;
        os_sleep_ms(20);
    }

    // 去除最大值和最小值后的总和计算
    cur_sum -= (cur_max + cur_min);
    cur_v = cur_sum / 8;  // 计算去除极值后的平均值

    // 计算电池电压（单位：mV）
    int vbat = (cur_v * REF_VOLTAGE * 2) / ADC_MAX_VALUE;

    os_printf("bat_ad_value:%d vbat = %d mV\r\n", cur_v, vbat); // 1677    2210mV

    return cur_v;
}

inline int hali_energy_adc_func_register(struct G_TX_Power *power)
{
    power->get_adc_value = hali_energy_adc_func;
}

inline int hali_energy_charge_func_register(struct G_TX_Power *power)
{
    power->get_charging_status = hali_energy_charge_func;
}

inline int hall_energy_bat_func_register(struct G_TX_Power *power)
{
    hali_energy_adc_func_register(power);
    power->get_battery_value = hali_energy_bat_func;
}

static void hali_adc_init(struct G_TX_Power *power)
{
    power->global_hgadc_value = (struct hgadc_v0*)dev_get(HG_ADC0_DEVID);
	adc_open((struct adc_device *)(power->global_hgadc_value)); // 打开 准备加通道
	adc_add_channel((struct adc_device *)power->global_hgadc_value, power->adc_io);
}

static void hali_remind_to_powerOff_two_func(struct G_TX_Power *power, void (*remind)(void), void (*powerOff)(void))
{
    if (remind != NULL) {
        power->remind_func = remind;
    }
    if (powerOff != NULL) {
        power->power_off_func = powerOff;
    }
}

static void remind_func(void)
{
    printf("reminf func called\r\n");
}

static void power_off_func(void)
{
    printf("power off func called\r\n");
}

/**
 * @return 1-100
 */
uint8_t getPowerLevel(struct G_TX_Power *power)
{
    //static int tmpV = 0;
    static tmpV = 0;
    uint8_t quantity;

    if (power == NULL) {
        printf("something error ,such as power is NULL~\r\n");
        return -1;
    }
    tmpV = power->get_battery_value(power);

    // 定义充电状态和非充电状态下的电压阈值和对应的电量值
    const int charging_thresholds[] = {BAT_4_17V, BAT_4_10V, BAT_4_08V, BAT_4_05V, BAT_4_02V, BAT_3_99V, BAT_3_96V, BAT_3_88V, BAT_3_81V, BAT_3_76V, BAT_3_71V, BAT_3_58V};
    const int charging_quantities[] = {110, 100, 90, 80, 70, 60, 50, 40, 30, 20, 10, 5, 0};

    const int discharging_thresholds[] = {BAT_4_03V, BAT_3_90V, BAT_3_84V, BAT_3_77V, BAT_3_72V, BAT_3_66V, BAT_3_59V, BAT_3_56V, BAT_3_52V, BAT_3_47V, BAT_3_42V, BAT_3_33V};
    const int discharging_quantities[] = {110, 100, 90, 80, 70, 60, 50, 40, 30, 20, 10, 5, 0};

    // 选择对应的阈值和电量表
    const int* thresholds = power->is_charging ? charging_thresholds : discharging_thresholds;
    const int* quantities = power->is_charging ? charging_quantities : discharging_quantities;

    // 根据电压值确定电量
    int i = 0;
    for (i = 0; i < sizeof(charging_thresholds)/sizeof(charging_thresholds[0]); i++) {
        if (tmpV >= thresholds[i]) {
            quantity = quantities[i];
            // os_printf("i4GetPowerLevel: quantity = %d, quantities[i] = %d, tmpV = %d.\r\n", quantity, quantities[i], tmpV);
            break;
        }
    }

    // 如果电压小于所有阈值，电量为0
    if (i == sizeof(charging_thresholds)/sizeof(charging_thresholds[0])) {
        quantity = 0;
    }

    // os_printf("i4GetPowerLevel: quantity = %d, tmpV = %d.\r\n", quantity, tmpV);
    return quantity;
}

static void hali_energy_electricity_value_register(struct G_TX_Power *power)
{
    power->getPowerLevel = getPowerLevel(power);
}

void hali_energy_init(struct G_TX_Power *power)
{
    if (power == NULL)
    {
        printf("power invail, %s init is NULL\r\n", __FUNCTION__);
        return;
    }
    
    hali_energy_charge_func_register(power);
    hall_energy_bat_func_register(power);
    hali_energy_electricity_value_register(power);

    hali_adc_init(power);

    hali_remind_to_powerOff_two_func(power, remind_func, power_off_func); // XXX Users should put your demand in these functions if you want to use them
}


void hali_energy_register(void)
{
    extern void hali_powerOn(void);
    extern void hali_powerOff(void);

    memset(&tx_power, 0, sizeof(struct G_TX_Power));
    tx_power = (struct G_TX_Power) {
        .mcu_io = PA_2,
        .adc_io = PA_1,
        .charging_io = PA_8,
        // .basic_unit = 1,
        .detect_interval = 200,
        .power_charging_level = 1,
        .power_on = hali_powerOn,
        .power_off = hali_powerOff,
        .remind_bat = BAT_3_55V,
        .poweroff_bat = BAT_3_46V,
    };

    hali_energy_init(&tx_power);
}

void hali_battrgy_program(struct G_TX_Power *power)
{
    for(;;os_sleep_ms(power->detect_interval))
    {
        power->is_charging = power->get_charging_status(power);

        power->now_bat = power->get_battery_value(power);

        power->tx_battery = power->getPowerLevel(power);

        if (power->now_bat <= power->remind_bat && !power->is_charging && power->is_powerOn) {
            if (power->now_bat <= power->poweroff_bat) {
                power->need_powerOff = 1;
            } else {
                power->need_remind_battery = 1;
            }
        }

        if (power->need_powerOff && power->power_off_func) { // low bat should to shut down
            power->power_off_func();
            power->power_off(power);
            power->need_powerOff = 0;
        }

        if (power->need_remind_battery && power->remind_func) { // remind bat should to do something
            power->remind_func();
            power->need_remind_battery = 0;
        }

        if (power->need_powerOn && power->is_powerOff) {
            power->power_on(power);
            power->need_powerOn = 0;
            return;
        }

        // bat upgrade
        power->tx_battery = power->getPowerLevel(power);
        // TODO set Device battery
    }
}