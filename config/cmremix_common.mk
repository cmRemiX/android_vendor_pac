## CMRemix Roms Required Apps and Configs

# Omni 
PRODUCT_PACKAGES += \
    OmniSwitch \
    OmniJaws \
    OmniStyle

# CMRemixOTA
PRODUCT_PACKAGES += \
    CMRemixOTA \
    CMRemixUpdater \
    CMRemixSetupWizard

# slim Apps
PRODUCT_PACKAGES += \
    SlimFileManager \
    DashClock \
    SlimLauncher

# Kernel Adiuter
PRODUCT_PACKAGES += \
    KernelAdiutor \
    FloatingActionButton

# Busybox
PRODUCT_PACKAGES += \
    Busybox

# DU Utils Library
PRODUCT_PACKAGES += \
    org.dirtyunicorns.utils

PRODUCT_BOOT_JARS += \
    org.dirtyunicorns.utils

# Exchange support
PRODUCT_PACKAGES += \
   OpenWeatherMapProvider

# CMRemix Utils Library
PRODUCT_PACKAGES += \
    org.cmremix.utils

PRODUCT_BOOT_JARS += \
    org.cmremix.utils

# Viper4Android
ifeq ($(CMREMIX_INCLUDE_VIPER4ANDROID),true)
PRODUCT_COPY_FILES += \
   vendor/cmremix/prebuilt/common/bin/audio_policy.sh:system/audio_policy.sh \
   vendor/cmremix/prebuilt/common/addon.d/95-LolliViPER.sh:system/addon.d/95-LolliViPER.sh \
   vendor/cmremix/prebuilt/common/su.d/50viper.sh:system/su.d/50viper.sh \
   vendor/cmremix/prebuilt/common/etc/audio_effects.conf:system/etc/audio_effects.conf \
   vendor/cmremix/prebuilt/common/lib/soundfx/libeffectproxy.so:system/lib/soundfx/libeffectproxy.so \
   vendor/cmremix/prebuilt/common/lib/soundfx/libv4a_fx_ics.so:system/lib/soundfx/libv4a_fx_ics.so \
   vendor/cmremix/prebuilt/common/apk/Viper4Android/lib/arm/libV4AJniUtils.so:system/priv-app/Viper4Android/lib/arm/libV4AJniUtils.so \
   vendor/cmremix/prebuilt/common/apk/Viper4Android/Viper4Android.apk:system/priv-app/Viper4Android/Viper4Android.apk
endif

# KCAL - Advanced color control for Qualcomm MDSS 8x26/8974/8084
PRODUCT_COPY_FILES += \
vendor/cmremix/prebuilt/common/apk/Savoca-Kcal/Savoca-Kcal.apk:system/app/Savoca-Kcal/Savoca-Kcal.apk

# OpenCamra
PRODUCT_COPY_FILES += \
vendor/cmremix/prebuilt/common/apk/OpenCamera/OpenCamera.apk:system/app/OpenCamera/OpenCamera.apk

# KernelAdiutor
PRODUCT_COPY_FILES += \
    vendor/cmremix/prebuilt/common/apk/KernelAdiutor/KernelAdiutor.apk:system/app/KernelAdiutor/KernelAdiutor.apk

# DeviceControl
PRODUCT_COPY_FILES += \
    vendor/cmremix/prebuilt/common/apk/DeviceControl/DeviceControl.apk:system/app/DeviceControl/DeviceControl.apk

# AdvancedDisplay
PRODUCT_COPY_FILES += \
    vendor/cmremix/prebuilt/common/apk/AdvancedDisplay/AdvancedDisplay.apk:system/app/AdvancedDisplay/AdvancedDisplay.apk

# CM-Remix Overlays
PRODUCT_PACKAGE_OVERLAYS += vendor/cmremix/overlay/common

# Bootanimation
PRODUCT_COPY_FILES += vendor/cmremix/prebuilt/common/bootanimation/$(CMREMIX_BOOTANIMATION_NAME).zip:system/media/bootanimation.zip

# AdAway App
PRODUCT_COPY_FILES += \
    vendor/cmremix/prebuilt/common/apk/AdAway/AdAway.apk:system/priv-app/AdAway/AdAway.apk

# Init script file with CM-Remix extras
PRODUCT_COPY_FILES += \
vendor/cmremix/prebuilt/common/etc/init.local.rc:root/init.cmremix.rc

# Add ZION959 kernel config file
#PRODUCT_COPY_FILES += \
#    vendor/cmremix/prebuilt/common/etc/init.zion959.kernel.sh:system/etc/init.zion959.kernel.sh

 # SuperSU
PRODUCT_COPY_FILES += \
    vendor/cmremix/prebuilt/common/etc/supersu.zip:supersu/supersu.zip

# Assertive Disaply
PRODUCT_COPY_FILES += \
    vendor/cmremix/prebuilt/common/etc/ad_calib.cfg:system/etc/ad_calib.cfg
PRODUCT_PROPERTY_OVERRIDES += \
    ro.qcom.ad=1 \
    ro.qcom.ad.calib.data=/system/etc/ad_calib.cfg \
    persist.radio.add_power_save=1 \
    persist.radio.data_no_toggle=1

# CMRemix Rom
PRODUCT_COPY_FILES += \
    vendor/cmremix/config/permissions/org.cmremixrom.android.xml:system/etc/permissions/org.cmremixrom.android.xml

# easy way to extend to add more packages
-include vendor/cmremix/extra/product.mk

# Inherite sabermod Config
-include vendor/cmremix/config/sm_board.mk

# CM-Remix version
CMREMIXVERSION := $(shell echo $(CMREMIX_VERSION) | sed -e 's/^[ \t]*//;s/[ \t]*$$//;s/ /./g')
BOARD := $(subst cmremix_,,$(TARGET_PRODUCT))
CMREMIX_BUILD_VERSION := CMRemix_$(BOARD)_$(CMREMIXVERSION)_$(shell date +%Y%m%d-%H%M%S)
PRODUCT_NAME := $(TARGET_PRODUCT)

# Set the board version
CM_BUILD := $(BOARD)

# Lower RAM devices
ifeq ($(CMREMIX_LOW_RAM_DEVICE),true)
MALLOC_IMPL := dlmalloc
TARGET_BOOTANIMATION_TEXTURE_CACHE := false

PRODUCT_PROPERTY_OVERRIDES += \
    config.disable_atlas=true \
    dalvik.vm.jit.codecachesize=0 \
    persist.sys.force_highendgfx=true \
    ro.config.low_ram=true \
    ro.config.max_starting_bg=8 \
    ro.sys.fw.bg_apps_limit=16
endif

# ROMStats Properties
PRODUCT_PROPERTY_OVERRIDES += \
    ro.cmremixstats.name=cmRemix Rom \
    ro.cmremixstats.version=$(CMREMIXVERSION) \
    ro.cmremixstats.tframe=1

# statistics identity
PRODUCT_PROPERTY_OVERRIDES += \
    ro.cmremix.version=$(CMREMIXVERSION) \
    ro.modversion=$(CMREMIX_BUILD_VERSION) \
    cmremix.ota.version=$(CMREMIX_BUILD_VERSION)

# DragonTC info
DRAGONTC_VERSION := $(DRAGONTC_VERSION)
export $(DRAGONTC_VERSION)

DTC_PATH := prebuilts/clang/linux-x86/host/$(DRAGONTC_VERSION)
DTC_VER := $(shell cat $(DTC_PATH)/VERSION)
export $(DTC_VER)

PRODUCT_PROPERTY_OVERRIDES += \
    ro.dtc.version=$(DTC_VER)

# Disable ADB authentication and set root access to Apps and ADB
ifeq ($(DISABLE_ADB_AUTH),true)
    ADDITIONAL_DEFAULT_PROPERTIES += \
        ro.adb.secure=0 \
        persist.sys.root_access=3
endif

# TWRP Recovery
ifeq ($(RECOVERY_VARIANT),twrp)
    ifeq ($(CMREMIX_MAKE),recoveryimage)
        BOARD_SEPOLICY_IGNORE += external/sepolicy/domain.te
        BOARD_SEPOLICY_DIRS += vendor/cmremix/sepolicy/twrp
        BOARD_SEPOLICY_UNION += domain.te init.te recovery.te
    endif
endif

EXTENDED_POST_PROCESS_PROPS := vendor/cmremix/tools/cmremix_process_props.py
