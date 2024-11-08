/* USER CODE BEGIN Header */
/**
  ******************************************************************************
  * @file           : main.h
  * @brief          : Header for main.c file.
  *                   This file contains the common defines of the application.
  ******************************************************************************
  * @attention
  *
  * Copyright (c) 2024 STMicroelectronics.
  * All rights reserved.
  *
  * This software is licensed under terms that can be found in the LICENSE file
  * in the root directory of this software component.
  * If no LICENSE file comes with this software, it is provided AS-IS.
  *
  ******************************************************************************
  */
/* USER CODE END Header */

/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef __MAIN_H
#define __MAIN_H

#ifdef __cplusplus
extern "C" {
#endif

/* Includes ------------------------------------------------------------------*/
#include "stm32f4xx_hal.h"

/* Private includes ----------------------------------------------------------*/
/* USER CODE BEGIN Includes */

/* USER CODE END Includes */

/* Exported types ------------------------------------------------------------*/
/* USER CODE BEGIN ET */

/* USER CODE END ET */

/* Exported constants --------------------------------------------------------*/
/* USER CODE BEGIN EC */
extern DAC_HandleTypeDef hdac;
/* USER CODE END EC */

/* Exported macro ------------------------------------------------------------*/
/* USER CODE BEGIN EM */

/* USER CODE END EM */

/* Exported functions prototypes ---------------------------------------------*/
void Error_Handler(void);

/* USER CODE BEGIN EFP */

/* USER CODE END EFP */

/* Private defines -----------------------------------------------------------*/
#define DAC_NEG_Pin GPIO_PIN_4
#define DAC_NEG_GPIO_Port GPIOA
#define DAC_POSI_Pin GPIO_PIN_5
#define DAC_POSI_GPIO_Port GPIOA
#define Sensor1_Pin GPIO_PIN_7
#define Sensor1_GPIO_Port GPIOE
#define Sensor2_Pin GPIO_PIN_8
#define Sensor2_GPIO_Port GPIOE
#define Sensor3_Pin GPIO_PIN_9
#define Sensor3_GPIO_Port GPIOE
#define Sensor4_Pin GPIO_PIN_10
#define Sensor4_GPIO_Port GPIOE
#define Sensor5_Pin GPIO_PIN_11
#define Sensor5_GPIO_Port GPIOE
#define Sensor6_Pin GPIO_PIN_12
#define Sensor6_GPIO_Port GPIOE
#define Sensor7_Pin GPIO_PIN_13
#define Sensor7_GPIO_Port GPIOE

/* USER CODE BEGIN Private defines */

/* USER CODE END Private defines */

#ifdef __cplusplus
}
#endif

#endif /* __MAIN_H */

