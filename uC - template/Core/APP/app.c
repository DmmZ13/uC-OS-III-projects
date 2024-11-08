#include "stm32f4xx_hal.h"
#include <os.h>
#include <stdlib.h>
#include <stdbool.h>
#include "stm32f4_discovery.h"

#define INITIAL_TASK_PRIO                    5u
#define INITIAL_TASK_STK_SIZE          		 (256u)

static OS_TCB                   initialTaskTCB;
static CPU_STK                  initialTaskStk[INITIAL_TASK_STK_SIZE];

static void initialTask (void *p_arg);

static void SystemClkCfg (void);

int main(void)
{
    OS_ERR  err;

    HAL_Init();

    SystemClkCfg();

    OSInit(&err);

    OSTaskCreate(    (OS_TCB       *)&initialTaskTCB,
                     (CPU_CHAR     *)"Initial Task",
                     (OS_TASK_PTR   )initialTask,
                     (void         *)0u,
                     (OS_PRIO       )INITIAL_TASK_PRIO,
                     (CPU_STK      *)&initialTaskStk[0u],
                     (CPU_STK_SIZE  )initialTaskStk[INITIAL_TASK_STK_SIZE / 10u],
                     (CPU_STK_SIZE  )INITIAL_TASK_STK_SIZE,
                     (OS_MSG_QTY    )0u,
                     (OS_TICK       )0u,
                     (void         *)0u,
                     (OS_OPT        )(OS_OPT_TASK_STK_CHK | OS_OPT_TASK_STK_CLR),
                     (OS_ERR       *)&err);

    OSStart(&err);

    while (DEF_TRUE) {

    }

    return 0;
}



static void initialTask (void *p_arg)
{
    OS_ERR  err;

    (void)p_arg;

    BSP_LED_Init(LED6);

    while (DEF_TRUE) {
        BSP_LED_Toggle(LED6);
        OSTimeDly(200u, OS_OPT_TIME_PERIODIC , &err);

    }
}

static void SystemClkCfg (void)
{
    RCC_OscInitTypeDef RCC_OscInitStruct;
    RCC_ClkInitTypeDef RCC_ClkInitStruct;

    HAL_RCC_DeInit();
    __HAL_RCC_PWR_CLK_ENABLE();
    __HAL_PWR_VOLTAGESCALING_CONFIG(PWR_REGULATOR_VOLTAGE_SCALE1);
    RCC_OscInitStruct.OscillatorType = RCC_OSCILLATORTYPE_HSE;
    RCC_OscInitStruct.HSEState = RCC_HSE_ON;
    RCC_OscInitStruct.PLL.PLLState = RCC_PLL_ON;
    RCC_OscInitStruct.PLL.PLLSource = RCC_PLLSOURCE_HSE;
    RCC_OscInitStruct.PLL.PLLM = 25u;
    RCC_OscInitStruct.PLL.PLLN = 336u;
    RCC_OscInitStruct.PLL.PLLP = 2u;
    RCC_OscInitStruct.PLL.PLLQ = 7u;
    HAL_RCC_OscConfig(&RCC_OscInitStruct);
    RCC_ClkInitStruct.ClockType     = RCC_CLOCKTYPE_SYSCLK |
                                      RCC_CLOCKTYPE_HCLK   |
                                      RCC_CLOCKTYPE_PCLK1  |
                                      RCC_CLOCKTYPE_PCLK2;
    RCC_ClkInitStruct.SYSCLKSource = RCC_SYSCLKSOURCE_PLLCLK;
    RCC_ClkInitStruct.AHBCLKDivider = RCC_SYSCLK_DIV1;
    RCC_ClkInitStruct.APB1CLKDivider = RCC_HCLK_DIV4;
    RCC_ClkInitStruct.APB2CLKDivider = RCC_HCLK_DIV2;
    HAL_RCC_ClockConfig(&RCC_ClkInitStruct, FLASH_LATENCY_5);

    if (HAL_GetREVID() == 0x1001)
    {
        __HAL_FLASH_PREFETCH_BUFFER_ENABLE();
    }
}

