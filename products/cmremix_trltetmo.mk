# Check for target product
ifeq (cmremix_trltetmo,$(TARGET_PRODUCT))

# Set Custom GCC Kernel Version 
TARGET_GCC_VERSION_ARM := 4.9

# Set Custom GCC Rom Version 
TARGET_GCC_VERSION_AND := 4.8

# Target arch is arm
TARGET_ARCH := arm


# Enable PIPE Optimization
#TARGET_USE_PIPE := true

# Set bootanimation Size
CMREMIX_BOOTANIMATION_NAME := 1600

# Include CM-Remix common configuration
include vendor/cmremix/config/cmremix_common.mk

# Inherit CM device configuration
$(call inherit-product, device/samsung/trltetmo/cm.mk)

PRODUCT_NAME := cmremix_trltetmo

endif
