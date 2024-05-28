#!/bin/sh

LOG_RVTUNING=/sdcard
DATE=$(date +"%Y-%m-%d")
TIME=$(date +"%H:%M:%S")

# Delete old log
#rm -rf $LOG_RVTUNING/rvtuning.log

rvtuning() {
# PATH
RVE_CPU0_FREQ=/sys/devices/system/cpu/cpu0/cpufreq
RVE_CPU0_schedutil=/sys/devices/system/cpu/cpu0/cpufreq/schedutil
RVE_CPU0_CORE=/sys/devices/system/cpu/cpu0/core_ctl

RVE_CPU_BOOST=/sys/module/cpu_boost/parameters

RVE_CPU4_FREQ=/sys/devices/system/cpu/cpu4/cpufreq
RVE_CPU4_schedutil=/sys/devices/system/cpu/cpu4/cpufreq/schedutil
RVE_CPU4_CORE=/sys/devices/system/cpu/cpu4/core_ctl

RVE_GPU=/sys/class/kgsl/kgsl-3d0
RVE_GPU_FREQ=/sys/class/kgsl/kgsl-3d0/devfreq

RVE_IO_SDA=/sys/block/sda/queue
RVE_IO_SDB=/sys/block/sdb/queue
RVE_IO_SDC=/sys/block/sdc/queue
RVE_IO_SDD=/sys/block/sdd/queue
RVE_IO_SDE=/sys/block/sde/queue
RVE_IO_SDF=/sys/block/sdf/queue

RVE_ST=/sys/module/smb_lib/parameters
RVE_FAST_CHARGE=/sys/kernel/fast_charge
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
chmod 0644 $RVE_CPU0_schedutil/*

# CPU0 core_ctl Permission
chmod 0644 "$RVE_CPU0_CORE/enable"
chmod 0644 "$RVE_CPU0_CORE/busy_down_thres"
chmod 0644 "$RVE_CPU0_CORE/busy_up_thres"
chmod 0644 "$RVE_CPU0_CORE/max_cpus"
chmod 0644 "$RVE_CPU0_CORE/min_cpus"

# Big Cluster CPU4 Permission
chmod 0644 "$RVE_CPU4_FREQ/scaling_governor"
chmod 0644 "$RVE_CPU4_FREQ/scaling_max_freq"
chmod 0644 "$RVE_CPU4_FREQ/scaling_min_freq"
chmod 0644 $RVE_CPU4_schedutil/*

# CPU4 core_ctl Permission
chmod 0644 "$RVE_CPU4_CORE/enable"
chmod 0644 "$RVE_CPU4_CORE/busy_down_thres"
chmod 0644 "$RVE_CPU4_CORE/busy_up_thres"
chmod 0644 "$RVE_CPU4_CORE/max_cpus"
chmod 0644 "$RVE_CPU4_CORE/min_cpus"

# CPU Boost Permission
chmod 0644 $RVE_CPU_BOOST/*

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
chmod 0644 "$RVE_GPU_FREQ/governor"

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

# Charging Permission
chmod 0644 "$RVE_ST/skip_thermal"
chmod 0644 "$RVE_FAST_CHARGE/force_fast_charge"

# LMK Permission
chmod 0644 $RVE_LMK/*

# Little Cluster CPU0
echo "schedutil" > "$RVE_CPU0_FREQ/scaling_governor"
echo 1056000 > "$RVE_CPU0_FREQ/scaling_max_freq"
echo 300000 > "$RVE_CPU0_FREQ/scaling_min_freq"

# CPU0 schedutil
echo 1056000 > "$RVE_CPU0_schedutil/hispeed_freq"
echo 70 > "$RVE_CPU0_schedutil/hispeed_load"
echo 500 > "$RVE_CPU0_schedutil/up_rate_limit_us"
echo 2000 > "$RVE_CPU0_schedutil/down_rate_limit_us"
echo 1 > "$RVE_CPU0_schedutil/iowait_boost_enable"

# CPU0 core_ctl
echo 1 > "$RVE_CPU0_CORE/enable"
echo 0 0 0 0 > "$RVE_CPU0_CORE/busy_down_thres"
echo 0 0 0 0 > "$RVE_CPU0_CORE/busy_up_thres"
echo 4 > "$RVE_CPU0_CORE/max_cpus"
echo 2 > "$RVE_CPU0_CORE/min_cpus"

# Big Cluster CPU4
echo "schedutil" > "$RVE_CPU4_FREQ/scaling_governor"
echo 1536000 > "$RVE_CPU4_FREQ/scaling_max_freq"
echo 825600 > "$RVE_CPU4_FREQ/scaling_min_freq"

# CPU4 schedutil
echo 1536000 > "$RVE_CPU4_schedutil/hispeed_freq"
echo 70 > "$RVE_CPU4_schedutil/hispeed_load"
echo 500 > "$RVE_CPU4_schedutil/up_rate_limit_us"
echo 2000 > "$RVE_CPU4_schedutil/down_rate_limit_us"
echo 1 > "$RVE_CPU4_schedutil/iowait_boost_enable"

# CPU4 core_ctl
echo 1 > "$RVE_CPU4_CORE/enable"
echo 30 30 30 30 > "$RVE_CPU4_CORE/busy_down_thres"
echo 50 50 50 50 > "$RVE_CPU4_CORE/busy_up_thres"
echo 4 > "$RVE_CPU4_CORE/max_cpus"
echo 1 > "$RVE_CPU4_CORE/min_cpus"

# CPU Boost
echo "0:1056000 1:1056000 2:1056000 3:1056000 4:1536000 5:1536000 6:1536000 7:1536000" > "$RVE_CPU_BOOST/input_boost_freq"
echo 64 > "$RVE_CPU_BOOST/input_boost_ms"
echo 1 > "$RVE_CPU_BOOST/sched_boost_on_input"

# GPU
echo 160 > "$RVE_GPU/min_clock_mhz"
echo 520 > "$RVE_GPU/max_clock_mhz"
echo 520000000 > "$RVE_GPU/max_gpuclk"
echo 1 > "$RVE_GPU/bus_split"
echo 0 > "$RVE_GPU/force_bus_on"
echo 0 > "$RVE_GPU/force_rail_on"
echo 0 > "$RVE_GPU/force_clk_on"
echo 0 > "$RVE_GPU/throttling"

echo 160000000 > "$RVE_GPU_FREQ/min_freq"
echo 520000000 > "$RVE_GPU_FREQ/max_freq"
echo 1 > "$RVE_GPU_FREQ/adrenoboost"
echo "msm-adreno-tz" > "$RVE_GPU_FREQ/governor"

# I/O Scheduler
echo "cfq" > "$RVE_IO_SDA/scheduler"
echo 512 > "$RVE_IO_SDA/read_ahead_kb"
echo 128 > "$RVE_IO_SDA/nr_requests"

echo "cfq" > "$RVE_IO_SDB/scheduler"
echo 512 > "$RVE_IO_SDB/read_ahead_kb"
echo 128 > "$RVE_IO_SDB/nr_requests"

echo "cfq" > "$RVE_IO_SDC/scheduler"
echo 512 > "$RVE_IO_SDC/read_ahead_kb"
echo 128 > "$RVE_IO_SDC/nr_requests"

echo "cfq" > "$RVE_IO_SDD/scheduler"
echo 512 > "$RVE_IO_SDD/read_ahead_kb"
echo 128 > "$RVE_IO_SDD/nr_requests"

echo "cfq" > "$RVE_IO_SDE/scheduler"
echo 512 > "$RVE_IO_SDE/read_ahead_kb"
echo 128 > "$RVE_IO_SDE/nr_requests"

echo "cfq" > "$RVE_IO_SDF/scheduler"
echo 512 > "$RVE_IO_SDF/read_ahead_kb"
echo 128 > "$RVE_IO_SDF/nr_requests"

# Charging
echo "Y" > "$RVE_ST/skip_thermal"
echo 1 > "$RVE_FAST_CHARGE/force_fast_charge"

# LMK
echo 1 > "$RVE_LMK/oom_reaper"
echo 0 > "$RVE_LMK/lmk_fast_run"

# TCP Algorithm
echo "bbrplus" > "$RVE_TCP/tcp_congestion_control"

# Cpusets & Stune Boost
echo 1 > "$RVE_STUNE_TOP_APP/schedtune.prefer_idle"
echo 1 > "$RVE_STUNE_TOP_APP/schedtune.boost"
echo 1 > "$RVE_STUNE_FOREGROUND/schedtune.prefer_idle"
echo 0 > "$RVE_STUNE_FOREGROUND/schedtune.boost"
echo -10 > "$RVE_STUNE_BACKGROUND/schedtune.boost"
echo 0 > "$RVE_STUNE/schedtune.prefer_idle"

# Kernel
echo 0 > "$RVE_KERNEL/panic_on_oops"
echo 0 > "$RVE_KERNEL/panic_on_rcu_stall"
echo 0 > "$RVE_KERNEL/panic_on_warn"
echo 1 > "$RVE_KERNEL/perf_event_paranoid"
echo 0 > "$RVE_KERNEL/print-fatal-signals"
echo 1 > "$RVE_KERNEL/sched_min_task_util_for_boost_colocation"

# Sched
echo 1 > "$RVE_KERNEL/sched_autogroup_enabled"
echo 1 > "$RVE_KERNEL/sched_bore"
echo 1 > "$RVE_KERNEL/sched_cfs_boost"

# Done
echo "[$DATE]-[$TIME] Balance Underclock mode applied"
}

# Call the function
rvtuning #2>&1 | tee -a $LOG_RVTUNING/rvtuning.log