
Q
Command: %s
53*	vivadotcl2 
place_design2default:defaultZ4-113h px? 
?
@Attempting to get a license for feature '%s' and/or device '%s'
308*common2"
Implementation2default:default2
xc7a35ti2default:defaultZ17-347h px? 
?
0Got license for feature '%s' and/or device '%s'
310*common2"
Implementation2default:default2
xc7a35ti2default:defaultZ17-349h px? 
P
Running DRC with %s threads
24*drc2
82default:defaultZ23-27h px? 
V
DRC finished with %s
79*	vivadotcl2
0 Errors2default:defaultZ4-198h px? 
e
BPlease refer to the DRC report (report_drc) for more information.
80*	vivadotclZ4-199h px? 
p
,Running DRC as a precondition to command %s
22*	vivadotcl2 
place_design2default:defaultZ4-22h px? 
P
Running DRC with %s threads
24*drc2
82default:defaultZ23-27h px? 
V
DRC finished with %s
79*	vivadotcl2
0 Errors2default:defaultZ4-198h px? 
e
BPlease refer to the DRC report (report_drc) for more information.
80*	vivadotclZ4-199h px? 
U

Starting %s Task
103*constraints2
Placer2default:defaultZ18-103h px? 
}
BMultithreading enabled for place_design using a maximum of %s CPUs12*	placeflow2
82default:defaultZ30-611h px? 
v

Phase %s%s
101*constraints2
1 2default:default2)
Placer Initialization2default:defaultZ18-101h px? 
?

Phase %s%s
101*constraints2
1.1 2default:default29
%Placer Initialization Netlist Sorting2default:defaultZ18-101h px? 
?
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2
00:00:002default:default2
2907.5552default:default2
0.0002default:default2
6732default:default2
247512default:defaultZ17-722h px? 
Z
EPhase 1.1 Placer Initialization Netlist Sorting | Checksum: 967b911a
*commonh px? 
?

%s
*constraints2?
?Time (s): cpu = 00:00:00.01 ; elapsed = 00:00:00.02 . Memory (MB): peak = 2907.555 ; gain = 0.000 ; free physical = 673 ; free virtual = 247512default:defaulth px? 
?
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2
00:00:002default:default2
2907.5552default:default2
0.0002default:default2
6732default:default2
247512default:defaultZ17-722h px? 
?

Phase %s%s
101*constraints2
1.2 2default:default2F
2IO Placement/ Clock Placement/ Build Placer Device2default:defaultZ18-101h px? 
g
RPhase 1.2 IO Placement/ Clock Placement/ Build Placer Device | Checksum: 8bcab10b
*commonh px? 
?

%s
*constraints2?
?Time (s): cpu = 00:00:00.34 ; elapsed = 00:00:00.23 . Memory (MB): peak = 2907.555 ; gain = 0.000 ; free physical = 695 ; free virtual = 247752default:defaulth px? 
}

Phase %s%s
101*constraints2
1.3 2default:default2.
Build Placer Netlist Model2default:defaultZ18-101h px? 
P
;Phase 1.3 Build Placer Netlist Model | Checksum: 11e59e841
*commonh px? 
?

%s
*constraints2?
?Time (s): cpu = 00:00:00.38 ; elapsed = 00:00:00.27 . Memory (MB): peak = 2907.555 ; gain = 0.000 ; free physical = 694 ; free virtual = 247752default:defaulth px? 
z

Phase %s%s
101*constraints2
1.4 2default:default2+
Constrain Clocks/Macros2default:defaultZ18-101h px? 
M
8Phase 1.4 Constrain Clocks/Macros | Checksum: 11e59e841
*commonh px? 
?

%s
*constraints2?
?Time (s): cpu = 00:00:00.38 ; elapsed = 00:00:00.28 . Memory (MB): peak = 2907.555 ; gain = 0.000 ; free physical = 694 ; free virtual = 247752default:defaulth px? 
I
4Phase 1 Placer Initialization | Checksum: 11e59e841
*commonh px? 
?

%s
*constraints2?
?Time (s): cpu = 00:00:00.38 ; elapsed = 00:00:00.28 . Memory (MB): peak = 2907.555 ; gain = 0.000 ; free physical = 694 ; free virtual = 247742default:defaulth px? 
q

Phase %s%s
101*constraints2
2 2default:default2$
Global Placement2default:defaultZ18-101h px? 
p

Phase %s%s
101*constraints2
2.1 2default:default2!
Floorplanning2default:defaultZ18-101h px? 
C
.Phase 2.1 Floorplanning | Checksum: 11e59e841
*commonh px? 
?

%s
*constraints2?
?Time (s): cpu = 00:00:00.38 ; elapsed = 00:00:00.29 . Memory (MB): peak = 2907.555 ; gain = 0.000 ; free physical = 693 ; free virtual = 247742default:defaulth px? 
?

Phase %s%s
101*constraints2
2.2 2default:default25
!Update Timing before SLR Path Opt2default:defaultZ18-101h px? 
W
BPhase 2.2 Update Timing before SLR Path Opt | Checksum: 11e59e841
*commonh px? 
?

%s
*constraints2?
?Time (s): cpu = 00:00:00.38 ; elapsed = 00:00:00.29 . Memory (MB): peak = 2907.555 ; gain = 0.000 ; free physical = 693 ; free virtual = 247742default:defaulth px? 
x

Phase %s%s
101*constraints2
2.3 2default:default2)
Global Placement Core2default:defaultZ18-101h px? 
h
Eplace_design is not in timing mode. Skip physical synthesis in placer29*	placeflowZ46-29h px? 
J
5Phase 2.3 Global Placement Core | Checksum: c2c27b4d
*commonh px? 
?

%s
*constraints2?
?Time (s): cpu = 00:00:00.66 ; elapsed = 00:00:00.43 . Memory (MB): peak = 2907.555 ; gain = 0.000 ; free physical = 660 ; free virtual = 247412default:defaulth px? 
C
.Phase 2 Global Placement | Checksum: c2c27b4d
*commonh px? 
?

%s
*constraints2?
?Time (s): cpu = 00:00:00.66 ; elapsed = 00:00:00.43 . Memory (MB): peak = 2907.555 ; gain = 0.000 ; free physical = 661 ; free virtual = 247432default:defaulth px? 
q

Phase %s%s
101*constraints2
3 2default:default2$
Detail Placement2default:defaultZ18-101h px? 
}

Phase %s%s
101*constraints2
3.1 2default:default2.
Commit Multi Column Macros2default:defaultZ18-101h px? 
O
:Phase 3.1 Commit Multi Column Macros | Checksum: c2c27b4d
*commonh px? 
?

%s
*constraints2?
?Time (s): cpu = 00:00:00.67 ; elapsed = 00:00:00.43 . Memory (MB): peak = 2907.555 ; gain = 0.000 ; free physical = 661 ; free virtual = 247432default:defaulth px? 


Phase %s%s
101*constraints2
3.2 2default:default20
Commit Most Macros & LUTRAMs2default:defaultZ18-101h px? 
R
=Phase 3.2 Commit Most Macros & LUTRAMs | Checksum: 121a84aae
*commonh px? 
?

%s
*constraints2?
?Time (s): cpu = 00:00:00.67 ; elapsed = 00:00:00.44 . Memory (MB): peak = 2907.555 ; gain = 0.000 ; free physical = 661 ; free virtual = 247432default:defaulth px? 
y

Phase %s%s
101*constraints2
3.3 2default:default2*
Area Swap Optimization2default:defaultZ18-101h px? 
L
7Phase 3.3 Area Swap Optimization | Checksum: 158a9a198
*commonh px? 
?

%s
*constraints2?
?Time (s): cpu = 00:00:00.69 ; elapsed = 00:00:00.44 . Memory (MB): peak = 2907.555 ; gain = 0.000 ; free physical = 661 ; free virtual = 247432default:defaulth px? 
?

Phase %s%s
101*constraints2
3.4 2default:default22
Pipeline Register Optimization2default:defaultZ18-101h px? 
T
?Phase 3.4 Pipeline Register Optimization | Checksum: 158a9a198
*commonh px? 
?

%s
*constraints2?
?Time (s): cpu = 00:00:00.69 ; elapsed = 00:00:00.44 . Memory (MB): peak = 2907.555 ; gain = 0.000 ; free physical = 661 ; free virtual = 247432default:defaulth px? 


Phase %s%s
101*constraints2
3.5 2default:default20
Small Shape Detail Placement2default:defaultZ18-101h px? 
R
=Phase 3.5 Small Shape Detail Placement | Checksum: 10fd1eac3
*commonh px? 
?

%s
*constraints2?
?Time (s): cpu = 00:00:00.76 ; elapsed = 00:00:00.50 . Memory (MB): peak = 2907.555 ; gain = 0.000 ; free physical = 667 ; free virtual = 247492default:defaulth px? 
u

Phase %s%s
101*constraints2
3.6 2default:default2&
Re-assign LUT pins2default:defaultZ18-101h px? 
H
3Phase 3.6 Re-assign LUT pins | Checksum: 10fd1eac3
*commonh px? 
?

%s
*constraints2?
?Time (s): cpu = 00:00:00.76 ; elapsed = 00:00:00.50 . Memory (MB): peak = 2907.555 ; gain = 0.000 ; free physical = 667 ; free virtual = 247492default:defaulth px? 
?

Phase %s%s
101*constraints2
3.7 2default:default22
Pipeline Register Optimization2default:defaultZ18-101h px? 
T
?Phase 3.7 Pipeline Register Optimization | Checksum: 10fd1eac3
*commonh px? 
?

%s
*constraints2?
?Time (s): cpu = 00:00:00.76 ; elapsed = 00:00:00.50 . Memory (MB): peak = 2907.555 ; gain = 0.000 ; free physical = 667 ; free virtual = 247492default:defaulth px? 
D
/Phase 3 Detail Placement | Checksum: 10fd1eac3
*commonh px? 
?

%s
*constraints2?
?Time (s): cpu = 00:00:00.76 ; elapsed = 00:00:00.51 . Memory (MB): peak = 2907.555 ; gain = 0.000 ; free physical = 667 ; free virtual = 247492default:defaulth px? 
?

Phase %s%s
101*constraints2
4 2default:default2<
(Post Placement Optimization and Clean-Up2default:defaultZ18-101h px? 
{

Phase %s%s
101*constraints2
4.1 2default:default2,
Post Commit Optimization2default:defaultZ18-101h px? 
N
9Phase 4.1 Post Commit Optimization | Checksum: 10fd1eac3
*commonh px? 
?

%s
*constraints2?
?Time (s): cpu = 00:00:00.78 ; elapsed = 00:00:00.51 . Memory (MB): peak = 2907.555 ; gain = 0.000 ; free physical = 667 ; free virtual = 247492default:defaulth px? 
y

Phase %s%s
101*constraints2
4.2 2default:default2*
Post Placement Cleanup2default:defaultZ18-101h px? 
L
7Phase 4.2 Post Placement Cleanup | Checksum: 10fd1eac3
*commonh px? 
?

%s
*constraints2?
?Time (s): cpu = 00:00:00.79 ; elapsed = 00:00:00.51 . Memory (MB): peak = 2907.555 ; gain = 0.000 ; free physical = 667 ; free virtual = 247492default:defaulth px? 
s

Phase %s%s
101*constraints2
4.3 2default:default2$
Placer Reporting2default:defaultZ18-101h px? 


Phase %s%s
101*constraints2
4.3.1 2default:default2.
Print Estimated Congestion2default:defaultZ18-101h px? 
?
'Post-Placement Estimated Congestion %s
38*	placeflow2?
?
 ____________________________________________________
|           | Global Congestion | Short Congestion  |
| Direction | Region Size       | Region Size       |
|___________|___________________|___________________|
|      North|                1x1|                1x1|
|___________|___________________|___________________|
|      South|                1x1|                1x1|
|___________|___________________|___________________|
|       East|                1x1|                1x1|
|___________|___________________|___________________|
|       West|                1x1|                1x1|
|___________|___________________|___________________|
2default:defaultZ30-612h px? 
R
=Phase 4.3.1 Print Estimated Congestion | Checksum: 10fd1eac3
*commonh px? 
?

%s
*constraints2?
?Time (s): cpu = 00:00:00.79 ; elapsed = 00:00:00.51 . Memory (MB): peak = 2907.555 ; gain = 0.000 ; free physical = 667 ; free virtual = 247492default:defaulth px? 
F
1Phase 4.3 Placer Reporting | Checksum: 10fd1eac3
*commonh px? 
?

%s
*constraints2?
?Time (s): cpu = 00:00:00.80 ; elapsed = 00:00:00.51 . Memory (MB): peak = 2907.555 ; gain = 0.000 ; free physical = 667 ; free virtual = 247492default:defaulth px? 
z

Phase %s%s
101*constraints2
4.4 2default:default2+
Final Placement Cleanup2default:defaultZ18-101h px? 
?
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2
00:00:002default:default2
2907.5552default:default2
0.0002default:default2
6672default:default2
247492default:defaultZ17-722h px? 
?

%s
*constraints2?
?Time (s): cpu = 00:00:00.80 ; elapsed = 00:00:00.52 . Memory (MB): peak = 2907.555 ; gain = 0.000 ; free physical = 667 ; free virtual = 247492default:defaulth px? 
\
GPhase 4 Post Placement Optimization and Clean-Up | Checksum: 115074309
*commonh px? 
?

%s
*constraints2?
?Time (s): cpu = 00:00:00.80 ; elapsed = 00:00:00.52 . Memory (MB): peak = 2907.555 ; gain = 0.000 ; free physical = 667 ; free virtual = 247492default:defaulth px? 
>
)Ending Placer Task | Checksum: 105a7111a
*commonh px? 
?

%s
*constraints2?
?Time (s): cpu = 00:00:00.80 ; elapsed = 00:00:00.52 . Memory (MB): peak = 2907.555 ; gain = 0.000 ; free physical = 667 ; free virtual = 247492default:defaulth px? 
Z
Releasing license: %s
83*common2"
Implementation2default:defaultZ17-83h px? 
?
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
432default:default2
12default:default2
02default:default2
02default:defaultZ4-41h px? 
^
%s completed successfully
29*	vivadotcl2 
place_design2default:defaultZ4-42h px? 
H
&Writing timing data to binary archive.266*timingZ38-480h px? 
D
Writing placer database...
1603*designutilsZ20-1893h px? 
=
Writing XDEF routing.
211*designutilsZ20-211h px? 
J
#Writing XDEF routing logical nets.
209*designutilsZ20-209h px? 
J
#Writing XDEF routing special nets.
210*designutilsZ20-210h px? 
?
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2)
Write XDEF Complete: 2default:default2
00:00:00.102default:default2
00:00:00.032default:default2
2907.5552default:default2
0.0002default:default2
6812default:default2
247652default:defaultZ17-722h px? 
?
 The %s '%s' has been generated.
621*common2

checkpoint2default:default2?
?/run/media/ondra/enc/Sync/BPC-EKT2L/BPC-DE1/projekt/Digital-Electronics-1-project/exercise_bike_console/exercise_bike_console.runs/impl_1/top_placed.dcp2default:defaultZ17-1381h px? 
^
%s4*runtcl2B
.Executing : report_io -file top_io_placed.rpt
2default:defaulth px? 
?
?report_io: Time (s): cpu = 00:00:00.06 ; elapsed = 00:00:00.13 . Memory (MB): peak = 2907.555 ; gain = 0.000 ; free physical = 675 ; free virtual = 24757
*commonh px? 
?
%s4*runtcl2r
^Executing : report_utilization -file top_utilization_placed.rpt -pb top_utilization_placed.pb
2default:defaulth px? 
{
%s4*runtcl2_
KExecuting : report_control_sets -verbose -file top_control_sets_placed.rpt
2default:defaulth px? 
?
?report_control_sets: Time (s): cpu = 00:00:00.01 ; elapsed = 00:00:00.05 . Memory (MB): peak = 2907.555 ; gain = 0.000 ; free physical = 679 ; free virtual = 24761
*commonh px? 


End Record