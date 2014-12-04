# MapleAOSP 
# 
# See config/common_versions.mk to set build numbers and OTA info

ifeq ($(PRODUCT_GMS_CLIENTID_BASE),)
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.clientidbase=android-google
else
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.clientidbase=$(PRODUCT_GMS_CLIENTID_BASE)
endif

PRODUCT_PROPERTY_OVERRIDES += \
    keyguard.no_require_sim=true \
    ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
    ro.url.legal.android_privacy=http://www.google.com/intl/%s/mobile/android/basic/privacy.html \
    ro.com.android.wifi-watchlist=GoogleGuest \
    ro.error.receiver.system.apps=com.google.android.gms \
    ro.setupwizard.enterprise_mode=1 \
    ro.com.android.dateformat=dd-MM-yyyy \
    ro.com.android.dataroaming=false \
    ro.build.selinux=0 \
    persist.debug.wfd.enable=1 \
    ro.adb.secure=0 \
    ro.secure=0 \
    ro.allow.mock.location=0 \
    ro.debuggable=1 \
    persist.service.adb.enable=1 \
    persist.sys.root_access=3 \
    ro.sys.fw.bservice_enable=1

# Enable ADB authentication
ADDITIONAL_DEFAULT_PROPERTIES += \
    ro.adb.secure=0 \
    ro.secure=0

# Enable MTP by default
PRODUCT_PROPERTY_OVERRIDES += \
    sys.usb.config=mtp,adb \
    persist.sys.usb.config=mtp,adb

# GoogleDNS
PRODUCT_PROPERTY_OVERRIDES += \
    net.rmnet0.dns1=8.8.8.8 \
    net.rmnet0.dns2=8.8.4.4 \
    net.dns1=8.8.8.8 \
    net.dns2=8.8.4.4

# Backup Tool
PRODUCT_COPY_FILES += \
    vendor/maple/prebuilt/common/bin/backuptool.sh:install/bin/backuptool.sh \
    vendor/maple/prebuilt/common/bin/backuptool.functions:install/bin/backuptool.functions

# Density Backup
PRODUCT_COPY_FILES += \
    vendor/maple/prebuilt/common/addon.d/95-backup.sh:system/addon.d/95-backup.sh \
    vendor/maple/prebuilt/common/etc/backup.conf:system/etc/backup.conf

# init.d support
PRODUCT_COPY_FILES += \
    vendor/maple/prebuilt/common/etc/init.d/00banner:system/etc/init.d/00banner \
    vendor/maple/prebuilt/common/bin/sysinit:system/bin/sysinit

# userinit support
PRODUCT_COPY_FILES += \
    vendor/maple/prebuilt/common/etc/init.d/90userinit:system/etc/init.d/90userinit

# init file
PRODUCT_COPY_FILES += \
    vendor/maple/prebuilt/common/etc/init.maple.rc:root/init.maple.rc

# Enable SIP+VoIP
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

# Copy latinime for gesture typing
PRODUCT_COPY_FILES += \
    vendor/maple/prebuilt/common/lib64/libjni_keyboarddecoder.so:system/lib64/libjni_keyboarddecoder \
    vendor/maple/prebuilt/common/lib64/libjni_latinimegoogle.so:system/lib64/libjni_latinimegoogle.so \
    vendor/maple/prebuilt/common/lib64/libjni_latinime.so:system/lib64/libjni_latinime.so

# SuperSU
PRODUCT_COPY_FILES += \
   vendor/maple/prebuilt/common/etc/UPDATE-SuperSU.zip:system/addon.d/UPDATE-SuperSU.zip \
   vendor/maple/prebuilt/common/etc/init.d/99SuperSUDaemon:system/etc/init.d/99SuperSUDaemon

# Extra packages
PRODUCT_PACKAGES += \
    Gallery2 \
    Launcher3 \
    masquerade

# Busybox
PRODUCT_PACKAGES += \
    Busybox

PRODUCT_PACKAGE_OVERLAYS += vendor/maple/overlay/common

export USE_NINJA := false
export USE_GOMA := false

export ANDROID_JACK_VM_ARGS += "-Xmx8g"

# Copy Bootanimation
-include vendor/maple/config/bootanimation.mk

# Inherit common product build prop overrides
-include vendor/maple/config/common_versions.mk

# Squisher Location
SQUISHER_SCRIPT := vendor/cmremix/tools/squisher
