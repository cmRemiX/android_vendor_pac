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
# TARGET_SM_AND can be set before this file to override the default of gcc 4.8 for ROM.
# This is to avoid hardcoding the gcc versions for the ROM and kernels.

# Inherit sabermod configs.  Default to arm if LOCAL_ARCH is not defined.

 # Write version info to build.prop

 # Write version info to build.prop
 ifeq (6.1,$(TARGET_GCC_VERSION))
   PRODUCT_PROPERTY_OVERRIDES += \
     ro.sm.android=$(SM_AND_NAME)-$(SM_AND_DATE)-(experimental)
 else
   PRODUCT_PROPERTY_OVERRIDES += \
     ro.sm.android=$(SM_AND_VERSION)
 endif

 # Write version info to build.prop
 ifeq (6.2,$(TARGET_GCC_VERSION_KERNEL))
   PRODUCT_PROPERTY_OVERRIDES += \
     ro.sm.kernel=$(SM_KERNEL_NAME)-$(SM_KERNEL_DATE)-(experimental)
 else
   PRODUCT_PROPERTY_OVERRIDES += \
     ro.sm.kernel=$(SM_KERNEL_VERSION)
 endif

ifeq ($(O3_OPTIMIZATIONS),true)
   OPT1 := (O3)
endif

ifeq ($(GRAPHITE_OPTIMIZATION),true)
   OPT2 := (graphite)
endif

ifeq (true,$(LOCAL_STRICT_ALIASING))
   OPT3 := (strict)
endif

ifeq ($(FLOOP_NEST_OPTIMIZE),true)
   OPT4 := (floop-nest)
endif

ifeq (true,$(ENABLE_GCC_DEFAULTS))
   OPT5 := (gcc-tunings)
endif

ifeq ($,$(TARGET_DRAGONTC_VERSION))
   OPT6 := (polly)
endif

ifeq (true,$(ENABLE_DTC_LTO))
   OPT7 := (LTO)
endif

ifeq ($(ENABLE_PTHREAD),true)
   OPT8 := (pthread)
endif

ifeq ($(OPENMP_OPTIMIZATIONS),true)
   OPT9 := (openmp)
endif

ifeq (true,$(IPA_OPTIMIZATIONS))
   OPT10 := (analyzer)
endif

ifeq (true,$(GCC_ONLY_OPTIMIZATION))
   OPT11 := (gcconly)
endif

ifeq (true,$(MEMORY_LEAK_OPTIMIZATIONS))
   OPT12 := (mem-sanitize)
endif

ifeq ($(USE_ARM_MODE),true)
   OPT13 := (arm-mode)
endif

ifeq ($(ARCHIDROID_OPTIMIZATIONS),true)
   OPT14 := (Archi)
endif

  GCC_OPTIMIZATION_LEVELS := $(OPT1)$(OPT2)$(OPT3)$(OPT4)$(OPT5)$(OPT6)$(OPT7)$(OPT8)$(OPT9)$(OPT10)$(OPT11)$(OPT12)$(OPT13)$(OPT14)

  ifneq ($(GCC_OPTIMIZATION_LEVELS),)
    PRODUCT_PROPERTY_OVERRIDES += \
      ro.sm.flags=$(GCC_OPTIMIZATION_LEVELS)
  endif
export GCC_OPTIMIZATION_LEVELS
