/*
 * config.h
 *
 *  Created on: Mar 18, 2015
 *      Author: iwasz
 */

#ifndef SRC_CONFIG_H_
#define SRC_CONFIG_H_

extern void Error_Handler (void);

/*---------------------------------------------------------------------------*/
/* CDC ACM STUFF                                                             */
/*---------------------------------------------------------------------------*/

/* Definition for TIM_CDC clock resources */
#define TIM_CDC                             TIM3
#define TIM_CDC_CLK_ENABLE                  __HAL_RCC_TIM3_CLK_ENABLE
#define TIM_CDC_FORCE_RESET()               __HAL_RCC_USART3_FORCE_RESET()
#define TIM_CDC_RELEASE_RESET()             __HAL_RCC_USART3_RELEASE_RESET()

/* Definition for TIM_CDC's NVIC */
#define TIM_CDC_IRQn                        TIM3_IRQn
#define TIM_CDC_IRQHandler                  TIM3_IRQHandler

#define CDC_RX_DATA_SIZE  1024
#define CDC_TX_DATA_SIZE  1024

// Leds
#define GPIO_PIN_LED_LEFT_RED GPIO_PIN_12
#define GPIO_PIN_LED_RIGHT_RED GPIO_PIN_13
#define GPIO_PIN_LED_RIGHT_YELLOW GPIO_PIN_14
#define GPIO_PIN_LED_LEFT_YELLOW GPIO_PIN_15
#define GPIO_LED GPIOB
#define __HAL_RCC_GPIO_LED_CLK_ENABLE __HAL_RCC_GPIOB_CLK_ENABLE

// Motor phase
#define GPIO_PIN_APHASEL GPIO_PIN_3
#define GPIO_PIN_BPHASEL GPIO_PIN_4
#define GPIO_PIN_APHASER GPIO_PIN_6
#define GPIO_PIN_BPHASER GPIO_PIN_7
#define GPIO_PHASE GPIOA
#define __HAL_RCC_GPIO_PHASE_CLK_ENABLE __HAL_RCC_GPIOA_CLK_ENABLE

// Motor enable
#define GPIO_PIN_AENBLL GPIO_PIN_0
#define GPIO_PIN_BENBLL GPIO_PIN_1
#define GPIO_PIN_AENBLR GPIO_PIN_11
#define GPIO_PIN_BENBLR GPIO_PIN_10
#define GPIO_ENBL GPIOB
#define __HAL_RCC_GPIO_ENBL_CLK_ENABLE __HAL_RCC_GPIOB_CLK_ENABLE

// Okres timera. Timer zlicza od 0 do PERIOD.
#define PERIOD 255

#endif /* SRC_CONFIG_H_ */
