
�
Command: %s
1870*	planAhead2�
�read_checkpoint -auto_incremental -incremental D:/sem2/PSN/proiect/finalProiect/test/test.srcs/utils_1/imports/synth_1/afis_buton.dcp2default:defaultZ12-2866h px� 
�
;Read reference checkpoint from %s for incremental synthesis3154*	planAhead2j
VD:/sem2/PSN/proiect/finalProiect/test/test.srcs/utils_1/imports/synth_1/afis_buton.dcp2default:defaultZ12-5825h px� 
T
-Please ensure there are no constraint changes3725*	planAheadZ12-7989h px� 
w
Command: %s
53*	vivadotcl2F
2synth_design -top afis_buton -part xc7a35tcpg236-12default:defaultZ4-113h px� 
:
Starting synth_design
149*	vivadotclZ4-321h px� 
�
@Attempting to get a license for feature '%s' and/or device '%s'
308*common2
	Synthesis2default:default2
xc7a35t2default:defaultZ17-347h px� 
�
0Got license for feature '%s' and/or device '%s'
310*common2
	Synthesis2default:default2
xc7a35t2default:defaultZ17-349h px� 
V
Loading part %s157*device2#
xc7a35tcpg236-12default:defaultZ21-403h px� 
�
[Reference run did not run incremental synthesis because %s; reverting to default synthesis
2138*designutils2+
the design is too small2default:defaultZ20-4072h px� 
�
�Flow is switching to default flow due to incremental criteria not met. If you would like to alter this behaviour and have the flow terminate instead, please set the following parameter config_implementation {autoIncr.Synth.RejectBehavior Terminate}2229*designutilsZ20-4379h px� 
�
HMultithreading enabled for synth_design using a maximum of %s processes.4828*oasys2
22default:defaultZ8-7079h px� 
a
?Launching helper process for spawning children vivado processes4827*oasysZ8-7078h px� 
`
#Helper process launched with PID %s4824*oasys2
125202default:defaultZ8-7075h px� 
�
%s*synth2�
wStarting RTL Elaboration : Time (s): cpu = 00:00:05 ; elapsed = 00:00:04 . Memory (MB): peak = 1250.434 ; gain = 0.000
2default:defaulth px� 
�
synthesizing module '%s'638*oasys2

afis_buton2default:default2b
LD:/sem2/PSN/proiect/finalProiect/test/test.srcs/sources_1/new/afis_buton.vhd2default:default2
212default:default8@Z8-638h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2"
debouncer_afis2default:default2d
PD:/sem2/PSN/proiect/finalProiect/test/test.srcs/sources_1/new/debouncer_afis.vhd2default:default2
52default:default2
buton_adcif2default:default2"
debouncer_afis2default:default2b
LD:/sem2/PSN/proiect/finalProiect/test/test.srcs/sources_1/new/afis_buton.vhd2default:default2
682default:default8@Z8-3491h px� 
�
synthesizing module '%s'638*oasys2"
debouncer_afis2default:default2f
PD:/sem2/PSN/proiect/finalProiect/test/test.srcs/sources_1/new/debouncer_afis.vhd2default:default2
112default:default8@Z8-638h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2

counter16b2default:default2`
LD:/sem2/PSN/proiect/finalProiect/test/test.srcs/sources_1/new/counter16b.vhd2default:default2
62default:default2
p12default:default2

counter16b2default:default2f
PD:/sem2/PSN/proiect/finalProiect/test/test.srcs/sources_1/new/debouncer_afis.vhd2default:default2
342default:default8@Z8-3491h px� 
�
synthesizing module '%s'638*oasys2

counter16b2default:default2b
LD:/sem2/PSN/proiect/finalProiect/test/test.srcs/sources_1/new/counter16b.vhd2default:default2
122default:default8@Z8-638h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2

counter16b2default:default2
12default:default2
12default:default2b
LD:/sem2/PSN/proiect/finalProiect/test/test.srcs/sources_1/new/counter16b.vhd2default:default2
122default:default8@Z8-256h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
bistD_en2default:default2^
JD:/sem2/PSN/proiect/finalProiect/test/test.srcs/sources_1/new/bistD_en.vhd2default:default2
52default:default2
p22default:default2
bistD_en2default:default2f
PD:/sem2/PSN/proiect/finalProiect/test/test.srcs/sources_1/new/debouncer_afis.vhd2default:default2
362default:default8@Z8-3491h px� 
�
synthesizing module '%s'638*oasys2
bistD_en2default:default2`
JD:/sem2/PSN/proiect/finalProiect/test/test.srcs/sources_1/new/bistD_en.vhd2default:default2
102default:default8@Z8-638h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2
bistD_en2default:default2
22default:default2
12default:default2`
JD:/sem2/PSN/proiect/finalProiect/test/test.srcs/sources_1/new/bistD_en.vhd2default:default2
102default:default8@Z8-256h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
bistD2default:default2[
GD:/sem2/PSN/proiect/finalProiect/test/test.srcs/sources_1/new/bistD.vhd2default:default2
52default:default2
p32default:default2
bistD2default:default2f
PD:/sem2/PSN/proiect/finalProiect/test/test.srcs/sources_1/new/debouncer_afis.vhd2default:default2
372default:default8@Z8-3491h px� 
�
synthesizing module '%s'638*oasys2
bistD2default:default2]
GD:/sem2/PSN/proiect/finalProiect/test/test.srcs/sources_1/new/bistD.vhd2default:default2
102default:default8@Z8-638h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2
bistD2default:default2
32default:default2
12default:default2]
GD:/sem2/PSN/proiect/finalProiect/test/test.srcs/sources_1/new/bistD.vhd2default:default2
102default:default8@Z8-256h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
bistD2default:default2[
GD:/sem2/PSN/proiect/finalProiect/test/test.srcs/sources_1/new/bistD.vhd2default:default2
52default:default2
p42default:default2
bistD2default:default2f
PD:/sem2/PSN/proiect/finalProiect/test/test.srcs/sources_1/new/debouncer_afis.vhd2default:default2
382default:default8@Z8-3491h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2"
debouncer_afis2default:default2
42default:default2
12default:default2f
PD:/sem2/PSN/proiect/finalProiect/test/test.srcs/sources_1/new/debouncer_afis.vhd2default:default2
112default:default8@Z8-256h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2"
debouncer_afis2default:default2d
PD:/sem2/PSN/proiect/finalProiect/test/test.srcs/sources_1/new/debouncer_afis.vhd2default:default2
52default:default2
buton_reset2default:default2"
debouncer_afis2default:default2b
LD:/sem2/PSN/proiect/finalProiect/test/test.srcs/sources_1/new/afis_buton.vhd2default:default2
692default:default8@Z8-3491h px� 
�
Esignal '%s' is read in the process but is not in the sensitivity list614*oasys2
en_reset2default:default2b
LD:/sem2/PSN/proiect/finalProiect/test/test.srcs/sources_1/new/afis_buton.vhd2default:default2
712default:default8@Z8-614h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
	numarator2default:default2_
KD:/sem2/PSN/proiect/finalProiect/test/test.srcs/sources_1/new/numarator.vhd2default:default2
62default:default2
p12default:default2
	numarator2default:default2b
LD:/sem2/PSN/proiect/finalProiect/test/test.srcs/sources_1/new/afis_buton.vhd2default:default2
882default:default8@Z8-3491h px� 
�
synthesizing module '%s'638*oasys2
	numarator2default:default2a
KD:/sem2/PSN/proiect/finalProiect/test/test.srcs/sources_1/new/numarator.vhd2default:default2
172default:default8@Z8-638h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2"
debouncer_afis2default:default2d
PD:/sem2/PSN/proiect/finalProiect/test/test.srcs/sources_1/new/debouncer_afis.vhd2default:default2
52default:default2
buton12default:default2"
debouncer_afis2default:default2a
KD:/sem2/PSN/proiect/finalProiect/test/test.srcs/sources_1/new/numarator.vhd2default:default2
322default:default8@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2"
debouncer_afis2default:default2d
PD:/sem2/PSN/proiect/finalProiect/test/test.srcs/sources_1/new/debouncer_afis.vhd2default:default2
52default:default2
buton22default:default2"
debouncer_afis2default:default2a
KD:/sem2/PSN/proiect/finalProiect/test/test.srcs/sources_1/new/numarator.vhd2default:default2
332default:default8@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2"
debouncer_afis2default:default2d
PD:/sem2/PSN/proiect/finalProiect/test/test.srcs/sources_1/new/debouncer_afis.vhd2default:default2
52default:default2
button32default:default2"
debouncer_afis2default:default2a
KD:/sem2/PSN/proiect/finalProiect/test/test.srcs/sources_1/new/numarator.vhd2default:default2
342default:default8@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2"
debouncer_afis2default:default2d
PD:/sem2/PSN/proiect/finalProiect/test/test.srcs/sources_1/new/debouncer_afis.vhd2default:default2
52default:default2
button42default:default2"
debouncer_afis2default:default2a
KD:/sem2/PSN/proiect/finalProiect/test/test.srcs/sources_1/new/numarator.vhd2default:default2
352default:default8@Z8-3491h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2
	numarator2default:default2
52default:default2
12default:default2a
KD:/sem2/PSN/proiect/finalProiect/test/test.srcs/sources_1/new/numarator.vhd2default:default2
172default:default8@Z8-256h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2 
registru_12B2default:default2b
ND:/sem2/PSN/proiect/finalProiect/test/test.srcs/sources_1/new/registru_12B.vhd2default:default2
62default:default2
p22default:default2 
registru_12B2default:default2b
LD:/sem2/PSN/proiect/finalProiect/test/test.srcs/sources_1/new/afis_buton.vhd2default:default2
892default:default8@Z8-3491h px� 
�
synthesizing module '%s'638*oasys2 
registru_12B2default:default2d
ND:/sem2/PSN/proiect/finalProiect/test/test.srcs/sources_1/new/registru_12B.vhd2default:default2
152default:default8@Z8-638h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2"
debouncer_afis2default:default2d
PD:/sem2/PSN/proiect/finalProiect/test/test.srcs/sources_1/new/debouncer_afis.vhd2default:default2
52default:default2
resetare2default:default2"
debouncer_afis2default:default2d
ND:/sem2/PSN/proiect/finalProiect/test/test.srcs/sources_1/new/registru_12B.vhd2default:default2
232default:default8@Z8-3491h px� 
�
Esignal '%s' is read in the process but is not in the sensitivity list614*oasys2
en_reset2default:default2d
ND:/sem2/PSN/proiect/finalProiect/test/test.srcs/sources_1/new/registru_12B.vhd2default:default2
242default:default8@Z8-614h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2 
registru_12B2default:default2
62default:default2
12default:default2d
ND:/sem2/PSN/proiect/finalProiect/test/test.srcs/sources_1/new/registru_12B.vhd2default:default2
152default:default8@Z8-256h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
afis_ssd2default:default2^
JD:/sem2/PSN/proiect/finalProiect/test/test.srcs/sources_1/new/afis_ssd.vhd2default:default2
42default:default2
p32default:default2
afis_ssd2default:default2b
LD:/sem2/PSN/proiect/finalProiect/test/test.srcs/sources_1/new/afis_buton.vhd2default:default2
902default:default8@Z8-3491h px� 
�
synthesizing module '%s'638*oasys2
afis_ssd2default:default2`
JD:/sem2/PSN/proiect/finalProiect/test/test.srcs/sources_1/new/afis_ssd.vhd2default:default2
162default:default8@Z8-638h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2

counter16b2default:default2`
LD:/sem2/PSN/proiect/finalProiect/test/test.srcs/sources_1/new/counter16b.vhd2default:default2
62default:default2
p12default:default2

counter16b2default:default2`
JD:/sem2/PSN/proiect/finalProiect/test/test.srcs/sources_1/new/afis_ssd.vhd2default:default2
272default:default8@Z8-3491h px� 
�
default block is never used226*oasys2`
JD:/sem2/PSN/proiect/finalProiect/test/test.srcs/sources_1/new/afis_ssd.vhd2default:default2
422default:default8@Z8-226h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2
afis_ssd2default:default2
72default:default2
12default:default2`
JD:/sem2/PSN/proiect/finalProiect/test/test.srcs/sources_1/new/afis_ssd.vhd2default:default2
162default:default8@Z8-256h px� 
�
Esignal '%s' is read in the process but is not in the sensitivity list614*oasys2
en_reset2default:default2b
LD:/sem2/PSN/proiect/finalProiect/test/test.srcs/sources_1/new/afis_buton.vhd2default:default2
922default:default8@Z8-614h px� 
�
Esignal '%s' is read in the process but is not in the sensitivity list614*oasys2'
caractere_distincte2default:default2b
LD:/sem2/PSN/proiect/finalProiect/test/test.srcs/sources_1/new/afis_buton.vhd2default:default2
922default:default8@Z8-614h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2

afis_buton2default:default2
82default:default2
12default:default2b
LD:/sem2/PSN/proiect/finalProiect/test/test.srcs/sources_1/new/afis_buton.vhd2default:default2
212default:default8@Z8-256h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2

nr_anod[1]2default:default2
afis_ssd2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2

nr_anod[0]2default:default2
afis_ssd2default:defaultZ8-7129h px� 
�
%s*synth2�
wFinished RTL Elaboration : Time (s): cpu = 00:00:06 ; elapsed = 00:00:05 . Memory (MB): peak = 1250.434 ; gain = 0.000
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
M
%s
*synth25
!Start Handling Custom Attributes
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Handling Custom Attributes : Time (s): cpu = 00:00:06 ; elapsed = 00:00:06 . Memory (MB): peak = 1250.434 ; gain = 0.000
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished RTL Optimization Phase 1 : Time (s): cpu = 00:00:06 ; elapsed = 00:00:06 . Memory (MB): peak = 1250.434 ; gain = 0.000
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2 
00:00:00.0032default:default2
1250.4342default:default2
0.0002default:defaultZ17-268h px� 
K
)Preparing netlist for logic optimization
349*projectZ1-570h px� 
>

Processing XDC Constraints
244*projectZ1-262h px� 
=
Initializing timing engine
348*projectZ1-569h px� 
�
Parsing XDC File [%s]
179*designutils2^
HD:/sem2/PSN/proiect/finalProiect/test/test.srcs/constrs_1/new/constr.xdc2default:default8Z20-179h px� 
�
Finished Parsing XDC File [%s]
178*designutils2^
HD:/sem2/PSN/proiect/finalProiect/test/test.srcs/constrs_1/new/constr.xdc2default:default8Z20-178h px� 
�
�Implementation specific constraints were found while reading constraint file [%s]. These constraints will be ignored for synthesis but will be used in implementation. Impacted constraints are listed in the file [%s].
233*project2\
HD:/sem2/PSN/proiect/finalProiect/test/test.srcs/constrs_1/new/constr.xdc2default:default20
.Xil/afis_buton_propImpl.xdc2default:defaultZ1-236h px� 
H
&Completed Processing XDC Constraints

245*projectZ1-263h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2
00:00:002default:default2
1250.4342default:default2
0.0002default:defaultZ17-268h px� 
~
!Unisim Transformation Summary:
%s111*project29
%No Unisim elements were transformed.
2default:defaultZ1-111h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common24
 Constraint Validation Runtime : 2default:default2
00:00:002default:default2 
00:00:00.0022default:default2
1250.4342default:default2
0.0002default:defaultZ17-268h px� 
�
[Reference run did not run incremental synthesis because %s; reverting to default synthesis
2138*designutils2+
the design is too small2default:defaultZ20-4072h px� 
�
�Flow is switching to default flow due to incremental criteria not met. If you would like to alter this behaviour and have the flow terminate instead, please set the following parameter config_implementation {autoIncr.Synth.RejectBehavior Terminate}2229*designutilsZ20-4379h px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
}Finished Constraint Validation : Time (s): cpu = 00:00:12 ; elapsed = 00:00:12 . Memory (MB): peak = 1250.434 ; gain = 0.000
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
V
%s
*synth2>
*Start Loading Part and Timing Information
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
J
%s
*synth22
Loading part: xc7a35tcpg236-1
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Loading Part and Timing Information : Time (s): cpu = 00:00:12 ; elapsed = 00:00:12 . Memory (MB): peak = 1250.434 ; gain = 0.000
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
Z
%s
*synth2B
.Start Applying 'set_property' XDC Constraints
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished applying 'set_property' XDC Constraints : Time (s): cpu = 00:00:12 ; elapsed = 00:00:12 . Memory (MB): peak = 1250.434 ; gain = 0.000
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished RTL Optimization Phase 2 : Time (s): cpu = 00:00:12 ; elapsed = 00:00:12 . Memory (MB): peak = 1250.434 ; gain = 0.000
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
L
%s
*synth24
 Start RTL Component Statistics 
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
K
%s
*synth23
Detailed RTL Component Info : 
2default:defaulth p
x
� 
:
%s
*synth2"
+---Adders : 
2default:defaulth p
x
� 
X
%s
*synth2@
,	   3 Input    4 Bit       Adders := 1     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input    4 Bit       Adders := 1     
2default:defaulth p
x
� 
=
%s
*synth2%
+---Registers : 
2default:defaulth p
x
� 
Z
%s
*synth2B
.	               12 Bit    Registers := 3     
2default:defaulth p
x
� 
Z
%s
*synth2B
.	                4 Bit    Registers := 3     
2default:defaulth p
x
� 
Z
%s
*synth2B
.	                1 Bit    Registers := 23    
2default:defaulth p
x
� 
9
%s
*synth2!
+---Muxes : 
2default:defaulth p
x
� 
X
%s
*synth2@
,	   4 Input   12 Bit        Muxes := 1     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   4 Input    4 Bit        Muxes := 2     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input    4 Bit        Muxes := 2     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   3 Input    4 Bit        Muxes := 1     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   4 Input    1 Bit        Muxes := 1     
2default:defaulth p
x
� 
X
%s
*synth2@
,	  10 Input    1 Bit        Muxes := 3     
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
O
%s
*synth27
#Finished RTL Component Statistics 
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
H
%s
*synth20
Start Part Resource Summary
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s
*synth2j
VPart Resources:
DSPs: 90 (col length:60)
BRAMs: 100 (col length: RAMB18 60 RAMB36 30)
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
K
%s
*synth23
Finished Part Resource Summary
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
W
%s
*synth2?
+Start Cross Boundary and Area Optimization
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
H
&Parallel synthesis criteria is not met4829*oasysZ8-7080h px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Cross Boundary and Area Optimization : Time (s): cpu = 00:00:14 ; elapsed = 00:00:14 . Memory (MB): peak = 1250.434 ; gain = 0.000
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
R
%s
*synth2:
&Start Applying XDC Timing Constraints
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Applying XDC Timing Constraints : Time (s): cpu = 00:00:19 ; elapsed = 00:00:19 . Memory (MB): peak = 1250.434 ; gain = 0.000
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
F
%s
*synth2.
Start Timing Optimization
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
{Finished Timing Optimization : Time (s): cpu = 00:00:19 ; elapsed = 00:00:19 . Memory (MB): peak = 1250.434 ; gain = 0.000
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
E
%s
*synth2-
Start Technology Mapping
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
zFinished Technology Mapping : Time (s): cpu = 00:00:19 ; elapsed = 00:00:19 . Memory (MB): peak = 1250.434 ; gain = 0.000
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
?
%s
*synth2'
Start IO Insertion
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
Q
%s
*synth29
%Start Flattening Before IO Insertion
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
T
%s
*synth2<
(Finished Flattening Before IO Insertion
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
H
%s
*synth20
Start Final Netlist Cleanup
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
K
%s
*synth23
Finished Final Netlist Cleanup
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
tFinished IO Insertion : Time (s): cpu = 00:00:23 ; elapsed = 00:00:23 . Memory (MB): peak = 1250.434 ; gain = 0.000
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
O
%s
*synth27
#Start Renaming Generated Instances
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Renaming Generated Instances : Time (s): cpu = 00:00:23 ; elapsed = 00:00:23 . Memory (MB): peak = 1250.434 ; gain = 0.000
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
L
%s
*synth24
 Start Rebuilding User Hierarchy
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Rebuilding User Hierarchy : Time (s): cpu = 00:00:23 ; elapsed = 00:00:23 . Memory (MB): peak = 1250.434 ; gain = 0.000
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
K
%s
*synth23
Start Renaming Generated Ports
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Renaming Generated Ports : Time (s): cpu = 00:00:23 ; elapsed = 00:00:23 . Memory (MB): peak = 1250.434 ; gain = 0.000
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
M
%s
*synth25
!Start Handling Custom Attributes
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Handling Custom Attributes : Time (s): cpu = 00:00:23 ; elapsed = 00:00:23 . Memory (MB): peak = 1250.434 ; gain = 0.000
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
J
%s
*synth22
Start Renaming Generated Nets
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
Finished Renaming Generated Nets : Time (s): cpu = 00:00:23 ; elapsed = 00:00:23 . Memory (MB): peak = 1250.434 ; gain = 0.000
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
K
%s
*synth23
Start Writing Synthesis Report
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
A
%s
*synth2)

Report BlackBoxes: 
2default:defaulth p
x
� 
J
%s
*synth22
+-+--------------+----------+
2default:defaulth p
x
� 
J
%s
*synth22
| |BlackBox name |Instances |
2default:defaulth p
x
� 
J
%s
*synth22
+-+--------------+----------+
2default:defaulth p
x
� 
J
%s
*synth22
+-+--------------+----------+
2default:defaulth p
x
� 
A
%s*synth2)

Report Cell Usage: 
2default:defaulth px� 
D
%s*synth2,
+------+-------+------+
2default:defaulth px� 
D
%s*synth2,
|      |Cell   |Count |
2default:defaulth px� 
D
%s*synth2,
+------+-------+------+
2default:defaulth px� 
D
%s*synth2,
|1     |BUFG   |     1|
2default:defaulth px� 
D
%s*synth2,
|2     |CARRY4 |     5|
2default:defaulth px� 
D
%s*synth2,
|3     |LUT1   |     2|
2default:defaulth px� 
D
%s*synth2,
|4     |LUT2   |     5|
2default:defaulth px� 
D
%s*synth2,
|5     |LUT3   |     3|
2default:defaulth px� 
D
%s*synth2,
|6     |LUT4   |    17|
2default:defaulth px� 
D
%s*synth2,
|7     |LUT5   |     9|
2default:defaulth px� 
D
%s*synth2,
|8     |LUT6   |    21|
2default:defaulth px� 
D
%s*synth2,
|9     |FDCE   |    18|
2default:defaulth px� 
D
%s*synth2,
|10    |FDPE   |     2|
2default:defaulth px� 
D
%s*synth2,
|11    |FDRE   |    61|
2default:defaulth px� 
D
%s*synth2,
|12    |FDSE   |     2|
2default:defaulth px� 
D
%s*synth2,
|13    |LDC    |     1|
2default:defaulth px� 
D
%s*synth2,
|14    |IBUF   |     5|
2default:defaulth px� 
D
%s*synth2,
|15    |OBUF   |    14|
2default:defaulth px� 
D
%s*synth2,
+------+-------+------+
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Writing Synthesis Report : Time (s): cpu = 00:00:23 ; elapsed = 00:00:23 . Memory (MB): peak = 1250.434 ; gain = 0.000
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
r
%s
*synth2Z
FSynthesis finished with 0 errors, 0 critical warnings and 1 warnings.
2default:defaulth p
x
� 
�
%s
*synth2�
}Synthesis Optimization Runtime : Time (s): cpu = 00:00:15 ; elapsed = 00:00:22 . Memory (MB): peak = 1250.434 ; gain = 0.000
2default:defaulth p
x
� 
�
%s
*synth2�
~Synthesis Optimization Complete : Time (s): cpu = 00:00:23 ; elapsed = 00:00:23 . Memory (MB): peak = 1250.434 ; gain = 0.000
2default:defaulth p
x
� 
B
 Translating synthesized netlist
350*projectZ1-571h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2 
00:00:00.0022default:default2
1250.4342default:default2
0.0002default:defaultZ17-268h px� 
e
-Analyzing %s Unisim elements for replacement
17*netlist2
62default:defaultZ29-17h px� 
j
2Unisim Transformation completed in %s CPU seconds
28*netlist2
02default:defaultZ29-28h px� 
K
)Preparing netlist for logic optimization
349*projectZ1-570h px� 
u
)Pushed %s inverter(s) to %s load pin(s).
98*opt2
02default:default2
02default:defaultZ31-138h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2
00:00:002default:default2
1250.4342default:default2
0.0002default:defaultZ17-268h px� 
�
!Unisim Transformation Summary:
%s111*project2Z
F  A total of 1 instances were transformed.
  LDC => LDCE: 1 instance 
2default:defaultZ1-111h px� 
g
$Synth Design complete, checksum: %s
562*	vivadotcl2
dc0fe2342default:defaultZ4-1430h px� 
U
Releasing license: %s
83*common2
	Synthesis2default:defaultZ17-83h px� 
�
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
512default:default2
92default:default2
02default:default2
02default:defaultZ4-41h px� 
^
%s completed successfully
29*	vivadotcl2 
synth_design2default:defaultZ4-42h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2"
synth_design: 2default:default2
00:00:262default:default2
00:00:272default:default2
1250.4342default:default2
0.0002default:defaultZ17-268h px� 
�
 The %s '%s' has been generated.
621*common2

checkpoint2default:default2Z
FD:/sem2/PSN/proiect/finalProiect/test/test.runs/synth_1/afis_buton.dcp2default:defaultZ17-1381h px� 
�
%s4*runtcl2~
jExecuting : report_utilization -file afis_buton_utilization_synth.rpt -pb afis_buton_utilization_synth.pb
2default:defaulth px� 
�
Exiting %s at %s...
206*common2
Vivado2default:default2,
Tue May 31 12:17:13 20222default:defaultZ17-206h px� 


End Record