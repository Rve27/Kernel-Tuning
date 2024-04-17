#!/bin/sh

LOG_RVTUNING=/sdcard
DATE=$(date +"%Y-%m-%d")
TIME=$(date +"%H:%M:%S")

# Delete old log
#rm -rf $LOG_RVTUNING/rvtuning.log

# Exit on error
#set -e

rvtuning() {
# PATH
RVE_CPU0_FREQ=/sys/devices/system/cpu/cpu0/cpufreq
RVE_CPU0_RvKernel=/sys/devices/system/cpu/cpu0/cpufreq/rvkernel
RVE_CPU0_CORE=/sys/devices/system/cpu/cpu0/core_ctl

RVE_CPU_BOOST=/sys/module/cpu_boost/parameters
RVE_CPU_INPUT_BOOST=/sys/module/cpu_input_boost/parameters

RVE_CPU4_FREQ=/sys/devices/system/cpu/cpu4/cpufreq
RVE_CPU4_RvKernel=/sys/devices/system/cpu/cpu4/cpufreq/rvkernel
RVE_CPU4_CORE=/sys/devices/system/cpu/cpu4/core_ctl

RVE_GPU=/sys/class/kgsl/kgsl-3d0
RVE_GPU_FREQ=/sys/class/kgsl/kgsl-3d0/devfreq

RVE_IO_SDA=/sys/block/sda/queue
RVE_IO_SDB=/sys/block/sdb/queue
RVE_IO_SDC=/sys/block/sdc/queue
RVE_IO_SDD=/sys/block/sdd/queue
RVE_IO_SDE=/sys/block/sde/queue
RVE_IO_SDF=/sys/block/sdf/queue

RVE_TC=/sys/module/smb_lib/parameters
RVE_FAST_CHARGE=/sys/kernel/fast_charge
RVE_VM=/proc/sys/vm
RVE_KERNEL=/proc/sys/kernel

RVE_STUNE=/dev/stune
RVE_STUNE_TOP_APP=/dev/stune/top-app
RVE_STUNE_FOREGROUND=/dev/stune/foreground
RVE_STUNE_BACKGROUND=/dev/stune/background

RVE_LMK=/sys/module/lowmemorykiller/parameters
RVE_FS=/sys/module/sync/parameters
RVE_TCP=/proc/sys/net/ipv4

# Start
echo "[$DATE]-[$TIME] Running RvTuning"

# Little Cluster CPU0 Permission
chmod 0644 "$RVE_CPU0_FREQ/scaling_governor"
chmod 0644 "$RVE_CPU0_FREQ/scaling_max_freq"
chmod 0644 "$RVE_CPU0_FREQ/scaling_min_freq"
chmod 0644 "$RVE_CPU0_RvKernel/exp_util"
chmod 0644 "$RVE_CPU0_RvKernel/hispeed_freq"
chmod 0644 "$RVE_CPU0_RvKernel/hispeed_load"
chmod 0644 "$RVE_CPU0_RvKernel/up_rate_limit_us"
chmod 0644 "$RVE_CPU0_RvKernel/down_rate_limit_us"

# CPU0 core_ctl Permission
chmod 0644 "$RVE_CPU0_CORE/enable"
chmod 0644 "$RVE_CPU0_CORE/busy_down_thres"
chmod 0644 "$RVE_CPU0_CORE/busy_up_thres"
chmod 0644 "$RVE_CPU0_CORE/max_cpus"
chmod 0644 "$RVE_CPU0_CORE/min_cpus"

# Little Cluster CPU4 Permission
chmod 0644 "$RVE_CPU4_FREQ/scaling_governor"
chmod 0644 "$RVE_CPU4_FREQ/scaling_max_freq"
chmod 0644 "$RVE_CPU4_FREQ/scaling_min_freq"
chmod 0644 "$RVE_CPU4_RvKernel/exp_util"
chmod 0644 "$RVE_CPU4_RvKernel/hispeed_freq"
chmod 0644 "$RVE_CPU4_RvKernel/hispeed_load"
chmod 0644 "$RVE_CPU4_RvKernel/up_rate_limit_us"
chmod 0644 "$RVE_CPU4_RvKernel/down_rate_limit_us"

# CPU4 core_ctl Permission
chmod 0644 "$RVE_CPU4_CORE/enable"
chmod 0644 "$RVE_CPU4_CORE/busy_down_thres"
chmod 0644 "$RVE_CPU4_CORE/busy_up_thres"
chmod 0644 "$RVE_CPU4_CORE/max_cpus"
chmod 0644 "$RVE_CPU4_CORE/min_cpus"

# CPU Boost Permission
chmod 0644 "$RVE_CPU_BOOST/input_boost_freq"
chmod 0644 "$RVE_CPU_BOOST/input_boost_ms"
chmod 0644 "$RVE_CPU_BOOST/sched_boost_on_input"
chmod 0644 "$RVE_CPU_INPUT_BOOST/dynamic_stune_boost"
chmod 0644 "$RVE_CPU_INPUT_BOOST/dynamic_stune_boost_duration"
chmod 0644 "$RVE_CPU_INPUT_BOOST/input_boost_duration"
chmod 0644 "$RVE_CPU_INPUT_BOOST/remove_input_boost_freq_lp"
chmod 0644 "$RVE_CPU_INPUT_BOOST/input_boost_freq_lp"
chmod 0644 "$RVE_CPU_INPUT_BOOST/remove_input_boost_freq_perf"
chmod 0644 "$RVE_CPU_INPUT_BOOST/input_boost_freq_hp"

# GPU Permission
chmod 0644 "$RVE_GPU/min_clock_mhz"
chmod 0644 "$RVE_GPU/max_clock_mhz"
chmod 0644 "$RVE_GPU/max_gpuclk"
chmod 0644 "$RVE_GPU/bus_split"
chmod 0644 "$RVE_GPU/force_bus_on"
chmod 0644 "$RVE_GPU/force_rail_on"
chmod 0644 "$RVE_GPU/force_clk_on"
chmod 0644 "$RVE_GPU/throttling"

chmod 0644 "$RVE_GPU_FREQ/min_freq"
chmod 0644 "$RVE_GPU_FREQ/max_freq"
chmod 0644 "$RVE_GPU_FREQ/adrenoboost"

# I/O Scheduler Permission
chmod 0644 "$RVE_IO_SDA/scheduler"
chmod 0644 "$RVE_IO_SDA/read_ahead_kb"
chmod 0644 "$RVE_IO_SDA/nr_requests"

chmod 0644 "$RVE_IO_SDB/scheduler"
chmod 0644 "$RVE_IO_SDB/read_ahead_kb"
chmod 0644 "$RVE_IO_SDB/nr_requests"

chmod 0644 "$RVE_IO_SDC/scheduler"
chmod 0644 "$RVE_IO_SDC/read_ahead_kb"
chmod 0644 "$RVE_IO_SDC/nr_requests"

chmod 0644 "$RVE_IO_SDD/scheduler"
chmod 0644 "$RVE_IO_SDD/read_ahead_kb"
chmod 0644 "$RVE_IO_SDD/nr_requests"

chmod 0644 "$RVE_IO_SDE/scheduler"
chmod 0644 "$RVE_IO_SDE/read_ahead_kb"
chmod 0644 "$RVE_IO_SDE/nr_requests"

chmod 0644 "$RVE_IO_SDF/scheduler"
chmod 0644 "$RVE_IO_SDF/read_ahead_kb"
chmod 0644 "$RVE_IO_SDF/nr_requests"

# Charge Permission
chmod 0644 "$RVE_TC/skip_thermal"
chmod 0644 "$RVE_FAST_CHARGE/force_fast_charge"

# LMK Permission
chmod 0644 "$RVE_LMK/oom_reaper"
chmod 0644 "$RVE_LMK/lmk_fast_run"
chmod 0644 "$RVE_LMK/minfree"

# FSync Permission
chmod 0644 "$RVE_FS/fsync_enabled"

# Little Cluster CPU0
echo "rvkernel" > "$RVE_CPU0_FREQ/scaling_governor"
echo 1766400 > "$RVE_CPU0_FREQ/scaling_max_freq"
echo 902400 > "$RVE_CPU0_FREQ/scaling_min_freq"

# CPU0 RvKernel
echo 1 > "$RVE_CPU0_RvKernel/exp_util"
echo 1766400 > "$RVE_CPU0_RvKernel/hispeed_freq"
echo 40 > "$RVE_CPU0_RvKernel/hispeed_load"
echo 500 > "$RVE_CPU0_RvKernel/up_rate_limit_us"
echo 25000 > "$RVE_CPU0_RvKernel/down_rate_limit_us"

# CPU0 core_ctl
echo 1 > "$RVE_CPU0_CORE/enable"
echo 0 0 0 0 > "$RVE_CPU0_CORE/busy_down_thres"
echo 0 0 0 0 > "$RVE_CPU0_CORE/busy_up_thres"
echo 4 > "$RVE_CPU0_CORE/max_cpus"
echo 4 > "$RVE_CPU0_CORE/min_cpus"

# Little Cluster CPU4
echo "rvkernel" > "$RVE_CPU4_FREQ/scaling_governor"
echo 2803200 > "$RVE_CPU4_FREQ/scaling_max_freq"
echo 1536000 > "$RVE_CPU4_FREQ/scaling_min_freq"

# CPU4 RvKernel
echo 1 > "$RVE_CPU4_RvKernel/exp_util"
echo 2803200 > "$RVE_CPU4_RvKernel/hispeed_freq"
echo 40 > "$RVE_CPU4_RvKernel/hispeed_load"
echo 500 > "$RVE_CPU4_RvKernel/up_rate_limit_us"
echo 25000 > "$RVE_CPU4_RvKernel/down_rate_limit_us"

# CPU4 core_ctl
echo 1 > "$RVE_CPU4_CORE/enable"
echo 0 0 0 0 > "$RVE_CPU4_CORE/busy_down_thres"
echo 0 0 0 0 > "$RVE_CPU4_CORE/busy_up_thres"
echo 4 > "$RVE_CPU4_CORE/max_cpus"
echo 4 > "$RVE_CPU4_CORE/min_cpus"

# CPU Boost
echo "0:1766400 1:1766400 2:1766400 3:1766400 4:2803200 5:2803200 6:2803200 7:2803200" > "$RVE_CPU_BOOST/input_boost_freq"
echo 128 > "$RVE_CPU_BOOST/input_boost_ms"
echo 1 > "$RVE_CPU_BOOST/sched_boost_on_input"

# CPU Input Boost
echo 4 > "$RVE_CPU_INPUT_BOOST/dynamic_stune_boost"
echo 128 > "$RVE_CPU_INPUT_BOOST/dynamic_stune_boost_duration"
echo 128 > "$RVE_CPU_INPUT_BOOST/input_boost_duration"
echo 902400 > "$RVE_CPU_INPUT_BOOST/remove_input_boost_freq_lp"
echo 902400 > "$RVE_CPU_INPUT_BOOST/input_boost_freq_lp"
echo 1536000 > "$RVE_CPU_INPUT_BOOST/remove_input_boost_freq_perf"
echo 1536000 > "$RVE_CPU_INPUT_BOOST/input_boost_freq_hp"

# GPU
echo 414 > "$RVE_GPU/min_clock_mhz"
echo 800 > "$RVE_GPU/max_clock_mhz"
echo 800000000 > "$RVE_GPU/max_gpuclk"
echo 0 > "$RVE_GPU/bus_split"
echo 1 > "$RVE_GPU/force_bus_on"
echo 1 > "$RVE_GPU/force_rail_on"
echo 1 > "$RVE_GPU/force_clk_on"
echo 0 > "$RVE_GPU/throttling"

echo 414000000 > "$RVE_GPU_FREQ/min_freq"
echo 800000000 > "$RVE_GPU_FREQ/max_freq"
echo 3 > "$RVE_GPU_FREQ/adrenoboost"

# I/O Scheduler
echo "rvkernel" > "$RVE_IO_SDA/scheduler"
echo 1024 > "$RVE_IO_SDA/read_ahead_kb"
echo 256 > "$RVE_IO_SDA/nr_requests"

echo "rvkernel" > "$RVE_IO_SDB/scheduler"
echo 1024 > "$RVE_IO_SDB/read_ahead_kb"
echo 256 > "$RVE_IO_SDB/nr_requests"

echo "rvkernel" > "$RVE_IO_SDC/scheduler"
echo 1024 > "$RVE_IO_SDC/read_ahead_kb"
echo 256 > "$RVE_IO_SDC/nr_requests"

echo "rvkernel" > "$RVE_IO_SDD/scheduler"
echo 1024 > "$RVE_IO_SDD/read_ahead_kb"
echo 256 > "$RVE_IO_SDD/nr_requests"

echo "rvkernel" > "$RVE_IO_SDE/scheduler"
echo 1024 > "$RVE_IO_SDE/read_ahead_kb"
echo 256 > "$RVE_IO_SDE/nr_requests"

echo "rvkernel" > "$RVE_IO_SDF/scheduler"
echo 1024 > "$RVE_IO_SDF/read_ahead_kb"
echo 256 > "$RVE_IO_SDF/nr_requests"

# Thermal Charge & Fast Charge
echo "N" > "$RVE_TC/skip_thermal"
echo 1 > "$RVE_FAST_CHARGE/force_fast_charge"

# LMK
echo 1 > "$RVE_LMK/oom_reaper"
echo 0 > "$RVE_LMK/lmk_fast_run"
echo "33792,45056,56320,123904,168960,180224" > "$RVE_LMK/minfree"

# fsync
echo "N" > "$RVE_FS/fsync_enabled"

# TCP Algorithm
echo "bbr" > "$RVE_TCP/tcp_congestion_control"

# Cpusets & Stune Boost
echo 1 > "$RVE_STUNE_TOP_APP/schedtune.prefer_idle"
echo 1 > "$RVE_STUNE_TOP_APP/schedtune.boost"
echo 1 > "$RVE_STUNE_FOREGROUND/schedtune.prefer_idle"
echo 0 > "$RVE_STUNE_FOREGROUND/schedtune.boost"
echo -10 > "$RVE_STUNE_BACKGROUND/schedtune.boost"
echo 0 > "$RVE_STUNE/schedtune.prefer_idle"

# VM
echo 50 > "$RVE_VM/vfs_cache_pressure"
echo 30 > "$RVE_VM/stat_interval"
echo 0 > "$RVE_VM/page-cluster"
echo 100 > "$RVE_VM/swappiness"
echo 60 > "$RVE_VM/dirty_ratio"

# Kernel
echo 0 > "$RVE_KERNEL/panic_on_oops"
echo 0 > "$RVE_KERNEL/panic_on_rcu_stall"
echo 0 > "$RVE_KERNEL/panic_on_warn"
echo 1 > "$RVE_KERNEL/perf_event_paranoid"
echo 0 > "$RVE_KERNEL/print-fatal-signals"
echo 1 > "$RVE_KERNEL/sched_min_task_util_for_boost_colocation"
echo 1 > "$RVE_KERNEL/sched_autogroup_enabled"

# Done
echo "[$DATE]-[$TIME] RvK-G840 mode applied"
}

# Call the function
rvtuning #2>&1 | tee -a $LOG_RVTUNING/rvtuning.log