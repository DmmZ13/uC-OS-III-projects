
#include "stm32f4xx_hal.h"
#include "stm32f4_discovery.h"
#include <os.h>

#define TASK_START_PRIO                     			   15u
#define TASK1_PRIO                    					   5u
#define TASK2_PRIO                    					   6u

#define TASK_START_STK_SIZE             				 (256u)
#define TASK1_STK_SIZE             						 (128u)
#define TASK2_STK_SIZE             						 (128u)

static OS_TCB                   TaskStartTCB;
static OS_TCB                   Task1_TCB;
static OS_TCB                   Task2_TCB;
static OS_MUTEX					Mutex;
static OS_Q  					Q;

static CPU_STK                  TaskStart_Stk[TASK_START_STK_SIZE];
static CPU_STK                  Task1_Stk[TASK1_STK_SIZE];
static CPU_STK                  Task2_Stk[TASK2_STK_SIZE];

static void TaskStart (void *p_arg);
static void Task1 (void *p_arg);
static void Task2 (void *p_arg);
static void SystemClkCfg (void);


int main(void)
{
    OS_ERR  err;

    HAL_Init();

    SystemClkCfg();

    OSInit(&err);

    OSMutexCreate (		 (OS_MUTEX  *)&Mutex,
                         (CPU_CHAR  *)"Mutex",
                         (OS_ERR    *)&err);

    OSQCreate 	(	 (OS_Q        *)&Q,
                     (CPU_CHAR    *)"Queue",
                     (OS_MSG_QTY   )10, //how many messages the message queue is allowed to receive
                     (OS_ERR      *)&err);


    OSTaskCreate(    (OS_TCB       *)&TaskStartTCB,
                     (CPU_CHAR     *)"Task Start",
                     (OS_TASK_PTR   )TaskStart,
                     (void         *)0u,
                     (OS_PRIO       )TASK_START_PRIO,
                     (CPU_STK      *)&TaskStart_Stk[0u],
                     (CPU_STK_SIZE  )TaskStart_Stk[TASK_START_STK_SIZE  / 10u],
                     (CPU_STK_SIZE  )TASK_START_STK_SIZE ,
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



static void TaskStart (void *p_arg)
{
    OS_ERR  err;

    (void)p_arg;

    OSTaskCreate(    (OS_TCB       *)&Task1_TCB,
                     (CPU_CHAR     *)"Task 1",
                     (OS_TASK_PTR   )Task1,
                     (void         *)0u,
                     (OS_PRIO       )TASK1_PRIO,
                     (CPU_STK      *)&Task1_Stk[0u],
                     (CPU_STK_SIZE  )Task1_Stk[TASK1_STK_SIZE  / 10u],
                     (CPU_STK_SIZE  )TASK1_STK_SIZE ,
                     (OS_MSG_QTY    )0u,
                     (OS_TICK       )0u,
                     (void         *)0u,
                     (OS_OPT        )(OS_OPT_TASK_STK_CHK | OS_OPT_TASK_STK_CLR),
                     (OS_ERR       *)&err);

    OSTaskCreate(    (OS_TCB       *)&Task2_TCB,
                     (CPU_CHAR     *)"Task 2",
                     (OS_TASK_PTR   )Task2,
                     (void         *)0u,
                     (OS_PRIO       )TASK2_PRIO,
                     (CPU_STK      *)&Task2_Stk[0u],
                     (CPU_STK_SIZE  )Task2_Stk[TASK2_STK_SIZE  / 10u],
                     (CPU_STK_SIZE  )TASK2_STK_SIZE ,
                     (OS_MSG_QTY    )0u,
                     (OS_TICK       )0u,
                     (void         *)0u,
                     (OS_OPT        )(OS_OPT_TASK_STK_CHK | OS_OPT_TASK_STK_CLR),
                     (OS_ERR       *)&err);

    BSP_LED_Init(LED6);

    while (DEF_TRUE) {
        BSP_LED_Toggle(LED6);
//        OSTimeDlyHMSM(0u, 0u, 0u, 500u, OS_OPT_TIME_PERIODIC , &err);
        OSTimeDly (		 (OS_TICK   )200,
                         (OS_OPT    )OS_OPT_TIME_PERIODIC,
                         (OS_ERR   *)&err);

    }
}


static void Task1 (void *p_arg)
{
    OS_ERR  err;
    CPU_TS ts;
    CPU_INT32U message = 100;

    (void)p_arg;

    while (DEF_TRUE) {
        OSTimeDly (		 (OS_TICK   )200,
                         (OS_OPT    )OS_OPT_TIME_PERIODIC,
                         (OS_ERR   *)&err);
        OSQPost (	   (OS_Q         *)&Q,
                       (void         *)message,
                       (OS_MSG_SIZE   )sizeof(void *),
                       (OS_OPT        )OS_OPT_POST_FIFO, //message to the end of the queue
                       (OS_ERR       *)&err);
        OSMutexPend (	   (OS_MUTEX  *)&Mutex,
                           (OS_TICK    )0,
                           (OS_OPT     )OS_OPT_PEND_BLOCKING,
                           (CPU_TS    *)&ts,
                           (OS_ERR    *)&err);
        // Access shared resource
        OSMutexPost (	   (OS_MUTEX  *)&Mutex,
                           (OS_OPT     )OS_OPT_POST_NONE,
                           (OS_ERR    *)&err);

    }
}

static void Task2 (void *p_arg)
{
    OS_ERR  err;
    CPU_INT32U message;
    OS_MSG_SIZE msg_size;
    CPU_TS ts;
    CPU_TS ts_delta;

    p_arg = p_arg;
    BSP_LED_Init(LED3);

    while (DEF_TRUE) {
    	message = (CPU_INT32U) OSQPend ( (OS_Q         *)&Q,
										(OS_TICK       )0, //0 means that the task will wait forever for the message to arrive
										(OS_OPT        )OS_OPT_PEND_BLOCKING,
										(OS_MSG_SIZE  *)&msg_size, //is a pointer to a variable that will receive the size of the message
										(CPU_TS       *)&ts,//is a pointer to a variable that will receive the timestamp of when the message was received, pend aborted or the message queue delete
										(OS_ERR       *)&err);
        ts_delta = OS_TS_GET() - ts; // delta é o tempo entre a obtenção da mensagem e sua recepção
        //process message received
        if (message == 100){
        	BSP_LED_Toggle(LED3);

        }
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

