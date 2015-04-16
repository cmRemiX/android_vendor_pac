# Check for target product
ifeq (cmremix_trltexx,$(TARGET_PRODUCT))

# Inherit sabermod device configuration
include vendor/cmremix/products/sm_trltexx.mk

# Set bootanimation Size
CMREMIX_BOOTANIMATION_NAME := 1440

# Include CM-Remix common configuration
include vendor/cmremix/config/cmremix_common.mk

# Inherit CM device configuration
$(call inherit-product, device/samsung/trltexx/cm.mk)

PRODUCT_NAME := cmremix_trltexx

endif
