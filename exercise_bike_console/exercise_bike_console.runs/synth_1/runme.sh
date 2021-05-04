#!/bin/sh

# 
# Vivado(TM)
# runme.sh: a Vivado-generated Runs Script for UNIX
# Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
# 

if [ -z "$PATH" ]; then
  PATH=/mnt/643cdda3-bbe4-4e4c-a460-95929b593fea/Xilinx/Vivado/2020.2/ids_lite/ISE/bin/lin64:/mnt/643cdda3-bbe4-4e4c-a460-95929b593fea/Xilinx/Vivado/2020.2/bin
else
  PATH=/mnt/643cdda3-bbe4-4e4c-a460-95929b593fea/Xilinx/Vivado/2020.2/ids_lite/ISE/bin/lin64:/mnt/643cdda3-bbe4-4e4c-a460-95929b593fea/Xilinx/Vivado/2020.2/bin:$PATH
fi
export PATH

if [ -z "$LD_LIBRARY_PATH" ]; then
  LD_LIBRARY_PATH=
else
  LD_LIBRARY_PATH=:$LD_LIBRARY_PATH
fi
export LD_LIBRARY_PATH

HD_PWD='/run/media/ondra/enc/Sync/BPC-EKT2L/BPC-DE1/projekt/Digital-Electronics-1-project/exercise_bike_console/exercise_bike_console.runs/synth_1'
cd "$HD_PWD"

HD_LOG=runme.log
/bin/touch $HD_LOG

ISEStep="./ISEWrap.sh"
EAStep()
{
     $ISEStep $HD_LOG "$@" >> $HD_LOG 2>&1
     if [ $? -ne 0 ]
     then
         exit
     fi
}

EAStep vivado -log top.vds -m64 -product Vivado -mode batch -messageDb vivado.pb -notrace -source top.tcl
