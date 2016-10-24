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
Sheet 1 6
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Sheet
S 2475 1975 1075 400 
U 5723E963
F0 "power" 60
F1 "power.sch" 60
F2 "progress" O R 3550 2075 60 
F3 "complete" O R 3550 2175 60 
F4 "sense" O R 3550 2275 60 
$EndSheet
$Sheet
S 8575 -800 1050 1450
U 57253421
F0 "motors" 60
F1 "motors.sch" 60
F2 "aphasel" I L 8575 -700 60 
F3 "aenbll" I L 8575 -600 60 
F4 "bphasel" I L 8575 -500 60 
F5 "benbll" I L 8575 -400 60 
F6 "aphaser" I L 8575 -300 60 
F7 "aenblr" I L 8575 -200 60 
F8 "bphaser" I L 8575 -100 60 
F9 "benblr" I L 8575 0   60 
F10 "sda" B L 8575 100 60 
F11 "photo_l_int" O L 8575 400 60 
F12 "scl" I L 8575 200 60 
F13 "photo_r_int" O L 8575 300 60 
F14 "photo_illumination" I L 8575 500 60 
$EndSheet
$Sheet
S 2475 3600 1075 700 
U 5725DB8C
F0 "bluetooth" 60
F1 "bluetooth.sch" 60
F2 "ble_spi_mosi" I R 3550 4200 60 
F3 "ble_spi_clk" I R 3550 4100 60 
F4 "ble_spi_irq" O R 3550 4000 60 
F5 "ble_resetn" I R 3550 3900 60 
F6 "ble_spi_miso" O R 3550 3800 60 
F7 "ble_spi_cs" I R 3550 3700 60 
$EndSheet
Wire Wire Line
	3550 2075 4125 2075
Wire Wire Line
	3550 2175 4125 2175
Wire Wire Line
	3550 2275 4125 2275
$Sheet
S 8575 900  1050 625 
U 57DAAC9B
F0 "peripherals" 60
F1 "peripherals.sch" 60
F2 "ir_cannon" I L 8575 1050 60 
F3 "ir_sense" O L 8575 1150 60 
F4 "led_r" I L 8575 1450 60 
F5 "led_g" I L 8575 1350 60 
F6 "led_b" I L 8575 1250 60 
F7 "sound" I L 8575 950 60 
$EndSheet
$Sheet
S 4125 1975 2450 3775
U 57240139
F0 "micro" 60
F1 "micro.sch" 60
F2 "aphasel" O R 6575 4050 60 
F3 "bphasel" O R 6575 4150 60 
F4 "aphaser" O R 6575 3750 60 
F5 "bphaser" O R 6575 3650 60 
F6 "aenbll" O R 6575 4250 60 
F7 "benbll" O R 6575 4350 60 
F8 "aenblr" O R 6575 3550 60 
F9 "benblr" O R 6575 3450 60 
F10 "ble_spi_mosi" O L 4125 4200 60 
F11 "ble_spi_clk" O L 4125 4100 60 
F12 "ble_spi_miso" I L 4125 3800 60 
F13 "ble_spi_irq" I L 4125 4000 60 
F14 "ble_resetn" O L 4125 3900 60 
F15 "ble_spi_cs" O L 4125 3700 60 
F16 "progress" I L 4125 2075 60 
F17 "complete" I L 4125 2175 60 
F18 "sense" I L 4125 2275 60 
F19 "sda" B R 6575 2550 60 
F20 "scl" O R 6575 2450 60 
F21 "photo_r_int" I R 6575 2350 60 
F22 "photo_l_int" I R 6575 2250 60 
F23 "photo_illumination" O R 6575 2150 60 
F24 "ir_cannon" O R 6575 4850 60 
F25 "ir_sense" I R 6575 4950 60 
F26 "led_r" O R 6575 4750 60 
F27 "led_g" O R 6575 4650 60 
F28 "led_b" O R 6575 4550 60 
F29 "sound" O R 6575 2750 60 
F30 "console_rx" I R 6575 5250 60 
F31 "console_tx" O R 6575 5150 60 
F32 "nrst" I R 6575 5050 60 
F33 "swdio" B R 6575 5450 60 
F34 "swdclk" I R 6575 5650 60 
F35 "pb15" B R 6575 2850 60 
F36 "pb14" B R 6575 2950 60 
F37 "pc15" B R 6575 3050 60 
F38 "pc14" B R 6575 3150 60 
F39 "pc13" B R 6575 3250 60 
$EndSheet
$Comp
L R R19
U 1 1 580DE93C
P 7150 5450
F 0 "R19" V 7125 5550 50  0000 L CNN
F 1 "22R" V 7150 5350 50  0000 L CNN
F 2 "w_smd_resistors:r_0402" V 7080 5450 50  0001 C CNN
F 3 "" H 7150 5450 50  0000 C CNN
	1    7150 5450
	0    1    1    0   
$EndComp
$Comp
L R R20
U 1 1 580DE943
P 7150 5650
F 0 "R20" V 7225 5550 50  0000 L CNN
F 1 "22R" V 7150 5550 50  0000 L CNN
F 2 "w_smd_resistors:r_0402" V 7080 5650 50  0001 C CNN
F 3 "" H 7150 5650 50  0000 C CNN
	1    7150 5650
	0    1    1    0   
$EndComp
$Comp
L GND #PWR2
U 1 1 580DE94A
P 6875 5550
F 0 "#PWR2" H 6875 5300 50  0001 C CNN
F 1 "GND" H 6875 5400 50  0000 C CNN
F 2 "" H 6875 5550 60  0000 C CNN
F 3 "" H 6875 5550 60  0000 C CNN
	1    6875 5550
	0    1    1    0   
$EndComp
$Comp
L +3.3V #PWR1
U 1 1 580DE950
P 6875 5350
F 0 "#PWR1" H 6875 5200 50  0001 C CNN
F 1 "+3.3V" H 6875 5490 50  0000 C CNN
F 2 "" H 6875 5350 60  0000 C CNN
F 3 "" H 6875 5350 60  0000 C CNN
	1    6875 5350
	0    -1   -1   0   
$EndComp
Wire Wire Line
	7450 5350 6875 5350
Wire Wire Line
	7450 5450 7300 5450
Wire Wire Line
	7450 5550 6875 5550
Wire Wire Line
	7450 5650 7300 5650
Wire Wire Line
	7000 5650 6575 5650
Wire Wire Line
	7000 5450 6575 5450
$Comp
L +BATT #PWR3
U 1 1 580DE978
P 7350 4450
F 0 "#PWR3" H 7350 4300 50  0001 C CNN
F 1 "+BATT" V 7365 4577 50  0000 L CNN
F 2 "" H 7350 4450 50  0000 C CNN
F 3 "" H 7350 4450 50  0000 C CNN
	1    7350 4450
	0    -1   -1   0   
$EndComp
$Comp
L +5V #PWR4
U 1 1 580DE97E
P 7375 3350
F 0 "#PWR4" H 7375 3200 50  0001 C CNN
F 1 "+5V" H 7375 3490 50  0000 C CNN
F 2 "" H 7375 3350 60  0000 C CNN
F 3 "" H 7375 3350 60  0000 C CNN
	1    7375 3350
	0    -1   -1   0   
$EndComp
$Comp
L CONN_01X17 P12
U 1 1 580DE984
P 7650 4850
F 0 "P12" H 7225 3800 50  0000 L CNN
F 1 "CONN_01X17" H 7200 3900 50  0000 L CNN
F 2 "w_pin_strip:pin_strip_17" H 7650 4850 50  0001 C CNN
F 3 "" H 7650 4850 50  0000 C CNN
	1    7650 4850
	1    0    0    -1  
$EndComp
$Comp
L CONN_01X17 P13
U 1 1 580DE98B
P 7650 2950
F 0 "P13" H 7275 1975 50  0000 L CNN
F 1 "CONN_01X17" H 7225 2050 50  0000 L CNN
F 2 "w_pin_strip:pin_strip_17" H 7650 2950 50  0001 C CNN
F 3 "" H 7650 2950 50  0000 C CNN
	1    7650 2950
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR5
U 1 1 580DE992
P 7150 2650
F 0 "#PWR5" H 7150 2400 50  0001 C CNN
F 1 "GND" H 7150 2500 50  0000 C CNN
F 2 "" H 7150 2650 60  0000 C CNN
F 3 "" H 7150 2650 60  0000 C CNN
	1    7150 2650
	0    1    1    0   
$EndComp
Wire Wire Line
	7450 2650 7150 2650
Wire Wire Line
	7450 3350 7375 3350
Wire Wire Line
	7350 4450 7450 4450
Wire Wire Line
	3550 3700 4125 3700
Wire Wire Line
	4125 3800 3550 3800
Wire Wire Line
	3550 3900 4125 3900
Wire Wire Line
	4125 4000 3550 4000
Wire Wire Line
	3550 4100 4125 4100
Wire Wire Line
	4125 4200 3550 4200
Wire Wire Line
	6575 5050 7450 5050
Wire Wire Line
	6575 5150 7450 5150
Wire Wire Line
	6575 5250 7450 5250
Wire Wire Line
	6575 4050 7450 4050
Wire Wire Line
	7450 4150 6575 4150
Wire Wire Line
	6575 4250 7450 4250
Wire Wire Line
	7450 4350 6575 4350
Wire Wire Line
	7450 4550 6575 4550
Wire Wire Line
	6575 4650 7450 4650
Wire Wire Line
	7450 4750 6575 4750
Wire Wire Line
	6575 4850 7450 4850
Wire Wire Line
	7450 4950 6575 4950
Wire Wire Line
	6575 2150 7450 2150
Wire Wire Line
	7450 2250 6575 2250
Wire Wire Line
	6575 2350 7450 2350
Wire Wire Line
	7450 2450 6575 2450
Wire Wire Line
	6575 2550 7450 2550
Wire Wire Line
	7450 2750 6575 2750
Wire Wire Line
	6575 2850 7450 2850
Wire Wire Line
	7450 2950 6575 2950
Wire Wire Line
	6575 3050 7450 3050
Wire Wire Line
	7450 3150 6575 3150
Wire Wire Line
	7450 3250 6575 3250
Wire Wire Line
	6575 3450 7450 3450
Wire Wire Line
	7450 3550 6575 3550
Wire Wire Line
	6575 3650 7450 3650
Wire Wire Line
	7450 3750 6575 3750
$Comp
L GND #PWR?
U 1 1 5819E3F4
P 8575 5550
F 0 "#PWR?" H 8575 5300 50  0001 C CNN
F 1 "GND" H 8575 5400 50  0000 C CNN
F 2 "" H 8575 5550 60  0000 C CNN
F 3 "" H 8575 5550 60  0000 C CNN
	1    8575 5550
	0    -1   1    0   
$EndComp
$Comp
L +3.3V #PWR?
U 1 1 5819E3FA
P 8575 5350
F 0 "#PWR?" H 8575 5200 50  0001 C CNN
F 1 "+3.3V" H 8575 5490 50  0000 C CNN
F 2 "" H 8575 5350 60  0000 C CNN
F 3 "" H 8575 5350 60  0000 C CNN
	1    8575 5350
	0    1    -1   0   
$EndComp
Wire Wire Line
	8000 5350 8575 5350
Wire Wire Line
	8000 5550 8575 5550
Text HLabel 8000 4250 2    60   Output ~ 0
aenbll
Text HLabel 8000 4350 2    60   Output ~ 0
benbll
Text HLabel 8000 3750 2    60   Output ~ 0
aphaser
Text HLabel 8000 3650 2    60   Output ~ 0
bphaser
Text HLabel 8000 2250 2    60   Input ~ 0
photo_l_int
Text HLabel 8000 2350 2    60   Input ~ 0
photo_r_int
Text HLabel 8000 4050 2    60   Output ~ 0
aphasel
Text HLabel 8000 4150 2    60   Output ~ 0
bphasel
Text HLabel 8000 3450 2    60   Output ~ 0
benblr
Text HLabel 8000 3550 2    60   Output ~ 0
aenblr
Text HLabel 8000 2450 2    60   Output ~ 0
scl
Text HLabel 8000 2550 2    60   BiDi ~ 0
sda
Text HLabel 8000 2150 2    60   Output ~ 0
photo_illumination
$Comp
L +BATT #PWR?
U 1 1 5819E411
P 8100 4450
F 0 "#PWR?" H 8100 4300 50  0001 C CNN
F 1 "+BATT" V 8115 4577 50  0000 L CNN
F 2 "" H 8100 4450 50  0000 C CNN
F 3 "" H 8100 4450 50  0000 C CNN
	1    8100 4450
	0    1    -1   0   
$EndComp
$Comp
L +5V #PWR?
U 1 1 5819E417
P 8075 3350
F 0 "#PWR?" H 8075 3200 50  0001 C CNN
F 1 "+5V" H 8075 3490 50  0000 C CNN
F 2 "" H 8075 3350 60  0000 C CNN
F 3 "" H 8075 3350 60  0000 C CNN
	1    8075 3350
	0    1    -1   0   
$EndComp
Wire Wire Line
	8000 3350 8075 3350
Wire Wire Line
	8100 4450 8000 4450
$Comp
L CONN_01X05 P?
U 1 1 5819E41F
P 7800 4250
F 0 "P?" H 7750 4650 50  0000 L CNN
F 1 "CONN_01X05" H 7375 3950 50  0000 L CNN
F 2 "w_pin_strip:pin_strip_5" H 7800 4250 50  0001 C CNN
F 3 "" H 7800 4250 50  0000 C CNN
	1    7800 4250
	-1   0    0    -1  
$EndComp
$Comp
L CONN_01X05 P?
U 1 1 5819E426
P 7800 5450
F 0 "P?" H 7750 5900 50  0000 L CNN
F 1 "CONN_01X05" H 7375 5800 50  0000 L CNN
F 2 "w_pin_strip:pin_strip_5" H 7800 5450 50  0001 C CNN
F 3 "" H 7800 5450 50  0000 C CNN
	1    7800 5450
	-1   0    0    -1  
$EndComp
$Comp
L CONN_01X05 P?
U 1 1 5819E42D
P 7800 3550
F 0 "P?" H 7800 2475 50  0000 C CNN
F 1 "CONN_01X05" H 7600 3175 50  0000 C CNN
F 2 "w_pin_strip:pin_strip_5" H 7800 3550 50  0001 C CNN
F 3 "" H 7800 3550 50  0000 C CNN
	1    7800 3550
	-1   0    0    -1  
$EndComp
$Comp
L CONN_01X05 P?
U 1 1 5819E434
P 7800 2350
F 0 "P?" H 7719 1925 50  0000 C CNN
F 1 "CONN_01X05" H 7600 2025 50  0000 C CNN
F 2 "w_pin_strip:pin_strip_5" H 7800 2350 50  0001 C CNN
F 3 "" H 7800 2350 50  0000 C CNN
	1    7800 2350
	-1   0    0    -1  
$EndComp
NoConn ~ 8000 5250
NoConn ~ 8000 5450
NoConn ~ 8000 5650
$EndSCHEMATC
