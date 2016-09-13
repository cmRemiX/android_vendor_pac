# Check for target product
ifeq (cmremix_trltetmo,$(TARGET_PRODUCT))

  # Custom Toolchain
  TARGET_NDK_VERSION := 4.9
  TARGET_SM_AND := 4.9
  TARGET_SM_KERNEL := 4.9
  #DRAGONTC_VERSION := 3.9

# Dalvik/Art
ADDITIONAL_DEFAULT_PROPERTIES += \
    ro.sys.fw.dex2oat_thread_count=4

# Disable ADB authentication and set root access to Apps and ADB
# DISABLE_ADB_AUTH := true

# Set bootanimation Size
CMREMIX_BOOTANIMATION_NAME := 1440

# Include Viper4Android
CMREMIX_INCLUDE_VIPER4ANDROID := true

# Include CM-Remix common configuration
include vendor/cmremix/config/cmremix_common.mk

# Inherit CM device configuration
$(call inherit-product, device/samsung/trltetmo/cm.mk)

endif
