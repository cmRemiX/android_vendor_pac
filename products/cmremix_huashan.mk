# Check for target product
ifeq (cmremix_huashan,$(TARGET_PRODUCT))

# Set bootanimation Size
CMREMIX_BOOTANIMATION_NAME := 720

# Include CM-Remix common configuration
include vendor/cmremix/config/cmremix_common.mk

# Inherit CM device configuration
$(call inherit-product, device/sony/huashan/cm.mk)

PRODUCT_NAME := cmremix_huashan

endif
