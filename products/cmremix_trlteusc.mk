# Check for target product
ifeq (cmremix_trlteusc,$(TARGET_PRODUCT))

# Define Which GCC Version
TARGET_GCC_VERSION_AND := 4.9
TARGET_GCC_VERSION_ARM := 4.9

# Uber-MM Optimization
STRICT_ALIASING := true
KRAIT_TUNINGS := true
ENABLE_GCCONLY := true
GRAPHITE_OPTS := true
CLANG_O3 := true
POLLY_OPTIMIZATION := true

# Synapse 
# TARGET_ENABLE_UKM := true

# Disable ADB authentication and set root access to Apps and ADB
DISABLE_ADB_AUTH := true

# Set bootanimation Size
CMREMIX_BOOTANIMATION_NAME := 1440

# Include CM-Remix common configuration
include vendor/cmremix/config/cmremix_common.mk

# Inherit CM device configuration
$(call inherit-product, device/samsung/trlteusc/cm.mk)

endif
