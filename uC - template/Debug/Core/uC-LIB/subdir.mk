################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Core/uC-LIB/lib_ascii.c \
../Core/uC-LIB/lib_math.c \
../Core/uC-LIB/lib_str.c 

OBJS += \
./Core/uC-LIB/lib_ascii.o \
./Core/uC-LIB/lib_math.o \
./Core/uC-LIB/lib_str.o 

C_DEPS += \
./Core/uC-LIB/lib_ascii.d \
./Core/uC-LIB/lib_math.d \
./Core/uC-LIB/lib_str.d 


# Each subdirectory must supply rules for building sources it contributes
Core/uC-LIB/%.o Core/uC-LIB/%.su Core/uC-LIB/%.cyclo: ../Core/uC-LIB/%.c Core/uC-LIB/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F407xx -c -I"C:/Users/Visita/Downloads/Modelo-ucOS3/SYSTEM" -I"C:/Users/Visita/Downloads/Modelo-ucOS3/SYSTEM/STMCubeF4/CMSIS" -I"C:/Users/Visita/Downloads/Modelo-ucOS3/SYSTEM/STMCubeF4/STM32F4xx-HAL-Driver/inc" -I"C:/Users/Visita/Downloads/Modelo-ucOS3/SYSTEM/STMCubeF4/STM32F4xx-HAL-Driver/inc/Legacy" -I"C:/Users/Visita/Downloads/Modelo-ucOS3/uC-CPU" -I"C:/Users/Visita/Downloads/Modelo-ucOS3/uC-CPU/ARM-Cortex-M/ARMv7-M/GNU" -I"C:/Users/Visita/Downloads/Modelo-ucOS3/uC-LIB" -I"C:/Users/Visita/Downloads/Modelo-ucOS3/uC-LIB/Cfg/Template" -I"C:/Users/Visita/Downloads/Modelo-ucOS3/uC-OS3/Ports/ARM-Cortex-M/ARMv7-M/GNU" -I"C:/Users/Visita/Downloads/Modelo-ucOS3/uC-OS3/Source" -I"C:/Users/Visita/Downloads/Modelo-ucOS3/uC-LIB/Ports/ARM-Cortex-M4/GNU" -I"C:/Users/Visita/Documents/uC-tutorial/uC - template/Core/APP/config" -I"C:/Users/Visita/Documents/uC-tutorial/uC - template/Core/BSP" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Core-2f-uC-2d-LIB

clean-Core-2f-uC-2d-LIB:
	-$(RM) ./Core/uC-LIB/lib_ascii.cyclo ./Core/uC-LIB/lib_ascii.d ./Core/uC-LIB/lib_ascii.o ./Core/uC-LIB/lib_ascii.su ./Core/uC-LIB/lib_math.cyclo ./Core/uC-LIB/lib_math.d ./Core/uC-LIB/lib_math.o ./Core/uC-LIB/lib_math.su ./Core/uC-LIB/lib_str.cyclo ./Core/uC-LIB/lib_str.d ./Core/uC-LIB/lib_str.o ./Core/uC-LIB/lib_str.su

.PHONY: clean-Core-2f-uC-2d-LIB

