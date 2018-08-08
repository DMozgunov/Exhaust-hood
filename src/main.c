/*
 * Simple exhaust hood controller
 *
 *
 *
 */


// PIC16F628A Configuration Bit Settings

// 'C' source line config statements

// CONFIG
#pragma config FOSC = INTOSCIO  // Oscillator Selection bits (INTOSC oscillator: I/O function on RA6/OSC2/CLKOUT pin, I/O function on RA7/OSC1/CLKIN)
#pragma config WDTE = OFF       // Watchdog Timer Enable bit (WDT disabled)
#pragma config PWRTE = ON       // Power-up Timer Enable bit (PWRT enabled)
#pragma config MCLRE = OFF      // RA5/MCLR/VPP Pin Function Select bit (RA5/MCLR/VPP pin function is digital input, MCLR internally tied to VDD)
#pragma config BOREN = OFF      // Brown-out Detect Enable bit (BOD disabled)
#pragma config LVP = OFF        // Low-Voltage Programming Enable bit (RB4/PGM pin has digital I/O function, HV on MCLR must be used for programming)
#pragma config CPD = OFF        // Data EE Memory Code Protection bit (Data memory code protection off)
#pragma config CP = OFF         // Flash Program Memory Code Protection bit (Code protection off)

// #pragma config statements should precede project file includes.
// Use project enums instead of #define for ON and OFF.

#include <xc.h>


void main(void) {

    /*
     * We have a board with relays and triak. Relays are used to connect
     * motor coils (there are 3 of them). As it is too powerful for
     * my application, it is also controlled by triac to get lower speed
     * and noise.
     *
     * Inputs
     * Control panel from left to right:
     *
     * Button 1 - 
     * Controls relay to bring the light under the hood
     *
     * Button 2 - 
     * Increase speed
     *
     * Button 3 - 
     * Decrease speed
     *
     * Button 4 - 
     * Fan on/off
     *
     * Button 5 - 
     * Timer 5 minutes coarse. It shall be using internal RC clock so several
     * seconds are the mistake
     *
     * Outputs:
     * 
     * PWM Thyristor - 
     * 
     * Ligts - 
     * 
     * Coil_1 - 
     * Coil_2 - 
     * Coil_3 - 
     * 
     * 
     * Multiplexed LEDs
     *  
     *  
     *  
     * 
     */

    


     return;
}
