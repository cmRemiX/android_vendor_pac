# Check for target product
ifeq (cmremix_trltevzw,$(TARGET_PRODUCT))

# Custom Toolchaim
  TARGET_NDK_VERSION := 4.9
  TARGET_SM_AND := 4.9
  TARGET_SM_KERNEL := 4.9

# CMRemix-MM Optimization
  GRAPHITE_OPTIMIZATION := true
  LOCAL_STRICT_ALIASING := true
  ENABLE_GCC_DEFAULTS := true
  O3_OPTIMIZATIONS := true
  USE_ARM_MODE := true
  DISABLE_DTC_OPTS := false

#################
# NO OPTIMIZATION
#################
# Bluetooth modules
LOCAL_BLUETOOTH_BLUEDROID := \
  bluetooth.default \
  libbt-brcm_stack \
  audio.a2dp.default \
  libbt-brcm_gki \
  libbt-utils \
  libbt-qcom_sbc_decoder \
  libbt-brcm_bta \
  bdt \
  bdtest \
  libbt-hci \
  libosi \
  ositests \
  libbt-vendor \
  libbluetooth_jni

ifndef NO_OPTIMIZATIONS
  NO_OPTIMIZATIONS := $(LOCAL_BLUETOOTH_BLUEDROID) libadbd
else
  NO_OPTIMIZATIONS += $(LOCAL_BLUETOOTH_BLUEDROID) libadbd
endif

# setup scheduler tunable
PRODUCT_PROPERTY_OVERRIDES += \
   ro.qualcomm.perf.cores_online=2

# Synapse 
# TARGET_ENABLE_UKM := true

# Disable ADB authentication and set root access to Apps and ADB
DISABLE_ADB_AUTH := true

# Set bootanimation Size
CMREMIX_BOOTANIMATION_NAME := 1440

# Include CM-Remix common configuration
include vendor/cmremix/config/cmremix_common.mk

# Inherit CM device configuration
$(call inherit-product, device/samsung/trltevzw/cm.mk)

endif
