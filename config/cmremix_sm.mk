# Copyright (C) 2014-2015 The SaberMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Written for SaberMod toolchains
# Find host os

# Set GCC colors
export GCC_COLORS := 'error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

UNAME := $(shell uname -s)

ifeq (Linux,$(UNAME))
  HOST_OS := linux
endif

# Only use these compilers on linux host.
ifeq ($(strip $(HOST_OS)),linux)
  ifndef TARGET_ARCH
    $(warning ********************************************************************************)
    $(warning *  TARGET_ARCH not defined.)
    $(warning *  This is commonly set in device trees BoardConfig.mk.)
    $(warning *  Define TARGET_ARCH before including this file sm.mk)
    $(warning ********************************************************************************)
  endif

# Add extra libs for the compilers to use
# Filter by TARGET_ARCH since we're pointing to ARCH specific compilers.
# To use this on new devices define TARGET_ARCH in device makefile.
  ifeq ($(strip $(TARGET_ARCH)),arm)

    # Add extra libs for the compilers to use
    export LD_LIBRARY_PATH := $(ANDROID_BUILD_TOP)/prebuilts/gcc/$(HOST_PREBUILT_TAG)/arm/arm-linux-androideabi-4.8/arch-arm/usr/lib
    export LIBRARY_PATH := $(ANDROID_BUILD_TOP)/prebuilts/gcc/$(HOST_PREBUILT_TAG)/arm/arm-linux-androideabi-4.8/arch-arm/usr/lib


    # Path to ROM toolchain
    SM_AND_PATH := prebuilts/gcc/$(HOST_PREBUILT_TAG)/arm/arm-linux-androideabi-4.8
    SM_AND := $(shell $(SM_AND_PATH)/bin/arm-linux-androideabi-gcc --version)

    # Find strings in version info
    ifneq ($(filter (SaberMod%),$(SM_AND)),)
      SM_AND_NAME := $(filter (SaberMod%),$(SM_AND))
      SM_AND_DATE := $(filter 20140% 20141% 20150% 20151%,$(SM_AND))
      SM_AND_STATUS := $(filter (release) (prerelease) (experimental),$(SM_AND))
      SM_AND_VERSION := $(SM_AND_NAME)-$(SM_AND_DATE)-$(SM_AND_STATUS)

      PRODUCT_PROPERTY_OVERRIDES += \
        ro.sm.android=$(SM_AND_VERSION)
    endif

    # Path to kernel toolchain
    SM_KERNEL_PATH := prebuilts/gcc/$(HOST_PREBUILT_TAG)/arm/arm-eabi-4.9
    SM_KERNEL := $(shell $(SM_KERNEL_PATH)/bin/arm-eabi-gcc --version)

    ifneq ($(filter (SaberMod%),$(SM_KERNEL)),)
      SM_KERNEL_NAME := $(filter (SaberMod%),$(SM_KERNEL))
      SM_KERNEL_DATE := $(filter 20140% 20141% 20150% 20151%,$(SM_KERNEL))
      SM_KERNEL_STATUS := $(filter (release) (prerelease) (experimental),$(SM_KERNEL))
      SM_KERNEL_VERSION := $(SM_KERNEL_NAME)-$(SM_KERNEL_DATE)-$(SM_KERNEL_STATUS)
      PRODUCT_PROPERTY_OVERRIDES += \
        ro.sm.kernel=$(SM_KERNEL_VERSION)
    endif

  OPT1 := (graphite)

  # Graphite flags and friends
  export GRAPHITE_FLAGS := \
           -fgraphite \
           -fgraphite-identity \
           -floop-flatten \
           -floop-parallelize-all \
           -ftree-loop-linear \
           -floop-interchange \
           -floop-strip-mine \
           -floop-block \
           -Wno-error=maybe-uninitialized

  # Force disable some modules that are not compatible with graphite flags
  LOCAL_DISABLE_GRAPHITE := \
    libunwind \
    libFFTEm \
    libicui18n \
    libskia \
    libvpx \
    libmedia_jni \
    libstagefright_mp3dec \
    libart \
    mdnsd \
    libwebrtc_spl \
    third_party_WebKit_Source_core_webcore_svg_gyp
  endif

  ifeq ($(strip $(TARGET_ARCH)),arm64)

    # Add extra libs for the compilers to use
    export LD_LIBRARY_PATH := $(ANDROID_BUILD_TOP)/prebuilts/gcc/$(HOST_PREBUILT_TAG)/aarch64/aarch64-linux-android-4.9/arch-arm64/usr/lib
    export LIBRARY_PATH := $(ANDROID_BUILD_TOP)/prebuilts/gcc/$(HOST_PREBUILT_TAG)/aarch64/aarch64-linux-android-4.9/arch-arm64/usr/lib


    # Path to toolchain
    SM_AND_PATH := prebuilts/gcc/$(HOST_PREBUILT_TAG)/aarch64/aarch64-linux-android-4.9
    SM_AND := $(shell $(SM_AND_PATH)/bin/aarch64-linux-android-gcc --version)

    # Find strings in version info
    ifneq ($(filter (SaberMod%),$(SM_AND)),)
      SM_AND_NAME := $(filter (SaberMod%),$(SM_AND))
      SM_AND_DATE := $(filter 20140% 20141% 20150% 20151%,$(SM_AND))
      SM_AND_STATUS := $(filter (release) (prerelease) (experimental),$(SM_AND))
      SM_AND_VERSION := $(SM_AND_NAME)-$(SM_AND_DATE)-$(SM_AND_STATUS)
      PRODUCT_PROPERTY_OVERRIDES += \
        ro.sm.android=$(SM_AND_VERSION)
    endif

  OPT1 := (graphite)

  # Graphite flags and friends
  export GRAPHITE_FLAGS := \
           -fgraphite \
           -fgraphite-identity \
           -floop-flatten \
           -floop-parallelize-all \
           -ftree-loop-linear \
           -floop-interchange \
           -floop-strip-mine \
           -floop-block \
           -Wno-error=maybe-uninitialized

  # Force disable some modules that are not compatible with graphite flags
  LOCAL_DISABLE_GRAPHITE := \
    libunwind \
    libFFTEm \
    libicui18n \
    libskia \
    libvpx \
    libmedia_jni \
    libstagefright_mp3dec \
    libart \
    mdnsd \
    libwebrtc_spl \
    third_party_WebKit_Source_core_webcore_svg_gyp
  endif

  ifeq ($(strip $(STRICT_ALIASING)),true)
  OPT2 := (strict)

  LOCAL_DISABLE_STRICT := \
	libc_bionic \
	libc_dns \
	libc_tzcode \
	libziparchive \
	libtwrpmtp \
	libfusetwrp \
	libguitwrp \
	busybox \
	libuclibcrpc \
	libziparchive-host \
	libpdfiumcore \
	libandroid_runtime \
	libmedia \
	libpdfiumcore \
	libpdfium \
	bluetooth.default \
	logd \
	mdnsd \
	net_net_gyp \
	libstagefright_webm \
	libaudioflinger \
	libmediaplayerservice \
	libstagefright \
	ping \
	ping6 \
	libdiskconfig \
	libjavacore \
	libfdlibm \
	libvariablespeed \
	librtp_jni \
	libwilhelm \
	libdownmix \
	libldnhncr \
	libqcomvisualizer \
	libvisualizer \
	libstlport \
	libutils \
	libandroidfw \
	dnsmasq \
	static_busybox \
	libwebviewchromium \
	libwebviewchromium_loader \
	libwebviewchromium_plat_support \
	content_content_renderer_gyp \
	third_party_WebKit_Source_modules_modules_gyp \
	third_party_WebKit_Source_platform_blink_platform_gyp \
	third_party_WebKit_Source_core_webcore_remaining_gyp \
	third_party_angle_src_translator_lib_gyp \
	third_party_WebKit_Source_core_webcore_generated_gyp \
	libc_gdtoa \
	libc_openbsd \
	libc \
	libc_nomalloc \
	libc_malloc \
	camera.msm8084 \
	libfusetwrp \
	libguitwrp \
	libwnndict \
	libtwrpmtp \
	libstlport_static \
	gatt_testtool \
	libfuse \
	lsof \
	libOmxVenc
  endif

  ifeq ($(strip $(O3_OPTIMIZATIONS)),true)
    OPT3 := (extreme)

    # Disable some modules that break with -O3
    LOCAL_DISABLE_O3 := \
      libaudioflinger \
      libwebviewchromium

    # -O3 flags and friends
    O3_FLAGS := \
      -O3 \
      -Wno-error=array-bounds \
      -Wno-error=strict-overflow
  endif

GCC_OPTIMIZATION_LEVELS := $(OPT1)$(OPT2)$(OPT3)
ifneq (,$(GCC_OPTIMIZATION_LEVELS))
PRODUCT_PROPERTY_OVERRIDES += \
    ro.sm.flags=$(GCC_OPTIMIZATION_LEVELS)
endif

else
  $(warning ********************************************************************************)
  $(warning *  SaberMod currently only works on linux host systems.)
  $(warning ********************************************************************************)
endif
