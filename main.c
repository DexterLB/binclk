#include "main.h"

uint8_t led_matrix[8];

ISR(TIMER2_OVF_vect)
{

}


ISR(TIMER2_COMP_vect)
{

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
    
    memset(led_matrix, 0, sizeof(led_matrix));

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


    /*
    TCCR2 = 0x05;           // Prescaler /128 (8Mhz/128=62.5kHz)
    TCNT2 = 0x00;
    
    TCCR0 = BEEP_PRESCALER;
    TCNT0 = BEEP_COUNTFROM;
    
    TIMSK = (0x01<<TOIE2)   // Timer 2 overflow interrupt enable
          | (0x01<<OCIE2);  // Timer 2 compare match interrupt enable

    ADMUX  = 0x66;			// 01100110 - Int Ref + Cap; Left justified; ADC6 enable
    ADCSRA = 0x8F;		    // 10001111	- ADC Enable; Interupt enable; SysClc/128        
    */
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
