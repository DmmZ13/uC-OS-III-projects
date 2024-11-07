################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Core/uC-OS3/Source/os_cfg_app.c \
../Core/uC-OS3/Source/os_core.c \
../Core/uC-OS3/Source/os_dbg.c \
../Core/uC-OS3/Source/os_flag.c \
../Core/uC-OS3/Source/os_mem.c \
../Core/uC-OS3/Source/os_msg.c \
../Core/uC-OS3/Source/os_mutex.c \
../Core/uC-OS3/Source/os_prio.c \
../Core/uC-OS3/Source/os_q.c \
../Core/uC-OS3/Source/os_sem.c \
../Core/uC-OS3/Source/os_stat.c \
../Core/uC-OS3/Source/os_task.c \
../Core/uC-OS3/Source/os_tick.c \
../Core/uC-OS3/Source/os_time.c \
../Core/uC-OS3/Source/os_tmr.c \
../Core/uC-OS3/Source/os_var.c 

OBJS += \
./Core/uC-OS3/Source/os_cfg_app.o \
./Core/uC-OS3/Source/os_core.o \
./Core/uC-OS3/Source/os_dbg.o \
./Core/uC-OS3/Source/os_flag.o \
./Core/uC-OS3/Source/os_mem.o \
./Core/uC-OS3/Source/os_msg.o \
./Core/uC-OS3/Source/os_mutex.o \
./Core/uC-OS3/Source/os_prio.o \
./Core/uC-OS3/Source/os_q.o \
./Core/uC-OS3/Source/os_sem.o \
./Core/uC-OS3/Source/os_stat.o \
./Core/uC-OS3/Source/os_task.o \
./Core/uC-OS3/Source/os_tick.o \
./Core/uC-OS3/Source/os_time.o \
./Core/uC-OS3/Source/os_tmr.o \
./Core/uC-OS3/Source/os_var.o 

C_DEPS += \
./Core/uC-OS3/Source/os_cfg_app.d \
./Core/uC-OS3/Source/os_core.d \
./Core/uC-OS3/Source/os_dbg.d \
./Core/uC-OS3/Source/os_flag.d \
./Core/uC-OS3/Source/os_mem.d \
./Core/uC-OS3/Source/os_msg.d \
./Core/uC-OS3/Source/os_mutex.d \
./Core/uC-OS3/Source/os_prio.d \
./Core/uC-OS3/Source/os_q.d \
./Core/uC-OS3/Source/os_sem.d \
./Core/uC-OS3/Source/os_stat.d \
./Core/uC-OS3/Source/os_task.d \
./Core/uC-OS3/Source/os_tick.d \
./Core/uC-OS3/Source/os_time.d \
./Core/uC-OS3/Source/os_tmr.d \
./Core/uC-OS3/Source/os_var.d 


# Each subdirectory must supply rules for building sources it contributes
Core/uC-OS3/Source/%.o Core/uC-OS3/Source/%.su Core/uC-OS3/Source/%.cyclo: ../Core/uC-OS3/Source/%.c Core/uC-OS3/Source/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F407xx -c -I"C:/Users/Visita/Downloads/Modelo-ucOS3/SYSTEM" -I"C:/Users/Visita/Downloads/Modelo-ucOS3/SYSTEM/STMCubeF4/CMSIS" -I"C:/Users/Visita/Downloads/Modelo-ucOS3/SYSTEM/STMCubeF4/STM32F4xx-HAL-Driver/inc" -I"C:/Users/Visita/Downloads/Modelo-ucOS3/SYSTEM/STMCubeF4/STM32F4xx-HAL-Driver/inc/Legacy" -I"C:/Users/Visita/Downloads/Modelo-ucOS3/uC-CPU" -I"C:/Users/Visita/Downloads/Modelo-ucOS3/uC-CPU/ARM-Cortex-M/ARMv7-M/GNU" -I"C:/Users/Visita/Downloads/Modelo-ucOS3/uC-LIB" -I"C:/Users/Visita/Downloads/Modelo-ucOS3/uC-LIB/Cfg/Template" -I"C:/Users/Visita/Downloads/Modelo-ucOS3/uC-OS3/Ports/ARM-Cortex-M/ARMv7-M/GNU" -I"C:/Users/Visita/Downloads/Modelo-ucOS3/uC-OS3/Source" -I"C:/Users/Visita/Downloads/Modelo-ucOS3/uC-LIB/Ports/ARM-Cortex-M4/GNU" -I"C:/Users/Visita/Documents/uC-tutorial/uC - template/Core/APP/config" -I"C:/Users/Visita/Documents/uC-tutorial/uC - template/Core/BSP" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Core-2f-uC-2d-OS3-2f-Source

clean-Core-2f-uC-2d-OS3-2f-Source:
	-$(RM) ./Core/uC-OS3/Source/os_cfg_app.cyclo ./Core/uC-OS3/Source/os_cfg_app.d ./Core/uC-OS3/Source/os_cfg_app.o ./Core/uC-OS3/Source/os_cfg_app.su ./Core/uC-OS3/Source/os_core.cyclo ./Core/uC-OS3/Source/os_core.d ./Core/uC-OS3/Source/os_core.o ./Core/uC-OS3/Source/os_core.su ./Core/uC-OS3/Source/os_dbg.cyclo ./Core/uC-OS3/Source/os_dbg.d ./Core/uC-OS3/Source/os_dbg.o ./Core/uC-OS3/Source/os_dbg.su ./Core/uC-OS3/Source/os_flag.cyclo ./Core/uC-OS3/Source/os_flag.d ./Core/uC-OS3/Source/os_flag.o ./Core/uC-OS3/Source/os_flag.su ./Core/uC-OS3/Source/os_mem.cyclo ./Core/uC-OS3/Source/os_mem.d ./Core/uC-OS3/Source/os_mem.o ./Core/uC-OS3/Source/os_mem.su ./Core/uC-OS3/Source/os_msg.cyclo ./Core/uC-OS3/Source/os_msg.d ./Core/uC-OS3/Source/os_msg.o ./Core/uC-OS3/Source/os_msg.su ./Core/uC-OS3/Source/os_mutex.cyclo ./Core/uC-OS3/Source/os_mutex.d ./Core/uC-OS3/Source/os_mutex.o ./Core/uC-OS3/Source/os_mutex.su ./Core/uC-OS3/Source/os_prio.cyclo ./Core/uC-OS3/Source/os_prio.d ./Core/uC-OS3/Source/os_prio.o ./Core/uC-OS3/Source/os_prio.su ./Core/uC-OS3/Source/os_q.cyclo ./Core/uC-OS3/Source/os_q.d ./Core/uC-OS3/Source/os_q.o ./Core/uC-OS3/Source/os_q.su ./Core/uC-OS3/Source/os_sem.cyclo ./Core/uC-OS3/Source/os_sem.d ./Core/uC-OS3/Source/os_sem.o ./Core/uC-OS3/Source/os_sem.su ./Core/uC-OS3/Source/os_stat.cyclo ./Core/uC-OS3/Source/os_stat.d ./Core/uC-OS3/Source/os_stat.o ./Core/uC-OS3/Source/os_stat.su ./Core/uC-OS3/Source/os_task.cyclo ./Core/uC-OS3/Source/os_task.d ./Core/uC-OS3/Source/os_task.o ./Core/uC-OS3/Source/os_task.su ./Core/uC-OS3/Source/os_tick.cyclo ./Core/uC-OS3/Source/os_tick.d ./Core/uC-OS3/Source/os_tick.o ./Core/uC-OS3/Source/os_tick.su ./Core/uC-OS3/Source/os_time.cyclo ./Core/uC-OS3/Source/os_time.d ./Core/uC-OS3/Source/os_time.o ./Core/uC-OS3/Source/os_time.su ./Core/uC-OS3/Source/os_tmr.cyclo ./Core/uC-OS3/Source/os_tmr.d ./Core/uC-OS3/Source/os_tmr.o ./Core/uC-OS3/Source/os_tmr.su ./Core/uC-OS3/Source/os_var.cyclo ./Core/uC-OS3/Source/os_var.d ./Core/uC-OS3/Source/os_var.o ./Core/uC-OS3/Source/os_var.su

.PHONY: clean-Core-2f-uC-2d-OS3-2f-Source

