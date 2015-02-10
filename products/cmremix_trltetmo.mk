# Check for target product
ifeq (cmremix_trltetmo,$(TARGET_PRODUCT))

# Target arch is arm
TARGET_ARCH := arm

# Some common sabermod variables before common
TARGET_SM_AND := 4.8
TARGET_SM_KERNEL := 4.9

# Set Custom GCC Kernel Version 
TARGET_GCC_VERSION_ARM := 4.9

# Set Custom GCC Rom Version 
TARGET_GCC_VERSION_AND := 4.8

# Enabled Optimization Options Here : 
GRAPHITE_OPTS := true
STRICT_ALIASING := true
USE_HOST_4_8 := true
O3_OPTIMIZATIONS := true
KRAIT_TUNINGS := true
#ENABLE_GCCONLY := true
#TARGET_USE_PIPE := true
#LOCAL_LTO := true
#GNU11_OPTIMIZATIONS := true
#FLOOP_NEST_OPTIMIZE := true

# Set bootanimation Size
CMREMIX_BOOTANIMATION_NAME := 1440

# Include CM-Remix common configuration
include vendor/cmremix/config/cmremix_common.mk

# Inherit CM device configuration
$(call inherit-product, device/samsung/trltetmo/cm.mk)

PRODUCT_NAME := cmremix_trltetmo

endif
