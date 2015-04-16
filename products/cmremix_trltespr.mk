# Check for target product
ifeq (cmremix_trltespr,$(TARGET_PRODUCT))

$(shell unset EXTRA_SABERMOD_GCC_CFLAGS)

# Inherit sabermod device configuration
include vendor/cmremix/products/sm_trltespr.mk

# Set bootanimation Size
CMREMIX_BOOTANIMATION_NAME := 1440

# Include CM-Remix common configuration
include vendor/cmremix/config/cmremix_common.mk

# Inherit CM device configuration
$(call inherit-product, device/samsung/trltespr/cm.mk)

PRODUCT_NAME := cmremix_trltespr

endif
