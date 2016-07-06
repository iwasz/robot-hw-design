#include <stm32f0xx_hal.h>
#include "hci.h"
#include "config.h"
#include "stm32f4xx_nucleo_bluenrg.h"

/******************************************************************************/
/*            Cortex-M4 Processor Exceptions Handlers                         */
/******************************************************************************/

/**
 * @brief  This function handles NMI exception.
 * @param  None
 * @retval None
 */
void NMI_Handler (void)
{
}

/**
 * @brief  This function handles Hard Fault exception.
 * @param  None
 * @retval None
 */
void HardFault_Handler (void)
{
        /* Go to infinite loop when Hard Fault exception occurs */
        while (1) {
        }
}

/**
 * @brief  This function handles SVCall exception.
 * @param  None
 * @retval None
 */
void SVC_Handler (void)
{
}

/**
 * @brief  This function handles PendSVC exception.
 * @param  None
 * @retval None
 */
void PendSV_Handler (void)
{
}

/**
 * @brief  This function handles SysTick Handler.
 * @param  None
 * @retval None
 */
void SysTick_Handler (void)
{
        HAL_IncTick ();
}

void BNRG_SPI_EXTI_IRQHandler (void)
{
        HCI_Isr ();
}
