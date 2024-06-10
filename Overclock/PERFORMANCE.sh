#!/bin/sh

LOG_RVTUNING=/sdcard
DATE=$(date +"%Y-%m-%d")
TIME=$(date +"%H:%M:%S")

# Delete old log
#rm -rf $LOG_RVTUNING/rvtuning.log

rvtuning() {
# PATH
RVE_CPU0_FREQ=/sys/devices/system/cpu/cpu0/cpufreq
RVE_CPU0_CORE=/sys/devices/system/cpu/cpu0/core_ctl

RVE_CPU_BOOST=/sys/module/cpu_boost/parameters

RVE_CPU4_FREQ=/sys/devices/system/cpu/cpu4/cpufreq
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
RVE_TCP=/proc/sys/net/ipv4

# Start
echo "[$DATE]-[$TIME] Running RvTuning"

# Little Cluster CPU0
echo "performance" > "$RVE_CPU0_FREQ/scaling_governor"
echo 1766400 > "$RVE_CPU0_FREQ/scaling_max_freq"
echo 1766400 > "$RVE_CPU0_FREQ/scaling_min_freq"

# CPU0 core_ctl
echo 1 > "$RVE_CPU0_CORE/enable"
echo 0 0 0 0 > "$RVE_CPU0_CORE/busy_down_thres"
echo 0 0 0 0 > "$RVE_CPU0_CORE/busy_up_thres"
echo 4 > "$RVE_CPU0_CORE/max_cpus"
echo 4 > "$RVE_CPU0_CORE/min_cpus"

# Big Cluster CPU4
echo "performance" > "$RVE_CPU4_FREQ/scaling_governor"
echo 2803200 > "$RVE_CPU4_FREQ/scaling_max_freq"
echo 2803200 > "$RVE_CPU4_FREQ/scaling_min_freq"

# CPU4 core_ctl
echo 1 > "$RVE_CPU4_CORE/enable"
echo 0 0 0 0 > "$RVE_CPU4_CORE/busy_down_thres"
echo 0 0 0 0 > "$RVE_CPU4_CORE/busy_up_thres"
echo 4 > "$RVE_CPU4_CORE/max_cpus"
echo 4 > "$RVE_CPU4_CORE/min_cpus"

# CPU Boost
echo "0:1766400 1:1766400 2:1766400 3:1766400 4:2803200 5:2803200 6:2803200 7:2803200" > "$RVE_CPU_BOOST/input_boost_freq"
echo 120 > "$RVE_CPU_BOOST/input_boost_ms"
echo 1 > "$RVE_CPU_BOOST/sched_boost_on_input"

# GPU
echo 800 > "$RVE_GPU/min_clock_mhz"
echo 800 > "$RVE_GPU/max_clock_mhz"
echo 800000000 > "$RVE_GPU/max_gpuclk"
echo 0 > "$RVE_GPU/bus_split"
echo 1 > "$RVE_GPU/force_bus_on"
echo 1 > "$RVE_GPU/force_rail_on"
echo 1 > "$RVE_GPU/force_clk_on"
chmod 0644 "$RVE_GPU/throttling"
echo 0 > "$RVE_GPU/throttling"

echo 800000000 > "$RVE_GPU_FREQ/min_freq"
echo 800000000 > "$RVE_GPU_FREQ/max_freq"
echo 3 > "$RVE_GPU_FREQ/adrenoboost"

# I/O Scheduler
echo "deadline" > "$RVE_IO_SDA/scheduler"
echo 1024 > "$RVE_IO_SDA/read_ahead_kb"
echo 256 > "$RVE_IO_SDA/nr_requests"
echo 0 > "$RVE_IO_SDA/iostats"

echo "deadline" > "$RVE_IO_SDB/scheduler"
echo 1024 > "$RVE_IO_SDB/read_ahead_kb"
echo 256 > "$RVE_IO_SDB/nr_requests"
echo 0 > "$RVE_IO_SDB/iostats"

echo "deadline" > "$RVE_IO_SDC/scheduler"
echo 1024 > "$RVE_IO_SDC/read_ahead_kb"
echo 256 > "$RVE_IO_SDC/nr_requests"
echo 0 > "$RVE_IO_SDC/iostats"

echo "deadline" > "$RVE_IO_SDD/scheduler"
echo 1024 > "$RVE_IO_SDD/read_ahead_kb"
echo 256 > "$RVE_IO_SDD/nr_requests"
echo 0 > "$RVE_IO_SDD/iostats"

echo "deadline" > "$RVE_IO_SDE/scheduler"
echo 1024 > "$RVE_IO_SDE/read_ahead_kb"
echo 256 > "$RVE_IO_SDE/nr_requests"
echo 0 > "$RVE_IO_SDE/iostats"

echo "deadline" > "$RVE_IO_SDF/scheduler"
echo 1024 > "$RVE_IO_SDF/read_ahead_kb"
echo 256 > "$RVE_IO_SDF/nr_requests"
echo 0 > "$RVE_IO_SDF/iostats"

# Charging
echo "Y" > "$RVE_ST/skip_thermal"
echo 1 > "$RVE_FAST_CHARGE/force_fast_charge"

# TCP Algorithm
echo "1" > "$RVE_TCP/tcp_ecn"
echo "3" > "$RVE_TCP/tcp_fastopen"
echo "bbrplus" > "$RVE_TCP/tcp_congestion_control"

# Sched
echo 1 > "$RVE_KERNEL/sched_autogroup_enabled"
echo 1 > "$RVE_KERNEL/sched_bore"
echo 1 > "$RVE_KERNEL/sched_burst_smoothness_down"
echo 1 > "$RVE_KERNEL/sched_burst_smoothness_up"
echo 1 > "$RVE_KERNEL/sched_child_runs_first"
echo 5 > "$RVE_KERNEL/perf_cpu_time_max_percent"
echo 0 > "$RVE_KERNEL/sched_tunable_scaling"
echo off > "$RVE_KERNEL/printk_devkmsg"
echo 32 > "$RVE_KERNEL/sched_nr_migrate"
echo 0 > "$RVE_KERNEL/sched_schedstats"
echo 100 > "$RVE_KERNEL/sched_cfs_boost"

# Done
echo "[$DATE]-[$TIME] Gaming mode applied"
}

# Call the function
rvtuning #2>&1 | tee -a $LOG_RVTUNING/rvtuning.log