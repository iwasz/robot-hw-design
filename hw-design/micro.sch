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
Sheet 6 6
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
L C C11
U 1 1 5724042C
P 4725 3300
F 0 "C11" H 4750 3400 50  0000 L CNN
F 1 "100nF" H 4750 3200 50  0000 L CNN
F 2 "w_smd_cap:c_0603" H 4763 3150 30  0001 C CNN
F 3 "" H 4725 3300 60  0000 C CNN
F 4 "Decoupling capacitor" H 4725 3300 60  0001 C CNN "Opis"
	1    4725 3300
	-1   0    0    1   
$EndComp
$Comp
L C C12
U 1 1 5724042D
P 4425 3300
F 0 "C12" H 4450 3400 50  0000 L CNN
F 1 "4.7µF" H 4450 3200 50  0000 L CNN
F 2 "w_smd_cap:c_0805" H 4463 3150 30  0001 C CNN
F 3 "" H 4425 3300 60  0000 C CNN
F 4 "Decoupling capacitor" H 4425 3300 60  0001 C CNN "Opis"
	1    4425 3300
	-1   0    0    1   
$EndComp
$Comp
L GND #PWR82
U 1 1 5724042E
P 4425 3025
F 0 "#PWR82" H 4425 2775 50  0001 C CNN
F 1 "GND" H 4425 2875 50  0000 C CNN
F 2 "" H 4425 3025 60  0000 C CNN
F 3 "" H 4425 3025 60  0000 C CNN
	1    4425 3025
	-1   0    0    1   
$EndComp
$Comp
L C C8
U 1 1 5724042F
P 6675 5400
F 0 "C8" H 6700 5500 50  0000 L CNN
F 1 "100nF" H 6700 5300 50  0000 L CNN
F 2 "w_smd_cap:c_0603" H 6713 5250 30  0001 C CNN
F 3 "" H 6675 5400 60  0000 C CNN
F 4 "Decoupling capacitor" H 6675 5400 60  0001 C CNN "Opis"
	1    6675 5400
	1    0    0    -1  
$EndComp
$Comp
L C C9
U 1 1 57240430
P 7000 5400
F 0 "C9" H 7025 5500 50  0000 L CNN
F 1 "100nF" H 7025 5300 50  0000 L CNN
F 2 "w_smd_cap:c_0603" H 7038 5250 30  0001 C CNN
F 3 "" H 7000 5400 60  0000 C CNN
F 4 "Decoupling capacitor" H 7000 5400 60  0001 C CNN "Opis"
	1    7000 5400
	1    0    0    -1  
$EndComp
$Comp
L C C10
U 1 1 57240431
P 7300 5400
F 0 "C10" H 7325 5500 50  0000 L CNN
F 1 "4.7µF" H 7325 5300 50  0000 L CNN
F 2 "w_smd_cap:c_0805" H 7338 5250 30  0001 C CNN
F 3 "" H 7300 5400 60  0000 C CNN
F 4 "Decoupling capacitor" H 7300 5400 60  0001 C CNN "Opis"
	1    7300 5400
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR86
U 1 1 57240432
P 7300 5750
F 0 "#PWR86" H 7300 5500 50  0001 C CNN
F 1 "GND" H 7300 5600 50  0000 C CNN
F 2 "" H 7300 5750 60  0000 C CNN
F 3 "" H 7300 5750 60  0000 C CNN
	1    7300 5750
	1    0    0    -1  
$EndComp
$Comp
L C C7
U 1 1 57240433
P 5675 2125
F 0 "C7" H 5700 2225 50  0000 L CNN
F 1 "100nF" H 5700 2025 50  0000 L CNN
F 2 "w_smd_cap:c_0603" H 5713 1975 30  0001 C CNN
F 3 "" H 5675 2125 60  0000 C CNN
F 4 "Decoupling capacitor" H 5675 2125 60  0001 C CNN "Opis"
	1    5675 2125
	0    -1   -1   0   
$EndComp
$Comp
L C C6
U 1 1 57240434
P 5675 1800
F 0 "C6" H 5700 1900 50  0000 L CNN
F 1 "100nF" H 5700 1700 50  0000 L CNN
F 2 "w_smd_cap:c_0603" H 5713 1650 30  0001 C CNN
F 3 "" H 5675 1800 60  0000 C CNN
F 4 "Decoupling capacitor" H 5675 1800 60  0001 C CNN "Opis"
	1    5675 1800
	0    -1   -1   0   
$EndComp
$Comp
L C C5
U 1 1 57240435
P 5675 1500
F 0 "C5" H 5700 1600 50  0000 L CNN
F 1 "4.7µF" H 5700 1400 50  0000 L CNN
F 2 "w_smd_cap:c_0805" H 5713 1350 30  0001 C CNN
F 3 "" H 5675 1500 60  0000 C CNN
F 4 "Decoupling capacitor" H 5675 1500 60  0001 C CNN "Opis"
	1    5675 1500
	0    -1   -1   0   
$EndComp
$Comp
L GND #PWR85
U 1 1 57240436
P 5975 1500
F 0 "#PWR85" H 5975 1250 50  0001 C CNN
F 1 "GND" H 5975 1350 50  0000 C CNN
F 2 "" H 5975 1500 60  0000 C CNN
F 3 "" H 5975 1500 60  0000 C CNN
	1    5975 1500
	0    -1   -1   0   
$EndComp
$Comp
L C C4
U 1 1 57240437
P 4175 4500
F 0 "C4" H 4200 4600 50  0000 L CNN
F 1 "10nF" H 4200 4400 50  0000 L CNN
F 2 "w_smd_cap:c_0603" H 4213 4350 30  0001 C CNN
F 3 "" H 4175 4500 60  0000 C CNN
F 4 "Decoupling capacitor" H 4175 4500 60  0001 C CNN "Opis"
	1    4175 4500
	1    0    0    -1  
$EndComp
$Comp
L C C1
U 1 1 57240438
P 3875 4500
F 0 "C1" H 3900 4600 50  0000 L CNN
F 1 "1µF" H 3900 4400 50  0000 L CNN
F 2 "w_smd_cap:c_0603" H 3913 4350 30  0001 C CNN
F 3 "" H 3875 4500 60  0000 C CNN
F 4 "Decoupling capacitor" H 3875 4500 60  0001 C CNN "Opis"
	1    3875 4500
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR80
U 1 1 57240439
P 3875 4775
F 0 "#PWR80" H 3875 4525 50  0001 C CNN
F 1 "GND" H 3875 4625 50  0000 C CNN
F 2 "" H 3875 4775 60  0000 C CNN
F 3 "" H 3875 4775 60  0000 C CNN
	1    3875 4775
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR83
U 1 1 5724043A
P 4750 4200
F 0 "#PWR83" H 4750 3950 50  0001 C CNN
F 1 "GND" H 4750 4050 50  0000 C CNN
F 2 "" H 4750 4200 60  0000 C CNN
F 3 "" H 4750 4200 60  0000 C CNN
	1    4750 4200
	0    1    1    0   
$EndComp
$Comp
L +3.3V #PWR84
U 1 1 57240443
P 5450 1400
F 0 "#PWR84" H 5450 1250 50  0001 C CNN
F 1 "+3.3V" H 5450 1540 50  0000 C CNN
F 2 "" H 5450 1400 60  0000 C CNN
F 3 "" H 5450 1400 60  0000 C CNN
	1    5450 1400
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR81
U 1 1 57240444
P 4275 3500
F 0 "#PWR81" H 4275 3350 50  0001 C CNN
F 1 "+3.3V" H 4275 3640 50  0000 C CNN
F 2 "" H 4275 3500 60  0000 C CNN
F 3 "" H 4275 3500 60  0000 C CNN
	1    4275 3500
	0    -1   -1   0   
$EndComp
$Comp
L +3.3V #PWR87
U 1 1 57240445
P 7450 5175
F 0 "#PWR87" H 7450 5025 50  0001 C CNN
F 1 "+3.3V" H 7450 5315 50  0000 C CNN
F 2 "" H 7450 5175 60  0000 C CNN
F 3 "" H 7450 5175 60  0000 C CNN
	1    7450 5175
	0    1    1    0   
$EndComp
$Comp
L +3.3V #PWR79
U 1 1 57240446
P 3725 4300
F 0 "#PWR79" H 3725 4150 50  0001 C CNN
F 1 "+3.3V" H 3725 4440 50  0000 C CNN
F 2 "" H 3725 4300 60  0000 C CNN
F 3 "" H 3725 4300 60  0000 C CNN
	1    3725 4300
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4275 3500 4950 3500
Wire Wire Line
	4425 3500 4425 3450
Wire Wire Line
	4725 3500 4725 3450
Connection ~ 4725 3500
Wire Wire Line
	4425 3025 4425 3150
Wire Wire Line
	4725 3150 4725 3100
Connection ~ 4425 3100
Wire Wire Line
	6550 5050 6550 5175
Wire Wire Line
	6550 5175 7450 5175
Wire Wire Line
	7300 5175 7300 5250
Wire Wire Line
	7000 5250 7000 5175
Connection ~ 7000 5175
Wire Wire Line
	6675 5250 6675 5175
Connection ~ 6675 5175
Wire Wire Line
	7300 5550 7300 5750
Wire Wire Line
	6675 5550 6675 5625
Wire Wire Line
	6450 5625 7300 5625
Connection ~ 7300 5625
Wire Wire Line
	7000 5550 7000 5625
Connection ~ 7000 5625
Wire Wire Line
	5450 1400 5450 3000
Wire Wire Line
	5525 1800 5450 1800
Connection ~ 5450 1800
Wire Wire Line
	5525 2125 5450 2125
Connection ~ 5450 2125
Wire Wire Line
	5825 1500 5975 1500
Wire Wire Line
	5900 2125 5825 2125
Wire Wire Line
	5900 1500 5900 2300
Wire Wire Line
	5825 1800 5900 1800
Connection ~ 5900 1800
Connection ~ 5450 1500
Wire Wire Line
	3725 4300 4950 4300
Wire Wire Line
	4175 4350 4175 4300
Connection ~ 4175 4300
Wire Wire Line
	4175 4650 4175 4700
Wire Wire Line
	4175 4700 3875 4700
Wire Wire Line
	3875 4650 3875 4775
Connection ~ 3875 4700
Wire Wire Line
	4950 4200 4750 4200
Wire Wire Line
	5550 2300 5550 3000
Wire Wire Line
	6450 5050 6450 5625
Connection ~ 3875 4300
Wire Wire Line
	5450 1500 5525 1500
Connection ~ 5900 1500
Connection ~ 4425 3500
Connection ~ 7300 5175
Wire Wire Line
	3875 4350 3875 4300
Connection ~ 6675 5625
Connection ~ 4725 3100
Wire Wire Line
	5900 2300 5550 2300
Connection ~ 5900 2125
Wire Wire Line
	5650 5250 5650 5050
Wire Wire Line
	5750 5050 5750 5250
Wire Wire Line
	5850 5250 5850 5050
Wire Wire Line
	5950 5050 5950 5250
Text HLabel 7100 3600 2    60   Output ~ 0
aphasel
Text HLabel 7100 3500 2    60   Output ~ 0
bphasel
Text HLabel 6150 5250 3    60   Output ~ 0
aphaser
Text HLabel 6250 5250 3    60   Output ~ 0
bphaser
Text HLabel 5950 5250 3    60   Output ~ 0
aenbll
Text HLabel 6050 5250 3    60   Output ~ 0
benbll
Text HLabel 6150 2875 1    60   Output ~ 0
aenblr
Text HLabel 6250 2875 1    60   Output ~ 0
benblr
Wire Wire Line
	6050 5050 6050 5250
Wire Wire Line
	6250 5050 6250 5250
Text HLabel 5850 5250 3    60   Output ~ 0
ble_spi_mosi
Wire Wire Line
	6150 3000 6150 2875
Text HLabel 5650 5250 3    60   Output ~ 0
ble_spi_clk
Text HLabel 5750 5250 3    60   Input ~ 0
ble_spi_miso
Wire Wire Line
	6250 2875 6250 3000
Text HLabel 6350 2875 1    60   Input ~ 0
ble_spi_irq
Wire Wire Line
	6350 3000 6350 2875
Text HLabel 6450 2875 1    60   Output ~ 0
ble_resetn
Wire Wire Line
	6450 3000 6450 2875
Text HLabel 6350 5250 3    60   Output ~ 0
ble_spi_cs
Wire Wire Line
	6050 3000 6050 2875
Text HLabel 4850 4400 0    60   Input ~ 0
progress
Text HLabel 4850 4500 0    60   Input ~ 0
complete
Text HLabel 8050 3900 2    60   Input ~ 0
sense
Wire Wire Line
	4850 4400 4950 4400
Wire Wire Line
	4850 4500 4950 4500
$Comp
L R R5
U 1 1 5727D143
P 7800 3900
F 0 "R5" H 7870 3946 50  0000 L CNN
F 1 "1k" H 7870 3855 50  0000 L CNN
F 2 "w_smd_resistors:r_0402" V 7730 3900 50  0001 C CNN
F 3 "" H 7800 3900 50  0000 C CNN
	1    7800 3900
	0    -1   -1   0   
$EndComp
$Comp
L GND #PWR88
U 1 1 5727D3BA
P 8050 3675
F 0 "#PWR88" H 8050 3425 50  0001 C CNN
F 1 "GND" V 8055 3547 50  0000 R CNN
F 2 "" H 8050 3675 50  0000 C CNN
F 3 "" H 8050 3675 50  0000 C CNN
	1    8050 3675
	0    -1   -1   0   
$EndComp
$Comp
L R R7
U 1 1 5727D467
P 7800 3675
F 0 "R7" H 7870 3721 50  0000 L CNN
F 1 "1k" H 7870 3630 50  0000 L CNN
F 2 "w_smd_resistors:r_0402" V 7730 3675 50  0001 C CNN
F 3 "" H 7800 3675 50  0000 C CNN
	1    7800 3675
	0    -1   -1   0   
$EndComp
Wire Wire Line
	8050 3900 7950 3900
Wire Wire Line
	8050 3675 7950 3675
Wire Wire Line
	7575 3900 7650 3900
Wire Wire Line
	7575 3675 7575 3900
Wire Wire Line
	7575 3675 7650 3675
Wire Wire Line
	6350 5050 6350 5250
Text HLabel 5950 2875 1    60   BiDi ~ 0
sda
Text HLabel 6050 2875 1    60   Output ~ 0
scl
Wire Wire Line
	5950 2875 5950 3000
Text HLabel 7100 4500 2    60   Input ~ 0
photo_r_int
Text HLabel 7100 4600 2    60   Input ~ 0
photo_l_int
Text HLabel 5650 2875 1    60   Output ~ 0
photo_illumination
Text HLabel 7100 3900 2    60   Input ~ 0
ir_sense
Text HLabel 5750 2875 1    60   Output ~ 0
ir_cannon
Wire Wire Line
	6150 5050 6150 5250
Wire Wire Line
	7000 3900 7100 3900
Wire Wire Line
	7000 4000 7100 4000
Wire Wire Line
	7100 4100 7000 4100
Wire Wire Line
	7000 4200 7100 4200
Text Notes 1350 1375 0    60   ~ 0
TODO dać USB, bo to umożliwi stosowanie płytki głównej\njako development boarda (głównie dla mnie?).
Text Notes 1350 1575 0    60   ~ 0
TODO serial console
Wire Notes Line
	1250 1225 4100 1225
Wire Notes Line
	4100 1225 4100 1250
Wire Notes Line
	1275 1350 3700 1350
Text Notes 1350 1725 0    60   ~ 0
TODO LED RGB
Text Notes 1350 1850 0    60   ~ 0
TODO Włączniczek zamiast pinów
Text Notes 1350 1975 0    60   ~ 0
TODO Ustalić jaki w końcu ten mikrokontroler.
Text Notes 1350 2100 0    60   ~ 0
TODO Czy nie da się wszystkich IR sensorów podłączyć do jednego wejścia!?
Text Notes 1350 2225 0    60   ~ 0
TODO dźwięk!
Text Notes 1350 2350 0    60   ~ 0
TODO Skalowalność µC - chodzi mi o pamięć flash i RAM
Wire Notes Line
	1325 1800 2925 1800
Wire Notes Line
	1325 2050 4950 2050
Wire Notes Line
	4950 2050 4950 2075
Wire Notes Line
	1325 2300 4125 2300
Text HLabel 7100 4000 2    60   Output ~ 0
led_r
Text HLabel 7100 4100 2    60   Output ~ 0
led_g
Text HLabel 7100 4200 2    60   Output ~ 0
led_b
Wire Wire Line
	7000 4500 7100 4500
Wire Wire Line
	7100 4600 7000 4600
Wire Wire Line
	5650 3000 5650 2875
Wire Wire Line
	5750 2875 5750 3000
Wire Wire Line
	4725 3100 4425 3100
Wire Wire Line
	7000 3500 7100 3500
Wire Wire Line
	7100 3600 7000 3600
Wire Wire Line
	7000 3800 7575 3800
Connection ~ 7575 3800
Wire Wire Line
	5450 5050 5450 5250
Wire Wire Line
	5550 5050 5550 5250
Wire Notes Line
	1325 1525 2300 1525
Wire Notes Line
	1350 1675 2050 1675
Wire Notes Line
	1325 1925 3500 1925
$Comp
L Crystal Y1
U 1 1 580B1D49
P 3675 3750
F 0 "Y1" H 3675 3900 50  0000 C CNN
F 1 "16MHz" H 3675 3600 50  0000 C CNN
F 2 "Crystals:crystal_FA238-TSX3225" H 3675 3750 60  0001 C CNN
F 3 "http://pl.farnell.com/epson/x1e0000210193-tsx-3225-16mhz-16pf/crystal-16mhz-16pf-3-2-x-2-5mm/dp/2471828" H 3675 3750 60  0001 C CNN
F 4 "Kryształ 16MHz do radia do nRF8001" H 3675 3750 60  0001 C CNN "Opis"
	1    3675 3750
	0    1    1    0   
$EndComp
$Comp
L C C40
U 1 1 580B1D51
P 3350 4000
F 0 "C40" H 3375 4100 50  0000 L CNN
F 1 "15pF" H 3375 3900 50  0000 L CNN
F 2 "w_smd_cap:c_0603" H 3388 3850 30  0001 C CNN
F 3 "" H 3350 4000 60  0000 C CNN
F 4 "Obciążenie kryształu" H 3350 4000 60  0001 C CNN "Opis"
	1    3350 4000
	0    1    1    0   
$EndComp
$Comp
L C C39
U 1 1 580B1D59
P 3350 3475
F 0 "C39" H 3375 3575 50  0000 L CNN
F 1 "15pF" H 3375 3375 50  0000 L CNN
F 2 "w_smd_cap:c_0603" H 3388 3325 30  0001 C CNN
F 3 "" H 3350 3475 60  0000 C CNN
F 4 "Obciążenie kryształu" H 3350 3475 60  0001 C CNN "Opis"
	1    3350 3475
	0    1    1    0   
$EndComp
Wire Wire Line
	3500 4000 3900 4000
Wire Wire Line
	3500 3475 3975 3475
Wire Wire Line
	3675 3900 3675 4000
Connection ~ 3675 4000
Wire Wire Line
	3675 3600 3675 3475
Connection ~ 3675 3475
Wire Wire Line
	3200 4000 3000 4000
Wire Wire Line
	3200 3475 3000 3475
$Comp
L GND #PWR77
U 1 1 580B1D68
P 3000 3475
F 0 "#PWR77" H 3000 3225 50  0001 C CNN
F 1 "GND" H 3000 3325 50  0000 C CNN
F 2 "" H 3000 3475 60  0000 C CNN
F 3 "" H 3000 3475 60  0000 C CNN
	1    3000 3475
	0    1    1    0   
$EndComp
$Comp
L GND #PWR78
U 1 1 580B1D6E
P 3000 4000
F 0 "#PWR78" H 3000 3750 50  0001 C CNN
F 1 "GND" H 3000 3850 50  0000 C CNN
F 2 "" H 3000 4000 60  0000 C CNN
F 3 "" H 3000 4000 60  0000 C CNN
	1    3000 4000
	0    1    1    0   
$EndComp
$Comp
L STM32F030CxTx U14
U 1 1 580B3217
P 6000 4050
F 0 "U14" H 5475 3725 60  0000 L CNN
F 1 "STM32F030CxTx" H 5475 3575 60  0000 L CNN
F 2 "w_smd_lqfp:lqfp48" H 6450 3750 60  0001 C CNN
F 3 "" H 6450 3750 60  0000 C CNN
	1    6000 4050
	1    0    0    -1  
$EndComp
Text Notes 5800 4350 0    60   ~ 0
C6Tx : 32/4\nC8Tx : 64/8\nCCTx : 256/32
$Comp
L R R34
U 1 1 580B73FD
P 4050 4000
F 0 "R34" V 4150 4000 50  0000 C CNN
F 1 "220" V 4050 4000 50  0000 C CNN
F 2 "w_smd_resistors:r_0402" V 3980 4000 50  0001 C CNN
F 3 "" H 4050 4000 50  0000 C CNN
	1    4050 4000
	0    1    1    0   
$EndComp
Wire Wire Line
	4950 4000 4200 4000
Wire Wire Line
	3975 3475 3975 3900
Wire Wire Line
	3975 3900 4950 3900
Text Notes 3000 3350 0    60   ~ 0
Crystal is optional
NoConn ~ 5850 3000
Text HLabel 5550 5250 3    60   Output ~ 0
sound
Wire Notes Line
	1350 2200 1975 2200
Text HLabel 5450 5250 3    60   Input ~ 0
console_rx
Text HLabel 4850 4600 0    60   Output ~ 0
console_tx
Wire Wire Line
	4950 4600 4850 4600
Text HLabel 4950 4100 0    60   Input ~ 0
nrst
Text HLabel 7100 3700 2    60   BiDi ~ 0
swdio
Wire Wire Line
	7000 3700 7100 3700
Text HLabel 6550 2875 1    60   Input ~ 0
swdclk
Wire Wire Line
	6550 3000 6550 2875
Text HLabel 7100 4300 2    60   BiDi ~ 0
pb15
Text HLabel 7100 4400 2    60   BiDi ~ 0
pb14
Wire Wire Line
	7000 4400 7100 4400
Wire Wire Line
	7000 4300 7100 4300
Text HLabel 4850 3800 0    60   BiDi ~ 0
pc15
Text HLabel 4850 3700 0    60   BiDi ~ 0
pc14
Text HLabel 4850 3600 0    60   BiDi ~ 0
pc13
Wire Wire Line
	4850 3800 4950 3800
Wire Wire Line
	4850 3700 4950 3700
Wire Wire Line
	4850 3600 4950 3600
$EndSCHEMATC
