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
Sheet 1 5
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
S 4350 2925 2450 2250
U 57240139
F0 "micro" 60
F1 "micro.sch" 60
F2 "aphasel" O R 6800 3025 60 
F3 "bphasel" O R 6800 3225 60 
F4 "aphaser" O R 6800 3575 60 
F5 "bphaser" O R 6800 3775 60 
F6 "aenbll" O R 6800 3125 60 
F7 "benbll" O R 6800 3325 60 
F8 "aenblr" O R 6800 3675 60 
F9 "benblr" O R 6800 3875 60 
F10 "ble_spi_mosi" O R 6800 4375 60 
F11 "ble_spi_clk" O R 6800 4475 60 
F12 "ble_spi_miso" I R 6800 4775 60 
F13 "ble_spi_irq" I R 6800 4575 60 
F14 "ble_resetn" O R 6800 4675 60 
F15 "ble_spi_cs" O R 6800 4875 60 
F16 "progress" I L 4350 3025 60 
F17 "complete" I L 4350 3125 60 
F18 "sense" I L 4350 3225 60 
$EndSheet
$Sheet
S 2275 2925 1500 825 
U 5723E963
F0 "power" 60
F1 "power.sch" 60
F2 "progress" O R 3775 3025 60 
F3 "complete" O R 3775 3125 60 
F4 "sense" O R 3775 3225 60 
$EndSheet
$Sheet
S 7375 2925 1050 1050
U 57253421
F0 "motors" 60
F1 "motors.sch" 60
F2 "aphasel" I L 7375 3025 60 
F3 "aenbll" I L 7375 3125 60 
F4 "bphasel" I L 7375 3225 60 
F5 "benbll" I L 7375 3325 60 
F6 "aphaser" I L 7375 3575 60 
F7 "aenblr" I L 7375 3675 60 
F8 "bphaser" I L 7375 3775 60 
F9 "benblr" I L 7375 3875 60 
$EndSheet
$Sheet
S 7350 4275 1100 900 
U 5725DB8C
F0 "bluetooth" 60
F1 "bluetooth.sch" 60
F2 "ble_spi_mosi" I L 7350 4375 60 
F3 "ble_spi_clk" I L 7350 4475 60 
F4 "ble_spi_irq" O L 7350 4575 60 
F5 "ble_resetn" I L 7350 4675 60 
F6 "ble_spi_miso" O L 7350 4775 60 
F7 "ble_spi_cs" I L 7350 4875 60 
$EndSheet
Wire Wire Line
	6800 3025 7375 3025
Wire Wire Line
	6800 3125 7375 3125
Wire Wire Line
	6800 3225 7375 3225
Wire Wire Line
	6800 3325 7375 3325
Wire Wire Line
	6800 3575 7375 3575
Wire Wire Line
	6800 3675 7375 3675
Wire Wire Line
	6800 3775 7375 3775
Wire Wire Line
	6800 3875 7375 3875
Wire Wire Line
	6800 4375 7350 4375
Wire Wire Line
	6800 4475 7350 4475
Wire Wire Line
	6800 4575 7350 4575
Wire Wire Line
	6800 4675 7350 4675
Wire Wire Line
	6800 4775 7350 4775
Wire Wire Line
	7350 4875 6800 4875
Wire Wire Line
	3775 3025 4350 3025
Wire Wire Line
	3775 3125 4350 3125
Wire Wire Line
	3775 3225 4350 3225
$EndSCHEMATC
