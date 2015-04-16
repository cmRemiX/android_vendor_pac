# Copyright (C) 2015 The SaberMod Project
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
# Target arch is arm
TARGET_ARCH := arm

# Some common sabermod variables before common
TARGET_SM_AND := 4.8
TARGET_SM_KERNEL := 4.9

# Allow overriding of NDK toolchain version
TARGET_NDK_VERSION := 4.8

# Set Custom GCC Kernel Version 
TARGET_GCC_VERSION_ARM := 4.9

# Set Custom GCC Rom Version 
TARGET_GCC_VERSION_AND := 4.8

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
  hwcomposer.msm8974

# Extra SaberMod C flags for the ROM and Kernel
export EXTRA_SABERMOD_GCC_CFLAGS := \
         -ftree-loop-distribution \
         -ftree-loop-if-convert \
         -fvect-cost-model=dynamic \
         -fprefetch-loop-arrays \
         -ftree-vectorize \
         -mvectorize-with-neon-quad

EXTRA_SABERMOD_AND_GCC_CFLAGS := \
         -fsanitize=thread

EXTRA_SABERMOD_CLANG_CFLAGS := \
         -ftree-loop-if-convert \
         -fprefetch-loop-arrays \
         -ftree-vectorize \
         -mvectorize-with-neon-quad \
	 -fsanitize=memory

##
