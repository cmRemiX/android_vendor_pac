# Check for target product
ifeq (cmremix_trlteusc,$(TARGET_PRODUCT))

# Target arch is arm
TARGET_ARCH := arm

# Some common sabermod variables before common
TARGET_SM_AND := 4.9
TARGET_SM_KERNEL := 4.9
TARGET_LIB_VERSION := 4.9

# Set Custom GCC Kernel Version 
TARGET_GCC_VERSION_ARM := 4.9

# Set Custom GCC Rom Version 
TARGET_GCC_VERSION_AND := 4.9

# Set Qcom Clang 3.5 
USE_CLANG_QCOM := true
#USE_CLANG_QCOM_LTO := true
LTO_OPTIMIZATION := true

# Enabled SaberMod Optimization Here
CMREMIX_OPTIMIZATIONS := true
GRAPHITE_OPTS := true
STRICT_ALIASING := true
USE_HOST_4_8 := true
O3_OPTIMIZATIONS := true
KRAIT_TUNINGS := true
ENABLE_GCCONLY := true
TARGET_USE_PIPE := true
ENABLE_PTHREAD := true
FLOOP_NEST_OPTIMIZE := true

# General flags for gcc 4.9 to allow compilation to complete.
MAYBE_UNINITIALIZED := \

##

# Set bootanimation Size
CMREMIX_BOOTANIMATION_NAME := 1440

# Include CM-Remix common configuration
include vendor/cmremix/config/cmremix_common.mk

# Inherit CM device configuration
$(call inherit-product, device/samsung/trlteusc/cm.mk)

PRODUCT_NAME := cmremix_trlteusc

endif
