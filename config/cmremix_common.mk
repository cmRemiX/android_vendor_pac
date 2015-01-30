# Backup Tool
PRODUCT_COPY_FILES += \
    vendor/cmremix/prebuilt/common/bin/50-backup-script.sh:system/addon.d/50-backup-script.sh \
    vendor/cmremix/prebuilt/common/bin/backuptool.functions:install/bin/backuptool.functions \
    vendor/cmremix/prebuilt/common/bin/backuptool.sh:install/bin/backuptool.sh \
    vendor/cmremix/prebuilt/common/bin/98-temasek.sh:system/addon.d/98-temasek.sh

# LCD density backup
PRODUCT_COPY_FILES += \
vendor/cmremix/prebuilt/common/bin/99-backup.sh:system/addon.d/99-backup.sh \
vendor/cmremix/prebuilt/common/etc/backup.conf:system/etc/backup.conf

# Zion959 Debugs Files
PRODUCT_COPY_FILES += \
    vendor/cmremix/prebuilt/common/etc/00_DEBUG:system/etc/init.d/00_DEBUG

# Viper4Android
PRODUCT_COPY_FILES += \
vendor/cmremix/prebuilt/common/etc/viper/ViPER4Android.apk:system/app/ViPER4Android.apk

# AdAway
PRODUCT_COPY_FILES += \
    vendor/cmremix/prebuilt/common/app/Adaway/org.adaway.apk:system/app/Adaway/org.adaway.apk

# cmRemiX Overlays
PRODUCT_PACKAGE_OVERLAYS += vendor/cmremix/overlay/common

# Bootanimation
PRODUCT_COPY_FILES += vendor/cmremix/prebuilt/common/bootanimation/$(CMREMIX_BOOTANIMATION_NAME).zip:system/media/bootanimation.zip

# Init script file with cmRemiX extras
PRODUCT_COPY_FILES += vendor/cmremix/prebuilt/common/etc/init.local.rc:root/init.cmremix.rc

# SuperSU
PRODUCT_COPY_FILES += \
    vendor/cmremix/prebuilt/common/etc/UPDATE-SuperSU.zip:system/addon.d/UPDATE-SuperSU.zip \
    vendor/cmremix/prebuilt/common/etc/init.d/99SuperSUDaemon:system/etc/init.d/99SuperSUDaemon

# Copy over the changelog to the device
PRODUCT_COPY_FILES += \
vendor/cmremix/CHANGELOG.mkdn:system/etc/CHANGELOG-cmR.txt

# cmRemiX Packages
PRODUCT_PACKAGES += \
    OmniSwitch \
    PerformanceControl \
    ScreenRecorder \
    libscreenrecorder

# Chromium Prebuilt
ifeq ($(PRODUCT_PREBUILT_WEBVIEWCHROMIUM),yes)
-include prebuilts/chromium/$(TARGET_DEVICE)/chromium_prebuilt.mk
endif

# SELinux
BOARD_SEPOLICY_IGNORE += vendor/cm/sepolicy/file_contexts
BOARD_SEPOLICY_DIRS += vendor/cmremix/sepolicy
BOARD_SEPOLICY_UNION += \
    file_contexts \
    system_app.te \
    system_server.te

BOARD := $(subst cmremix_,,$(TARGET_PRODUCT))

# Add CM release version
CM_RELEASE := true
CM_BUILD := $(BOARD)

# cmRemiX version
CMREMIXVERSION := $(shell echo $(CMREMIX_VERSION) | sed -e 's/^[ \t]*//;s/[ \t]*$$//;s/ /./g')
CMREMIX_BUILD_VERSION := cmRemiX_$(BOARD)_$(CMREMIXVERSION)_$(shell date +%Y%m%d-%H%M%S)

# ROMStats Properties
PRODUCT_PROPERTY_OVERRIDES += \
    ro.cmremixstats.name=cmRemix Rom \
    ro.cmremixstats.version=$(CMREMIXVERSION) \
    ro.cmremixstats.tframe=1

# statistics identity
PRODUCT_PROPERTY_OVERRIDES += \
    ro.cmremix.version=$(CMREMIXVERSION) \
    ro.modversion=$(CMREMIXVERSION)

# Disable ADB authentication and set root access to Apps and ADB
ifeq ($(DISABLE_ADB_AUTH),true)
    ADDITIONAL_DEFAULT_PROPERTIES += \
        ro.adb.secure=3 \
        persist.sys.root_access=3
endif

EXTENDED_POST_PROCESS_PROPS := vendor/cmremix/tools/cmremix_process_props.py

# Inherit sabermod configs.  Don't include if TARGET_ARCH isn't defined
ifndef TARGET_ARCH
  include vendor/cmremix/config/cmremix_sm.mk
else
    $(warning ********************************************************************************)
    $(warning *  TARGET_ARCH not defined.)
    $(warning *  This needs to be set in device trees before common.mk is called.)
    $(warning *  Define TARGET_ARCH before common.mk is called.)
    $(warning *  skipping sm.mk.)
    $(warning ********************************************************************************)
endif
