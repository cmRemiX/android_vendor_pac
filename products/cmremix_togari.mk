# Check for target product
ifeq (cmremix_togari,$(TARGET_PRODUCT))

  TARGET_NDK_VERSION := 5.2
  TARGET_SM_AND := 5.3
  TARGET_SM_KERNEL := 6.0

  STRICT_ALIASING := true
  KRAIT_TUNINGS := true
  ENABLE_GCCONLY := true
  GRAPHITE_OPTS := true
  ENABLE_LSAN_OPENMP := true
  IPA_OPIMIZATION := true
  POLLY_OPTIMIZATION := true

# Clang Qcom Optimization
DISABLE_CLANG_QCOM_OPTIMIZATIONS := true
ifneq ($(DISABLE_CLANG_QCOM_OPTIMIZATIONS),true)
  USE_CLANG_QCOM := true
  USE_CLANG_QCOM_VERBOSE := true
  USE_CLANG_QCOM_POLLY := true
  CLANG_QCOM_COMPILE_ART := false
  CLANG_QCOM_COMPILE_BIONIC := false
  CLANG_QCOM_COMPILE_MIXED := false
endif

# enabled Debuggable by default
#PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
#    persist.service.adb.enable=1 \
#    persist.service.debuggable=1 \
#    persist.sys.usb.config=mtp,adb

# Set bootanimation Size
CMREMIX_BOOTANIMATION_NAME := 1080

# Include CM-Remix common configuration
include vendor/cmremix/config/cmremix_common.mk

# Inherit CM device configuration
$(call inherit-product, device/sony/togari/cm.mk)

endif
