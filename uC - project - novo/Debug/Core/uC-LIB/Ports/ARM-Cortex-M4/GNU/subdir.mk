################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
S_SRCS += \
../Core/uC-LIB/Ports/ARM-Cortex-M4/GNU/lib_mem_a.s 

OBJS += \
./Core/uC-LIB/Ports/ARM-Cortex-M4/GNU/lib_mem_a.o 

S_DEPS += \
./Core/uC-LIB/Ports/ARM-Cortex-M4/GNU/lib_mem_a.d 


# Each subdirectory must supply rules for building sources it contributes
Core/uC-LIB/Ports/ARM-Cortex-M4/GNU/%.o: ../Core/uC-LIB/Ports/ARM-Cortex-M4/GNU/%.s Core/uC-LIB/Ports/ARM-Cortex-M4/GNU/subdir.mk
	arm-none-eabi-gcc -mcpu=cortex-m4 -g3 -DDEBUG -c -x assembler-with-cpp -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@" "$<"

clean: clean-Core-2f-uC-2d-LIB-2f-Ports-2f-ARM-2d-Cortex-2d-M4-2f-GNU

clean-Core-2f-uC-2d-LIB-2f-Ports-2f-ARM-2d-Cortex-2d-M4-2f-GNU:
	-$(RM) ./Core/uC-LIB/Ports/ARM-Cortex-M4/GNU/lib_mem_a.d ./Core/uC-LIB/Ports/ARM-Cortex-M4/GNU/lib_mem_a.o

.PHONY: clean-Core-2f-uC-2d-LIB-2f-Ports-2f-ARM-2d-Cortex-2d-M4-2f-GNU

