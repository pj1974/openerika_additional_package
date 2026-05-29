/*
 * These code snippets are derived from the STMCubeH5 repository
 * and are used to configure Demos using the STM32H573I-DK in OpenERIKA
 * 
 * The original repository can be found at the following address:
 * https://github.com/STMicroelectronics/STM32CubeH5/tree/main/Projects/STM32H573I-DK
 * 
 * Licensing:
 * https://github.com/STMicroelectronics/STM32CubeH5/blob/main/LICENSE.md?plain=1
 */

#ifndef STMH573I_DK_STARTUP_H
#define STMH573I_DK_STARTUP_H

/* Includes ------------------------------------------------------------------*/
#include "stm32h5xx_ll_adc.h"
#include "stm32h5xx_ll_bus.h"
#include "stm32h5xx_ll_cordic.h"
#include "stm32h5xx_ll_cortex.h"
#include "stm32h5xx_ll_crc.h"
#include "stm32h5xx_ll_crs.h"
#include "stm32h5xx_ll_dac.h"
#include "stm32h5xx_ll_dcache.h"
#include "stm32h5xx_ll_dma.h"
#include "stm32h5xx_ll_exti.h"
#include "stm32h5xx_ll_fmac.h"
#include "stm32h5xx_ll_gpio.h"
#include "stm32h5xx_ll_i2c.h"
#include "stm32h5xx_ll_i3c.h"
#include "stm32h5xx_ll_icache.h"
#include "stm32h5xx_ll_iwdg.h"
#include "stm32h5xx_ll_lptim.h"
#include "stm32h5xx_ll_lpuart.h"
#include "stm32h5xx_ll_pka.h"
#include "stm32h5xx_ll_pwr.h"
#include "stm32h5xx_ll_rcc.h"
#include "stm32h5xx_ll_rng.h"
#include "stm32h5xx_ll_rtc.h"
#include "stm32h5xx_ll_spi.h"
#include "stm32h5xx_ll_system.h"
#include "stm32h5xx_ll_tim.h"
#include "stm32h5xx_ll_ucpd.h"
#include "stm32h5xx_ll_usart.h"
#include "stm32h5xx_ll_utils.h"
#include "stm32h5xx_ll_wwdg.h"

#include "stm32h5xx_hal.h"

/**
  * @brief System Clock Configuration
  * @retval None
  */
void SystemClock_Config(void);

/**
  * @brief  Enable ICACHE with 2-ways set-associative configuration.
  * @param  None
  * @retval None
  */
void CACHE_Enable(void);

#endif