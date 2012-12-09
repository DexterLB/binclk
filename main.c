#include "main.h"


ISR(TIMER2_OVF_vect)
{

}


ISR(TIMER2_COMP_vect)
{

}

ISR(ADC_vect)   //ADC convertion complete interupt
{
    uint8_t adcStatus = (uint8_t)(ADC >> 8);
    
}


void init(void)
{
    DDRB = DDRB_STATE;
    DDRC = DDRC_STATE;
    DDRD = DDRD_STATE;
    
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
    for (;;) {
        _delay_ms(500);
    }
    return 0;
}   // main()
