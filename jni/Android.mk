LOCAL_PATH:= $(call my-dir)
include $(CLEAR_VARS)

LOCAL_SRC_FILES := \
    src/closures.c \
    src/java_raw_api.c \
    src/types.c \
    src/raw_api.c \
    src/prep_cif.c

LOCAL_C_INCLUDES += \
	$(LOCAL_PATH)/ \
	$(LOCAL_PATH)/include \

ifeq ($(TARGET_ARCH),arm)
  LOCAL_SRC_FILES += \
  	src/arm/ffi.c \
  	src/arm/sysv.S \
  	src/arm/trampoline.S
  LOCAL_C_INCLUDES += \
	$(LOCAL_PATH)/src/arm

endif

ifeq ($(TARGET_ARCH),arm-v7a)
  LOCAL_SRC_FILES += \
  	src/arm/ffi.c \
  	src/arm/sysv.S \
  	src/arm/trampoline.S
  LOCAL_C_INCLUDES += \
	$(LOCAL_PATH)/src/arm

endif

ifeq ($(TARGET_ARCH),mips)
  LOCAL_SRC_FILES += \
  	src/mips/ffi.c \
  	src/mips/n32.S \
  	src/mips/o32.S
  LOCAL_C_INCLUDES += \
	$(LOCAL_PATH)/src/mips

endif

LOCAL_MODULE := ffi

#include $(BUILD_STATIC_LIBRARY)
include $(BUILD_STATIC_LIBRARY)


