EESchema Schematic File Version 2
LIBS:power
LIBS:device
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
LIBS:iwasz-kicad
LIBS:robot1-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 3 5
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L CP C15
U 1 1 5723EAD0
P 8175 3300
F 0 "C15" H 8200 3400 50  0000 L CNN
F 1 "10µF" H 8200 3200 50  0000 L CNN
F 2 "w_smd_cap:c_tant_B" H 8213 3150 30  0001 C CNN
F 3 "" H 8175 3300 60  0000 C CNN
	1    8175 3300
	1    0    0    -1  
$EndComp
Wire Wire Line
	8050 3025 8350 3025
Wire Wire Line
	8175 3025 8175 3150
$Comp
L MCP73833 U3
U 1 1 5723EAD1
P 5450 3525
F 0 "U3" H 5500 3625 60  0000 C CNN
F 1 "MCP73833" V 5400 3525 60  0000 C CNN
F 2 "ref-packages:MSOP10" H 5500 3575 60  0001 C CNN
F 3 "http://pl.farnell.com/microchip/mcp73833-fci-un/ic-charge-control-li-ion-1a-msop/dp/1605576" H 5500 3575 60  0001 C CNN
	1    5450 3525
	1    0    0    -1  
$EndComp
$Comp
L CP C14
U 1 1 5723EAD2
P 7225 3300
F 0 "C14" H 7343 3346 50  0000 L CNN
F 1 "10µF" H 7343 3254 50  0000 L CNN
F 2 "w_smd_cap:c_tant_B" H 7263 3150 30  0001 C CNN
F 3 "" H 7225 3300 60  0000 C CNN
	1    7225 3300
	1    0    0    -1  
$EndComp
Wire Wire Line
	3225 3325 4850 3325
$Comp
L CP C13
U 1 1 5723EAD3
P 3400 3600
F 0 "C13" H 3518 3646 50  0000 L CNN
F 1 "10µF" H 3518 3554 50  0000 L CNN
F 2 "w_smd_cap:c_tant_B" H 3438 3450 30  0001 C CNN
F 3 "" H 3400 3600 60  0000 C CNN
	1    3400 3600
	1    0    0    -1  
$EndComp
Wire Wire Line
	3400 3325 3400 3450
$Comp
L +5V #PWR22
U 1 1 5723EAD4
P 3225 3325
F 0 "#PWR22" H 3225 3175 50  0001 C CNN
F 1 "+5V" H 3225 3465 50  0000 C CNN
F 2 "" H 3225 3325 60  0000 C CNN
F 3 "" H 3225 3325 60  0000 C CNN
	1    3225 3325
	0    -1   -1   0   
$EndComp
Connection ~ 3400 3325
$Comp
L GND #PWR23
U 1 1 5723EAD5
P 3400 3825
F 0 "#PWR23" H 3400 3575 50  0001 C CNN
F 1 "GND" H 3400 3675 50  0000 C CNN
F 2 "" H 3400 3825 60  0000 C CNN
F 3 "" H 3400 3825 60  0000 C CNN
	1    3400 3825
	1    0    0    -1  
$EndComp
Wire Wire Line
	3400 3750 3400 3825
Wire Wire Line
	4675 3425 4850 3425
Wire Wire Line
	4675 2700 4675 3425
Connection ~ 4675 3325
Wire Wire Line
	4175 3525 4850 3525
Wire Wire Line
	4175 3625 4850 3625
$Comp
L GND #PWR24
U 1 1 5723EAD6
P 4775 4125
F 0 "#PWR24" H 4775 3875 50  0001 C CNN
F 1 "GND" H 4775 3975 50  0000 C CNN
F 2 "" H 4775 4125 60  0000 C CNN
F 3 "" H 4775 4125 60  0000 C CNN
	1    4775 4125
	1    0    0    -1  
$EndComp
Wire Wire Line
	4850 3725 4775 3725
Wire Wire Line
	4775 3725 4775 4125
$Comp
L GND #PWR27
U 1 1 5723EAD7
P 7750 3750
F 0 "#PWR27" H 7750 3500 50  0001 C CNN
F 1 "GND" H 7750 3600 50  0000 C CNN
F 2 "" H 7750 3750 60  0000 C CNN
F 3 "" H 7750 3750 60  0000 C CNN
	1    7750 3750
	1    0    0    -1  
$EndComp
Wire Wire Line
	7225 3450 7225 3525
Wire Wire Line
	7225 3525 8175 3525
Wire Wire Line
	8175 3525 8175 3450
Wire Wire Line
	7750 3325 7750 3750
Connection ~ 7750 3525
$Comp
L +3V3 #PWR28
U 1 1 5723EAD8
P 8350 3025
F 0 "#PWR28" H 8350 2875 50  0001 C CNN
F 1 "+3V3" H 8350 3165 50  0000 C CNN
F 2 "" H 8350 3025 60  0000 C CNN
F 3 "" H 8350 3025 60  0000 C CNN
	1    8350 3025
	0    1    1    0   
$EndComp
Connection ~ 8175 3025
$Comp
L R R12
U 1 1 5723EAD9
P 5450 3950
F 0 "R12" V 5530 3950 50  0000 C CNN
F 1 "3k3" V 5450 3950 50  0000 C CNN
F 2 "w_smd_resistors:r_0603" V 5380 3950 30  0001 C CNN
F 3 "" H 5450 3950 30  0000 C CNN
	1    5450 3950
	0    1    1    0   
$EndComp
Wire Wire Line
	6000 3725 6050 3725
Wire Wire Line
	6050 3725 6050 3950
Wire Wire Line
	6050 3950 5600 3950
Wire Wire Line
	4775 3950 5300 3950
Connection ~ 4775 3950
Text Notes 5300 4150 0    60   ~ 0
300mA
$Comp
L CONN_01X03 P3
U 1 1 5723EADA
P 6750 3425
F 0 "P3" V 6715 3231 50  0000 R CNN
F 1 "CONN_01X03" V 6623 3231 50  0000 R CNN
F 2 "w_pin_strip:pin_strip_3" H 6750 3425 60  0001 C CNN
F 3 "" H 6750 3425 60  0000 C CNN
	1    6750 3425
	1    0    0    -1  
$EndComp
Wire Wire Line
	6125 3425 6000 3425
Connection ~ 6125 3325
$Comp
L GND #PWR26
U 1 1 5723EADB
P 6550 3575
F 0 "#PWR26" H 6550 3325 50  0001 C CNN
F 1 "GND" H 6644 3538 50  0000 L CNN
F 2 "" H 6550 3575 60  0000 C CNN
F 3 "" H 6550 3575 60  0000 C CNN
	1    6550 3575
	1    0    0    -1  
$EndComp
Wire Wire Line
	6300 3525 6000 3525
Connection ~ 7225 3025
Wire Wire Line
	6125 2950 6125 3125
Wire Wire Line
	6125 3225 6125 3425
Wire Wire Line
	6300 3425 6300 3525
Wire Wire Line
	5600 3025 7450 3025
Wire Wire Line
	6550 3575 6550 3525
$Comp
L AP111733 U4
U 1 1 57241BB2
P 7750 3025
F 0 "U4" H 7750 3392 50  0000 C CNN
F 1 "AP111733" H 7750 3301 50  0000 C CNN
F 2 "linear:SOT223" H 7750 2675 50  0001 C CNN
F 3 "" H 7850 2775 50  0000 C CNN
	1    7750 3025
	1    0    0    -1  
$EndComp
Wire Wire Line
	7225 2700 7225 3150
NoConn ~ 6000 3625
Wire Wire Line
	6300 3425 6550 3425
$Comp
L D_Schottky D5
U 1 1 5724AD72
P 6400 2700
F 0 "D5" H 6400 2484 50  0000 C CNN
F 1 "D_Schottky" H 6400 2575 50  0000 C CNN
F 2 "iwasz:sod123-pins21" H 6400 2700 50  0001 C CNN
F 3 "http://pl.farnell.com/multicomp/1n4148ws/diode-h-speed-100v-0-15a-sod323/dp/1466524" H 6400 2700 50  0001 C CNN
	1    6400 2700
	-1   0    0    1   
$EndComp
Wire Wire Line
	4675 2700 6250 2700
Wire Wire Line
	6550 2700 7225 2700
Connection ~ 6125 3025
Text HLabel 4175 3525 0    60   Output ~ 0
progress
Text HLabel 4175 3625 0    60   Output ~ 0
complete
Text HLabel 5600 3025 0    60   Output ~ 0
sense
$Comp
L +BATT #PWR25
U 1 1 572542F4
P 6125 2950
F 0 "#PWR25" H 6125 2800 50  0001 C CNN
F 1 "+BATT" H 6140 3123 50  0000 C CNN
F 2 "" H 6125 2950 50  0000 C CNN
F 3 "" H 6125 2950 50  0000 C CNN
	1    6125 2950
	1    0    0    -1  
$EndComp
Text Notes 5475 2425 0    60   ~ 0
TODO nie wlutowywać tego na początek, bo\nzapomniałem jak to ma działać. IMHO to powinno\ndziałać ok także bez tej diody.
$Comp
L CONN_01X02 P10
U 1 1 577EA8A3
P 6350 3175
F 0 "P10" H 6428 3216 50  0000 L CNN
F 1 "CONN_01X02" H 6428 3125 50  0000 L CNN
F 2 "w_pin_strip:pin_strip_2" V 6178 3037 50  0001 R CNN
F 3 "" H 6350 3175 50  0000 C CNN
	1    6350 3175
	1    0    0    -1  
$EndComp
Wire Wire Line
	6000 3325 6550 3325
Wire Wire Line
	6125 3125 6150 3125
Wire Wire Line
	6125 3225 6150 3225
$EndSCHEMATC
