#!/system/bin/sh
#--------------------------------------------------
# Zion959 - generated kernel options init script
#--------------------------------------------------

log_file="/data/kernel-boot.log"

echo "----------------------------------------------------" >$log_file
echo "Zion959   - execution of kernel options init script" >>$log_file
echo "----------------------------------------------------" >>$log_file
echo "Kernel version : `uname -a`" >>$log_file

echo `date +"%F %R:%S : Waiting for Android to start..."` >>$log_file

# Wait until we see some android processes to consider boot is more or less complete (credits to AndiP71)
while ! /sbin/pgrep com.android ; do
  sleep 1
done

echo `date +"%F %R:%S : Android is starting up, let's wait another 10 seconds..."` >>$log_file

# Now that is checked, let's just wait another tiny little bit
sleep 10

echo `date +"%F %R:%S : Starting kernel configuration..."` >>$log_file

# Script generated on 07/01/2013 at  8:56
#----------------------------------------------------

# - init.d support by kernel/ramdisk not installed
echo `date +"%F %R:%S : Init.d script execution support disabled."` >>$log_file
ls -al /system/etc/init.d >>$log_file

# Set Simple GPU algorithm (faux123)
echo 1 > /sys/module/simple_gpu_algorithm/parameters/simple_gpu_activate
echo `date +"%F %R:%S : Simple GPU algorithm set to enabled."` >>$log_file

# Set Userspace DVFS access to ignore
echo 1 > /sys/kernel/cpufreq_hardlimit/userspace_dvfs_lock
echo `date +"%F %R:%S : Userspace DVFS access set to ignore."` >>$log_file
 
# Set CPU Governor
echo "interactive" > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
echo 1 > /sys/devices/system/cpu/cpu1/online
echo "interactive" > /sys/devices/system/cpu/cpu1/cpufreq/scaling_governor
echo 1 > /sys/devices/system/cpu/cpu2/online
echo "interactive" > /sys/devices/system/cpu/cpu2/cpufreq/scaling_governor
echo 1 > /sys/devices/system/cpu/cpu3/online
echo "interactive" > /sys/devices/system/cpu/cpu3/cpufreq/scaling_governor
echo `date +"%F %R:%S : CPU governor set to interactive."` >>$log_file
 
# Set CPU min. wakeup kick frequency
echo 300000 > /sys/kernel/cpufreq_hardlimit/scaling_min_freq_screen_on
echo `date +"%F %R:%S : CPU min. screen on frequency hardlimit set to 0.30GHz."` >>$log_file
 
# Set CPU min. wakeup kick frequency
echo 300000 > /sys/kernel/cpufreq_hardlimit/scaling_min_freq_screen_off
echo `date +"%F %R:%S : CPU min. screen off frequency hardlimit set to 0.30GHz."` >>$log_file
 
# Set CPU max. frequency hardlimit
echo 2265600 > /sys/kernel/cpufreq_hardlimit/scaling_max_freq_screen_on
echo `date +"%F %R:%S : CPU max. screen on frequency hardlimit set to 2.26GHz."` >>$log_file
 
# Set CPU max. frequency screen off hardlimit
echo 2265600 > /sys/kernel/cpufreq_hardlimit/scaling_max_freq_screen_off
echo `date +"%F %R:%S : CPU max. screen off frequency hardlimit set to 2.27GHz."` >>$log_file
 
# Set CPU min. wakeup kick frequency
echo 2265600 > /sys/kernel/cpufreq_hardlimit/wakeup_kick_freq
echo `date +"%F %R:%S : CPU min. wakeup kick frequency set to 2.27GHz."` >>$log_file
 
# Set CPU min. wakeup kick delay
echo 1000 > /sys/kernel/cpufreq_hardlimit/wakeup_kick_delay
echo `date +"%F %R:%S : CPU min. wakeup kick delay set to 1 second."` >>$log_file
 
# Set CPU touchboost low frequency
echo 652800 > /sys/kernel/cpufreq_hardlimit/touchboost_lo_freq
echo `date +"%F %R:%S : CPU min. touchboost low frequency set to 0.65GHz."` >>$log_file
 
# Set CPU touchboost high frequency
echo 1036800 > /sys/kernel/cpufreq_hardlimit/touchboost_hi_freq
echo `date +"%F %R:%S : CPU min. touchboost high frequency set to 1.04GHz."` >>$log_file
 
# Set CPU Hotplug driver
stop mpdecision
echo 1 > /sys/module/intelli_plug/parameters/intelli_plug_active
echo 0 > /sys/module/intelli_plug/parameters/touch_boost_active
echo `date +"%F %R:%S : CPU Hotplug driver set to IntelliPlug."` >>$log_file
 
# Set CPU Hotplug driver
echo 2 > /sys/module/intelli_plug/parameters/nr_run_profile_sel
echo `date +"%F %R:%S : IntelliPlug Profile set to Conservative."` >>$log_file
 
# Set CPU Hotplug driver
echo 8 > /sys/module/intelli_plug/parameters/nr_run_hysteresis
echo `date +"%F %R:%S : IntelliPlug Hysteresis set to average (8)."` >>$log_file
 
# Set CPU Hotplug driver
echo 2000 > /sys/module/intelli_plug/parameters/cpu_nr_run_threshold
echo `date +"%F %R:%S : IntelliPlug Runqueue Threshold set to calm (2000)."` >>$log_file
 
# Set CPU Thermal driver
stop thermal-engine
echo 1 > /sys/module/msm_thermal/parameters/enabled
echo 12 > /sys/module/msm_thermal/parameters/core_control_mask
echo 15 > /sys/module/msm_thermal/parameters/freq_control_mask
echo `date +"%F %R:%S : CPU Thermal driver set to IntelliThermal."` >>$log_file
 
# Set CPU Thermal driver
echo 80 > /sys/module/msm_thermal/parameters/limit_temp_degC
echo `date +"%F %R:%S : IntelliThermal Frequency Throttle limit set to 80 degrees."` >>$log_file
 
# Set CPU Thermal driver
echo 85 > /sys/module/msm_thermal/parameters/core_limit_temp_degC
echo `date +"%F %R:%S : IntelliThermal Core Throttle limit set to 85 degrees."` >>$log_file
 
# - zSwap not activated
echo `date +"%F %R:%S : zSwap support disabled."` >>$log_file

# - swappiness not set here
echo `date +"%F %R:%S : Swappiness not set."` >>$log_file

# - Disable USB forced fast charge
echo 0 > /sys/kernel/fast_charge/force_fast_charge
echo `date +"%F %R:%S : Fast Charge - disabled."` >>$log_file
echo 900 > /sys/kernel/fast_charge/usb_charge_level
echo `date +"%F %R:%S : Fast Charge - USB charge level set to 900mA/h."` >>$log_file
echo 650 > /sys/kernel/fast_charge/wireless_charge_level
echo `date +"%F %R:%S : Fast Charge - WIRELESS charge level set to 650mA/h."` >>$log_file
echo 1800 > /sys/kernel/fast_charge/ac_charge_level
echo `date +"%F %R:%S : Fast Charge - AC charge level set to 1800mA/h."` >>$log_file

# - Enable notification LED with normal intensity
echo 100 > /sys/class/sec/led/led_intensity
echo `date +"%F %R:%S : Notification LED set to normal intensity."` >>$log_file

# - Enable notification LED on at normal speed
echo 1 > /sys/class/sec/led/led_speed_on
echo `date +"%F %R:%S : Notification LED on set to normal time."` >>$log_file

# - Enable notification LED off at normal speed
echo 1 > /sys/class/sec/led/led_speed_off
echo `date +"%F %R:%S : Notification LED of set to normal time."` >>$log_file

# - Disable touch wake
echo 0 > /sys/class/misc/touchwake/disabled
echo `date +"%F %R:%S : Touch Wake disabled."` >>$log_file

# Wait for everything to become ready
echo `date +"%F %R:%S : Waiting 60 seconds..."` >>$log_file
sleep 60
# Internal MMC readahead buffer size
echo 2048 > /sys/block/mmcblk0/bdi/read_ahead_kb
echo `date +"%F %R:%S : Internal MMC Readahead set to 2048Kb."` >>$log_file

# Internal MMC I/O scheduler
echo "deadline" > /sys/block/mmcblk0/queue/scheduler
echo `date +"%F %R:%S : Internal MMC scheduler set to DEADLINE."` >>$log_file

# SD card readahead buffer size
echo 1024 > /sys/block/mmcblk1/bdi/read_ahead_kb
echo `date +"%F %R:%S : External MMC Readahead set to 1024Kb."` >>$log_file

# SD card I/O scheduler
echo "cfq" > /sys/block/mmcblk1/queue/scheduler
echo `date +"%F %R:%S : External MMC scheduler set to CFQ."` >>$log_file

# - Disable dynamic deferred file sync (by faux123)
#     Fsync synchronises writes normally (slower, but safer).
echo 0 > /sys/kernel/dyn_fsync/Dyn_fsync_active
echo `date +"%F %R:%S : Dynamic Deferred File Sync disabled."` >>$log_file

# echo `date +"%F %R:%S : Forcing scaling minimum to 300MHz on all cores (safer), and remove write access (dirty hack, but safer)."` >>$log_file

# echo 300000 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq
# chmod 444 /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq

# echo 300000 > /sys/devices/system/cpu/cpu1/cpufreq/scaling_min_freq
# chmod 444 /sys/devices/system/cpu/cpu1/cpufreq/scaling_min_freq

# echo 300000 > /sys/devices/system/cpu/cpu2/cpufreq/scaling_min_freq
# chmod 444 /sys/devices/system/cpu/cpu2/cpufreq/scaling_min_freq

# echo 300000 > /sys/devices/system/cpu/cpu3/cpufreq/scaling_min_freq
# chmod 444 /sys/devices/system/cpu/cpu3/cpufreq/scaling_min_freq

echo `date +"%F %R:%S : Finished kernel configuration."` >>$log_file

chmod 644 $log_file

#--------------------------------------------------
# End of generated script
#--------------------------------------------------
