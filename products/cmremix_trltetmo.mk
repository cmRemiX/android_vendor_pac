# Check for target product
ifeq (cmremix_trltetmo,$(TARGET_PRODUCT))

GCC_VERSION_AND := 4.9
GCC_VERSION_ARM := 4.9

#SaberMod GCC info
-include vendor/cmremix/config/sm_board.mk

# Synapse 
TARGET_ENABLE_UKM := true

# Disable ADB authentication and set root access to Apps and ADB
DISABLE_ADB_AUTH := true

# Set bootanimation Size
CMREMIX_BOOTANIMATION_NAME := 1440

# Include CM-Remix common configuration
include vendor/cmremix/config/cmremix_common.mk

# Inherit CM device configuration
$(call inherit-product, device/samsung/trltetmo/cm.mk)

endif
