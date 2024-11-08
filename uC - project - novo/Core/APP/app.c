#include <os.h>
#include <stdlib.h>
#include <stdbool.h>
#include "stm32f4_discovery.h"
#include "main.h"

#define INITIAL_TASK_PRIO                    5u
#define INITIAL_TASK_STK_SIZE          		 (256u)
#define SENSORES_RNT_TASK_PRIO               (INITIAL_TASK_PRIO - 2)
#define SENSORES_RNT_TASK_STK_SIZE           (256u)
#define VOLTAGEM_MAX  						 3	//Voltagem máxima a ser entregue ao driver do motor

/* Parâmetros para as Tasks*/
static OS_TCB                   initialTaskTCB;
static CPU_STK                  initialTaskStk[INITIAL_TASK_STK_SIZE];
static OS_TCB                   sensoresRntTaskTCB;
static CPU_STK                  sensoresRntTaskStk[SENSORES_RNT_TASK_STK_SIZE];

/* Definição das Tasks */
static void initialTask (void *p_arg);
static void sensoresRntTask (void *p_arg);

/*Função para ler os sensores e enviar as saídas analógicas*/
static void le_sensores (void);


GPIO_PinState sensor1_read;
GPIO_PinState sensor2_read;
GPIO_PinState sensor3_read;
GPIO_PinState sensor4_read;
GPIO_PinState sensor5_read;
GPIO_PinState sensor6_read;
GPIO_PinState sensor7_read;

float positive_voltage_value = 0;
float negative_voltage_value = 0;
uint16_t positive_dac_value;
uint16_t negative_dac_value;

int main(void)
{
    OS_ERR  err;

    HAL_Init();

    SystemClock_Config();

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

/* Inicia os perifericos e a taks de ler os sensores*/
static void initialTask (void *p_arg)
{
    OS_ERR  err;

    (void)p_arg;

    MX_GPIO_Init();
    MX_DAC_Init();
    BSP_LED_Init(LED3);
    BSP_LED_Init(LED4);
    BSP_LED_Init(LED5);
    BSP_LED_Init(LED6);

    OSTaskCreate(    (OS_TCB       *)&sensoresRntTaskTCB,
                     (CPU_CHAR     *)"Sensores Read and Transmit Task",
                     (OS_TASK_PTR   )sensoresRntTask,
                     (void         *)0u,
                     (OS_PRIO       )SENSORES_RNT_TASK_PRIO,
                     (CPU_STK      *)&sensoresRntTaskStk[0u],
                     (CPU_STK_SIZE  )sensoresRntTaskStk[SENSORES_RNT_TASK_STK_SIZE / 10u],
                     (CPU_STK_SIZE  )SENSORES_RNT_TASK_STK_SIZE,
                     (OS_MSG_QTY    )0u,
                     (OS_TICK       )0u,
                     (void         *)0u,
                     (OS_OPT        )(OS_OPT_TASK_STK_CHK | OS_OPT_TASK_STK_CLR),
                     (OS_ERR       *)&err);

    while (DEF_TRUE) {
        BSP_LED_Toggle(LED6);
        OSTimeDly(500u, OS_OPT_TIME_PERIODIC , &err);

    }
}

/*sensores read and transmit task*/
static void sensoresRntTask (void *p_arg)
{
	OS_ERR  err;
	(void)p_arg;

	HAL_DAC_Start(&hdac, DAC_CHANNEL_1);
	HAL_DAC_Start(&hdac, DAC_CHANNEL_2);
	while (DEF_TRUE) {
	    BSP_LED_Toggle(LED5);
	    le_sensores();
	    OSTimeDly(10u, OS_OPT_TIME_PERIODIC , &err); //Máximo de 1ms de delay já que OS_CFG_TICK_RATE_HZ = 1000Hz

	}
}

static void le_sensores (void){
	sensor1_read = HAL_GPIO_ReadPin(Sensor1_GPIO_Port, Sensor1_Pin);
	sensor2_read = HAL_GPIO_ReadPin(Sensor2_GPIO_Port, Sensor2_Pin);
	sensor3_read = HAL_GPIO_ReadPin(Sensor3_GPIO_Port, Sensor3_Pin); /* SENSOR BASE */
	sensor4_read = HAL_GPIO_ReadPin(Sensor4_GPIO_Port, Sensor4_Pin);
	sensor5_read = HAL_GPIO_ReadPin(Sensor5_GPIO_Port, Sensor5_Pin);
	sensor6_read = HAL_GPIO_ReadPin(Sensor6_GPIO_Port, Sensor6_Pin);
	sensor7_read = HAL_GPIO_ReadPin(Sensor7_GPIO_Port, Sensor7_Pin);

	if (sensor7_read) {
		positive_voltage_value = 1*VOLTAGEM_MAX; //3
		negative_voltage_value = 0;
	}

	else if (sensor6_read) {
		positive_voltage_value = 0.75*VOLTAGEM_MAX; //2.25
		negative_voltage_value = 0;
	}

	else if (sensor5_read) {
		positive_voltage_value = 0.5*VOLTAGEM_MAX; //1.5
		negative_voltage_value = 0;
	}

	else if (sensor4_read) {
		positive_voltage_value = 0.25*VOLTAGEM_MAX; //0.75
		negative_voltage_value = 0;
	}

	else if (sensor3_read) {
		positive_voltage_value = 0;
		negative_voltage_value = 0;
	}

	else if (sensor2_read) {
		positive_voltage_value = 0;
		negative_voltage_value = 0.5*VOLTAGEM_MAX; //-1.5
	}

	else if (sensor1_read) {
		positive_voltage_value = 0;
		negative_voltage_value = 1*VOLTAGEM_MAX; //-3
	}

	positive_dac_value = (uint16_t)((positive_voltage_value*4095)/VOLTAGEM_MAX);
	negative_dac_value = (uint16_t)((negative_voltage_value*4095)/VOLTAGEM_MAX);
	HAL_DAC_SetValue(&hdac, DAC_CHANNEL_1, DAC_ALIGN_12B_R, negative_dac_value); //CHANNEL1 - PA4
	HAL_DAC_SetValue(&hdac, DAC_CHANNEL_2, DAC_ALIGN_12B_R, positive_dac_value); //CHANNEL2 - PA5

}

