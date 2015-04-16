# Check for target product
ifeq (cmremix_hltespr,$(TARGET_PRODUCT))

# Inherit sabermod device configuration
include vendor/cmremix/products/sm_hltespr.mk

# Set bootanimation Size
CMREMIX_BOOTANIMATION_NAME := 1080

# Include CM-Remix common configuration
include vendor/cmremix/config/cmremix_common.mk

# Inherit CM device configuration
$(call inherit-product, device/samsung/hltespr/cm.mk)

PRODUCT_NAME := cmremix_hltespr

endif
