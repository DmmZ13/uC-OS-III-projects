################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Core/APP/config/main.c \
../Core/APP/config/os_app_hooks.c \
../Core/APP/config/stm32f4xx_hal_msp.c 

OBJS += \
./Core/APP/config/main.o \
./Core/APP/config/os_app_hooks.o \
./Core/APP/config/stm32f4xx_hal_msp.o 

C_DEPS += \
./Core/APP/config/main.d \
./Core/APP/config/os_app_hooks.d \
./Core/APP/config/stm32f4xx_hal_msp.d 


# Each subdirectory must supply rules for building sources it contributes
Core/APP/config/%.o Core/APP/config/%.su Core/APP/config/%.cyclo: ../Core/APP/config/%.c Core/APP/config/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F407xx -c -I"C:/Users/Visita/Downloads/Modelo-ucOS3/SYSTEM" -I"C:/Users/Visita/Downloads/Modelo-ucOS3/SYSTEM/STMCubeF4/CMSIS" -I"C:/Users/Visita/Downloads/Modelo-ucOS3/SYSTEM/STMCubeF4/STM32F4xx-HAL-Driver/inc" -I"C:/Users/Visita/Downloads/Modelo-ucOS3/SYSTEM/STMCubeF4/STM32F4xx-HAL-Driver/inc/Legacy" -I"C:/Users/Visita/Downloads/Modelo-ucOS3/uC-CPU" -I"C:/Users/Visita/Downloads/Modelo-ucOS3/uC-CPU/ARM-Cortex-M/ARMv7-M/GNU" -I"C:/Users/Visita/Downloads/Modelo-ucOS3/uC-LIB" -I"C:/Users/Visita/Downloads/Modelo-ucOS3/uC-LIB/Cfg/Template" -I"C:/Users/Visita/Downloads/Modelo-ucOS3/uC-OS3/Ports/ARM-Cortex-M/ARMv7-M/GNU" -I"C:/Users/Visita/Downloads/Modelo-ucOS3/uC-OS3/Source" -I"C:/Users/Visita/Downloads/Modelo-ucOS3/uC-LIB/Ports/ARM-Cortex-M4/GNU" -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"C:/Users/Visita/Documents/uC-tutorial/uC - project - novo/Core/BSP" -I"C:/Users/Visita/Documents/uC-tutorial/uC - project - novo/Core/APP/config" -I../Core/Inc -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Core-2f-APP-2f-config

clean-Core-2f-APP-2f-config:
	-$(RM) ./Core/APP/config/main.cyclo ./Core/APP/config/main.d ./Core/APP/config/main.o ./Core/APP/config/main.su ./Core/APP/config/os_app_hooks.cyclo ./Core/APP/config/os_app_hooks.d ./Core/APP/config/os_app_hooks.o ./Core/APP/config/os_app_hooks.su ./Core/APP/config/stm32f4xx_hal_msp.cyclo ./Core/APP/config/stm32f4xx_hal_msp.d ./Core/APP/config/stm32f4xx_hal_msp.o ./Core/APP/config/stm32f4xx_hal_msp.su

.PHONY: clean-Core-2f-APP-2f-config

