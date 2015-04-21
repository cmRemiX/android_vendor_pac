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
#
# Target arch is arm
TARGET_ARCH := arm

# Sabermod configs
TARGET_SM_AND := 4.9
TARGET_SM_KERNEL := 4.9
O3_OPTIMIZATIONS := true
STRICT_ALIASING := true
ENABLE_PTHREAD := true
TRLTESPR_THREADS := 4
PRODUCT_THREADS := $(TRLTESPR_THREADS)

# General flags for gcc 4.9 to allow compilation to complete.
MAYBE_UNINITIALIZED := \
  hwcomposer.msm8974

# Extra SaberMod GCC C flags for the ROM and Kernel
export EXTRA_SABERMOD_GCC_CFLAGS := \
         -ftree-loop-distribution \
         -ftree-loop-if-convert \
         -ftree-loop-im \
         -ftree-loop-ivcanon \
         -fprefetch-loop-arrays \
         -ftree-vectorize \
         -mvectorize-with-neon-quad \
         -pipe

# Extra SaberMod CLANG C flags
EXTRA_SABERMOD_CLANG_CFLAGS := \
  -fprefetch-loop-arrays \
  -ftree-vectorize \
  -pipe


OPT4 := (extra)

GRAPHITE_KERNEL_FLAGS := \
  -floop-parallelize-all \
  -ftree-parallelize-loops=$(PRODUCT_THREADS) \
  -fopenmp
