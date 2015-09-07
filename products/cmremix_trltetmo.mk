# Check for target product
ifeq (cmremix_trltetmo,$(TARGET_PRODUCT))

# Synapse 
TARGET_ENABLE_UKM := true

# Set bootanimation Size
CMREMIX_BOOTANIMATION_NAME := 1440

# Include CM-Remix common configuration
include vendor/cmremix/config/cmremix_common.mk

# Inherit CM device configuration
$(call inherit-product, device/samsung/trltetmo/cm.mk)

PRODUCT_NAME := cmremix_trltetmo

endif
