#!/bin/sh

#log
#DIR=/storage/emulated/0

#rvtuning() {
#mkdir -p "$DIR/RvTuning"
#rm -f "$DIR/RvTuning/rvtuning.log"
#LOG_LOCATION="/storage/emulated/0/RvTuning/"
#exec >> $LOG_LOCATION/rvtuning.log 2>&1
#}

#TIMESTAMP
#DATE=$(date +"%Y-%m-%d")
#TIME=$(date +"%H:%M:%S")

#RVE
RVE_CPU0f=/sys/devices/system/cpu/cpu0/cpufreq
RVE_CPU0c=/sys/devices/system/cpu/cpu0/core_ctl
RVE_CPUb=/sys/module/cpu_boost/parameters
RVE_CPUib=/sys/module/cpu_input_boost/parameters

RVE_CPU4f=/sys/devices/system/cpu/cpu4/cpufreq
RVE_CPU4s=/sys/devices/system/cpu/cpu4/cpufreq/schedutil
RVE_CPU4c=/sys/devices/system/cpu/cpu4/core_ctl

RVE_GPU=/sys/class/kgsl/kgsl-3d0
RVE_GPUf=/sys/class/kgsl/kgsl-3d0/devfreq

RVE_IOmmc=/sys/block/mmcblk0/queue
RVE_IOa=/sys/block/sda/queue
RVE_IOb=/sys/block/sdb/queue
RVE_IOc=/sys/block/sdc/queue
RVE_IOd=/sys/block/sdd/queue
RVE_IOe=/sys/block/sde/queue
RVE_IOf=/sys/block/sdf/queue

RVE_TC=/sys/module/smb_lib/parameters
RVE_FC=/sys/kernel/fast_charge
RVE_VM=/proc/sys/vm
RVE_K=/proc/sys/kernel

RVE_ST=/dev/stune
RVE_STta=/dev/stune/top-app
RVE_STfg=/dev/stune/foreground
RVE_STbg=/dev/stune/background

RVE_LMK=/sys/module/lowmemorykiller/parameters
RVE_FS=/sys/module/sync/parameters
RVE_TCP=/proc/sys/net/ipv4

#Little Cluster CPU0 Permission
chmod 0644 "$RVE_CPU0f/scaling_governor"
chmod 0644 "$RVE_CPU0f/scaling_max_freq"
chmod 0644 "$RVE_CPU0f/scaling_min_freq"

#CPU0 core_ctl Permission
chmod 0644 "$RVE_CPU0c/enable"
chmod 0644 "$RVE_CPU0c/busy_down_thres"
chmod 0644 "$RVE_CPU0c/busy_up_thres"
chmod 0644 "$RVE_CPU0c/max_cpus"
chmod 0644 "$RVE_CPU0c/min_cpus"

#Little Cluster CPU4 Permission
chmod 0644 "$RVE_CPU4f/scaling_governor"
chmod 0644 "$RVE_CPU4f/scaling_max_freq"
chmod 0644 "$RVE_CPU4f/scaling_min_freq"

#CPU4 core_ctl Permission
chmod 0644 "$RVE_CPU4c/enable"
chmod 0644 "$RVE_CPU4c/busy_down_thres"
chmod 0644 "$RVE_CPU4c/busy_up_thres"
chmod 0644 "$RVE_CPU4c/max_cpus"
chmod 0644 "$RVE_CPU4c/min_cpus"

#CPU Boost Permission
chmod 0644 "$RVE_CPUb/input_boost_freq"
chmod 0644 "$RVE_CPUb/input_boost_ms"
chmod 0644 "$RVE_CPUb/sched_boost_on_input"
chmod 0644 "$RVE_CPUib/dynamic_stune_boost"
chmod 0644 "$RVE_CPUib/dynamic_stune_boost_duration"
chmod 0644 "$RVE_CPUib/input_boost_duration"
chmod 0644 "$RVE_CPUib/remove_input_boost_freq_lp"
chmod 0644 "$RVE_CPUib/input_boost_freq_lp"
chmod 0644 "$RVE_CPUib/remove_input_boost_freq_perf"
chmod 0644 "$RVE_CPUib/input_boost_freq_hp"

#GPU Permission
chmod 0644 "$RVE_GPU/min_clock_mhz"
chmod 0644 "$RVE_GPU/max_clock_mhz"
chmod 0644 "$RVE_GPU/max_gpuclk"
chmod 0644 "$RVE_GPU/bus_split"
chmod 0644 "$RVE_GPU/force_bus_on"
chmod 0644 "$RVE_GPU/force_rail_on"
chmod 0644 "$RVE_GPU/force_clk_on"
chmod 0644 "$RVE_GPU/throttling"

chmod 0644 "$RVE_GPUf/min_freq"
chmod 0644 "$RVE_GPUf/max_freq"
chmod 0644 "$RVE_GPUf/adrenoboost"

#I/O Scheduler Permission
chmod 0644 "$RVE_IOmmc/scheduler"
chmod 0644 "$RVE_IOmmc/read_ahead_kb"
chmod 0644 "$RVE_IOmmc/nr_requests"

chmod 0644 "$RVE_IOa/scheduler"
chmod 0644 "$RVE_IOa/read_ahead_kb"
chmod 0644 "$RVE_IOa/nr_requests"

chmod 0644 "$RVE_IOb/scheduler"
chmod 0644 "$RVE_IOb/read_ahead_kb"
chmod 0644 "$RVE_IOb/nr_requests"

chmod 0644 "$RVE_IOc/scheduler"
chmod 0644 "$RVE_IOc/read_ahead_kb"
chmod 0644 "$RVE_IOc/nr_requests"

chmod 0644 "$RVE_IOd/scheduler"
chmod 0644 "$RVE_IOd/read_ahead_kb"
chmod 0644 "$RVE_IOd/nr_requests"

chmod 0644 "$RVE_IOe/scheduler"
chmod 0644 "$RVE_IOe/read_ahead_kb"
chmod 0644 "$RVE_IOe/nr_requests"

chmod 0644 "$RVE_IOf/scheduler"
chmod 0644 "$RVE_IOf/read_ahead_kb"
chmod 0644 "$RVE_IOf/nr_requests"

#Charge Permission
chmod 0644 "$RVE_TC/skip_thermal"
chmod 0644 "$RVE_FC/force_fast_charge"

#LMK Permission
chmod 0644 "$RVE_LMK/oom_reaper"
chmod 0644 "$RVE_LMK/lmk_fast_run"
chmod 0644 "$RVE_LMK/minfree"

#FSync Permission
chmod 0644 "$RVE_FS/fsync_enabled"

#Little Cluster CPU0
echo "powersave" > "$RVE_CPU0f/scaling_governor"
echo 1228800 > "$RVE_CPU0f/scaling_max_freq"
echo 300000 > "$RVE_CPU0f/scaling_min_freq"

#CPU0 core_ctl
echo 1 > "$RVE_CPU0c/enable"
echo 25 25 25 25 > "$RVE_CPU0c/busy_down_thres"
echo 25 25 25 25 > "$RVE_CPU0c/busy_up_thres"
echo 4 > "$RVE_CPU0c/max_cpus"
echo 1 > "$RVE_CPU0c/min_cpus"

#Little Cluster CPU4
echo "powersave" > "$RVE_CPU4f/scaling_governor"
echo 1209600 > "$RVE_CPU4f/scaling_max_freq"
echo 825600 > "$RVE_CPU4f/scaling_min_freq"

#CPU4 core_ctl
echo 1 > "$RVE_CPU4c/enable"
echo 60 60 60 60 > "$RVE_CPU4c/busy_down_thres"
echo 80 80 80 80 > "$RVE_CPU4c/busy_up_thres"
echo 1 > "$RVE_CPU4c/max_cpus"
echo 0 > "$RVE_CPU4c/min_cpus"

#CPU Boost
echo "0:0 1:0 2:0 3:0 4:0 5:0 6:0 7:0" > "$RVE_CPUb/input_boost_freq"
echo 0 > "$RVE_CPUb/input_boost_ms"
echo 0 > "$RVE_CPUb/sched_boost_on_input"

#CPU Input Boost
echo 0 > "$RVE_CPUib/dynamic_stune_boost"
echo 0 > "$RVE_CPUib/dynamic_stune_boost_duration"
echo 0 > "$RVE_CPUib/input_boost_duration"
echo 0 > "$RVE_CPUib/remove_input_boost_freq_lp"
echo 0 > "$RVE_CPUib/input_boost_freq_lp"
echo 0 > "$RVE_CPUib/remove_input_boost_freq_perf"
echo 0 > "$RVE_CPUib/input_boost_freq_hp"

#GPU
echo 160 > "$RVE_GPU/min_clock_mhz"
echo 160 > "$RVE_GPU/max_clock_mhz"
echo 160000000 > "$RVE_GPU/max_gpuclk"
echo 1 > "$RVE_GPU/bus_split"
echo 0 > "$RVE_GPU/force_bus_on"
echo 0 > "$RVE_GPU/force_rail_on"
echo 0 > "$RVE_GPU/force_clk_on"
echo 1 > "$RVE_GPU/throttling"

echo 160000000 > "$RVE_GPUf/min_freq"
echo 160000000 > "$RVE_GPUf/max_freq"
echo 0 > "$RVE_GPUf/adrenoboost"

#I/O Scheduler
echo "noop" > "$RVE_IOmmc/scheduler"
echo 256 > "$RVE_IOmmc/read_ahead_kb"
echo 128 > "$RVE_IOmmc/nr_requests"

echo "noop" > "$RVE_IOa/scheduler"
echo 256 > "$RVE_IOa/read_ahead_kb"
echo 128 > "$RVE_IOa/nr_requests"

echo "noop" > "$RVE_IOb/scheduler"
echo 256 > "$RVE_IOb/read_ahead_kb"
echo 128 > "$RVE_IOb/nr_requests"

echo "noop" > "$RVE_IOc/scheduler"
echo 256 > "$RVE_IOc/read_ahead_kb"
echo 128 > "$RVE_IOc/nr_requests"

echo "noop" > "$RVE_IOd/scheduler"
echo 256 > "$RVE_IOd/read_ahead_kb"
echo 128 > "$RVE_IOd/nr_requests"

echo "noop" > "$RVE_IOe/scheduler"
echo 256 > "$RVE_IOe/read_ahead_kb"
echo 128 > "$RVE_IOe/nr_requests"

echo "noop" > "$RVE_IOf/scheduler"
echo 256 > "$RVE_IOf/read_ahead_kb"
echo 128 > "$RVE_IOf/nr_requests"

#Thermal Charge & Fast Charge
echo "N" > "$RVE_TC/skip_thermal"
echo 1 > "$RVE_FC/force_fast_charge"

#LMK
echo 1 > "$RVE_LMK/oom_reaper"
echo 0 > "$RVE_LMK/lmk_fast_run"
echo "18432,23040,27648,32256,85296,120640" > "$RVE_LMK/minfree"

#fsync
echo "N" > "$RVE_FS/fsync_enabled"

#TCP Algorithm
echo "bbr" > "$RVE_TCP/tcp_congestion_control"

#Cpusets & Stune Boost
echo 0 > "$RVE_STta/schedtune.prefer_idle"
echo 0 > "$RVE_STta/schedtune.boost"
echo 0 > "$RVE_STfg/schedtune.prefer_idle"
echo 0 > "$RVE_STfg/schedtune.boost"
echo -10 > "$RVE_STbg/schedtune.boost"
echo 0 > "$RVE_ST/schedtune.prefer_idle"

#VM
echo 50 > "$RVE_VM/vfs_cache_pressure"
echo 30 > "$RVE_VM/stat_interval"
echo 0 > "$RVE_VM/page-cluster"
echo 100 > "$RVE_VM/swappiness"
echo 60 > "$RVE_VM/dirty_ratio"

#Kernel
echo 0 > "$RVE_K/panic_on_oops"
echo 0 > "$RVE_K/panic_on_rcu_stall"
echo 0 > "$RVE_K/panic_on_warn"
echo 1 > "$RVE_K/perf_event_paranoid"
echo 0 > "$RVE_K/print-fatal-signals"
echo 1 > "$RVE_K/sched_min_task_util_for_boost_colocation"
echo 1 > "$RVE_K/sched_autogroup_enabled"

#rvtuning "[$DATE]-[$TIME] Ultrasave mode applied"