#!/bin/bash -f
# ****************************************************************************
# Vivado (TM) v2020.2 (64-bit)
#
# Filename    : simulate.sh
# Simulator   : Xilinx Vivado Simulator
# Description : Script for simulating the design by launching the simulator
#
# Generated by Vivado on Fri Apr 30 13:05:16 CEST 2021
# SW Build 3064766 on Wed Nov 18 09:12:47 MST 2020
#
# Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
#
# usage: simulate.sh
#
# ****************************************************************************
set -Eeuo pipefail
# simulate design
echo "xsim tb_speedometer_behav -key {Behavioral:sim_1:Functional:tb_speedometer} -tclbatch tb_speedometer.tcl -view /run/media/ondra/enc/Sync/BPC-EKT2L/BPC-DE1/projekt/Digital-Electronics-1-project/exercise_bike_console/tb_speedometer_behav.wcfg -log simulate.log"
xsim tb_speedometer_behav -key {Behavioral:sim_1:Functional:tb_speedometer} -tclbatch tb_speedometer.tcl -view /run/media/ondra/enc/Sync/BPC-EKT2L/BPC-DE1/projekt/Digital-Electronics-1-project/exercise_bike_console/tb_speedometer_behav.wcfg -log simulate.log

