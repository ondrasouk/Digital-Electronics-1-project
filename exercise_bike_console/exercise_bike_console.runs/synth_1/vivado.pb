
r
Command: %s
53*	vivadotcl2A
-synth_design -top top -part xc7a35ticsg324-1L2default:defaultZ4-113h px? 
:
Starting synth_design
149*	vivadotclZ4-321h px? 
?
@Attempting to get a license for feature '%s' and/or device '%s'
308*common2
	Synthesis2default:default2
xc7a35ti2default:defaultZ17-347h px? 
?
0Got license for feature '%s' and/or device '%s'
310*common2
	Synthesis2default:default2
xc7a35ti2default:defaultZ17-349h px? 
X
Loading part %s157*device2%
xc7a35ticsg324-1L2default:defaultZ21-403h px? 
?
HMultithreading enabled for synth_design using a maximum of %s processes.4828*oasys2
42default:defaultZ8-7079h px? 
a
?Launching helper process for spawning children vivado processes4827*oasysZ8-7078h px? 
`
#Helper process launched with PID %s4824*oasys2
258722default:defaultZ8-7075h px? 
?
%s*synth2?
?Starting RTL Elaboration : Time (s): cpu = 00:00:03 ; elapsed = 00:00:03 . Memory (MB): peak = 2295.848 ; gain = 0.000 ; free physical = 207 ; free virtual = 24312
2default:defaulth px? 
?
synthesizing module '%s'638*oasys2
top2default:default2?
?/run/media/ondra/enc/Sync/BPC-EKT2L/BPC-DE1/projekt/Digital-Electronics-1-project/exercise_bike_console/exercise_bike_console.srcs/sources_1/new/top.vhd2default:default2
592default:default8@Z8-638h px? 
?
synthesizing module '%s'638*oasys2
speedometer2default:default2?
?/run/media/ondra/enc/Sync/BPC-EKT2L/BPC-DE1/projekt/Digital-Electronics-1-project/exercise_bike_console/exercise_bike_console.srcs/sources_1/new/speedometer.vhd2default:default2
522default:default8@Z8-638h px? 
b
%s
*synth2J
6	Parameter g_RESISTLOAD bound to: 20 - type: integer 
2default:defaulth p
x
? 
k
%s
*synth2S
?	Parameter g_INERTIA_MOMENT bound to: 5000000 - type: integer 
2default:defaulth p
x
? 
l
%s
*synth2T
@	Parameter g_WHEEL_CIRCUMFERENCE bound to: 250 - type: integer 
2default:defaulth p
x
? 
d
%s
*synth2L
8	Parameter g_ETIME_ZERO bound to: 16'b1110101001100000 
2default:defaulth p
x
? 
k
%s
*synth2S
?	Parameter g_TIME_UNIT_LENGHT bound to: 10000 - type: integer 
2default:defaulth p
x
? 
?
synthesizing module '%s'638*oasys2 
clock_enable2default:default2?
?/run/media/ondra/enc/Sync/BPC-EKT2L/BPC-DE1/projekt/Digital-Electronics-1-project/exercise_bike_console/exercise_bike_console.srcs/sources_1/new/clock_enable.vhd2default:default2
352default:default8@Z8-638h px? 
^
%s
*synth2F
2	Parameter g_MAX bound to: 10000 - type: integer 
2default:defaulth p
x
? 
?
%done synthesizing module '%s' (%s#%s)256*oasys2 
clock_enable2default:default2
12default:default2
12default:default2?
?/run/media/ondra/enc/Sync/BPC-EKT2L/BPC-DE1/projekt/Digital-Electronics-1-project/exercise_bike_console/exercise_bike_console.srcs/sources_1/new/clock_enable.vhd2default:default2
352default:default8@Z8-256h px? 
?
synthesizing module '%s'638*oasys2
cnt_up2default:default2?
?/run/media/ondra/enc/Sync/BPC-EKT2L/BPC-DE1/projekt/Digital-Electronics-1-project/exercise_bike_console/exercise_bike_console.srcs/sources_1/new/cnt_up.vhd2default:default2
362default:default8@Z8-638h px? 
a
%s
*synth2I
5	Parameter g_CNT_WIDTH bound to: 16 - type: integer 
2default:defaulth p
x
? 
?
%done synthesizing module '%s' (%s#%s)256*oasys2
cnt_up2default:default2
22default:default2
12default:default2?
?/run/media/ondra/enc/Sync/BPC-EKT2L/BPC-DE1/projekt/Digital-Electronics-1-project/exercise_bike_console/exercise_bike_console.srcs/sources_1/new/cnt_up.vhd2default:default2
362default:default8@Z8-256h px? 
?
Esignal '%s' is read in the process but is not in the sensitivity list614*oasys2
s_rst_t2default:default2?
?/run/media/ondra/enc/Sync/BPC-EKT2L/BPC-DE1/projekt/Digital-Electronics-1-project/exercise_bike_console/exercise_bike_console.srcs/sources_1/new/speedometer.vhd2default:default2
1032default:default8@Z8-614h px? 
?
Esignal '%s' is read in the process but is not in the sensitivity list614*oasys2
s_etime2default:default2?
?/run/media/ondra/enc/Sync/BPC-EKT2L/BPC-DE1/projekt/Digital-Electronics-1-project/exercise_bike_console/exercise_bike_console.srcs/sources_1/new/speedometer.vhd2default:default2
1032default:default8@Z8-614h px? 
?
%done synthesizing module '%s' (%s#%s)256*oasys2
speedometer2default:default2
32default:default2
12default:default2?
?/run/media/ondra/enc/Sync/BPC-EKT2L/BPC-DE1/projekt/Digital-Electronics-1-project/exercise_bike_console/exercise_bike_console.srcs/sources_1/new/speedometer.vhd2default:default2
522default:default8@Z8-256h px? 
?
synthesizing module '%s'638*oasys2#
display_control2default:default2?
?/run/media/ondra/enc/Sync/BPC-EKT2L/BPC-DE1/projekt/Digital-Electronics-1-project/exercise_bike_console/exercise_bike_console.srcs/sources_1/new/display_control.vhd2default:default2
552default:default8@Z8-638h px? 
k
%s
*synth2S
?	Parameter g_clk_div_sec bound to: 1000000000 - type: integer 
2default:defaulth p
x
? 
n
%s
*synth2V
B	Parameter g_time_for_reset bound to: 2000000000 - type: integer 
2default:defaulth p
x
? 
?
synthesizing module '%s'638*oasys20
clock_enable__parameterized02default:default2?
?/run/media/ondra/enc/Sync/BPC-EKT2L/BPC-DE1/projekt/Digital-Electronics-1-project/exercise_bike_console/exercise_bike_console.srcs/sources_1/new/clock_enable.vhd2default:default2
352default:default8@Z8-638h px? 
c
%s
*synth2K
7	Parameter g_MAX bound to: 1000000000 - type: integer 
2default:defaulth p
x
? 
?
%done synthesizing module '%s' (%s#%s)256*oasys20
clock_enable__parameterized02default:default2
32default:default2
12default:default2?
?/run/media/ondra/enc/Sync/BPC-EKT2L/BPC-DE1/projekt/Digital-Electronics-1-project/exercise_bike_console/exercise_bike_console.srcs/sources_1/new/clock_enable.vhd2default:default2
352default:default8@Z8-256h px? 
?
synthesizing module '%s'638*oasys20
clock_enable__parameterized12default:default2?
?/run/media/ondra/enc/Sync/BPC-EKT2L/BPC-DE1/projekt/Digital-Electronics-1-project/exercise_bike_console/exercise_bike_console.srcs/sources_1/new/clock_enable.vhd2default:default2
352default:default8@Z8-638h px? 
c
%s
*synth2K
7	Parameter g_MAX bound to: 2000000000 - type: integer 
2default:defaulth p
x
? 
?
%done synthesizing module '%s' (%s#%s)256*oasys20
clock_enable__parameterized12default:default2
32default:default2
12default:default2?
?/run/media/ondra/enc/Sync/BPC-EKT2L/BPC-DE1/projekt/Digital-Electronics-1-project/exercise_bike_console/exercise_bike_console.srcs/sources_1/new/clock_enable.vhd2default:default2
352default:default8@Z8-256h px? 
?
synthesizing module '%s'638*oasys2*
cnt_up__parameterized02default:default2?
?/run/media/ondra/enc/Sync/BPC-EKT2L/BPC-DE1/projekt/Digital-Electronics-1-project/exercise_bike_console/exercise_bike_console.srcs/sources_1/new/cnt_up.vhd2default:default2
362default:default8@Z8-638h px? 
a
%s
*synth2I
5	Parameter g_CNT_WIDTH bound to: 19 - type: integer 
2default:defaulth p
x
? 
?
%done synthesizing module '%s' (%s#%s)256*oasys2*
cnt_up__parameterized02default:default2
32default:default2
12default:default2?
?/run/media/ondra/enc/Sync/BPC-EKT2L/BPC-DE1/projekt/Digital-Electronics-1-project/exercise_bike_console/exercise_bike_console.srcs/sources_1/new/cnt_up.vhd2default:default2
362default:default8@Z8-256h px? 
?
Esignal '%s' is read in the process but is not in the sensitivity list614*oasys2'
s_button_last_local2default:default2?
?/run/media/ondra/enc/Sync/BPC-EKT2L/BPC-DE1/projekt/Digital-Electronics-1-project/exercise_bike_console/exercise_bike_console.srcs/sources_1/new/display_control.vhd2default:default2
1082default:default8@Z8-614h px? 
?
Esignal '%s' is read in the process but is not in the sensitivity list614*oasys2'
s_sel_display_local2default:default2?
?/run/media/ondra/enc/Sync/BPC-EKT2L/BPC-DE1/projekt/Digital-Electronics-1-project/exercise_bike_console/exercise_bike_console.srcs/sources_1/new/display_control.vhd2default:default2
1082default:default8@Z8-614h px? 
?
Esignal '%s' is read in the process but is not in the sensitivity list614*oasys2 
s_total_time2default:default2?
?/run/media/ondra/enc/Sync/BPC-EKT2L/BPC-DE1/projekt/Digital-Electronics-1-project/exercise_bike_console/exercise_bike_console.srcs/sources_1/new/display_control.vhd2default:default2
1082default:default8@Z8-614h px? 
?
Esignal '%s' is read in the process but is not in the sensitivity list614*oasys2
s_reset2default:default2?
?/run/media/ondra/enc/Sync/BPC-EKT2L/BPC-DE1/projekt/Digital-Electronics-1-project/exercise_bike_console/exercise_bike_console.srcs/sources_1/new/display_control.vhd2default:default2
1082default:default8@Z8-614h px? 
?
Esignal '%s' is read in the process but is not in the sensitivity list614*oasys2'
s_sel_display_local2default:default2?
?/run/media/ondra/enc/Sync/BPC-EKT2L/BPC-DE1/projekt/Digital-Electronics-1-project/exercise_bike_console/exercise_bike_console.srcs/sources_1/new/display_control.vhd2default:default2
1462default:default8@Z8-614h px? 
?
Esignal '%s' is read in the process but is not in the sensitivity list614*oasys2
speed_i2default:default2?
?/run/media/ondra/enc/Sync/BPC-EKT2L/BPC-DE1/projekt/Digital-Electronics-1-project/exercise_bike_console/exercise_bike_console.srcs/sources_1/new/display_control.vhd2default:default2
1462default:default8@Z8-614h px? 
?
Esignal '%s' is read in the process but is not in the sensitivity list614*oasys2 
s_temp_local2default:default2?
?/run/media/ondra/enc/Sync/BPC-EKT2L/BPC-DE1/projekt/Digital-Electronics-1-project/exercise_bike_console/exercise_bike_console.srcs/sources_1/new/display_control.vhd2default:default2
1462default:default8@Z8-614h px? 
?
Esignal '%s' is read in the process but is not in the sensitivity list614*oasys2

distance_i2default:default2?
?/run/media/ondra/enc/Sync/BPC-EKT2L/BPC-DE1/projekt/Digital-Electronics-1-project/exercise_bike_console/exercise_bike_console.srcs/sources_1/new/display_control.vhd2default:default2
1462default:default8@Z8-614h px? 
?
Esignal '%s' is read in the process but is not in the sensitivity list614*oasys2

calories_i2default:default2?
?/run/media/ondra/enc/Sync/BPC-EKT2L/BPC-DE1/projekt/Digital-Electronics-1-project/exercise_bike_console/exercise_bike_console.srcs/sources_1/new/display_control.vhd2default:default2
1462default:default8@Z8-614h px? 
?
Esignal '%s' is read in the process but is not in the sensitivity list614*oasys2 
s_total_time2default:default2?
?/run/media/ondra/enc/Sync/BPC-EKT2L/BPC-DE1/projekt/Digital-Electronics-1-project/exercise_bike_console/exercise_bike_console.srcs/sources_1/new/display_control.vhd2default:default2
1462default:default8@Z8-614h px? 
?
Esignal '%s' is read in the process but is not in the sensitivity list614*oasys2
max_speed_i2default:default2?
?/run/media/ondra/enc/Sync/BPC-EKT2L/BPC-DE1/projekt/Digital-Electronics-1-project/exercise_bike_console/exercise_bike_console.srcs/sources_1/new/display_control.vhd2default:default2
1462default:default8@Z8-614h px? 
?
%done synthesizing module '%s' (%s#%s)256*oasys2#
display_control2default:default2
42default:default2
12default:default2?
?/run/media/ondra/enc/Sync/BPC-EKT2L/BPC-DE1/projekt/Digital-Electronics-1-project/exercise_bike_console/exercise_bike_console.srcs/sources_1/new/display_control.vhd2default:default2
552default:default8@Z8-256h px? 
?
synthesizing module '%s'638*oasys2'
driver_7seg_4digits2default:default2?
?/run/media/ondra/enc/Sync/BPC-EKT2L/BPC-DE1/projekt/Digital-Electronics-1-project/exercise_bike_console/exercise_bike_console.srcs/sources_1/new/driver_7seg_4digits.vhd2default:default2
422default:default8@Z8-638h px? 
?
synthesizing module '%s'638*oasys20
clock_enable__parameterized22default:default2?
?/run/media/ondra/enc/Sync/BPC-EKT2L/BPC-DE1/projekt/Digital-Electronics-1-project/exercise_bike_console/exercise_bike_console.srcs/sources_1/new/clock_enable.vhd2default:default2
352default:default8@Z8-638h px? 
_
%s
*synth2G
3	Parameter g_MAX bound to: 400000 - type: integer 
2default:defaulth p
x
? 
?
%done synthesizing module '%s' (%s#%s)256*oasys20
clock_enable__parameterized22default:default2
42default:default2
12default:default2?
?/run/media/ondra/enc/Sync/BPC-EKT2L/BPC-DE1/projekt/Digital-Electronics-1-project/exercise_bike_console/exercise_bike_console.srcs/sources_1/new/clock_enable.vhd2default:default2
352default:default8@Z8-256h px? 
?
synthesizing module '%s'638*oasys2
hex_7seg2default:default2?
?/run/media/ondra/enc/Sync/BPC-EKT2L/BPC-DE1/projekt/Digital-Electronics-1-project/exercise_bike_console/exercise_bike_console.srcs/sources_1/new/hex_7seg.vhd2default:default2
412default:default8@Z8-638h px? 
?
default block is never used226*oasys2?
?/run/media/ondra/enc/Sync/BPC-EKT2L/BPC-DE1/projekt/Digital-Electronics-1-project/exercise_bike_console/exercise_bike_console.srcs/sources_1/new/hex_7seg.vhd2default:default2
512default:default8@Z8-226h px? 
?
%done synthesizing module '%s' (%s#%s)256*oasys2
hex_7seg2default:default2
52default:default2
12default:default2?
?/run/media/ondra/enc/Sync/BPC-EKT2L/BPC-DE1/projekt/Digital-Electronics-1-project/exercise_bike_console/exercise_bike_console.srcs/sources_1/new/hex_7seg.vhd2default:default2
412default:default8@Z8-256h px? 
?
%done synthesizing module '%s' (%s#%s)256*oasys2'
driver_7seg_4digits2default:default2
62default:default2
12default:default2?
?/run/media/ondra/enc/Sync/BPC-EKT2L/BPC-DE1/projekt/Digital-Electronics-1-project/exercise_bike_console/exercise_bike_console.srcs/sources_1/new/driver_7seg_4digits.vhd2default:default2
422default:default8@Z8-256h px? 
?
%done synthesizing module '%s' (%s#%s)256*oasys2
top2default:default2
72default:default2
12default:default2?
?/run/media/ondra/enc/Sync/BPC-EKT2L/BPC-DE1/projekt/Digital-Electronics-1-project/exercise_bike_console/exercise_bike_console.srcs/sources_1/new/top.vhd2default:default2
592default:default8@Z8-256h px? 
?
%s*synth2?
?Finished RTL Elaboration : Time (s): cpu = 00:00:04 ; elapsed = 00:00:04 . Memory (MB): peak = 2295.848 ; gain = 0.000 ; free physical = 955 ; free virtual = 25045
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
M
%s
*synth25
!Start Handling Custom Attributes
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Handling Custom Attributes : Time (s): cpu = 00:00:04 ; elapsed = 00:00:05 . Memory (MB): peak = 2295.848 ; gain = 0.000 ; free physical = 1004 ; free virtual = 25094
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished RTL Optimization Phase 1 : Time (s): cpu = 00:00:04 ; elapsed = 00:00:05 . Memory (MB): peak = 2295.848 ; gain = 0.000 ; free physical = 1004 ; free virtual = 25094
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2.
Netlist sorting complete. 2default:default2
00:00:00.012default:default2
00:00:00.012default:default2
2295.8482default:default2
0.0002default:default2
9982default:default2
250872default:defaultZ17-722h px? 
K
)Preparing netlist for logic optimization
349*projectZ1-570h px? 
>

Processing XDC Constraints
244*projectZ1-262h px? 
=
Initializing timing engine
348*projectZ1-569h px? 
?
Parsing XDC File [%s]
179*designutils2?
?/run/media/ondra/enc/Sync/BPC-EKT2L/BPC-DE1/projekt/Digital-Electronics-1-project/exercise_bike_console/exercise_bike_console.srcs/constrs_1/new/Arty-A7-35.xdc2default:default8Z20-179h px? 
?
Finished Parsing XDC File [%s]
178*designutils2?
?/run/media/ondra/enc/Sync/BPC-EKT2L/BPC-DE1/projekt/Digital-Electronics-1-project/exercise_bike_console/exercise_bike_console.srcs/constrs_1/new/Arty-A7-35.xdc2default:default8Z20-178h px? 
?
?Implementation specific constraints were found while reading constraint file [%s]. These constraints will be ignored for synthesis but will be used in implementation. Impacted constraints are listed in the file [%s].
233*project2?
?/run/media/ondra/enc/Sync/BPC-EKT2L/BPC-DE1/projekt/Digital-Electronics-1-project/exercise_bike_console/exercise_bike_console.srcs/constrs_1/new/Arty-A7-35.xdc2default:default2)
.Xil/top_propImpl.xdc2default:defaultZ1-236h px? 
H
&Completed Processing XDC Constraints

245*projectZ1-263h px? 
?
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2
00:00:002default:default2
2359.6992default:default2
0.0002default:default2
10002default:default2
250902default:defaultZ17-722h px? 
~
!Unisim Transformation Summary:
%s111*project29
%No Unisim elements were transformed.
2default:defaultZ1-111h px? 
?
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common24
 Constraint Validation Runtime : 2default:default2
00:00:002default:default2
00:00:002default:default2
2359.6992default:default2
0.0002default:default2
10002default:default2
250902default:defaultZ17-722h px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Constraint Validation : Time (s): cpu = 00:00:09 ; elapsed = 00:00:10 . Memory (MB): peak = 2359.699 ; gain = 63.852 ; free physical = 1059 ; free virtual = 25147
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
V
%s
*synth2>
*Start Loading Part and Timing Information
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
L
%s
*synth24
 Loading part: xc7a35ticsg324-1L
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Loading Part and Timing Information : Time (s): cpu = 00:00:09 ; elapsed = 00:00:10 . Memory (MB): peak = 2359.699 ; gain = 63.852 ; free physical = 1059 ; free virtual = 25147
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
Z
%s
*synth2B
.Start Applying 'set_property' XDC Constraints
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished applying 'set_property' XDC Constraints : Time (s): cpu = 00:00:09 ; elapsed = 00:00:10 . Memory (MB): peak = 2359.699 ; gain = 63.852 ; free physical = 1059 ; free virtual = 25147
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
!inferring latch for variable '%s'327*oasys2

leds_o_reg2default:default2?
?/run/media/ondra/enc/Sync/BPC-EKT2L/BPC-DE1/projekt/Digital-Electronics-1-project/exercise_bike_console/exercise_bike_console.srcs/sources_1/new/display_control.vhd2default:default2
1512default:default8@Z8-327h px? 
?
!inferring latch for variable '%s'327*oasys2
dp_o_reg2default:default2?
?/run/media/ondra/enc/Sync/BPC-EKT2L/BPC-DE1/projekt/Digital-Electronics-1-project/exercise_bike_console/exercise_bike_console.srcs/sources_1/new/display_control.vhd2default:default2
1532default:default8@Z8-327h px? 
?
!inferring latch for variable '%s'327*oasys2
data3_o_reg2default:default2?
?/run/media/ondra/enc/Sync/BPC-EKT2L/BPC-DE1/projekt/Digital-Electronics-1-project/exercise_bike_console/exercise_bike_console.srcs/sources_1/new/display_control.vhd2default:default2
1542default:default8@Z8-327h px? 
?
!inferring latch for variable '%s'327*oasys2
data2_o_reg2default:default2?
?/run/media/ondra/enc/Sync/BPC-EKT2L/BPC-DE1/projekt/Digital-Electronics-1-project/exercise_bike_console/exercise_bike_console.srcs/sources_1/new/display_control.vhd2default:default2
1552default:default8@Z8-327h px? 
?
!inferring latch for variable '%s'327*oasys2
data1_o_reg2default:default2?
?/run/media/ondra/enc/Sync/BPC-EKT2L/BPC-DE1/projekt/Digital-Electronics-1-project/exercise_bike_console/exercise_bike_console.srcs/sources_1/new/display_control.vhd2default:default2
1562default:default8@Z8-327h px? 
?
!inferring latch for variable '%s'327*oasys2
data0_o_reg2default:default2?
?/run/media/ondra/enc/Sync/BPC-EKT2L/BPC-DE1/projekt/Digital-Electronics-1-project/exercise_bike_console/exercise_bike_console.srcs/sources_1/new/display_control.vhd2default:default2
1572default:default8@Z8-327h px? 
?
!inferring latch for variable '%s'327*oasys2+
s_button_last_local_reg2default:default2?
?/run/media/ondra/enc/Sync/BPC-EKT2L/BPC-DE1/projekt/Digital-Electronics-1-project/exercise_bike_console/exercise_bike_console.srcs/sources_1/new/display_control.vhd2default:default2
1102default:default8@Z8-327h px? 
?
!inferring latch for variable '%s'327*oasys2$
s_temp_local_reg2default:default2?
?/run/media/ondra/enc/Sync/BPC-EKT2L/BPC-DE1/projekt/Digital-Electronics-1-project/exercise_bike_console/exercise_bike_console.srcs/sources_1/new/display_control.vhd2default:default2
1502default:default8@Z8-327h px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished RTL Optimization Phase 2 : Time (s): cpu = 00:00:09 ; elapsed = 00:00:11 . Memory (MB): peak = 2359.699 ; gain = 63.852 ; free physical = 1052 ; free virtual = 25142
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
L
%s
*synth24
 Start RTL Component Statistics 
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
K
%s
*synth23
Detailed RTL Component Info : 
2default:defaulth p
x
? 
:
%s
*synth2"
+---Adders : 
2default:defaulth p
x
? 
X
%s
*synth2@
,	   4 Input   24 Bit       Adders := 1     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   4 Input   22 Bit       Adders := 1     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   2 Input   20 Bit       Adders := 1     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   2 Input    4 Bit       Adders := 1     
2default:defaulth p
x
? 
=
%s
*synth2%
+---Registers : 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	               24 Bit    Registers := 3     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	               22 Bit    Registers := 7     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	               20 Bit    Registers := 2     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	               16 Bit    Registers := 4     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                4 Bit    Registers := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                2 Bit    Registers := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                1 Bit    Registers := 8     
2default:defaulth p
x
? 
9
%s
*synth2!
+---Muxes : 
2default:defaulth p
x
? 
X
%s
*synth2@
,	   2 Input   24 Bit        Muxes := 1     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   2 Input   22 Bit        Muxes := 5     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   2 Input   20 Bit        Muxes := 2     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   2 Input   16 Bit        Muxes := 4     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   2 Input    5 Bit        Muxes := 1     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   6 Input    5 Bit        Muxes := 1     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   5 Input    4 Bit        Muxes := 1     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   2 Input    4 Bit        Muxes := 29    
2default:defaulth p
x
? 
X
%s
*synth2@
,	   6 Input    4 Bit        Muxes := 5     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   3 Input    4 Bit        Muxes := 1     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   4 Input    4 Bit        Muxes := 3     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   4 Input    3 Bit        Muxes := 1     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   2 Input    1 Bit        Muxes := 14    
2default:defaulth p
x
? 
X
%s
*synth2@
,	   6 Input    1 Bit        Muxes := 2     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   4 Input    1 Bit        Muxes := 1     
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
O
%s
*synth27
#Finished RTL Component Statistics 
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
H
%s
*synth20
Start Part Resource Summary
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s
*synth2j
VPart Resources:
DSPs: 90 (col length:60)
BRAMs: 100 (col length: RAMB18 60 RAMB36 30)
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
K
%s
*synth23
Finished Part Resource Summary
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
W
%s
*synth2?
+Start Cross Boundary and Area Optimization
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
o
%s
*synth2W
CDSP Report: Generating DSP multOp, operation Mode is: A2*(B:0x24).
2default:defaulth p
x
? 
t
%s
*synth2\
HDSP Report: register s_avg_speed_local_reg is absorbed into DSP multOp.
2default:defaulth p
x
? 
e
%s
*synth2M
9DSP Report: operator multOp is absorbed into DSP multOp.
2default:defaulth p
x
? 
o
%s
*synth2W
CDSP Report: Generating DSP multOp, operation Mode is: A2*(B:0xfa).
2default:defaulth p
x
? 
s
%s
*synth2[
GDSP Report: register s_distance_local_reg is absorbed into DSP multOp.
2default:defaulth p
x
? 
e
%s
*synth2M
9DSP Report: operator multOp is absorbed into DSP multOp.
2default:defaulth p
x
? 
q
%s
*synth2Y
EDSP Report: Generating DSP s_inertia_local2, operation Mode is: A*B.
2default:defaulth p
x
? 
y
%s
*synth2a
MDSP Report: operator s_inertia_local2 is absorbed into DSP s_inertia_local2.
2default:defaulth p
x
? 
p
%s
*synth2X
DDSP Report: Generating DSP multOp, operation Mode is: A2*(B:0x3e8).
2default:defaulth p
x
? 
o
%s
*synth2W
CDSP Report: register s_work_local_reg is absorbed into DSP multOp.
2default:defaulth p
x
? 
e
%s
*synth2M
9DSP Report: operator multOp is absorbed into DSP multOp.
2default:defaulth p
x
? 
n
%s
*synth2V
BDSP Report: Generating DSP multOp, operation Mode is: A*(B:0x24).
2default:defaulth p
x
? 
e
%s
*synth2M
9DSP Report: operator multOp is absorbed into DSP multOp.
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Cross Boundary and Area Optimization : Time (s): cpu = 00:00:11 ; elapsed = 00:00:12 . Memory (MB): peak = 2359.699 ; gain = 63.852 ; free physical = 1035 ; free virtual = 25131
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?---------------------------------------------------------------------------------
Start ROM, RAM, DSP, Shift Register and Retiming Reporting
2default:defaulth px? 
~
%s*synth2f
R---------------------------------------------------------------------------------
2default:defaulth px? 
^
%s*synth2F
2
DSP: Preliminary Mapping	Report (see note below)
2default:defaulth px? 
?
%s*synth2?
}+------------+--------------+--------+--------+--------+--------+--------+------+------+------+------+-------+------+------+
2default:defaulth px? 
?
%s*synth2?
~|Module Name | DSP Mapping  | A Size | B Size | C Size | D Size | P Size | AREG | BREG | CREG | DREG | ADREG | MREG | PREG | 
2default:defaulth px? 
?
%s*synth2?
}+------------+--------------+--------+--------+--------+--------+--------+------+------+------+------+-------+------+------+
2default:defaulth px? 
?
%s*synth2?
~|speedometer | A2*(B:0x24)  | 22     | 6      | -      | -      | 28     | 1    | 0    | -    | -    | -     | 0    | 0    | 
2default:defaulth px? 
?
%s*synth2?
~|speedometer | A2*(B:0xfa)  | 20     | 8      | -      | -      | 28     | 1    | 0    | -    | -    | -     | 0    | 0    | 
2default:defaulth px? 
?
%s*synth2?
~|speedometer | A*B          | 16     | 16     | -      | -      | 32     | 0    | 0    | -    | -    | -     | 0    | 0    | 
2default:defaulth px? 
?
%s*synth2?
~|speedometer | A2*(B:0x3e8) | 24     | 10     | -      | -      | 34     | 1    | 0    | -    | -    | -     | 0    | 0    | 
2default:defaulth px? 
?
%s*synth2?
~|speedometer | A*(B:0x24)   | 22     | 6      | -      | -      | 28     | 0    | 0    | -    | -    | -     | 0    | 0    | 
2default:defaulth px? 
?
%s*synth2?
~+------------+--------------+--------+--------+--------+--------+--------+------+------+------+------+-------+------+------+

2default:defaulth px? 
?
%s*synth2?
?Note: The table above is a preliminary report that shows the DSPs inferred at the current stage of the synthesis flow. Some DSP may be reimplemented as non DSP primitives later in the synthesis flow. Multiple instantiated DSPs are reported only once.
2default:defaulth px? 
?
%s*synth2?
?---------------------------------------------------------------------------------
Finished ROM, RAM, DSP, Shift Register and Retiming Reporting
2default:defaulth px? 
~
%s*synth2f
R---------------------------------------------------------------------------------
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
R
%s
*synth2:
&Start Applying XDC Timing Constraints
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Applying XDC Timing Constraints : Time (s): cpu = 00:00:16 ; elapsed = 00:00:17 . Memory (MB): peak = 2359.699 ; gain = 63.852 ; free physical = 920 ; free virtual = 25017
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
F
%s
*synth2.
Start Timing Optimization
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Timing Optimization : Time (s): cpu = 00:00:16 ; elapsed = 00:00:17 . Memory (MB): peak = 2359.699 ; gain = 63.852 ; free physical = 920 ; free virtual = 25017
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
E
%s
*synth2-
Start Technology Mapping
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Technology Mapping : Time (s): cpu = 00:00:16 ; elapsed = 00:00:17 . Memory (MB): peak = 2359.699 ; gain = 63.852 ; free physical = 918 ; free virtual = 25016
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s
*synth2'
Start IO Insertion
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
Q
%s
*synth29
%Start Flattening Before IO Insertion
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
T
%s
*synth2<
(Finished Flattening Before IO Insertion
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
H
%s
*synth20
Start Final Netlist Cleanup
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
K
%s
*synth23
Finished Final Netlist Cleanup
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished IO Insertion : Time (s): cpu = 00:00:18 ; elapsed = 00:00:20 . Memory (MB): peak = 2359.699 ; gain = 63.852 ; free physical = 917 ; free virtual = 25014
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
O
%s
*synth27
#Start Renaming Generated Instances
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Renaming Generated Instances : Time (s): cpu = 00:00:18 ; elapsed = 00:00:20 . Memory (MB): peak = 2359.699 ; gain = 63.852 ; free physical = 917 ; free virtual = 25014
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
L
%s
*synth24
 Start Rebuilding User Hierarchy
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Rebuilding User Hierarchy : Time (s): cpu = 00:00:18 ; elapsed = 00:00:20 . Memory (MB): peak = 2359.699 ; gain = 63.852 ; free physical = 917 ; free virtual = 25014
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
K
%s
*synth23
Start Renaming Generated Ports
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Renaming Generated Ports : Time (s): cpu = 00:00:18 ; elapsed = 00:00:20 . Memory (MB): peak = 2359.699 ; gain = 63.852 ; free physical = 917 ; free virtual = 25014
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
M
%s
*synth25
!Start Handling Custom Attributes
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Handling Custom Attributes : Time (s): cpu = 00:00:18 ; elapsed = 00:00:20 . Memory (MB): peak = 2359.699 ; gain = 63.852 ; free physical = 917 ; free virtual = 25014
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
J
%s
*synth22
Start Renaming Generated Nets
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Renaming Generated Nets : Time (s): cpu = 00:00:18 ; elapsed = 00:00:20 . Memory (MB): peak = 2359.699 ; gain = 63.852 ; free physical = 917 ; free virtual = 25014
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
K
%s
*synth23
Start Writing Synthesis Report
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
A
%s
*synth2)

Report BlackBoxes: 
2default:defaulth p
x
? 
J
%s
*synth22
+-+--------------+----------+
2default:defaulth p
x
? 
J
%s
*synth22
| |BlackBox name |Instances |
2default:defaulth p
x
? 
J
%s
*synth22
+-+--------------+----------+
2default:defaulth p
x
? 
J
%s
*synth22
+-+--------------+----------+
2default:defaulth p
x
? 
A
%s*synth2)

Report Cell Usage: 
2default:defaulth px? 
D
%s*synth2,
+------+-------+------+
2default:defaulth px? 
D
%s*synth2,
|      |Cell   |Count |
2default:defaulth px? 
D
%s*synth2,
+------+-------+------+
2default:defaulth px? 
D
%s*synth2,
|1     |BUFG   |     1|
2default:defaulth px? 
D
%s*synth2,
|2     |CARRY4 |     8|
2default:defaulth px? 
D
%s*synth2,
|3     |LUT1   |     1|
2default:defaulth px? 
D
%s*synth2,
|4     |LUT2   |     5|
2default:defaulth px? 
D
%s*synth2,
|5     |LUT3   |     3|
2default:defaulth px? 
D
%s*synth2,
|6     |LUT4   |     3|
2default:defaulth px? 
D
%s*synth2,
|7     |LUT5   |     1|
2default:defaulth px? 
D
%s*synth2,
|8     |LUT6   |     8|
2default:defaulth px? 
D
%s*synth2,
|9     |FDRE   |    37|
2default:defaulth px? 
D
%s*synth2,
|10    |LD     |     5|
2default:defaulth px? 
D
%s*synth2,
|11    |LDP    |     1|
2default:defaulth px? 
D
%s*synth2,
|12    |IBUF   |     2|
2default:defaulth px? 
D
%s*synth2,
|13    |OBUF   |    17|
2default:defaulth px? 
D
%s*synth2,
+------+-------+------+
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Writing Synthesis Report : Time (s): cpu = 00:00:18 ; elapsed = 00:00:20 . Memory (MB): peak = 2359.699 ; gain = 63.852 ; free physical = 917 ; free virtual = 25014
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
r
%s
*synth2Z
FSynthesis finished with 0 errors, 0 critical warnings and 8 warnings.
2default:defaulth p
x
? 
?
%s
*synth2?
?Synthesis Optimization Runtime : Time (s): cpu = 00:00:17 ; elapsed = 00:00:18 . Memory (MB): peak = 2359.699 ; gain = 0.000 ; free physical = 964 ; free virtual = 25062
2default:defaulth p
x
? 
?
%s
*synth2?
?Synthesis Optimization Complete : Time (s): cpu = 00:00:18 ; elapsed = 00:00:20 . Memory (MB): peak = 2359.699 ; gain = 63.852 ; free physical = 964 ; free virtual = 25062
2default:defaulth p
x
? 
B
 Translating synthesized netlist
350*projectZ1-571h px? 
?
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2
00:00:002default:default2
2359.6992default:default2
0.0002default:default2
10512default:default2
251482default:defaultZ17-722h px? 
f
-Analyzing %s Unisim elements for replacement
17*netlist2
142default:defaultZ29-17h px? 
j
2Unisim Transformation completed in %s CPU seconds
28*netlist2
02default:defaultZ29-28h px? 
K
)Preparing netlist for logic optimization
349*projectZ1-570h px? 
u
)Pushed %s inverter(s) to %s load pin(s).
98*opt2
02default:default2
02default:defaultZ31-138h px? 
?
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2
00:00:002default:default2
2359.6992default:default2
0.0002default:default2
10122default:default2
251092default:defaultZ17-722h px? 
?
!Unisim Transformation Summary:
%s111*project2t
`  A total of 6 instances were transformed.
  LD => LDCE: 5 instances
  LDP => LDPE: 1 instance 
2default:defaultZ1-111h px? 
U
Releasing license: %s
83*common2
	Synthesis2default:defaultZ17-83h px? 
?
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
382default:default2
212default:default2
02default:default2
02default:defaultZ4-41h px? 
^
%s completed successfully
29*	vivadotcl2 
synth_design2default:defaultZ4-42h px? 
?
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2"
synth_design: 2default:default2
00:00:262default:default2
00:00:242default:default2
2359.6992default:default2
64.0312default:default2
11562default:default2
252532default:defaultZ17-722h px? 
?
 The %s '%s' has been generated.
621*common2

checkpoint2default:default2?
?/run/media/ondra/enc/Sync/BPC-EKT2L/BPC-DE1/projekt/Digital-Electronics-1-project/exercise_bike_console/exercise_bike_console.runs/synth_1/top.dcp2default:defaultZ17-1381h px? 
?
%s4*runtcl2p
\Executing : report_utilization -file top_utilization_synth.rpt -pb top_utilization_synth.pb
2default:defaulth px? 
?
Exiting %s at %s...
206*common2
Vivado2default:default2,
Thu May  6 23:34:48 20212default:defaultZ17-206h px? 


End Record