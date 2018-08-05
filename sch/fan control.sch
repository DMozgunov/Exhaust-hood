EESchema Schematic File Version 4
LIBS:fan control-cache
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
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
L fan-control-rescue:PIC16(L)F628A-I_P U2
U 1 1 56B100B8
P 3700 1950
F 0 "U2" H 2750 2650 50  0000 L CNN
F 1 "PIC16(L)F628A-I/P" H 2750 2550 50  0000 L CNN
F 2 "" H 3700 1950 50  0000 C CIN
F 3 "" H 3700 1950 50  0000 C CNN
	1    3700 1950
	-1   0    0    -1  
$EndComp
$Comp
L relays:RM50-xx21 RL1
U 1 1 56B1013D
P 9400 1200
F 0 "RL1" H 9850 1350 50  0000 L CNN
F 1 "in12v 220v/5A" H 9850 1250 50  0000 L CNN
F 2 "" H 9400 1200 50  0000 C CNN
F 3 "" H 9400 1200 50  0000 C CNN
	1    9400 1200
	1    0    0    -1  
$EndComp
$Comp
L relays:RM50-xx21 RL2
U 1 1 56B10254
P 9400 2100
F 0 "RL2" H 9850 2250 50  0000 L CNN
F 1 "in12v 220v/5A" H 9850 2150 50  0000 L CNN
F 2 "" H 9400 2100 50  0000 C CNN
F 3 "" H 9400 2100 50  0000 C CNN
	1    9400 2100
	1    0    0    -1  
$EndComp
$Comp
L relays:RM50-xx21 RL3
U 1 1 56B102BB
P 9400 3000
F 0 "RL3" H 9850 3150 50  0000 L CNN
F 1 "in12v 220v/5A" H 9850 3050 50  0000 L CNN
F 2 "" H 9400 3000 50  0000 C CNN
F 3 "" H 9400 3000 50  0000 C CNN
	1    9400 3000
	1    0    0    -1  
$EndComp
$Comp
L relays:RM50-xx21 RL4
U 1 1 56B10301
P 9400 3900
F 0 "RL4" H 9850 4050 50  0000 L CNN
F 1 "in12v 220v/5A" H 9850 3950 50  0000 L CNN
F 2 "" H 9400 3900 50  0000 C CNN
F 3 "" H 9400 3900 50  0000 C CNN
	1    9400 3900
	1    0    0    -1  
$EndComp
$Comp
L transistors:BC547 Q1
U 1 1 56B10545
P 7950 1700
F 0 "Q1" H 8150 1775 50  0000 L CNN
F 1 "BC547" H 8150 1700 50  0000 L CNN
F 2 "TO-92" H 8150 1625 50  0000 L CIN
F 3 "" H 7950 1700 50  0000 L CNN
	1    7950 1700
	1    0    0    -1  
$EndComp
$Comp
L transistors:BC547 Q2
U 1 1 56B105D0
P 7950 2600
F 0 "Q2" H 8150 2675 50  0000 L CNN
F 1 "BC547" H 8150 2600 50  0000 L CNN
F 2 "TO-92" H 8150 2525 50  0000 L CIN
F 3 "" H 7950 2600 50  0000 L CNN
	1    7950 2600
	1    0    0    -1  
$EndComp
$Comp
L transistors:BC547 Q3
U 1 1 56B1062D
P 7950 3500
F 0 "Q3" H 8150 3575 50  0000 L CNN
F 1 "BC547" H 8150 3500 50  0000 L CNN
F 2 "TO-92" H 8150 3425 50  0000 L CIN
F 3 "" H 7950 3500 50  0000 L CNN
	1    7950 3500
	1    0    0    -1  
$EndComp
$Comp
L transistors:BC547 Q4
U 1 1 56B10671
P 7950 4400
F 0 "Q4" H 8150 4475 50  0000 L CNN
F 1 "BC547" H 8150 4400 50  0000 L CNN
F 2 "TO-92" H 8150 4325 50  0000 L CIN
F 3 "" H 7950 4400 50  0000 L CNN
	1    7950 4400
	1    0    0    -1  
$EndComp
$Comp
L Device:R R8
U 1 1 56B106B3
P 7500 1700
F 0 "R8" V 7580 1700 50  0000 C CNN
F 1 "1k" V 7500 1700 50  0000 C CNN
F 2 "" V 7430 1700 50  0000 C CNN
F 3 "" H 7500 1700 50  0000 C CNN
	1    7500 1700
	0    1    1    0   
$EndComp
$Comp
L Device:R R9
U 1 1 56B10750
P 7500 2600
F 0 "R9" V 7580 2600 50  0000 C CNN
F 1 "1k" V 7500 2600 50  0000 C CNN
F 2 "" V 7430 2600 50  0000 C CNN
F 3 "" H 7500 2600 50  0000 C CNN
	1    7500 2600
	0    1    1    0   
$EndComp
$Comp
L Device:R R10
U 1 1 56B107DB
P 7500 3500
F 0 "R10" V 7580 3500 50  0000 C CNN
F 1 "1k" V 7500 3500 50  0000 C CNN
F 2 "" V 7430 3500 50  0000 C CNN
F 3 "" H 7500 3500 50  0000 C CNN
	1    7500 3500
	0    1    1    0   
$EndComp
$Comp
L Device:R R11
U 1 1 56B10886
P 7500 4400
F 0 "R11" V 7580 4400 50  0000 C CNN
F 1 "1k" V 7500 4400 50  0000 C CNN
F 2 "" V 7430 4400 50  0000 C CNN
F 3 "" H 7500 4400 50  0000 C CNN
	1    7500 4400
	0    1    1    0   
$EndComp
$Comp
L power:Earth #PWR3
U 1 1 56B1460C
P 8050 4800
F 0 "#PWR3" H 8050 4550 50  0001 C CNN
F 1 "Earth" H 8050 4650 50  0001 C CNN
F 2 "" H 8050 4800 50  0000 C CNN
F 3 "" H 8050 4800 50  0000 C CNN
	1    8050 4800
	1    0    0    -1  
$EndComp
$Comp
L pspice:DIODE D1
U 1 1 56B200E2
P 850 1850
F 0 "D1" H 850 2000 50  0000 C CNN
F 1 "1n4148" H 850 1675 50  0000 C CNN
F 2 "" H 850 1850 50  0000 C CNN
F 3 "" H 850 1850 50  0000 C CNN
	1    850  1850
	0    1    1    0   
$EndComp
$Comp
L Device:R R2
U 1 1 56B201AF
P 1150 1900
F 0 "R2" V 1230 1900 50  0000 C CNN
F 1 "1k" V 1150 1900 50  0000 C CNN
F 2 "" V 1080 1900 50  0000 C CNN
F 3 "" H 1150 1900 50  0000 C CNN
	1    1150 1900
	-1   0    0    1   
$EndComp
$Comp
L Device:R R7
U 1 1 56B2049A
P 2350 2050
F 0 "R7" V 2430 2050 50  0000 C CNN
F 1 "100" V 2350 2050 50  0000 C CNN
F 2 "" V 2280 2050 50  0000 C CNN
F 3 "" H 2350 2050 50  0000 C CNN
	1    2350 2050
	0    1    1    0   
$EndComp
$Comp
L Device:CP C1
U 1 1 56B2085F
P 850 2300
F 0 "C1" H 875 2400 50  0000 L CNN
F 1 "10mkF 10V" V 700 2050 50  0000 L CNN
F 2 "" H 888 2150 50  0000 C CNN
F 3 "" H 850 2300 50  0000 C CNN
	1    850  2300
	1    0    0    -1  
$EndComp
$Comp
L Device:R R14
U 1 1 56B5E669
P 7650 3750
F 0 "R14" V 7730 3750 50  0000 C CNN
F 1 "10k" V 7650 3750 50  0000 C CNN
F 2 "" V 7580 3750 50  0000 C CNN
F 3 "" H 7650 3750 50  0000 C CNN
	1    7650 3750
	1    0    0    1   
$EndComp
$Comp
L Device:R R15
U 1 1 56B5EA03
P 7650 4650
F 0 "R15" V 7730 4650 50  0000 C CNN
F 1 "10k" V 7650 4650 50  0000 C CNN
F 2 "" V 7580 4650 50  0000 C CNN
F 3 "" H 7650 4650 50  0000 C CNN
	1    7650 4650
	1    0    0    1   
$EndComp
$Comp
L Device:R R12
U 1 1 56B5EE03
P 7650 1950
F 0 "R12" V 7730 1950 50  0000 C CNN
F 1 "10k" V 7650 1950 50  0000 C CNN
F 2 "" V 7580 1950 50  0000 C CNN
F 3 "" H 7650 1950 50  0000 C CNN
	1    7650 1950
	-1   0    0    1   
$EndComp
$Comp
L Device:R R13
U 1 1 56B5EE8A
P 7650 2850
F 0 "R13" V 7730 2850 50  0000 C CNN
F 1 "10k" V 7650 2850 50  0000 C CNN
F 2 "" V 7580 2850 50  0000 C CNN
F 3 "" H 7650 2850 50  0000 C CNN
	1    7650 2850
	1    0    0    1   
$EndComp
$Comp
L fan-control-rescue:THYRISTOR T2
U 1 1 56B62FF9
P 9600 5200
F 0 "T2" H 9600 5300 50  0000 C CNN
F 1 "THYRISTOR" H 9600 5100 50  0000 C CNN
F 2 "" H 9600 5200 50  0000 C CNN
F 3 "" H 9600 5200 50  0000 C CNN
	1    9600 5200
	-1   0    0    1   
$EndComp
$Comp
L Device:R R17
U 1 1 56B630F6
P 9200 5400
F 0 "R17" V 9280 5400 50  0000 C CNN
F 1 "330" V 9200 5400 50  0000 C CNN
F 2 "" V 9130 5400 50  0000 C CNN
F 3 "" H 9200 5400 50  0000 C CNN
	1    9200 5400
	0    1    1    0   
$EndComp
$Comp
L Device:R R18
U 1 1 56B631C2
P 10000 5400
F 0 "R18" V 10080 5400 50  0000 C CNN
F 1 "330" V 10000 5400 50  0000 C CNN
F 2 "" V 9930 5400 50  0000 C CNN
F 3 "" H 10000 5400 50  0000 C CNN
	1    10000 5400
	0    1    1    0   
$EndComp
$Comp
L Device:D_Small D7
U 1 1 56B636F4
P 9150 5200
F 0 "D7" H 9100 5280 50  0000 L CNN
F 1 "FR207" H 9000 5120 50  0000 L CNN
F 2 "" V 9150 5200 50  0000 C CNN
F 3 "" V 9150 5200 50  0000 C CNN
	1    9150 5200
	1    0    0    -1  
$EndComp
$Comp
L Device:D_Small D6
U 1 1 56B6384D
P 8750 4100
F 0 "D6" H 8700 4180 50  0000 L CNN
F 1 "1n4004" H 8600 4020 50  0000 L CNN
F 2 "" V 8750 4100 50  0000 C CNN
F 3 "" V 8750 4100 50  0000 C CNN
	1    8750 4100
	0    1    1    0   
$EndComp
$Comp
L Device:D_Small D5
U 1 1 56B649F5
P 8750 3200
F 0 "D5" H 8700 3280 50  0000 L CNN
F 1 "1n4004" H 8600 3120 50  0000 L CNN
F 2 "" V 8750 3200 50  0000 C CNN
F 3 "" V 8750 3200 50  0000 C CNN
	1    8750 3200
	0    1    1    0   
$EndComp
$Comp
L Device:D_Small D4
U 1 1 56B64B09
P 8750 2300
F 0 "D4" H 8700 2380 50  0000 L CNN
F 1 "1n4004" H 8600 2220 50  0000 L CNN
F 2 "" V 8750 2300 50  0000 C CNN
F 3 "" V 8750 2300 50  0000 C CNN
	1    8750 2300
	0    1    1    0   
$EndComp
$Comp
L Device:D_Small D3
U 1 1 56B653FD
P 8750 1400
F 0 "D3" H 8700 1480 50  0000 L CNN
F 1 "1n4004" H 8600 1320 50  0000 L CNN
F 2 "" V 8750 1400 50  0000 C CNN
F 3 "" V 8750 1400 50  0000 C CNN
	1    8750 1400
	0    1    1    0   
$EndComp
$Comp
L opto:MOC3041M U3
U 1 1 56B666EA
P 8650 5300
F 0 "U3" H 8450 5500 50  0000 L CNN
F 1 "MOC3041M" H 8650 5500 50  0000 L CNN
F 2 "DIP-6" H 8450 5100 50  0000 L CIN
F 3 "" H 8615 5300 50  0000 L CNN
	1    8650 5300
	1    0    0    -1  
$EndComp
$Comp
L Device:R R16
U 1 1 56B66BB5
P 8100 5200
F 0 "R16" V 8180 5200 50  0000 C CNN
F 1 "240" V 8100 5200 50  0000 C CNN
F 2 "" V 8030 5200 50  0000 C CNN
F 3 "" H 8100 5200 50  0000 C CNN
	1    8100 5200
	0    1    1    0   
$EndComp
$Comp
L conn:Conn_01x07 J1
U 1 1 5B2D77BA
P 3150 4500
F 0 "J1" H 3150 4900 50  0000 C CNN
F 1 "Touch Panel/buttons" H 3150 4100 50  0000 C CNN
F 2 "" H 3150 4500 50  0001 C CNN
F 3 "" H 3150 4500 50  0001 C CNN
	1    3150 4500
	1    0    0    -1  
$EndComp
$Comp
L Device:R R3
U 1 1 5B2D8D56
P 1300 4000
F 0 "R3" V 1380 4000 50  0000 C CNN
F 1 "1k" V 1300 4000 50  0000 C CNN
F 2 "" V 1230 4000 50  0001 C CNN
F 3 "" H 1300 4000 50  0001 C CNN
	1    1300 4000
	1    0    0    -1  
$EndComp
$Comp
L Device:R R1
U 1 1 5B2D8E47
P 1100 4000
F 0 "R1" V 1180 4000 50  0000 C CNN
F 1 "1k" V 1100 4000 50  0000 C CNN
F 2 "" V 1030 4000 50  0001 C CNN
F 3 "" H 1100 4000 50  0001 C CNN
	1    1100 4000
	1    0    0    -1  
$EndComp
$Comp
L Device:R R4
U 1 1 5B2D8F40
P 1500 4000
F 0 "R4" V 1580 4000 50  0000 C CNN
F 1 "1k" V 1500 4000 50  0000 C CNN
F 2 "" V 1430 4000 50  0001 C CNN
F 3 "" H 1500 4000 50  0001 C CNN
	1    1500 4000
	1    0    0    -1  
$EndComp
$Comp
L Device:R R5
U 1 1 5B2D90DB
P 1700 4000
F 0 "R5" V 1780 4000 50  0000 C CNN
F 1 "1k" V 1700 4000 50  0000 C CNN
F 2 "" V 1630 4000 50  0001 C CNN
F 3 "" H 1700 4000 50  0001 C CNN
	1    1700 4000
	1    0    0    -1  
$EndComp
$Comp
L Device:R R6
U 1 1 5B2D9543
P 1900 4000
F 0 "R6" V 1980 4000 50  0000 C CNN
F 1 "1k" V 1900 4000 50  0000 C CNN
F 2 "" V 1830 4000 50  0001 C CNN
F 3 "" H 1900 4000 50  0001 C CNN
	1    1900 4000
	1    0    0    -1  
$EndComp
Connection ~ 8750 1500
Wire Wire Line
	8500 1800 8750 1800
Wire Wire Line
	8750 1800 8750 2200
Connection ~ 8750 2400
Wire Wire Line
	8500 2700 8750 2700
Wire Wire Line
	8750 2700 8750 3100
Connection ~ 8750 3300
Connection ~ 8750 4200
Wire Wire Line
	8500 3600 8750 3600
Wire Wire Line
	8750 3600 8750 4000
Wire Wire Line
	7650 4400 7750 4400
Wire Wire Line
	7650 3500 7750 3500
Wire Wire Line
	7650 2600 7750 2600
Wire Wire Line
	7650 1700 7750 1700
Connection ~ 8750 1800
Connection ~ 8500 900 
Connection ~ 8750 2700
Connection ~ 8500 1800
Connection ~ 8750 3600
Connection ~ 8500 2700
Wire Wire Line
	8050 1900 7800 1900
Wire Wire Line
	7800 1900 7800 2100
Wire Wire Line
	8050 2800 7800 2800
Connection ~ 7800 2800
Wire Wire Line
	8050 3700 7800 3700
Connection ~ 7800 3700
Wire Wire Line
	8050 4600 8050 4700
Connection ~ 8050 4700
Wire Wire Line
	9600 3300 10000 3300
Connection ~ 10000 3300
Wire Wire Line
	9600 2400 10000 2400
Wire Wire Line
	9600 4200 10000 4200
Connection ~ 10000 4200
Wire Wire Line
	10600 1000 10600 1500
Wire Wire Line
	10600 1500 9600 1500
Wire Wire Line
	10600 900  9700 900 
Wire Wire Line
	8050 4200 8750 4200
Wire Wire Line
	8050 1500 8750 1500
Wire Wire Line
	8050 2400 8750 2400
Wire Wire Line
	8050 3300 8750 3300
Wire Wire Line
	7800 4700 8050 4700
Wire Wire Line
	1150 1650 1150 1750
Wire Wire Line
	850  2050 1150 2050
Wire Wire Line
	850  2050 850  2150
Connection ~ 1150 2050
Wire Wire Line
	2500 2050 2600 2050
Wire Wire Line
	850  1650 850  1200
Wire Wire Line
	3700 900  3700 1200
Wire Wire Line
	850  2450 850  2700
Wire Wire Line
	850  2700 2150 2700
Wire Wire Line
	3700 2650 3700 2700
Connection ~ 3700 2700
Wire Wire Line
	4800 2050 7150 2050
Wire Wire Line
	7150 2050 7150 2600
Wire Wire Line
	7150 2600 7350 2600
Wire Wire Line
	4800 1950 7150 1950
Wire Wire Line
	7150 1950 7150 1700
Wire Wire Line
	7150 1700 7350 1700
Wire Wire Line
	7650 1800 7650 1700
Wire Wire Line
	7650 2100 7800 2100
Connection ~ 7800 2100
Wire Wire Line
	7650 2600 7650 2700
Wire Wire Line
	7800 3000 7800 3050
Wire Wire Line
	7650 3600 7650 3500
Wire Wire Line
	7650 3900 7800 3900
Connection ~ 7800 3900
Wire Wire Line
	7650 4500 7650 4400
Wire Wire Line
	7800 4800 7650 4800
Connection ~ 7800 4700
Wire Wire Line
	10000 2400 10000 3300
Wire Wire Line
	9700 5300 9700 5400
Wire Wire Line
	9350 5400 9700 5400
Connection ~ 9700 5400
Wire Wire Line
	9800 5200 10200 5200
Wire Wire Line
	10150 5400 10200 5400
Wire Wire Line
	9400 5200 9350 5200
Wire Wire Line
	9050 5200 8950 5200
Wire Wire Line
	9050 5400 8950 5400
Wire Wire Line
	8250 5200 8350 5200
Connection ~ 9350 5200
Wire Wire Line
	10600 3000 10600 4850
Wire Wire Line
	10600 4850 9350 4850
Wire Wire Line
	9350 4850 9350 5200
Connection ~ 10200 5400
Connection ~ 1700 3850
Connection ~ 1500 3850
Connection ~ 1300 3850
Wire Wire Line
	2150 4200 2950 4200
Wire Wire Line
	2150 4200 2150 3850
Connection ~ 2150 2700
Connection ~ 1900 3850
Wire Wire Line
	600  4400 1900 4400
Wire Wire Line
	1900 4400 1900 4150
Wire Wire Line
	700  4500 1700 4500
Wire Wire Line
	1700 4500 1700 4150
Wire Wire Line
	800  4600 1500 4600
Wire Wire Line
	1500 4600 1500 4150
Wire Wire Line
	900  4700 1300 4700
Wire Wire Line
	1300 4700 1300 4150
Wire Wire Line
	1000 4800 1100 4800
Wire Wire Line
	1100 4800 1100 4150
Wire Wire Line
	4800 2150 7050 2150
Wire Wire Line
	7050 2150 7050 3500
Wire Wire Line
	7050 3500 7350 3500
Wire Wire Line
	4800 2250 6950 2250
Wire Wire Line
	6950 2250 6950 4400
Wire Wire Line
	6950 4400 7350 4400
Wire Wire Line
	4800 1850 6850 1850
Wire Wire Line
	6850 1850 6850 5200
Wire Wire Line
	6850 5200 7950 5200
Wire Wire Line
	2600 1550 1650 1550
Wire Wire Line
	1650 1550 1650 3650
Wire Wire Line
	1650 3650 1000 3650
Wire Wire Line
	1000 3650 1000 4800
Connection ~ 1100 4800
Wire Wire Line
	2600 1650 1750 1650
Wire Wire Line
	1750 1650 1750 3550
Wire Wire Line
	1750 3550 900  3550
Wire Wire Line
	900  3550 900  4700
Connection ~ 1300 4700
Wire Wire Line
	2600 1750 1850 1750
Wire Wire Line
	1850 1750 1850 3450
Wire Wire Line
	1850 3450 800  3450
Wire Wire Line
	800  3450 800  4600
Connection ~ 1500 4600
Wire Wire Line
	2600 1850 1950 1850
Wire Wire Line
	1950 1850 1950 3350
Wire Wire Line
	1950 3350 700  3350
Wire Wire Line
	700  3350 700  4500
Connection ~ 1700 4500
Wire Wire Line
	2600 1950 2050 1950
Wire Wire Line
	2050 1950 2050 3250
Wire Wire Line
	2050 3250 600  3250
Wire Wire Line
	600  3250 600  4400
Connection ~ 1900 4400
Wire Wire Line
	7650 3000 7800 3000
Connection ~ 7800 3000
Wire Wire Line
	8500 3600 8500 2700
Connection ~ 3700 1200
$Comp
L power:+5V #PWR1
U 1 1 5B2E0BB9
P 3700 850
F 0 "#PWR1" H 3700 700 50  0001 C CNN
F 1 "+5V" H 3700 990 50  0000 C CNN
F 2 "" H 3700 850 50  0001 C CNN
F 3 "" H 3700 850 50  0001 C CNN
	1    3700 850 
	1    0    0    -1  
$EndComp
Wire Wire Line
	3700 1200 3700 850 
Wire Wire Line
	8750 900  8750 1300
Wire Wire Line
	8250 900  8500 900 
Connection ~ 8750 900 
Wire Wire Line
	8250 1200 8250 900 
Wire Wire Line
	850  1200 3700 1200
$Comp
L conn:Conn_01x02 J3
U 1 1 5B2E1B5B
P 10800 900
F 0 "J3" H 10800 1000 50  0000 C CNN
F 1 "Lights" H 10800 700 50  0000 C CNN
F 2 "" H 10800 900 50  0001 C CNN
F 3 "" H 10800 900 50  0001 C CNN
	1    10800 900 
	1    0    0    -1  
$EndComp
$Comp
L conn:Conn_01x04 J4
U 1 1 5B2E1D40
P 10800 2800
F 0 "J4" H 10800 3000 50  0000 C CNN
F 1 "Motor conection" H 10800 2500 50  0000 C CNN
F 2 "" H 10800 2800 50  0001 C CNN
F 3 "" H 10800 2800 50  0001 C CNN
	1    10800 2800
	1    0    0    -1  
$EndComp
$Comp
L conn:Conn_01x03 J5
U 1 1 5B2E1EB0
P 10800 5300
F 0 "J5" H 10800 5500 50  0000 C CNN
F 1 "AC in, 220v" H 10800 5100 50  0000 C CNN
F 2 "" H 10800 5300 50  0001 C CNN
F 3 "" H 10800 5300 50  0001 C CNN
	1    10800 5300
	1    0    0    -1  
$EndComp
$Comp
L power:VSS #PWR2
U 1 1 5B2E2161
P 3700 2800
F 0 "#PWR2" H 3700 2650 50  0001 C CNN
F 1 "VSS" H 3700 2950 50  0000 C CNN
F 2 "" H 3700 2800 50  0001 C CNN
F 3 "" H 3700 2800 50  0001 C CNN
	1    3700 2800
	-1   0    0    1   
$EndComp
$Comp
L conn:Conn_01x02 J2
U 1 1 5B2E2434
P 3450 3250
F 0 "J2" H 3450 3350 50  0000 C CNN
F 1 "DC in 5V" H 3450 3050 50  0000 C CNN
F 2 "" H 3450 3250 50  0001 C CNN
F 3 "" H 3450 3250 50  0001 C CNN
	1    3450 3250
	-1   0    0    1   
$EndComp
Wire Wire Line
	3650 3150 3950 3150
Wire Wire Line
	3950 3150 3950 2700
Wire Wire Line
	3650 3250 5100 3250
Wire Wire Line
	5100 3250 5100 1200
Connection ~ 5100 1200
Wire Wire Line
	9700 1800 9700 1750
Wire Wire Line
	9700 1750 10550 1750
Wire Wire Line
	10550 1750 10550 2700
Wire Wire Line
	10550 2700 10600 2700
Wire Wire Line
	9700 2700 9700 2650
Wire Wire Line
	9700 2650 10450 2650
Wire Wire Line
	10450 2650 10450 2800
Wire Wire Line
	10450 2800 10600 2800
Wire Wire Line
	9700 3600 10450 3600
Wire Wire Line
	10450 3600 10450 2900
Wire Wire Line
	10450 2900 10600 2900
Wire Wire Line
	10600 5200 10500 5200
Wire Wire Line
	10500 5200 10500 4200
Wire Wire Line
	10200 5200 10200 5400
$Comp
L power:Earth #PWR5
U 1 1 5B2E431E
P 10450 5600
F 0 "#PWR5" H 10450 5350 50  0001 C CNN
F 1 "Earth" H 10450 5450 50  0001 C CNN
F 2 "" H 10450 5600 50  0001 C CNN
F 3 "" H 10450 5600 50  0001 C CNN
	1    10450 5600
	1    0    0    -1  
$EndComp
Wire Wire Line
	10600 5300 10450 5300
Wire Wire Line
	10450 5300 10450 5600
Wire Wire Line
	8350 5400 6700 5400
Wire Wire Line
	6700 5400 6700 2700
Wire Wire Line
	6700 2700 3700 2700
Wire Wire Line
	1100 3850 1300 3850
Connection ~ 2150 3850
Wire Wire Line
	2950 4300 2850 4300
Wire Wire Line
	2850 4300 2850 3450
Wire Wire Line
	2850 3450 3650 3450
Wire Wire Line
	3650 3450 3650 3250
Wire Wire Line
	8750 1500 9200 1500
Wire Wire Line
	8750 2400 9200 2400
Wire Wire Line
	8750 3300 9200 3300
Wire Wire Line
	8750 4200 9200 4200
Wire Wire Line
	8750 1800 9200 1800
Wire Wire Line
	8500 900  8750 900 
Wire Wire Line
	8750 2700 9200 2700
Wire Wire Line
	8500 1800 8500 900 
Wire Wire Line
	8750 3600 9200 3600
Wire Wire Line
	8500 2700 8500 1800
Wire Wire Line
	7800 2800 7800 3000
Wire Wire Line
	7800 3700 7800 3900
Wire Wire Line
	8050 4700 8050 4800
Wire Wire Line
	10000 3300 10000 4200
Wire Wire Line
	10000 4200 10500 4200
Wire Wire Line
	1150 2050 2200 2050
Wire Wire Line
	3700 2700 3950 2700
Wire Wire Line
	3700 2700 3700 2800
Wire Wire Line
	7800 2100 7800 2800
Wire Wire Line
	7800 3900 7800 4700
Wire Wire Line
	7800 4700 7800 4800
Wire Wire Line
	9700 5400 9850 5400
Wire Wire Line
	9350 5200 9250 5200
Wire Wire Line
	10200 5400 10600 5400
Wire Wire Line
	1700 3850 1900 3850
Wire Wire Line
	1500 3850 1700 3850
Wire Wire Line
	1300 3850 1500 3850
Wire Wire Line
	2150 2700 3700 2700
Wire Wire Line
	1900 3850 2150 3850
Wire Wire Line
	1100 4800 2950 4800
Wire Wire Line
	1300 4700 2950 4700
Wire Wire Line
	1500 4600 2950 4600
Wire Wire Line
	1700 4500 2950 4500
Wire Wire Line
	1900 4400 2950 4400
Wire Wire Line
	7800 3000 7800 3700
Wire Wire Line
	3700 1200 3700 1250
Wire Wire Line
	3700 1200 5100 1200
Wire Wire Line
	8750 900  9200 900 
Wire Wire Line
	5100 1200 8250 1200
Wire Wire Line
	2150 3850 2150 2700
$EndSCHEMATC
