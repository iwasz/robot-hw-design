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
Sheet 1 7
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
S 7050 1975 1050 1450
U 57253421
F0 "motors" 60
F1 "motors.sch" 60
F2 "aphasel" I L 7050 2075 60 
F3 "aenbll" I L 7050 2175 60 
F4 "bphasel" I L 7050 2275 60 
F5 "benbll" I L 7050 2375 60 
F6 "aphaser" I L 7050 2475 60 
F7 "aenblr" I L 7050 2575 60 
F8 "bphaser" I L 7050 2675 60 
F9 "benblr" I L 7050 2775 60 
F10 "sda" B L 7050 2875 60 
F11 "photo_l_int" O L 7050 3175 60 
F12 "scl" I L 7050 2975 60 
F13 "photo_r_int" O L 7050 3075 60 
F14 "photo_illumination" I L 7050 3275 60 
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
S 4125 1975 2450 3775
U 57240139
F0 "micro" 60
F1 "micro.sch" 60
F2 "aphasel" O R 6575 2075 60 
F3 "bphasel" O R 6575 2275 60 
F4 "aphaser" O R 6575 2475 60 
F5 "bphaser" O R 6575 2675 60 
F6 "aenbll" O R 6575 2175 60 
F7 "benbll" O R 6575 2375 60 
F8 "aenblr" O R 6575 2575 60 
F9 "benblr" O R 6575 2775 60 
F10 "ble_spi_mosi" O L 4125 4200 60 
F11 "ble_spi_clk" O L 4125 4100 60 
F12 "ble_spi_miso" I L 4125 3800 60 
F13 "ble_spi_irq" I L 4125 4000 60 
F14 "ble_resetn" O L 4125 3900 60 
F15 "ble_spi_cs" O L 4125 3700 60 
F16 "progress" I L 4125 2075 60 
F17 "complete" I L 4125 2175 60 
F18 "sense" I L 4125 2275 60 
F19 "sda" B R 6575 2875 60 
F20 "scl" O R 6575 2975 60 
F21 "photo_r_int" I R 6575 3075 60 
F22 "photo_l_int" I R 6575 3175 60 
F23 "photo_illumination" O R 6575 3275 60 
F24 "ir_cannon" O R 6575 4850 60 
F25 "ir_sense" I R 6575 4950 60 
F26 "led_r" O R 6575 4750 60 
F27 "led_g" O R 6575 4650 60 
F28 "led_b" O R 6575 4550 60 
F29 "sound" O L 4125 5025 60 
F30 "console_rx" I R 6575 5250 60 
F31 "console_tx" O R 6575 5150 60 
F32 "nrst" I R 6575 5050 60 
F33 "swdio" B R 6575 5350 60 
F34 "swdclk" I R 6575 5450 60 
F35 "pb15" B L 4125 5125 60 
F36 "pb14" B L 4125 5225 60 
F37 "pc15" B L 4125 5325 60 
F38 "pc14" B L 4125 5425 60 
F39 "pc13" B L 4125 5525 60 
$EndSheet
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
$Sheet
S 7050 5125 1050 625 
U 57DAAC9B
F0 "peripherals" 60
F1 "peripherals.sch" 60
$EndSheet
Wire Wire Line
	6575 2075 7050 2075
Wire Wire Line
	7050 2175 6575 2175
Wire Wire Line
	6575 2275 7050 2275
Wire Wire Line
	7050 2375 6575 2375
Wire Wire Line
	6575 2475 7050 2475
Wire Wire Line
	7050 2575 6575 2575
Wire Wire Line
	6575 2675 7050 2675
Wire Wire Line
	7050 2775 6575 2775
Wire Wire Line
	6575 2875 7050 2875
Wire Wire Line
	7050 2975 6575 2975
Wire Wire Line
	6575 3075 7050 3075
Wire Wire Line
	7050 3175 6575 3175
Wire Wire Line
	6575 3275 7050 3275
$Sheet
S 7050 3875 1050 725 
U 580FC6A6
F0 "photo" 60
F1 "photo.sch" 60
$EndSheet
$EndSCHEMATC
