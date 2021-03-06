#!/bin/bash -f
# ****************************************************************************
# Vivado (TM) v2020.2 (64-bit)
#
# Filename    : elaborate.sh
# Simulator   : Xilinx Vivado Simulator
# Description : Script for elaborating the compiled design
#
# Generated by Vivado on Thu May 06 23:33:31 CEST 2021
# SW Build 3064766 on Wed Nov 18 09:12:47 MST 2020
#
# Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
#
# usage: elaborate.sh
#
# ****************************************************************************
set -Eeuo pipefail
# elaborate design
echo "xelab -wto ca7177a56f2249eaa06a50e1464b7bcd --incr --debug typical --relax --mt 8 -L xil_defaultlib -L secureip --snapshot tb_display_control_behav xil_defaultlib.tb_display_control -log elaborate.log"
xelab -wto ca7177a56f2249eaa06a50e1464b7bcd --incr --debug typical --relax --mt 8 -L xil_defaultlib -L secureip --snapshot tb_display_control_behav xil_defaultlib.tb_display_control -log elaborate.log

