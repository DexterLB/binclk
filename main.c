#include "main.h"

uint8_t led_matrix[CNT_N] = {
    0, 1, 2, 3, 4, 5, 6, 7
};
uint8_t led_index;

ISR(TIMER1_OVF_vect)
{
    // increment matrix counter
    if (++led_index >= CNT_N) led_index = 0;

    // set port to desired value
    CNT_PORT |= CNT[led_index] << CNT_SHIFT;
    CNT_PORT &= ~CNT_MASK | (CNT[led_index] << CNT_SHIFT);

    ANODE_PORT |= led_matrix[led_index] << ANODE_SHIFT;
    ANODE_PORT &= ~ANODE_MASK | (led_matrix[led_index] << ANODE_SHIFT);

}

ISR(ADC_vect)   //ADC convertion complete interupt
{
//    uint8_t adcStatus = (uint8_t)(ADC >> 8);
    
}


void init(void)
{
    DDRB = DDRB_STATE;
    DDRC = DDRC_STATE;
    DDRD = DDRD_STATE;
    
    led_index = 0;

    // Both PWM channels set to non-inverting Fast PWM
    TCCR1A =  (0<<COM1A0) | (1<<COM1A1) | (0<<COM1B0) | (1<<COM1B1);
    TCCR1A |= (0<<WGM10)  | (1<<WGM11);
    TCCR1B =  (1<<WGM12)  | (1<<WGM13);

    // No prescaler
    TCCR1B |= (1<<CS10)   | (0<<CS11)   | (0<<CS12);

    // Set frequency
    ICR1 = PWM_TOP;

    OCR1A = PWM_TOP/2;
    OCR1B = PWM_TOP/4;
    
    // Enable Timer1 overflow interrupt
    TIMSK = (1<<TOIE1);

    sei();
}


ISR(TIMER0_OVF_vect)
{

}

int main(void)
{
    init();
    for (;;) {
        _delay_ms(500);
    }
    return 0;
}   // main()
