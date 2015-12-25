# CMRemix Core
  export KBUILD_BUILD_USER := cmremix
  export KBUILD_BUILD_HOST := zion959

# System
# export ANDROID_COMPILE_WITH_JACK := false
#export USE_HOST_LEX := yes
#export USE_ORACLE_JAVA := 1
#export USE_CCACHE := 1
#export USE_SYSTEM_CCACHE := 1
#export BLOCK_BUILD := false


  TARGET_NDK_VERSION := 5.2
  TARGET_SM_AND := 5.3
  TARGET_SM_KERNEL := 6.0

  STRICT_ALIASING := true
  KRAIT_TUNINGS := true
  ENABLE_GCCONLY := true
  GRAPHITE_OPTS := true
  CLANG_O3 := true
  POLLY_OPTIMIZATION := true

# Clang Qcom Optimization
DISABLE_CLANG_QCOM_OPTIMIZATIONS := true
ifneq ($(DISABLE_CLANG_QCOM_OPTIMIZATIONS),true)
  USE_CLANG_QCOM := true
  USE_CLANG_QCOM_VERBOSE := true
  USE_CLANG_QCOM_POLLY := true
  CLANG_QCOM_COMPILE_ART := false
  CLANG_QCOM_COMPILE_BIONIC := false
  CLANG_QCOM_COMPILE_MIXED := false
endif

# Prop Optimizations
PRODUCT_PROPERTY_OVERRIDES += \
    debug.performance.tuning=1 \
    keyguard.no_require_sim=true \
    persist.service.lgospd.enable=0 \
    persist.service.pcsync.enable=0 \
    pm.sleep.mode=1 \
    ro.facelock.black_timeout=400 \
    ro.facelock.det_timeout=1500 \
    ro.facelock.rec_timeout=2500 \
    ro.facelock.lively_timeout=2500 \
    ro.facelock.est_max_time=600 \
    ro.facelock.use_intro_anim=false \
    ro.ril.power_collapse=1 \
    ro.sys.fw.bg_apps_limit=20 \
    ro.setupwizard.network_required=false \
    ro.setupwizard.gservices_delay=-1 \
    wifi.supplicant_scan_interval=180 \
    windowsmgr.max_events_per_sec=150
