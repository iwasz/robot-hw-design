#include <stm32f0xx_hal.h>
//#include "usbd_core.h"
//#include "usbd_desc.h"
//#include "usbd_cdc.h"
//#include "usbd_cdc_interface.h"
#include "config.h"
#include <stdbool.h>
#include <stdlib.h>
#include "functions.h"

static void SystemClock_Config (void);
static TIM_HandleTypeDef motorMicroStepTimer;

/**
 * -128 : slowest backwards
 * -1   : fastest backwards
 * 0    : stop
 * 1    : fastest forward
 * 127  : slowest forward
 */
int8_t leftMotorSpeed = 20;
int8_t rightMotorSpeed = 20;

/*****************************************************************************/

void setWinding1L (int power)
{
        // *
        TIM3->CCR3 = abs (power);

        if (power >= 0) {
                GPIO_PHASE->BSRR |= GPIO_PIN_APHASEL << 16;
        }
        else {
                GPIO_PHASE->BSRR |= GPIO_PIN_APHASEL;
        }
}

/*---------------------------------------------------------------------------*/

void setWinding2L (int power)
{
        TIM3->CCR4 = abs (power);

        if (power >= 0) {
                GPIO_PHASE->BSRR |= GPIO_PIN_BPHASEL << 16;
        }
        else {
                GPIO_PHASE->BSRR |= GPIO_PIN_BPHASEL;
        }
}

/*---------------------------------------------------------------------------*/

void setWinding1R (int power)
{
        // *
        TIM2->CCR3 = abs (power);

        if (power >= 0) {
                GPIO_PHASE->BSRR |= GPIO_PIN_BPHASER << 16;
        }
        else {
                GPIO_PHASE->BSRR |= GPIO_PIN_BPHASER;
        }
}

/*---------------------------------------------------------------------------*/

void setWinding2R (int power)
{
        TIM2->CCR4 = abs (power);

        if (power >= 0) {
                GPIO_PHASE->BSRR |= GPIO_PIN_APHASER << 16;
        }
        else {
                GPIO_PHASE->BSRR |= GPIO_PIN_APHASER;
        }
}

/*****************************************************************************/

int main (void)
{
        HAL_Init ();
        SystemClock_Config ();

        //        __SYSCFG_CLK_ENABLE ();
        //        HAL_NVIC_SetPriority (SysTick_IRQn, 0, 0);
        //        HAL_NVIC_EnableIRQ (SysTick_IRQn);
        __enable_irq ();

        /*---------------------------------------------------------------------------*/

        GPIO_InitTypeDef gpioInitStruct;
        __HAL_RCC_GPIOB_CLK_ENABLE ();

        // Lights
        __HAL_RCC_GPIO_LED_CLK_ENABLE ();
        gpioInitStruct.Pin = GPIO_PIN_LED_LEFT_RED | GPIO_PIN_LED_RIGHT_RED | GPIO_PIN_LED_RIGHT_YELLOW | GPIO_PIN_LED_LEFT_YELLOW;
        gpioInitStruct.Mode = GPIO_MODE_OUTPUT_PP;
        gpioInitStruct.Speed = GPIO_SPEED_LOW;
        HAL_GPIO_Init (GPIO_LED, &gpioInitStruct);

        /*---------------------------------------------------------------------------*/

        // Motors - phase
        __HAL_RCC_GPIO_PHASE_CLK_ENABLE ();
        gpioInitStruct.Pin = GPIO_PIN_APHASEL | GPIO_PIN_BPHASEL | GPIO_PIN_APHASER | GPIO_PIN_BPHASER;
        gpioInitStruct.Mode = GPIO_MODE_OUTPUT_PP;
        gpioInitStruct.Speed = GPIO_SPEED_HIGH;
        HAL_GPIO_Init (GPIO_PHASE, &gpioInitStruct);

        // Motors - enbl
        __HAL_RCC_GPIO_ENBL_CLK_ENABLE ();
        gpioInitStruct.Mode = GPIO_MODE_AF_PP;
        gpioInitStruct.Speed = GPIO_SPEED_HIGH;

        gpioInitStruct.Pin = GPIO_PIN_AENBLL;
        // Który to numer (AF0, AF1 etc), można odczytać w tabeli "Alternate functions selected through GPIOx_AFR"
        gpioInitStruct.Alternate = GPIO_AF1_TIM3;
        HAL_GPIO_Init (GPIO_ENBL, &gpioInitStruct);

        gpioInitStruct.Pin = GPIO_PIN_BENBLL;
        gpioInitStruct.Alternate = GPIO_AF1_TIM3;
        HAL_GPIO_Init (GPIO_ENBL, &gpioInitStruct);

        gpioInitStruct.Pin = GPIO_PIN_AENBLR;
        gpioInitStruct.Alternate = GPIO_AF2_TIM2;
        HAL_GPIO_Init (GPIO_ENBL, &gpioInitStruct);

        gpioInitStruct.Pin = GPIO_PIN_BENBLR;
        gpioInitStruct.Alternate = GPIO_AF2_TIM2;
        HAL_GPIO_Init (GPIO_ENBL, &gpioInitStruct);

        /*---------------------------------------------------------------------------*/

        // Enbl timers LEWY MOTOR
        static TIM_HandleTypeDef leftMotorEnblTimer;
        leftMotorEnblTimer.Instance = TIM3;
        leftMotorEnblTimer.Init.Period = PERIOD - 1;                                           // *
        leftMotorEnblTimer.Init.Prescaler = (uint32_t) (HAL_RCC_GetHCLKFreq () / 2000000) - 1; // *
        leftMotorEnblTimer.Init.ClockDivision = TIM_CLOCKDIVISION_DIV1;                        // *
        leftMotorEnblTimer.Init.CounterMode = TIM_COUNTERMODE_UP;
        leftMotorEnblTimer.Init.RepetitionCounter = 0;

        // *
        // Uwaga! Zpisać to!!! Msp init jest wywoływane PRZED TIM_Base_SetConfig
        __HAL_RCC_TIM3_CLK_ENABLE ();

        if (HAL_TIM_PWM_Init (&leftMotorEnblTimer) != HAL_OK) {
                Error_Handler ();
        }

        TIM_OC_InitTypeDef sConfigOC;
        sConfigOC.OCMode = TIM_OCMODE_PWM1;         // * Jaka różnica, bo z PWM1 mi działa tylko jeden kanał.
        sConfigOC.OCPolarity = TIM_OCPOLARITY_HIGH; // *
        sConfigOC.OCFastMode = TIM_OCFAST_DISABLE;  // *

        sConfigOC.Pulse = 0;
        HAL_TIM_PWM_ConfigChannel (&leftMotorEnblTimer, &sConfigOC, TIM_CHANNEL_4);
        HAL_TIM_PWM_Start (&leftMotorEnblTimer, TIM_CHANNEL_4);

        // 0 max, 255 min
        sConfigOC.Pulse = 0;
        HAL_TIM_PWM_ConfigChannel (&leftMotorEnblTimer, &sConfigOC, TIM_CHANNEL_3);
        HAL_TIM_PWM_Start (&leftMotorEnblTimer, TIM_CHANNEL_3);

        /*---------------------------------------------------------------------------*/

        // Enbl timers PRAWY MOTOR
        static TIM_HandleTypeDef rightMotorEnblTimer;
        rightMotorEnblTimer.Instance = TIM2;
        rightMotorEnblTimer.Init.Period = PERIOD - 1;                                           // *
        rightMotorEnblTimer.Init.Prescaler = (uint32_t) (HAL_RCC_GetHCLKFreq () / 2000000) - 1; // *
        rightMotorEnblTimer.Init.ClockDivision = TIM_CLOCKDIVISION_DIV1;                        // *
        rightMotorEnblTimer.Init.CounterMode = TIM_COUNTERMODE_UP;
        rightMotorEnblTimer.Init.RepetitionCounter = 0;

        // *
        // Uwaga! Zpisać to!!! Msp init jest wywoływane PRZED TIM_Base_SetConfig
        __HAL_RCC_TIM2_CLK_ENABLE ();

        if (HAL_TIM_PWM_Init (&rightMotorEnblTimer) != HAL_OK) {
                Error_Handler ();
        }

        //        TIM_OC_InitTypeDef sConfigOC;

        /*
         * OCMode mówi, czy % wypełnienia PWM rośnie wraz ze zwiększeniem CCRx, czy maleje. A więc:
         * Kiedy TIM_OCMODE_PWM1, to rośnie. A więc im większe ustawimy CCRx, tym większy procent wypełnienia.
         * Kiedy TIM_OCMODE_PWM1, to maleje. A więc im większe ustawimy CCRx, tym MNIEJSZY procent wypełnienia.
         *
         * Przykładowo jeśli mamy mamy:
         * timer.Init.Period = 255 - 1;
         * ...
         * sConfigOC.OCMode = TIM_OCMODE_PWM1;
         *
         * To Ustawiając CCRx = 0, będziemy mieć na wyjściu stan niski (zerowe wypełnienie), a ustawiając 255
         * będziemy mieć stan wysoki (100% wypełnienia).
         *
         * W reference manual jest to wyjaśnione tak:
         * 110: PWM mode 1 - In upcounting, channel 1 is active as long as TIMx_CNT<TIMx_CCR1
         * else inactive. In downcounting, channel 1 is inactive (OC1REF=‘0) as long as
         * TIMx_CNT>TIMx_CCR1 else active (OC1REF=1).
         *
         * 111: PWM mode 2 - In upcounting, channel 1 is inactive as long as TIMx_CNT<TIMx_CCR1
         * else active. In downcounting, channel 1 is active as long as TIMx_CNT>TIMx_CCR1 else
         * inactive.
         */
        sConfigOC.OCMode = TIM_OCMODE_PWM1;

        /*
         * Outpu polarity. Dla mnie to działa dokładnie tak samo jak OCMode. Kiedy High, to rośnie z CCR, a
         * kiedy LOW, to maleje z CCR.
         */
        sConfigOC.OCPolarity = TIM_OCPOLARITY_HIGH;
        sConfigOC.OCFastMode = TIM_OCFAST_DISABLE; // Tego trochę nie rozumiem.

        sConfigOC.Pulse = 0;
        HAL_TIM_PWM_ConfigChannel (&rightMotorEnblTimer, &sConfigOC, TIM_CHANNEL_4);
        HAL_TIM_PWM_Start (&rightMotorEnblTimer, TIM_CHANNEL_4);

        // 0 max, 255 min
        sConfigOC.Pulse = 0;
        HAL_TIM_PWM_ConfigChannel (&rightMotorEnblTimer, &sConfigOC, TIM_CHANNEL_3);
        HAL_TIM_PWM_Start (&rightMotorEnblTimer, TIM_CHANNEL_3);

        /*---------------------------------------------------------------------------*/
        // TIMER, which advances themotors one micro-step in either directions. (640 microsteps)

        motorMicroStepTimer.Instance = TIM14;
        motorMicroStepTimer.Init.Period = 100;
        motorMicroStepTimer.Init.Prescaler = (uint32_t) (HAL_RCC_GetHCLKFreq () / 1000000) - 1;
        motorMicroStepTimer.Init.ClockDivision = TIM_CLOCKDIVISION_DIV1;
        motorMicroStepTimer.Init.CounterMode = TIM_COUNTERMODE_UP;
        motorMicroStepTimer.Init.RepetitionCounter = 0;

        // *
        // Uwaga! Zpisać to!!! Msp init jest wywoływane PRZED TIM_Base_SetConfig
        __HAL_RCC_TIM14_CLK_ENABLE ();

        HAL_NVIC_SetPriority (TIM14_IRQn, 0, 0);
        HAL_NVIC_EnableIRQ (TIM14_IRQn);

        if (HAL_TIM_Base_Init (&motorMicroStepTimer) != HAL_OK) {
                Error_Handler ();
        }

        if (HAL_TIM_Base_Start_IT (&motorMicroStepTimer) != HAL_OK) {
                Error_Handler ();
        }

        /*---------------------------------------------------------------------------*/

        while (1) {
                GPIOB->BSRR |= GPIO_PIN_LED_LEFT_RED | GPIO_PIN_LED_RIGHT_RED | GPIO_PIN_LED_RIGHT_YELLOW | GPIO_PIN_LED_LEFT_YELLOW;

                for (int i = 0; i < 1000000; ++i)
                        ;

                //                for (int i = 0; i < 10000; ++i)
                //                        ;

                // TODO Czemu nie działa HAL_Delay?
                //                HAL_Delay (500);

                //                for (int i = 0; i < 10000; ++i)
                //                        ;

                //                static uint8_t i = 0;
                //                TIM3->CCR3 = ++i;

                // TODO Czemu nie działa HAL_Delay?
                //                HAL_Delay (500);

                //                for (int k = 0; k < 5; ++k) {
                //                        GPIO_PHASE->BSRR |= GPIO_PIN_APHASEL;
                //                        GPIO_PHASE->BSRR |= GPIO_PIN_BPHASEL << 16;

                //                        for (int i = 0; i < 1000000; ++i)
                //                                ;

                //                        GPIO_PHASE->BSRR |= GPIO_PIN_APHASEL << 16;
                //                        GPIO_PHASE->BSRR |= GPIO_PIN_BPHASEL << 16;

                //                        for (int i = 0; i < 1000000; ++i)
                //                                ;

                //                        GPIO_PHASE->BSRR |= GPIO_PIN_APHASEL << 16;
                //                        GPIO_PHASE->BSRR |= GPIO_PIN_BPHASEL;

                //                        for (int i = 0; i < 1000000; ++i)
                //                                ;

                //                        GPIO_PHASE->BSRR |= GPIO_PIN_APHASEL;
                //                        GPIO_PHASE->BSRR |= GPIO_PIN_BPHASEL;

                //                        for (int i = 0; i < 1000000; ++i)
                //                                ;
                //                }

                //                for (int k = 0; k < 5 * 128; ++k) {
                ////                        setWinding1 (COSINE[k % 128]);
                ////                        setWinding2 (SINE[k % 128]);

                //                        for (int i = 0; i < 5000; ++i)
                //                                ;
                //                }

                GPIOB->BSRR |= (GPIO_PIN_LED_LEFT_RED | GPIO_PIN_LED_RIGHT_RED | GPIO_PIN_LED_RIGHT_YELLOW | GPIO_PIN_LED_LEFT_YELLOW) << 16;

                for (int i = 0; i < 1000000; ++i)
                        ;
        }
}

/**
 * Stop-watch ISR.
 * Here the value displayed is updated. 100Hz
 */
void TIM14_IRQHandler (void)
{
        __HAL_TIM_CLEAR_IT (&motorMicroStepTimer, TIM_IT_UPDATE);
        static int16_t leftMicroStepNum = 0;
        static int16_t rightMicroStepNum = 0;
        static uint32_t prescaler = 0; // So big type on purpose

        if (leftMotorSpeed && (prescaler % abs (leftMotorSpeed)) == 0) {

                if (leftMotorSpeed > 0) {
                        ++leftMicroStepNum;
                        leftMicroStepNum %= 640;
                }
                else {
                        --leftMicroStepNum;

                        if (leftMicroStepNum < 0) {
                                leftMicroStepNum = 640;
                        }
                }

                setWinding1L (COSINE[leftMicroStepNum % 128]);
                setWinding2L (SINE[leftMicroStepNum % 128]);
        }

        if (rightMotorSpeed && (prescaler % abs (rightMotorSpeed)) == 0) {

                if (rightMotorSpeed > 0) {
                        ++rightMicroStepNum;
                        rightMicroStepNum %= 640;
                }
                else {
                        --rightMicroStepNum;

                        if (rightMicroStepNum < 0) {
                                rightMicroStepNum = 640;
                        }
                }

                setWinding1R (COSINE[rightMicroStepNum % 128]);
                setWinding2R (SINE[rightMicroStepNum % 128]);
        }

        ++prescaler;
}

/*****************************************************************************/

void SystemClock_Config (void)
{

        RCC_OscInitTypeDef RCC_OscInitStruct;
        /* Select HSI48 Oscillator as PLL source */
        RCC_OscInitStruct.OscillatorType = RCC_OSCILLATORTYPE_HSI48;
        RCC_OscInitStruct.HSI48State = RCC_HSI48_ON;
        RCC_OscInitStruct.PLL.PLLState = RCC_PLL_ON;
        RCC_OscInitStruct.PLL.PLLSource = RCC_PLLSOURCE_HSI48;
        RCC_OscInitStruct.PLL.PREDIV = RCC_PREDIV_DIV2;
        RCC_OscInitStruct.PLL.PLLMUL = RCC_PLL_MUL2;

        if (HAL_RCC_OscConfig (&RCC_OscInitStruct) != HAL_OK) {
                Error_Handler ();
        }

        RCC_ClkInitTypeDef RCC_ClkInitStruct;
        RCC_ClkInitStruct.ClockType = RCC_CLOCKTYPE_SYSCLK;
        RCC_ClkInitStruct.SYSCLKSource = RCC_SYSCLKSOURCE_PLLCLK;
        RCC_ClkInitStruct.AHBCLKDivider = RCC_SYSCLK_DIV1;
        RCC_ClkInitStruct.APB1CLKDivider = RCC_HCLK_DIV1;
        HAL_RCC_ClockConfig (&RCC_ClkInitStruct, FLASH_LATENCY_1);

        HAL_SYSTICK_Config (HAL_RCC_GetHCLKFreq () / 1000);
        HAL_SYSTICK_CLKSourceConfig (SYSTICK_CLKSOURCE_HCLK);
}

/**
 * @brief  This function is executed in case of error occurrence.
 * @param  None
 * @retval None
 */
void Error_Handler (void)
{
        /* User may add here some code to deal with this error */
        while (1) {
        }
}
