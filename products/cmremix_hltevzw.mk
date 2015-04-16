# Check for target product
ifeq (cmremix_hltevzw,$(TARGET_PRODUCT))

$(shell unset EXTRA_SABERMOD_GCC_CFLAGS)

# Inherit sabermod device configuration
include vendor/cmremix/products/sm_hltevzw.mk

# Set bootanimation Size
CMREMIX_BOOTANIMATION_NAME := 1080

# Include CM-Remix common configuration
include vendor/cmremix/config/cmremix_common.mk

# Inherit CM device configuration
$(call inherit-product, device/samsung/hltevzw/cm.mk)

PRODUCT_NAME := cmremix_hltevzw

endif
