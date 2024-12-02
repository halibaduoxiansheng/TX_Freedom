#ifndef _HUGEIC_DEV_ID_H_
#define _HUGEIC_DEV_ID_H_

#ifdef __cplusplus
extern "C" {
#endif

typedef enum {
    HG_UART0_DEVID = 1,
    HG_UART1_DEVID,
    HG_UART2_DEVID,
    HG_UART3_DEVID,
    HG_UART4_DEVID,
    HG_UART5_DEVID,
    HG_UART6_DEVID,
    HG_UART7_DEVID,
    HG_UART8_DEVID,
    HG_UART9_DEVID,
    HG_USBDEV_DEVID,
    HG_HWAES0_DEVID,
    HG_HWAES1_DEVID,
    HG_SPI0_DEVID,
    HG_SPI1_DEVID,
    HG_SPI2_DEVID,
    HG_SPI3_DEVID,
    HG_SPI4_DEVID,
    HG_SPI5_DEVID,
    HG_SPI6_DEVID,
    HG_SPI7_DEVID,
    HG_SPI8_DEVID,
    HG_SPI9_DEVID,
    HG_DMAC_DEVID,
    HG_I2C0_DEVID,
    HG_I2C1_DEVID,
    HG_I2C2_DEVID,
    HG_I2C3_DEVID,
    HG_I2C4_DEVID,
    HG_I2C5_DEVID,
    HG_I2C6_DEVID,
    HG_I2C7_DEVID,
    HG_I2C8_DEVID,
    HG_I2C9_DEVID,
    HG_GPIOA_DEVID,
    HG_GPIOB_DEVID,
    HG_GPIOC_DEVID,
    HG_GPIOD_DEVID,
    HG_GPIOE_DEVID,
    HG_WDT_DEVID,
    HG_SDIOSLAVE_DEVID,
    HG_TIMER0_DEVID,
    HG_TIMER1_DEVID,
    HG_TIMER2_DEVID,
    HG_TIMER3_DEVID,
    HG_TIMER4_DEVID,
    HG_TIMER5_DEVID,
    HG_TIMER6_DEVID,
    HG_TIMER7_DEVID,
    HG_TIMER8_DEVID,
    HG_TIMER9_DEVID,
    HG_MIPI_DEVID,
    HG_GMAC_DEVID,
    HG_M2MDMA_DEVID,
    HG_FLASH0_DEVID,
    HG_FLASH1_DEVID,
    HG_FLASH2_DEVID,
    HG_FLASH3_DEVID,
    HG_CRC_DEVID,
    HG_ETHPHY0_DEVID,
    HG_ETHPHY1_DEVID,
    HG_ETH_MDIOBUS0_DEVID,
    HG_ETH_MDIOBUS1_DEVID,
    HG_DVP_DEVID,
    HG_LCDC_DEVID,
    HG_JPG0_DEVID,
    HG_JPG1_DEVID,
    HG_VPP_DEVID,
    HG_PRC_DEVID,
    HG_OF_DEVID,
    HG_SCALE1_DEVID,
	HG_SCALE2_DEVID,
	HG_SCALE3_DEVID,		
    HG_QSPI_DEVID,
    HG_XSPI_DEVID,
    HG_SDIOHOST_DEVID,
    HG_PDM0_DEVID,
    HG_PDM1_DEVID,
    HG_PDM2_DEVID,
    HG_PDM3_DEVID,
    HG_LED0_DEVID,
    HG_LED1_DEVID,
    HG_LED2_DEVID,
    HG_LED3_DEVID,
    HG_WIFI0_DEVID,
    HG_WIFI1_DEVID,
    HG_WIFI2_DEVID,
    HG_WIFI3_DEVID,
    HG_LED_TIMER0_DEVID,
    HG_LED_TIMER1_DEVID,
    HG_LED_TIMER2_DEVID,
    HG_LED_TIMER3_DEVID,
    HG_LED_TIMER4_DEVID,
    HG_LED_TIMER5_DEVID,
    HG_LED_TIMER6_DEVID,
    HG_LED_TIMER7_DEVID,
    HG_LED_TIMER8_DEVID,
    HG_LED_TIMER9_DEVID,
    HG_SUPTMR0_DEVID,
    HG_SUPTMR1_DEVID,
    HG_SUPTMR2_DEVID,
    HG_SUPTMR3_DEVID,
    HG_SUPTMR4_DEVID,
    HG_SUPTMR5_DEVID,
    HG_SUPTMR6_DEVID,
    HG_SUPTMR7_DEVID,
    HG_SUPTMR8_DEVID,
    HG_SUPTMR9_DEVID,
	HG_SIMTMR0_DEVID,
    HG_SIMTMR1_DEVID,
    HG_SIMTMR2_DEVID,
    HG_SIMTMR3_DEVID,
    HG_SIMTMR4_DEVID,
    HG_SIMTMR5_DEVID,
    HG_SIMTMR6_DEVID,
    HG_ADC0_DEVID,
    HG_ADC1_DEVID,
    HG_ADC2_DEVID,
    HG_ADC3_DEVID,
    HG_CAPTURE0_DEVID,
    HG_CAPTURE1_DEVID,
    HG_CAPTURE2_DEVID,
    HG_CAPTURE3_DEVID,
    HG_PWM0_DEVID,
    HG_PWM1_DEVID,
    HG_PWM2_DEVID,
    HG_PWM3_DEVID,
    HG_IIS0_DEVID,
    HG_IIS1_DEVID,
    HG_IIS2_DEVID,
    HG_IIS3_DEVID,
    HG_IIS4_DEVID,
    HG_IIS5_DEVID,
    HG_TOUCHKEY0_DEVID,
    HG_TOUCHKEY1_DEVID,
    HG_TOUCHKEY2_DEVID,
    HG_TOUCHKEY3_DEVID,
    HG_FMAC0_DEVID,
    HG_FMAC1_DEVID,
    HG_FMAC2_DEVID,
    HG_FMAC3_DEVID,
    HG_SDSPI0_DEVID,
    HG_SDSPI1_DEVID,
    HG_RTC_DEVID,
    HG_AUADC_DEVID,
    HG_AUDAC_DEVID,
    HG_AUHS_DEVID,
    HG_AUALAW_DEVID,
    HG_AUVAD_DEVID,
    HG_SHA_DEVID,
} DEV_ID;

#ifdef __cplusplus
}
#endif

#endif