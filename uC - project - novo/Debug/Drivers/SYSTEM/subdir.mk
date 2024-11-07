################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Drivers/SYSTEM/system_stm32f4xx.c 

S_UPPER_SRCS += \
../Drivers/SYSTEM/startup_stm32f407xx.S 

OBJS += \
./Drivers/SYSTEM/startup_stm32f407xx.o \
./Drivers/SYSTEM/system_stm32f4xx.o 

S_UPPER_DEPS += \
./Drivers/SYSTEM/startup_stm32f407xx.d 

C_DEPS += \
./Drivers/SYSTEM/system_stm32f4xx.d 


# Each subdirectory must supply rules for building sources it contributes
Drivers/SYSTEM/%.o: ../Drivers/SYSTEM/%.S Drivers/SYSTEM/subdir.mk
	arm-none-eabi-gcc -mcpu=cortex-m4 -g3 -DDEBUG -c -x assembler-with-cpp -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@" "$<"
Drivers/SYSTEM/%.o Drivers/SYSTEM/%.su Drivers/SYSTEM/%.cyclo: ../Drivers/SYSTEM/%.c Drivers/SYSTEM/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F407xx -c -I"C:/Users/Visita/Downloads/Modelo-ucOS3/SYSTEM" -I"C:/Users/Visita/Downloads/Modelo-ucOS3/SYSTEM/STMCubeF4/CMSIS" -I"C:/Users/Visita/Downloads/Modelo-ucOS3/SYSTEM/STMCubeF4/STM32F4xx-HAL-Driver/inc" -I"C:/Users/Visita/Downloads/Modelo-ucOS3/SYSTEM/STMCubeF4/STM32F4xx-HAL-Driver/inc/Legacy" -I"C:/Users/Visita/Downloads/Modelo-ucOS3/uC-CPU" -I"C:/Users/Visita/Downloads/Modelo-ucOS3/uC-CPU/ARM-Cortex-M/ARMv7-M/GNU" -I"C:/Users/Visita/Downloads/Modelo-ucOS3/uC-LIB" -I"C:/Users/Visita/Downloads/Modelo-ucOS3/uC-LIB/Cfg/Template" -I"C:/Users/Visita/Downloads/Modelo-ucOS3/uC-OS3/Ports/ARM-Cortex-M/ARMv7-M/GNU" -I"C:/Users/Visita/Downloads/Modelo-ucOS3/uC-OS3/Source" -I"C:/Users/Visita/Downloads/Modelo-ucOS3/uC-LIB/Ports/ARM-Cortex-M4/GNU" -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"C:/Users/Visita/Documents/uC-tutorial/uC - project - novo/Core/BSP" -I"C:/Users/Visita/Documents/uC-tutorial/uC - project - novo/Core/APP/config" -I../Core/Inc -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Drivers-2f-SYSTEM

clean-Drivers-2f-SYSTEM:
	-$(RM) ./Drivers/SYSTEM/startup_stm32f407xx.d ./Drivers/SYSTEM/startup_stm32f407xx.o ./Drivers/SYSTEM/system_stm32f4xx.cyclo ./Drivers/SYSTEM/system_stm32f4xx.d ./Drivers/SYSTEM/system_stm32f4xx.o ./Drivers/SYSTEM/system_stm32f4xx.su

.PHONY: clean-Drivers-2f-SYSTEM

