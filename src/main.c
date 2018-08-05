/*
 * Simple exhaust hood controller
 * 
 *
 * 
 */


#include <xc.h>

void main(void) {
    return;
    /*
     * We have a board with relays and triak. Relays are used to connect
     * motor coils (there are 3 of them). As it is too powerful for 
     * my application, it is also controlled by triac to get lower speed
     * and noise.
     * 
     * Control panel from left to right:
     * 
     * Button 1
     * Controls relay to bring the light under the hood
     * 
     * Button 2
     * Increase speed
     * 
     * Button 3
     * Decrease speed
     * 
     * Button 4
     * Fan on/off
     * 
     * Button 5
     * Timer 5 minutes coarse. It shall be using internal RC clock so several
     * seconds are the mistake
     * 
     */
}
