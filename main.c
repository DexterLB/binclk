#include "main.h"

uint8_t led_matrix[CNT_N] = {};
uint8_t led_index = 0;

inline void soft_reset()
{
    wdt_enable(WDTO_30MS);
    for(;;);
}

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
    char s[40] = "";
    struct ymdhms_t t;
    struct ymdhms_t t2;
    if (strcmp("human", str) == 0) {
        ds1302_get_time(&t);
        time_t ct = time_t_from_ymdhms(&t);
        sprintf(s, "humantime : %lu , ", (uint32_t)ct);
        
        usart_write_string(s, false);

        ymdhms_from_time_t(&t2, ct);
        sprintf(s, "%u-%u-%u'%u %u:%u:%u", t2.year, t2.month, t2.day, t2.weekday, t2.hour, t2.minute, t2.second);
        usart_write_string(s, true);
        return;
    }
    if (strcmp("reset", str) == 0) {
        usart_write_string("bye", true);
        soft_reset();
        return;
    }
    usart_write_string(str, true);
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
// populates led_matrix with data from ymdhms
{
    // handy trick to make things very simple
    // refer to comments @ the definition of LED_MAP
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
                bitval(tt[LED_MAP[i][j][0]]
                        , LED_MAP[i][j][1]) << j;
        }
    }
}

static inline void display_init(void)
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
    OCR1B = PWM_TOP/8;
    
    // Enable Timer1 overflow interrupt
    TIMSK = (1<<TOIE1);
}

void init(void)
{
    DDRB = DDRB_STATE;
    DDRC = DDRC_STATE;
    DDRD = DDRD_STATE;
 
    display_init();
    usart_init();
    usart_enable_interrupt();

    ds1302_init();

    struct ymdhms_t initial;
    if (!ds1302_get_time(&initial)) {
        // set time to Epoch if this is a first run
        ymdhms_from_time_t(&initial, 0);
        ds1302_set_time(&initial);
    }

    sei();
}


int main(void)
{
    init();
    usart_write_string("foo", true);
    struct ymdhms_t t;
    struct ymdhms_t t2;
//    char str[40] = "";

    for (;;) {
        _delay_ms(100);
        ds1302_get_time(&t);
        time_t ct = time_t_from_ymdhms(&t);
//        sprintf(str, "current time_t, : %lu , ", (uint32_t)ct);
        
//        usart_write_string(str);

        ymdhms_from_time_t(&t2, ct);
//        sprintf(str, "%u-%u-%u'%u %u:%u:%u\n", t2.year, t2.month, t2.day, t2.weekday, t2.hour, t2.minute, t2.second);
//        usart_write_string(str);


        display_time(&t2);
    }
    return 0;
}   // main()
