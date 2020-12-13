; Assembly source line config statements

#include "p16f628a.inc"

; PIC16F628A Configuration Bit Settings    
; CONFIG
; __config 0xFF18
 __CONFIG _FOSC_INTOSCIO & _WDTE_OFF & _PWRTE_OFF & _MCLRE_OFF & _BOREN_OFF & _LVP_OFF & _CPD_OFF & _CP_OFF

;===============================================================================
; Store DATA here
;===============================================================================

PWMLOW			    EQU	    b'00001000'	    ; 
PWMMID			    EQU	    b'10010000'	    ;	   
PWMHIGH			    EQU	    b'11111111'	    ;	   

TimeDelayCounterMAX	    EQU	    0xFF    ; Set max count of Timer1 interrupts
 
DebounceCounterMAX	    EQU	    5	    ; check this number of times in a row
FailSafeCounterMAX	    EQU	    40	    ; must be at least (DebounceCounterMAX * 2 + 1)
MAXCoil			    EQU	    3	    ;
			    
; buttons			    
LIGHTS			    EQU	    4	    ; RB4
FASTER			    EQU	    5	    ; RB5
SLOWER			    EQU	    6	    ; RB6
FAN			    EQU	    7	    ; RB7
TIMER			    EQU	    0	    ; RB0			    
	 
; coils outputs			    
NO_COIL			    EQU	    b'11111000'			    
COIL1			    EQU	    b'00000001'	    ; RA0
COIL2			    EQU	    b'00000010'	    ; RA1
COIL3			    EQU	    b'00000100'     ; RA2
			    
LIGHTS_OUT		    EQU	    4	    ; RA4 - open drain out, sutable for lights LED and realy are on same output
		    
FASTER_LED		    EQU	    6	    ; RA6
SLOWER_LED		    EQU	    7	    ; RA7
;FAN_LED use both FASTER_LED SLOWER_LED
TIMER_LED		    EQU	    3	    ; RA3   
		    
AT_MAX			    EQU	    1
AT_MIN			    EQU	    0		
			    

		    
    cblock 0x20		; (max 80 Bytes)
    
    Buttons		; for debounce - which is pushed
    
    LastStableState	 ; keep track of switch state (open-1; closed-0)
    DebounceCounter	; used during button debounce routine
    FailSafeCounter	; used to exit 'endless debounce loop'

    Delay		; assign an address to label Delay1
   
    CurrentCoil		; Which coil is on. 0 = motor off
    CurrentPWMDuty	
    
    MotorStatus
    
    TimeDelayCounter	; how many Timer1 interrupts should happen before system go to sleep mode
    
    ; Interrupr service
    W_Save
    STATUS_Save
    PCLATH_Save
    
    endc
    
;===============================================================================
; RESET and Interrupt vector
;===============================================================================
    
RES_VECT  CODE    0x0000            ; processor reset vector
    GOTO    START	            ; go to beginning of program 
  
  
ISR       CODE    0x0004	    ; Interrupts 
  
    movwf       W_Save		; Save context
    movf        STATUS,w
    movwf       STATUS_Save
    movf        PCLATH,w
    movwf       PCLATH_Save       
       
       
    btfss	INTCON, RBIF	    ; interrupt-on-change flag for PORTB<7:4>
    goto	ISR_TIMER
  
    ; if interrupt-on-change occured on PORTB then buttons 
    ; have been pushed during sleep mode 
    ; clear interrupt flags and process buttons
    bcf		INTCON, RBIE    ; disable interrupt-on-change
    bcf		INTCON, RBIF    ; disable interrupt-on-change
    ;bcf	    INTCON, GIE	    ; disable global interrupts
  
  
ISR_TIMER:
    btfss	PIR1,TMR1IF		    ; pattern timer overflow
    goto        EXIT_ISR
    
; Timer1 int is used for delay
    bcf		PIR1,TMR1IF		    ; clear interrupt flag   
  
    ;decf	TimeDelayCounter,f
    decfsz	TimeDelayCounter,f
    ;btfss	STATUS,Z	    ; TimeDelayCounter = 0 -> time to sleep
    goto        EXIT_ISR
;     
    bsf		STATUS, RP1
    bcf         PIE1, TMR1IE	    ; Timer1 overflow interrupt disable
    
    bcf		STATUS, RP1
    bcf         T1CON, TMR1ON	    ; Stop timer
    
    call ENTER_SLEEP
    
EXIT_ISR
    
    movf        STATUS_Save,w       ; Restore context
    movwf       STATUS
    movf        PCLATH_Save,w       
    movwf       PCLATH
 
    swapf       W_Save,f            ; swapf doesn't affect Status bits, but MOVF would
    swapf       W_Save,w    
    
    retfie

  
MAIN_PROG CODE                      ; let linker place main program

START

 ;===============================================================================
; Setup
;===============================================================================
Initial_Setup:			
    
    bcf		STATUS, RP0		; select Register Page 0
    bcf		STATUS, RP1		;
    
    clrf	Buttons			; no buttons have been pressed so far
    clrf	CurrentCoil		; motor is off at the beginning
    
; PWM config
    clrf	CCP1CON			; PWM off
    clrf	TMR2			; 
    clrf	CCPR1L			; duty = 0
; timer 2	   	  
    bcf		PIR1,TMR2IF		; timer2 interrupt on
	
    clrf	T2CON		  
    bsf		T2CON,T2CKPS1		; prescaler = 16
    bsf		T2CON,TMR2ON		; activate timer    
    
; timer 1
    
    movlw	b'00110000'		; 
    movwf	T1CON			; Timer1 prescaler 1:8 

    bcf		T1CON,TMR1CS		; Timer1 run at Fosc/4
          
    
; comparators    
    movlw	7
    movwf	CMCON			; CMCON=7 set comperators off
    
    bsf		STATUS, RP0		; select Register Page 1

; PWM config
    movlw	0x65			; PWM frequency 0,6 √ц
    movwf	PR2
    
; Timer 0    
    bcf		OPTION_REG, T0CS	; Timer 0 tie to internal clock source

; Port configuration    
    clrf	TRISA			; all pins are output

    movlw	0xFF			; all pins are inputs
    movwf	TRISB
    
   
    bcf		STATUS, RP0		; select Register Page 0
    bsf		PORTA, LIGHTS		; it is open drain out pulled to Vss, so set 1 to turn lights off

; Interrupts
    bsf		INTCON, GIE		; enable gloabal interrupts
    
    ; Set interrupt on change and go to sleep
    call	ENTER_SLEEP			

;===============================================================================
; Main program loop
;===============================================================================
    
MAIN_LOOP:
    
    
    
    bcf		STATUS, RP0		; select Register Page 0
    bcf		STATUS, RP1		;
    
      
     ; We have a board with relays and triak. Relays are used to connect
     ; motor coils (there are 3 of them). As it is too powerful for
     ; my application, it is also controlled by triac to get lower speed
     ; and noise.
     ; 
     ; Inputs
     ; Control panel from left to right:
     ; 
     ; Button 1 - 
     ; Controls relay to bring the light under the hood
     ; 
     ; Button 2 - 
     ; Increase speed
     ; 
     ; Button 3 - 
     ; Decrease speed
     ; 
     ; Button 4 - 
     ; Fan on/off
     ; 
     ; Button 5 - 
     ; Timer 5 minutes coarse. It shall be using internal RC clock 
     ; 
     ; Outputs:
     ; 
     ; PWM Thyristor - 
     ; 
     ; Ligts - 
     ; 
     ; Coil_1 - 
     ; Coil_2 - 
     ; Coil_3 - 
     ; 
     ; 
     ; Multiplexed LEDs
     ;  
     ;  
     ;  
     ; 
     ; /
 
 
    ; one or more buttons have been pushed
    
    ;------
    ;RBx = 0 - off
    ;RBx = 1 - on
    
   
BUTTON_CHECK_AND_DEBOUNCE:    
    
    
     ; Process LIGHTS button
    btfss	PORTB, LIGHTS	    ; if this button is not on, go to next
    goto	DEBOUNCE_LIGHTS_END
    
    movlw	1 
    movwf	LastStableState	    ; Assume the Switch is on
    
    movlw	FailSafeCounterMAX
    movwf	FailSafeCounter
    
    clrf	DebounceCounter
    
DEBOUNCE_LIGHTS:
    btfsc	LastStableState,0
    goto	LookingForUp_LIGHTS 
    
LookingForDown_LIGHTS:
    clrw
    btfss	PORTB,LIGHTS
    incf	DebounceCounter,w	    ; 
    movwf	DebounceCounter		    ; 
   
    decf	FailSafeCounter,f
    
    goto	CheckIfDebounced_LIGHTS
    
LookingForUp_LIGHTS:
    clrw
    btfsc	PORTB,LIGHTS
    incf	DebounceCounter,w	    ; 
    movwf	DebounceCounter		    ; 

    decf	FailSafeCounter,f
    
CheckIfDebounced_LIGHTS:
    
    movf	FailSafeCounter,w
    andwf	FailSafeCounter,w
    
    btfsc	STATUS,Z		    ; if Fail safe counter is 0 then smth is really wrong with button or wiring - exiting endless loop
    goto	DEBOUNCE_LIGHTS_END
    
    movlw	DebounceCounterMAX	    ; have we seen 5 in a row?
    xorwf	DebounceCounter,w
    
    btfsc	STATUS,Z 
    goto	$+3
    call	Delay1mS
    goto	DEBOUNCE_LIGHTS
    nop		; have seen 5 UP in a row
    
    ;bcf		PORTA, LIGHTS
    
    comf	LastStableState,f   ; after 5 straight, reverse the direction
    clrf	DebounceCounter
    
    btfsc	LastStableState,0   ; Was it a key-down press?
    goto	$+3
    call	Delay1mS	    ; no: take no action
    goto	DEBOUNCE_LIGHTS
    nop
    
    bsf		Buttons, LIGHTS	    ; set key pressed flag here
    
DEBOUNCE_LIGHTS_END:
    

    
;;    ;debug
;;    
;;    btfss	Buttons, LIGHTS
;;    goto	EndDebug_LIGHTS
;;    
;;    btfss	PORTA, LIGHTS
;;    goto	$+3
;;
;;    bcf		PORTA, LIGHTS
;;
;;    goto	$+2
;;    bsf		PORTA, LIGHTS
;;    nop
;;    
;;    ; flag proceed, crear
;;    bcf		Buttons, LIGHTS
;;EndDebug_LIGHTS:
;;    ; end debug
	    
       
    ; if button was pushed on previous step - no need to check others
    movf	Buttons,w
    andwf	Buttons,w
    
    btfsc	STATUS,Z		    
    goto	PROCESS_BUTTONS
    
    

  ; Process FASTER button
    btfss	PORTB, FASTER	    ; if this button is not on, go to next
    goto	DEBOUNCE_FASTER_END
    
    movlw	1 
    movwf	LastStableState	    ; Assume the Switch is on
    
    movlw	FailSafeCounterMAX
    movwf	FailSafeCounter
    
    clrf	DebounceCounter
    
DEBOUNCE_FASTER:
    btfsc	LastStableState,0
    goto	LookingForUp_FASTER 
    
LookingForDown_FASTER:
    clrw
    btfss	PORTB,FASTER
    incf	DebounceCounter,w	    ; 
    movwf	DebounceCounter		    ; 
   
    decf	FailSafeCounter,f
    
    goto	CheckIfDebounced_FASTER
    
LookingForUp_FASTER:
    clrw
    btfsc	PORTB,FASTER
    incf	DebounceCounter,w	    ; 
    movwf	DebounceCounter		    ; 

    decf	FailSafeCounter,f
    
CheckIfDebounced_FASTER:
    
    movf	FailSafeCounter,w
    andwf	FailSafeCounter,w
    
    btfsc	STATUS,Z		    ; if Fail safe counter is 0 then smth is really wrong with button or wiring - exiting endless loop
    goto	DEBOUNCE_FASTER_END
    
    movlw	DebounceCounterMAX	    ; have we seen 5 in a row?
    xorwf	DebounceCounter,w
    
    btfsc	STATUS,Z 
    goto	$+3
    call	Delay1mS
    goto	DEBOUNCE_FASTER
    nop		; have seen 5 UP in a row
    
    comf	LastStableState,f   ; after 5 straight, reverse the direction
    clrf	DebounceCounter
    
    btfsc	LastStableState,0   ; Was it a key-down press?
    goto	$+3
    call	Delay1mS	    ; no: take no action
    goto	DEBOUNCE_FASTER
    nop
    
    bsf		Buttons, FASTER	    ; set key pressed flag here
    
DEBOUNCE_FASTER_END:
    
    
    ; if button was pushed on previous step - no need to check others
    movf	Buttons,w
    andwf	Buttons,w
    
    btfsc	STATUS,Z		    ; 
    goto	PROCESS_BUTTONS    


  ; Process SLOWER button
    btfss	PORTB, SLOWER	    ; if this button is not on, go to next
    goto	DEBOUNCE_SLOWER_END
    
    movlw	1 
    movwf	LastStableState	    ; Assume the Switch is on
    
    movlw	FailSafeCounterMAX
    movwf	FailSafeCounter
    
    clrf	DebounceCounter
    
DEBOUNCE_SLOWER:
    btfsc	LastStableState,0
    goto	LookingForUp_SLOWER 
    
LookingForDown_SLOWER:
    clrw
    btfss	PORTB,SLOWER
    incf	DebounceCounter,w	    ; 
    movwf	DebounceCounter		    ; 
   
    decf	FailSafeCounter,f
    
    goto	CheckIfDebounced_SLOWER
    
LookingForUp_SLOWER:
    clrw
    btfsc	PORTB,SLOWER
    incf	DebounceCounter,w	    ; 
    movwf	DebounceCounter		    ; 

    decf	FailSafeCounter,f
    
CheckIfDebounced_SLOWER:
    
    movf	FailSafeCounter,w
    andwf	FailSafeCounter,w
    
    btfsc	STATUS,Z		    ; if Fail safe counter is 0 then smth is really wrong with button or wiring - exiting endless loop
    goto	DEBOUNCE_SLOWER_END
    
    movlw	DebounceCounterMAX	    ; have we seen 5 in a row?
    xorwf	DebounceCounter,w
    
    btfsc	STATUS,Z 
    goto	$+3
    call	Delay1mS
    goto	DEBOUNCE_SLOWER
    nop		; have seen 5 UP in a row
    
    comf	LastStableState,f   ; after 5 straight, reverse the direction
    clrf	DebounceCounter
    
    btfsc	LastStableState,0   ; Was it a key-down press?
    goto	$+3
    call	Delay1mS	    ; no: take no action
    goto	DEBOUNCE_SLOWER
    nop
    
    bsf		Buttons, SLOWER	    ; set key pressed flag here
    
DEBOUNCE_SLOWER_END:
    
    
    ; if button was pushed on previous step - no need to check others
    movf	Buttons,w
    andwf	Buttons,w
    
    btfsc	STATUS,Z		    ; 
    goto	PROCESS_BUTTONS

    
  ; Process FAN button
    btfss	PORTB, FAN	    ; if this button is not on, go to next
    goto	DEBOUNCE_FAN_END
    
    movlw	1 
    movwf	LastStableState	    ; Assume the Switch is on
    
    movlw	FailSafeCounterMAX
    movwf	FailSafeCounter
    
    clrf	DebounceCounter
    
DEBOUNCE_FAN:
    btfsc	LastStableState,0
    goto	LookingForUp_FAN 
    
LookingForDown_FAN:
    clrw
    btfss	PORTB,FAN
    incf	DebounceCounter,w	    ; 
    movwf	DebounceCounter		    ; 
   
    decf	FailSafeCounter,f
    
    goto	CheckIfDebounced_FAN
    
LookingForUp_FAN:
    clrw
    btfsc	PORTB,FAN
    incf	DebounceCounter,w	    ; 
    movwf	DebounceCounter		    ; 

    decf	FailSafeCounter,f
    
CheckIfDebounced_FAN:
    
    movf	FailSafeCounter,w
    andwf	FailSafeCounter,w
    
    btfsc	STATUS,Z		    ; if Fail safe counter is 0 then smth is really wrong with button or wiring - exiting endless loop
    goto	DEBOUNCE_FAN_END
    
    movlw	DebounceCounterMAX	    ; have we seen 5 in a row?
    xorwf	DebounceCounter,w
    
    btfsc	STATUS,Z 
    goto	$+3
    call	Delay1mS
    goto	DEBOUNCE_FAN
    nop		; have seen 5 UP in a row
    
    comf	LastStableState,f   ; after 5 straight, reverse the direction
    clrf	DebounceCounter
    
    btfsc	LastStableState,0   ; Was it a key-down press?
    goto	$+3
    call	Delay1mS	    ; no: take no action
    goto	DEBOUNCE_FAN
    nop
    
    bsf		Buttons, FAN	    ; set key pressed flag here
    
DEBOUNCE_FAN_END:
    

    ; if button was pushed on previous step - no need to check others
    movf	Buttons,w
    andwf	Buttons,w
    
    btfsc	STATUS,Z		    ; 
    goto	PROCESS_BUTTONS
    

  ; Process TIMER button
    btfss	PORTB, TIMER	    ; if this button is not on, go to next
    goto	DEBOUNCE_TIMER_END
    
    movlw	1 
    movwf	LastStableState	    ; Assume the Switch is on
    
    movlw	FailSafeCounterMAX
    movwf	FailSafeCounter
    
    clrf	DebounceCounter
    
DEBOUNCE_TIMER:
    btfsc	LastStableState,0
    goto	LookingForUp_TIMER 
    
LookingForDown_TIMER:
    clrw
    btfss	PORTB,TIMER
    incf	DebounceCounter,w	    ; 
    movwf	DebounceCounter		    ; 
   
    decf	FailSafeCounter,f
    
    goto	CheckIfDebounced_TIMER
    
LookingForUp_TIMER:
    clrw
    btfsc	PORTB,TIMER
    incf	DebounceCounter,w	    ; 
    movwf	DebounceCounter		    ; 

    decf	FailSafeCounter,f
    
CheckIfDebounced_TIMER:
    
    movf	FailSafeCounter,w
    andwf	FailSafeCounter,w
    
    btfsc	STATUS,Z		    ; if Fail safe counter is 0 then smth is really wrong with button or wiring - exiting endless loop
    goto	DEBOUNCE_TIMER_END
    
    movlw	DebounceCounterMAX	    ; have we seen 5 in a row?
    xorwf	DebounceCounter,w
    
    btfsc	STATUS,Z 
    goto	$+3
    call	Delay1mS
    goto	DEBOUNCE_TIMER
    nop		; have seen 5 UP in a row
    
    comf	LastStableState,f   ; after 5 straight, reverse the direction
    clrf	DebounceCounter
    
    btfsc	LastStableState,0   ; Was it a key-down press?
    goto	$+3
    call	Delay1mS	    ; no: take no action
    goto	DEBOUNCE_TIMER
    nop
    
    bsf		Buttons, TIMER	    ; set key pressed flag here
    
DEBOUNCE_TIMER_END:    
    
    
PROCESS_BUTTONS:    
    ;process buttons flags here

;;LIGHTS			    EQU	    4	    ; RB4
;;FASTER			    EQU	    5	    ; RB5
;;SLOWER			    EQU	    6	    ; RB6
;;FAN				    EQU	    7	    ; RB7
;;TIMER				    EQU	    0	    ; RB0	
    
;;FASTER_LED		    EQU	    6
;;SLOWER_LED		    EQU	    7
;;;FAN_LED use both FASTER_LED SLOWER_LED
;;TIMER_LED		    EQU	    3    
    
;PROCESS_BUTTONS_LIGHT:
    btfss	Buttons, LIGHTS
    goto	PROCESS_BUTTONS_FASTER
    
        
    ; inverse corresponding output
    btfss	PORTA, LIGHTS_OUT
    goto	$+3

    bcf		PORTA, LIGHTS_OUT

    goto	$+2
    bsf		PORTA, LIGHTS_OUT
    nop
    
    ; if motor is off and lights go off - must go to sleep!
    btfss	PORTA, LIGHTS_OUT	    ; lights are off - time to check motor
    goto	PROCESS_BUTTONS_END
    
    
    movfw	CurrentCoil
    andwf	CurrentCoil,w
    
    btfss	STATUS,Z		    ; 
    goto	PROCESS_BUTTONS_END
    
    call	ENTER_SLEEP
    
    goto	PROCESS_BUTTONS_END
    
    
PROCESS_BUTTONS_FASTER:
    btfss	Buttons, FASTER
    goto	PROCESS_BUTTONS_SLOWER
    
    ;if motor is off - start
    movfw	CurrentCoil
    andwf	CurrentCoil,w
    
    btfsc	STATUS,Z		    ; 
    goto	PROCESS_BUTTONS_FAN_START
 
    call	SET_MOTOR_NEXT_MODE
 
    ; if were operating at minimum - turn on LED: SLOWER   
    btfsc	MotorStatus, AT_MIN
    bsf		PORTA, SLOWER_LED
    
    ; if operating at a maximum speed - turn off LED: FASTER
    btfsc	MotorStatus, AT_MAX
    bcf		PORTA, FASTER_LED

    goto	PROCESS_BUTTONS_END
        
PROCESS_BUTTONS_SLOWER:
    btfss	Buttons, SLOWER
    goto	PROCESS_BUTTONS_FAN
    
    ;if motor is off - start
    movfw	CurrentCoil
    andwf	CurrentCoil,w
    
    btfsc	STATUS,Z		    ; 
    goto	PROCESS_BUTTONS_FAN_START
    
    call	SET_MOTOR_PREV_MODE   
    
    ; if were operating at a maximum speed - turn on LED: FASTER
    btfss	MotorStatus, AT_MAX
    bsf		PORTA, FASTER_LED
    
    ; if operating at a minimum speed - turn off LED: SLOWER
    btfsc	MotorStatus, AT_MIN    
    bcf		PORTA, SLOWER_LED

    goto	PROCESS_BUTTONS_END
    
    
PROCESS_BUTTONS_FAN:
    btfss	Buttons, FAN
    goto	PROCESS_BUTTONS_TIMER
    
    
    movfw	CurrentCoil
    andwf	CurrentCoil,w
    
    btfss	STATUS,Z		    ; motor if off
    goto	PROCESS_BUTTONS_FAN_TURN_OFF
    
PROCESS_BUTTONS_FAN_START
    ;1. init after sleep - start at a low speed
    
    ; set slowest mode - coil1
    movlw	COIL1
    movwf	CurrentCoil
    call	SET_COIL
    
    
    ; start CCP1 here
    movlw		b'00101100'	  	    
    movwf		CCP1CON			        ; enable PWM 
    
    movlw		PWMLOW
    movwf		CCPR1L				; set minimum duty cycle
    
    bsf			MotorStatus, AT_MIN
    
    ; turn on LEDs: FASTER and FAN
    bsf		PORTA, FASTER_LED
    
    goto	PROCESS_BUTTONS_END
    
PROCESS_BUTTONS_FAN_TURN_OFF    
    ;2. motor was working -  turn off
    
    
    ; turn off CCP1 here
    call	TURN_CCP1_OFF    
    
    ; turn all coils here
    
    clrf	CurrentCoil    
    call	SET_COIL
  
    ; turn off corresponding LEDs
    bcf		PORTA, FASTER_LED
    bcf		PORTA, SLOWER_LED
    
    ; chech for lights are on
    btfsc	PORTA, LIGHTS_OUT		   
    goto	PROCESS_BUTTONS_END	  ; lights are on, just turn motor off, no sleep

    ; if lights are off and motor goes off - must go to sleep
    call	ENTER_SLEEP
    
    goto	PROCESS_BUTTONS_END
    
    
    
PROCESS_BUTTONS_TIMER:
    btfss	Buttons, TIMER
    goto	PROCESS_BUTTONS_END
    
    btfsc	T1CON, TMR1ON
    goto	PROCESS_BUTTONS_TIMER_OFF
    
PROCESS_BUTTONS_TIMER_ON
    
    
    ; start timer for 5 minutes
    ; go to sleep after 
    
    movlw	TimeDelayCounterMAX
    movwf	TimeDelayCounter
    
    bsf		STATUS, RP1
    bsf         PIE1, TMR1IE	    ; Timer1 overflow interrupt enable
    
    bcf		STATUS, RP1
    
    clrf	TMR1H
    clrf	TMR1L
    bsf         T1CON, TMR1ON	    ; Start timer
    
    ; turn on LED:  TIMER
    bsf		PORTA, TIMER_LED
    
    goto	PROCESS_BUTTONS_END
    
PROCESS_BUTTONS_TIMER_OFF
    bsf		STATUS, RP1
    bcf         PIE1, TMR1IE	    ; Timer1 overflow interrupt disable
    
    bcf		STATUS, RP1
    bcf         T1CON, TMR1ON	    ; Stop timer
    
    ; turn off LED:  TIMER
    bcf		PORTA, TIMER_LED
    
    
PROCESS_BUTTONS_END:   
    clrf	Buttons
    
    
    
    GOTO MAIN_LOOP                      ; loop forever

;===============================================================================
; Subroutines
;===============================================================================
SET_MOTOR_PREV_MODE:
    
    bcf		MotorStatus, AT_MAX	    ; decreasing power 

    ;1 if possible - decrease duty

    movf	CCPR1L,w
    movwf	CurrentPWMDuty
    
    movlw	PWMLOW
    xorwf	CurrentPWMDuty,w
    
    btfsc	STATUS,Z
    goto	SET_MOTOR_PREV_MODE_PREV_COIL   
    
    movlw	PWMMID
    xorwf	CurrentPWMDuty,w
    
    btfss	STATUS,Z
    goto	$+3
    movlw	PWMLOW	    ; operating on PWMMID
    goto	$+2
    movlw	PWMMID	    ; operating on PWMLOW
    nop
    
    movwf	CCPR1L	    ; set new duty
    
    goto	SET_MOTOR_PREV_MODE_END
    
SET_MOTOR_PREV_MODE_PREV_COIL
    ;2 if duty on its min - set max duty and prev coil - if possible
    
    bsf		MotorStatus, AT_MIN	; assume it is at its min power
    
    movlw	COIL1
    xorwf	CurrentCoil,w
    
    btfsc	STATUS,Z   
    goto	SET_MOTOR_PREV_MODE_END	; operating at lowest power - nothing to do	
    
    bcf		MotorStatus, AT_MIN	; power can be lower
    
    movlw	COIL2
    xorwf	CurrentCoil,w
    
    btfss	STATUS,Z
    goto	$+3
    movlw	COIL1	    ; operating on coil 2 - change to coil 1
    goto	$+2
    movlw	COIL2	    ; operating on coil 3 - change to coil 2
    nop
   
    clrf	CCPR1L			; turn motor off before changing coils - no need to spark
    
    call	Delay1mS		; 
    call	Delay1mS		; 

    movwf	CurrentCoil

    call	SET_COIL		; change relay = coil under no load    
    
    movlw	PWMHIGH
    movwf	CCPR1L			; set lowest duty

    
SET_MOTOR_PREV_MODE_END:    
    return
    
    
SET_MOTOR_NEXT_MODE:
    
    bcf		MotorStatus, AT_MIN	    ; increasing power - no more silence
    
    ;1 if possible - increase duty
    
    movf	CCPR1L,w
    movwf	CurrentPWMDuty
    
    movlw	PWMHIGH
    xorwf	CurrentPWMDuty,w
    
    btfsc	STATUS,Z
    goto	SET_MOTOR_MODE_SET_NEXT_COIL	; operating on max duty - set next coil
    
    ; duty is not max here - set next
    
    movlw	PWMMID
    xorwf	CurrentPWMDuty,w
    
    btfss	STATUS,Z
    goto	$+3
    movlw	PWMHIGH	    ; operating on PWMMID
    goto	$+2
    movlw	PWMMID	    ; operating on PWMLOW
    nop
    
    movwf	CCPR1L	    ; set new duty
    
    goto	SET_MOTOR_NEXT_MODE_END
    
SET_MOTOR_MODE_SET_NEXT_COIL    
    ;2 if duty on its max - set min duty and next coil - if possible

    bsf		MotorStatus, AT_MAX	; assume it is at its max power
	
    movlw	COIL3
    xorwf	CurrentCoil,w
    
    btfsc	STATUS,Z
    goto	SET_MOTOR_NEXT_MODE_END	; operating at max

    bcf		MotorStatus,AT_MAX	; well, not now
   
    movlw	COIL2
    xorwf	CurrentCoil,w
    
    btfss	STATUS,Z
    goto	$+3
    movlw	COIL3	    ; operating on coil 2 - change to coil 3 
    goto	$+2
    movlw	COIL2	    ; operating on coil 1 - change to coil 2
    nop
    
    clrf	CCPR1L			; turn motor off before changing coils - no need to spark

    call	Delay1mS		; 
    call	Delay1mS		; 
    
    movwf	CurrentCoil

    call	SET_COIL		; change relay = coil under no load
    
    movlw	PWMLOW
    movwf	CCPR1L			; set lowest duty

    
SET_MOTOR_NEXT_MODE_END:
    return
    
    
SET_COIL:
    ; set corresponding output and preserve rest PORTA values

 ;   bcf		STATUS, RP0		; select Register Page 0
 ;   bcf		STATUS, RP1		;
    
    movlw	NO_COIL
    andwf	PORTA,f			; remove current coil 
    
    call	Delay1mS
    call	Delay1mS
    
    movf	CurrentCoil,w		; set new coil
    iorwf	PORTA,f    
    
    return
       
TURN_CCP1_OFF:
    
    bcf		STATUS, RP0		; select Register Page 0
    bcf		STATUS, RP1		;
    
    clrf	CCP1CON			; PWM off
    clrf	TMR2			; 
    clrf	CCPR1L			; duty = 0
    
    return
    
    
ENTER_SLEEP:
    ; turn off everything
    call	TURN_CCP1_OFF
    
    bcf		STATUS, RP0		; select Register Page 0
    bcf		STATUS, RP1		;
      
    clrf	Buttons			; 
    
    movlw	NO_COIL
    movwf	CurrentCoil		; motor is off at the beginning
    
    clrf	PORTA
    bsf		PORTA, LIGHTS		; it is open drain out pulled to Vss, so set 1 to turn lights off
     
    call	TURN_CCP1_OFF		; disable CCP1
    
    bsf		INTCON, RBIE		; enable interrupt-on-change for PORTB<7:4>
    sleep
    nop					; first to execute after exiting sleep mode
    
    return
    
    
Delay1mS:
    movlw	.71			; delay ~1000uS
    movwf	Delay
    decfsz	Delay,f			; this loop does 215 cycles
    goto	$-1  
    decfsz	Delay,f			; This loop does 786 cycles
    goto	$-1

    return
    
    
    END