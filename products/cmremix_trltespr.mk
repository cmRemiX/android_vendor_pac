# Check for target product
ifeq (cmremix_trltespr,$(TARGET_PRODUCT))

TARGET_GCC_VERSION_AND := 4.9
TARGET_GCC_VERSION_ARM := 4.9

LOCAL_STRICT_ALIASING := true
O3_OPTIMIZATIONS := true
TARGET_USE_PIPE := true
ENABLE_PTHREAD := true
ENABLE_SANITIZE := true
ENABLE_GOMP := true
ENABLE_GCCONLY := true
FLOOP_NEST_OPTIMIZE := true

# Synapse 
TARGET_ENABLE_UKM := true

# Disable ADB authentication and set root access to Apps and ADB
DISABLE_ADB_AUTH := true

# Set bootanimation Size
CMREMIX_BOOTANIMATION_NAME := 1440

# Include CM-Remix common configuration
include vendor/cmremix/config/cmremix_common.mk

# Inherit CM device configuration
$(call inherit-product, device/samsung/trltespr/cm.mk)

endif
