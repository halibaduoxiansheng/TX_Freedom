#ifndef __HALI_GSENSOR_H__
#define __HALI_GSENSOR_H__

#define UINT32 int32_t
#define UINT8 int8_t
#define UINT16 int32_t
#define u8 int8_t

struct G_TX_Gsensor {
    uint8_t is_open : 1;
    uint8_t reserve : 7;

    uint32_t gsensorData;
}__attribute__((packed));
extern struct G_TX_Gsensor g_tx_sensor;

int hali_gsensor_init(int32_t dev_id);

void hali_gsensor_start(void);
void hali_gsensor_stop(void);
uint8_t get_gsensor_angle(int ax, int ay, int az);

#endif