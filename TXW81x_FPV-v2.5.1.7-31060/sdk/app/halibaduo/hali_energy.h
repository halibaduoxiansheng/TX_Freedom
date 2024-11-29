#ifndef __HALI_ENERGY_H__
#define __HALI_ENERGY_H__

#include "halibaduo.h"
#include "halibaduo_lib.h"



/* ===== energy list start ===== */
#define  BAT_3_00V	1862
#define  BAT_3_01V	1868
#define  BAT_3_02V	1874
#define  BAT_3_03V	1880
#define  BAT_3_04V	1887
#define  BAT_3_05V	1893
#define  BAT_3_06V	1899
#define  BAT_3_07V	1905
#define  BAT_3_08V	1911
#define  BAT_3_09V	1918
#define  BAT_3_10V	1924
#define  BAT_3_11V	1930
#define  BAT_3_12V	1936
#define  BAT_3_13V	1942
#define  BAT_3_14V	1949
#define  BAT_3_15V	1955
#define  BAT_3_16V	1961
#define  BAT_3_17V	1967
#define  BAT_3_18V	1974
#define  BAT_3_19V	1980
#define  BAT_3_20V	1986
#define  BAT_3_21V	1992
#define  BAT_3_22V	1998
#define  BAT_3_23V	2005
#define  BAT_3_24V	2011
#define  BAT_3_25V	2017
#define  BAT_3_26V	2023
#define  BAT_3_27V	2029
#define  BAT_3_28V	2036
#define  BAT_3_29V	2042
#define  BAT_3_30V	2048
#define  BAT_3_31V	2054
#define  BAT_3_32V	2060
#define  BAT_3_33V	2067
#define  BAT_3_34V	2073
#define  BAT_3_35V	2079
#define  BAT_3_36V	2085
#define  BAT_3_37V	2091
#define  BAT_3_38V	2098
#define  BAT_3_39V	2104
#define  BAT_3_40V	2110
#define  BAT_3_41V	2116
#define  BAT_3_42V	2122
#define  BAT_3_43V	2129
#define  BAT_3_44V	2135
#define  BAT_3_45V	2141
#define  BAT_3_46V	2147
#define  BAT_3_47V	2154
#define  BAT_3_48V	2160
#define  BAT_3_49V	2166
#define  BAT_3_50V	2172
#define  BAT_3_51V	2178
#define  BAT_3_52V	2185
#define  BAT_3_53V	2191
#define  BAT_3_54V	2197
#define  BAT_3_55V	2203
#define  BAT_3_56V	2209
#define  BAT_3_57V	2216
#define  BAT_3_58V	2222
#define  BAT_3_59V	2228
#define  BAT_3_60V	2234
#define  BAT_3_61V	2240
#define  BAT_3_62V	2247
#define  BAT_3_63V	2253
#define  BAT_3_64V	2259
#define  BAT_3_65V	2265
#define  BAT_3_66V	2271
#define  BAT_3_67V	2278
#define  BAT_3_68V	2284
#define  BAT_3_69V	2290
#define  BAT_3_70V	2296
#define  BAT_3_71V	2302
#define  BAT_3_72V	2309
#define  BAT_3_73V	2315
#define  BAT_3_74V	2321
#define  BAT_3_75V	2327
#define  BAT_3_76V	2333
#define  BAT_3_77V	2340
#define  BAT_3_78V	2346
#define  BAT_3_79V	2352
#define  BAT_3_80V	2358
#define  BAT_3_81V	2365
#define  BAT_3_82V	2371
#define  BAT_3_83V	2377
#define  BAT_3_84V	2383
#define  BAT_3_85V	2389
#define  BAT_3_86V	2396
#define  BAT_3_87V	2402
#define  BAT_3_88V	2408
#define  BAT_3_89V	2414
#define  BAT_3_90V	2420
#define  BAT_3_91V	2427
#define  BAT_3_92V	2433
#define  BAT_3_93V	2439
#define  BAT_3_94V	2445
#define  BAT_3_95V	2451
#define  BAT_3_96V	2458
#define  BAT_3_97V	2464
#define  BAT_3_98V	2470
#define  BAT_3_99V	2476
#define  BAT_4_00V	2482
#define  BAT_4_01V	2489
#define  BAT_4_02V	2495
#define  BAT_4_03V	2501
#define  BAT_4_04V	2507
#define  BAT_4_05V	2513
#define  BAT_4_06V	2520
#define  BAT_4_07V	2526
#define  BAT_4_08V	2532
#define  BAT_4_09V	2538
#define  BAT_4_10V	2544
#define  BAT_4_11V	2551
#define  BAT_4_12V	2557
#define  BAT_4_13V	2563
#define  BAT_4_14V	2569
#define  BAT_4_15V	2576
#define  BAT_4_16V	2582
#define  BAT_4_17V	2588
#define  BAT_4_18V	2594
#define  BAT_4_19V	2600
#define  BAT_4_20V	2607
#define  BAT_4_21V	2613
#define  BAT_4_22V	2619
#define  BAT_4_23V	2625
#define  BAT_4_24V	2631
#define  BAT_4_25V	2638
#define  BAT_4_26V	2644
#define  BAT_4_27V	2650
#define  BAT_4_28V	2656
#define  BAT_4_29V	2662
#define  BAT_4_30V	2669
#define  BAT_4_35V	2699
/* ===== energy list end ===== */

/* General structure of switch machine */
struct G_TX_Power{
    /* 1: Condition is established 0: Condition is not met*/
    uint8_t is_powerOn:1; 
    uint8_t is_powerOff:1;
    uint8_t need_powerOn:1;
    uint8_t need_powerOff:1;

    uint8_t need_remind_battery:1;
    uint8_t need_powerOff_battery:1;
    uint8_t power_charging_level:1;
    uint8_t reserve:1;

    // uint8_t basic_unit; // ms
    uint16_t detect_interval;

    uint8_t mcu_io;
    uint8_t adc_io;
    uint8_t charging_io;

    uint16_t remind_bat;
    uint16_t poweroff_bat;
    int now_bat;

    struct hgadc_v0* global_hgadc_value;

    uint8_t tx_battery:7; /* 0-100 */
    uint8_t is_charging:1;

    
    uint8_t (*getPowerLevel)(struct G_TX_Power *);
    int (*get_adc_value)(struct G_TX_Power *);
    uint8_t (*get_charging_status)(struct G_TX_Power *);
    int (*get_battery_value)(struct G_TX_Power *);
    void (*power_on)(struct G_TX_Power *);
    void (*power_off)(struct G_TX_Power *);

    /* Function executed during prompt period or need power off */
    /* When the conditions are met, only execute once */
    void (*remind_func)(void);
    void (*power_off_func)(void);

}__attribute__((packed));



void hali_energy_register(void);
extern struct G_TX_Power tx_power;

#endif