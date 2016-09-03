#include <stm32f0xx_hal.h>
#include "config.h"
#include <stdbool.h>
#include <stdlib.h>
#include "functions.h"

#include "osal.h"
#include "sensor_service.h"
#include "stm32_bluenrg_ble.h"
#include "bluenrg_utils.h"

#undef BLE_ENABLED

extern volatile uint8_t set_connectable;
extern volatile int connected;
extern AxesRaw_t axes_data;
// CO TO JEST!
uint8_t bnrg_expansion_board = IDB04A1; /* at startup, suppose the X-NUCLEO-IDB04A1 is used */
void User_Process (AxesRaw_t *p_axes);

static void SystemClock_Config (void);
static TIM_HandleTypeDef motorMicroStepTimer;

/**
 * -128 : slowest backwards
 * -1   : fastest backwards
 * 0    : stop
 * 1    : fastest forward
 * 127  : slowest forward
 */
int8_t leftMotorSpeed = 0;
int8_t rightMotorSpeed = 0;

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

        HAL_NVIC_SetPriority (TIM14_IRQn, 4, 0);
        HAL_NVIC_EnableIRQ (TIM14_IRQn);

        if (HAL_TIM_Base_Init (&motorMicroStepTimer) != HAL_OK) {
                Error_Handler ();
        }

        if (HAL_TIM_Base_Start_IT (&motorMicroStepTimer) != HAL_OK) {
                Error_Handler ();
        }

/*---------------------------------------------------------------------------*/
#ifdef BLE_ENABLED

        //        while (1) {
        //                GPIOB->BSRR |= GPIO_PIN_LED_LEFT_RED << 16;
        //                HAL_Delay (500);
        //                GPIOB->BSRR |= GPIO_PIN_LED_LEFT_RED;
        //                HAL_Delay (500);
        //        }

        // BLE

        const char *name = "ZlaSuka";
        uint8_t SERVER_BDADDR[] = { 0x12, 0x34, 0x00, 0xE1, 0x80, 0x02 };
#define BDADDR_SIZE 6
        uint8_t bdaddr[BDADDR_SIZE];
        uint16_t service_handle, dev_name_char_handle, appearance_char_handle;

        uint8_t hwVersion;
        uint16_t fwVersion;

        int ret;

        /* Initialize the BlueNRG SPI driver */
        BNRG_SPI_Init ();

        /* Initialize the BlueNRG HCI */
        HCI_Init ();

        /* Reset BlueNRG hardware */
        BlueNRG_RST ();

        /* get the BlueNRG HW and FW versions */
        if (getBlueNRGVersion (&hwVersion, &fwVersion)) {
                Error_Handler ();
        }

        GPIOB->BSRR |= GPIO_PIN_LED_LEFT_YELLOW;

        /*
         * Reset BlueNRG again otherwise we won't
         * be able to change its MAC address.
         * aci_hal_write_config_data() must be the first
         * command after reset otherwise it will fail.
         */
        BlueNRG_RST ();

        if (hwVersion > 0x30) { /* X-NUCLEO-IDB05A1 expansion board is used */
                bnrg_expansion_board = IDB05A1;
                /*
                 * Change the MAC address to avoid issues with Android cache:
                 * if different boards have the same MAC address, Android
                 * applications unless you restart Bluetooth on tablet/phone
                 */
                SERVER_BDADDR[5] = 0x02;
        }

        /* The Nucleo board must be configured as SERVER */
        Osal_MemCpy (bdaddr, SERVER_BDADDR, sizeof (SERVER_BDADDR));

        if (aci_hal_write_config_data (CONFIG_DATA_PUBADDR_OFFSET, CONFIG_DATA_PUBADDR_LEN, bdaddr)) {
                Error_Handler ();
        }

        if (aci_gatt_init ()) {
                Error_Handler ();
        }

        if (bnrg_expansion_board == IDB05A1) {
                ret = aci_gap_init_IDB05A1 (GAP_PERIPHERAL_ROLE_IDB05A1, 0, 0x07, &service_handle, &dev_name_char_handle, &appearance_char_handle);
        }
        else {
                ret = aci_gap_init_IDB04A1 (GAP_PERIPHERAL_ROLE_IDB04A1, &service_handle, &dev_name_char_handle, &appearance_char_handle);
        }

        if (ret != BLE_STATUS_SUCCESS) {
                Error_Handler ();
        }

        if (aci_gatt_update_char_value (service_handle, dev_name_char_handle, 0, strlen (name), (uint8_t *)name)) {
                Error_Handler ();
        }

        if (aci_gap_set_auth_requirement (MITM_PROTECTION_REQUIRED, OOB_AUTH_DATA_ABSENT, NULL, 7, 16, USE_FIXED_PIN_FOR_PAIRING, 123456, BONDING)) {
                Error_Handler ();
        }

        if (Add_Acc_Service ()) {
                Error_Handler ();
        }

        /* Set output power level */
        if (aci_hal_set_tx_power_level (1, 7)) {
                Error_Handler ();
        }
#endif

        while (1) {
                GPIOB->BSRR |= GPIO_PIN_LED_LEFT_RED << 16;

#ifdef BLE_ENABLED
                HCI_Process ();
#else
                HAL_Delay (500);
#endif

                GPIOB->BSRR |= GPIO_PIN_LED_LEFT_RED;

#ifdef BLE_ENABLED
                User_Process (&axes_data);
#else
                HAL_Delay (500);
#endif
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

        //        RCC_OscInitTypeDef RCC_OscInitStruct;
        //        /* Select HSI48 Oscillator as PLL source */
        //        RCC_OscInitStruct.OscillatorType = RCC_OSCILLATORTYPE_HSI48;
        //        RCC_OscInitStruct.HSI48State = RCC_HSI48_ON;
        //        RCC_OscInitStruct.PLL.PLLState = RCC_PLL_ON;
        //        RCC_OscInitStruct.PLL.PLLSource = RCC_PLLSOURCE_HSI48;
        //        RCC_OscInitStruct.PLL.PREDIV = RCC_PREDIV_DIV2;
        //        RCC_OscInitStruct.PLL.PLLMUL = RCC_PLL_MUL2;

        //        if (HAL_RCC_OscConfig (&RCC_OscInitStruct) != HAL_OK) {
        //                Error_Handler ();
        //        }

        //        RCC_ClkInitTypeDef RCC_ClkInitStruct;
        //        RCC_ClkInitStruct.ClockType = RCC_CLOCKTYPE_SYSCLK;
        //        RCC_ClkInitStruct.SYSCLKSource = RCC_SYSCLKSOURCE_PLLCLK;
        //        RCC_ClkInitStruct.AHBCLKDivider = RCC_SYSCLK_DIV1;
        //        RCC_ClkInitStruct.APB1CLKDivider = RCC_HCLK_DIV1;
        //        HAL_RCC_ClockConfig (&RCC_ClkInitStruct, FLASH_LATENCY_1);

        //        HAL_SYSTICK_Config (HAL_RCC_GetHCLKFreq () / 1000);
        //        HAL_SYSTICK_CLKSourceConfig (SYSTICK_CLKSOURCE_HCLK);

        RCC_OscInitTypeDef RCC_OscInitStruct;
        RCC_ClkInitTypeDef RCC_ClkInitStruct;
        RCC_PeriphCLKInitTypeDef PeriphClkInit;

        RCC_OscInitStruct.OscillatorType = RCC_OSCILLATORTYPE_HSI14 | RCC_OSCILLATORTYPE_HSE;
        RCC_OscInitStruct.HSEState = RCC_HSE_ON;
        RCC_OscInitStruct.HSI14State = RCC_HSI14_ON;
        RCC_OscInitStruct.HSI14CalibrationValue = 16;
        RCC_OscInitStruct.PLL.PLLState = RCC_PLL_ON;
        RCC_OscInitStruct.PLL.PLLSource = RCC_PLLSOURCE_HSE;
        RCC_OscInitStruct.PLL.PLLMUL = RCC_PLL_MUL3;
        RCC_OscInitStruct.PLL.PREDIV = RCC_PREDIV_DIV1;
        HAL_RCC_OscConfig (&RCC_OscInitStruct);

        RCC_ClkInitStruct.ClockType = RCC_CLOCKTYPE_HCLK | RCC_CLOCKTYPE_SYSCLK
                | RCC_CLOCKTYPE_PCLK1;
        RCC_ClkInitStruct.SYSCLKSource = RCC_SYSCLKSOURCE_PLLCLK;
        RCC_ClkInitStruct.AHBCLKDivider = RCC_SYSCLK_DIV1;
        RCC_ClkInitStruct.APB1CLKDivider = RCC_HCLK_DIV1;
        HAL_RCC_ClockConfig (&RCC_ClkInitStruct, FLASH_LATENCY_1);

        PeriphClkInit.PeriphClockSelection = RCC_PERIPHCLK_USB;
        PeriphClkInit.UsbClockSelection = RCC_USBCLKSOURCE_PLLCLK;
        HAL_RCCEx_PeriphCLKConfig (&PeriphClkInit);

        HAL_SYSTICK_Config (HAL_RCC_GetHCLKFreq () / 1000);

        HAL_SYSTICK_CLKSourceConfig (SYSTICK_CLKSOURCE_HCLK);

        __SYSCFG_CLK_ENABLE ();
        HAL_NVIC_SetPriority (SysTick_IRQn, 0, 0);
        HAL_NVIC_EnableIRQ (SysTick_IRQn);
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

/**
 * @brief  Process user input (i.e. pressing the USER button on Nucleo board)
 *         and send the updated acceleration data to the remote client.
 *
 * @param  AxesRaw_t* p_axes
 * @retval None
 */
void User_Process (AxesRaw_t *p_axes)
{
        if (set_connectable) {
                setConnectable ();
                set_connectable = FALSE;
        }

        static int i = 0;

        if (++i > 100000) {
                i = 0;

                if (connected) {
                        /* Update acceleration data */
                        p_axes->AXIS_X += 100;
                        p_axes->AXIS_Y += 100;
                        p_axes->AXIS_Z += 100;

                        if (Acc_Update (p_axes)) {
                                Error_Handler ();
                        }
                }
        }
}
