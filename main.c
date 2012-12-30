#include "main.h"

uint8_t led_matrix[CNT_N] = {
    0, 1, 2, 3, 4, 5, 6, 7
};
uint8_t led_index;

void update_display()
// A single iteration for the dynamic LED display
{
    // increment matrix counter
    if (++led_index >= CNT_N) led_index = 0;

    // set port to desired value
    CNT_PORT |= CNT[led_index] << CNT_SHIFT;
    CNT_PORT &= ~CNT_MASK | (CNT[led_index] << CNT_SHIFT);

    ANODE_PORT |= led_matrix[led_index] << ANODE_SHIFT;
    ANODE_PORT &= ~ANODE_MASK | (led_matrix[led_index] << ANODE_SHIFT);
}

ISR(TIMER1_OVF_vect)
{
    update_display();
}

ISR(ADC_vect)   //ADC convertion complete interupt
{
//    uint8_t adcStatus = (uint8_t)(ADC >> 8);
    
}

uint8_t zeller(uint8_t year, uint8_t month, uint8_t day)
// calculates day of the week
{
    return 4;   // chosen by dice roll
}


void display_time(struct ymdhms_t *t)
{
    uint8_t tt[] = {
          t->year + 2000    // 0
        , t->month          // 1
        , t->day            // 2
        , 0 // weekday      // 3
        , t->hour           // 4
        , t->minute         // 5
        , t->second         // 6
    };
    tt[3] = zeller(tt[0], tt[1], tt[2]);

    uint8_t i, j;
    for (i = 0; i < CNT_N; ++i) {
        led_matrix[i] = 0;
        for (j = 0; j < ANODE_N; ++j) {
            // "loop" over all the bits of this line in led_matrix
            // LED_MAP[i][j][0] represents the index in tt
            // LED_MAP[i][j][1] represents the
            // bit number of the respective value.
            led_matrix[i] |= 
                bitset(tt[LED_MAP[i][j][0]]
                        , LED_MAP[i][j][1]) << j;
        }
    }
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

    OCR1A = PWM_TOP/2;  // set brightness. fixme
    OCR1B = PWM_TOP/4;
    
    // Enable Timer1 overflow interrupt
    TIMSK = (1<<TOIE1);

    sei();
}


int main(void)
{
    init();
    for (;;) {
        _delay_ms(500);
    }
    return 0;
}   // main()
