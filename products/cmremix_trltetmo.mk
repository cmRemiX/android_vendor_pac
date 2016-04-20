# Check for target product
ifeq (cmremix_trltetmo,$(TARGET_PRODUCT))

  # Custom Toolchain
  TARGET_NDK_VERSION := 5.2
  TARGET_SM_AND := 5.3
  TARGET_SM_KERNEL := 7.0
  DRAGONTC_VERSION := 3.9

  # CMRemix-MM Optimization
  GRAPHITE_OPTIMIZATION := true
  LOCAL_STRICT_ALIASING := true
  ENABLE_GCC_DEFAULTS := true
  O3_OPTIMIZATIONS := true
  DISABLE_DTC_OPTS := false
  ENABLE_PTHREAD := true
  GCC_ONLY_OPTIMIZATION := true
  ENABLE_DTC_LTO := false
  USE_ARM_MODE := true
  IPA_OPTIMIZATIONS := false
  OPENMP_OPTIMIZATIONS := false
  MEMORY_LEAK_OPTIMIZATIONS := false

# No Optimization Bluetooth modules
LOCAL_BLUETOOTH_BLUEDROID := libbluetooth_jni bluetooth.mapsapi bluetooth.default bluetooth.mapsapi libbt-brcm_stack audio.a2dp.default libbt-brcm_gki libbt-utils libbt-qcom_sbc_decoder libbt-brcm_bta libbt-brcm_stack libbt-vendor libbtprofile libbtdevice libbtcore bdt bdtest libbt-hci libosi ositests libbluetooth_jni net_test_osi net_test_device net_test_btcore net_bdtool net_hci bdAddrLoader libadbd

ifndef NO_OPTIMIZATIONS
  NO_OPTIMIZATIONS := $(LOCAL_BLUETOOTH_BLUEDROID)
else
  NO_OPTIMIZATIONS += $(LOCAL_BLUETOOTH_BLUEDROID)
endif

# Dalvik/Art
ADDITIONAL_DEFAULT_PROPERTIES += \
    ro.sys.fw.dex2oat_thread_count=4

# Disable ADB authentication and set root access to Apps and ADB
DISABLE_ADB_AUTH := true

# Set bootanimation Size
CMREMIX_BOOTANIMATION_NAME := 1440

# Include Viper4Android
CMREMIX_INCLUDE_VIPER4ANDROID := true

# Include CM-Remix common configuration
include vendor/cmremix/config/cmremix_common.mk

# Inherit CM device configuration
$(call inherit-product, device/samsung/trltetmo/cm.mk)

endif
