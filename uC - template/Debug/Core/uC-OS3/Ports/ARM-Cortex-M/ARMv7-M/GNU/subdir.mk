################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
S_UPPER_SRCS += \
../Core/uC-OS3/Ports/ARM-Cortex-M/ARMv7-M/GNU/os_cpu_a.S 

OBJS += \
./Core/uC-OS3/Ports/ARM-Cortex-M/ARMv7-M/GNU/os_cpu_a.o 

S_UPPER_DEPS += \
./Core/uC-OS3/Ports/ARM-Cortex-M/ARMv7-M/GNU/os_cpu_a.d 


# Each subdirectory must supply rules for building sources it contributes
Core/uC-OS3/Ports/ARM-Cortex-M/ARMv7-M/GNU/%.o: ../Core/uC-OS3/Ports/ARM-Cortex-M/ARMv7-M/GNU/%.S Core/uC-OS3/Ports/ARM-Cortex-M/ARMv7-M/GNU/subdir.mk
	arm-none-eabi-gcc -mcpu=cortex-m4 -g3 -DDEBUG -c -x assembler-with-cpp -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@" "$<"

clean: clean-Core-2f-uC-2d-OS3-2f-Ports-2f-ARM-2d-Cortex-2d-M-2f-ARMv7-2d-M-2f-GNU

clean-Core-2f-uC-2d-OS3-2f-Ports-2f-ARM-2d-Cortex-2d-M-2f-ARMv7-2d-M-2f-GNU:
	-$(RM) ./Core/uC-OS3/Ports/ARM-Cortex-M/ARMv7-M/GNU/os_cpu_a.d ./Core/uC-OS3/Ports/ARM-Cortex-M/ARMv7-M/GNU/os_cpu_a.o

.PHONY: clean-Core-2f-uC-2d-OS3-2f-Ports-2f-ARM-2d-Cortex-2d-M-2f-ARMv7-2d-M-2f-GNU

