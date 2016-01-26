# Check for target product
ifeq (cmremix_trltexx,$(TARGET_PRODUCT))

  TARGET_NDK_VERSION := 4.9
  TARGET_SM_AND := 4.9
  TARGET_SM_KERNEL := 4.9

  STRICT_ALIASING := true
  KRAIT_TUNINGS := true
  ENABLE_GCCONLY := true
  GRAPHITE_OPTS := true
  ENABLE_LSAN_OPENMP := true
  USE_ARM_MODE := true
#  DISABLE_DTC_OPTS := true

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
PRODUCT_PROPERTY_OVERRIDES += \
    persist.service.adb.enable=1 \
    persist.service.debuggable=1 \
    persist.sys.usb.config=mtp,adb

# Synapse 
# TARGET_ENABLE_UKM := true

# Disable ADB authentication and set root access to Apps and ADB
DISABLE_ADB_AUTH := true

# Set bootanimation Size
CMREMIX_BOOTANIMATION_NAME := 1440

# Include CM-Remix common configuration
include vendor/cmremix/config/cmremix_common.mk

# Inherit CM device configuration
$(call inherit-product, device/samsung/trltexx/cm.mk)

endif
