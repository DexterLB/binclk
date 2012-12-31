#include "main.h"

uint8_t led_matrix[CNT_N] = {};
uint8_t led_index = 0;

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

void process_usart_line(char *str)
{
    usart_write_string(str);
}

ISR(USART_RXC_vect)
{
    static char buf[40] = {};
    static uint8_t index = 0;
    char c;
    
    c = usart_read_byte();

    if ((c == '\0') || (c == '\n') || (c == '\r') || (index >= sizeof buf - 2)) {
        buf[index] = '\0';
        process_usart_line(buf);
        index = 0;
        return;
    }

    buf[index++] = c;
}



void display_time(struct ymdhms_t *t)
{
    /*
    uint8_t tt[] = {
          t->year           // 0
        , t->month          // 1
        , t->day            // 2
        , t->weekday        // 3
        , t->hour           // 4
        , t->minute         // 5
        , t->second         // 6
    };
    */
    uint8_t *tt = (uint8_t*) t;

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

static inline void init_display(void)
{
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
}

void init(void)
{
    DDRB = DDRB_STATE;
    DDRC = DDRC_STATE;
    DDRD = DDRD_STATE;
 
    init_display();
    usart_init();
    usart_enable_interrupt();

    ds1302_init();

    sei();
}


int main(void)
{
    init();
    usart_write_string("foo\n");
    struct ymdhms_t t;
    struct ymdhms_t t2;
    char str[40] = "";
    ymdhms_from_time_t(&t, 1356956553);
    ds1302_set_time(&t);
    for (;;) {
        _delay_ms(500);
        ds1302_get_time(&t);
        time_t ct = time_t_from_ymdhms(&t);
        sprintf(str, "current time_t, : %lu , ", (uint32_t)ct);
        
        usart_write_string(str);

        ymdhms_from_time_t(&t2, ct);
        sprintf(str, "%u-%u-%u'%u %u:%u:%u\n", t2.year, t2.month, t2.day, t2.weekday, t2.hour, t2.minute, t2.second);
        usart_write_string(str);
    }
    return 0;
}   // main()
