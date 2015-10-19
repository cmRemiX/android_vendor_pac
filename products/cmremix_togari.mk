# Check for target product
ifeq (cmremix_togari,$(TARGET_PRODUCT))

# Set bootanimation Size
CMREMIX_BOOTANIMATION_NAME := 1080

# Include CM-Remix common configuration
include vendor/cmremix/config/cmremix_common.mk

# Inherit CM device configuration
$(call inherit-product, device/sony/togari/cm.mk)

endif
