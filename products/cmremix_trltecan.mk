# Check for target product
ifeq (cmremix_trltecan,$(TARGET_PRODUCT))

# Set Custom GCC Kernel Version 
TARGET_GCC_VERSION_ARM := 4.9

# Set Custom GCC Rom Version 
TARGET_GCC_VERSION_AND := 4.8

# Target arch is arm
TARGET_ARCH := arm

# Enable Strict Aliasing
#STRICT_ALIASING := true

# Enable -O3 Optimization
#USE_O3_OPTIMIZATIONS := true

# ENABLE_MODULAR_O3 := true

# Enable graphite flags
#GRAPHITE_OPTS := true

# Google host GCC
#USE_HOST_4_8 := true

# ENABLE_GCCONLY := true

# Enable Optimization for Krait
#KRAIT_TUNINGS := true

# Enable Link Time Optimization
# LOCAL_LTO := true

# Enable PIPE Optimization
TARGET_USE_PIPE := true

# Copy bootanimation
PRODUCT_COPY_FILES += \
    vendor/cmremix/prebuilt/bootanimation/1080x1920/bootanimation.zip:system/media/bootanimation.zip

# Include CM-Remix common configuration
include vendor/cmremix/config/cmremix_common.mk

# Inherit CM device configuration
$(call inherit-product, device/samsung/trltecan/cm.mk)

PRODUCT_NAME := cmremix_trltecan

endif
