#include "main.h"

uint8_t led_matrix[CNT_N] = {};
uint8_t led_index = 0;

struct {
    time_t lastset;
    time_t driftbase;
    int64_t drift;
} permadata;

inline void soft_reset()
{
    wdt_enable(WDTO_30MS);
    for(;;);
}

void set_time(time_t time)
{
    struct ymdhms_t t;
    ymdhms_from_time_t(&t, time);
    ds1302_set_time(&t);
}

time_t get_time()
{
    struct ymdhms_t t;
    ds1302_get_time(&t);
    return time_t_from_ymdhms(&t);
}

time_t process_time(time_t time)
{
    // drift compensation
    if (permadata.drift)
        time += (time - permadata.driftbase) / permadata.drift;
    return time;
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

void permawrite(void)
{
    uint8_t *buf;
    uint8_t index;
    buf = (uint8_t*)(&permadata);
    for (index = 0; index < sizeof(permadata); ++index)
        ds1302_set_ram(index, *buf++);
}

void permaread(void)
{
    uint8_t *buf;
    uint8_t index;
    buf = (uint8_t*)(&permadata);
    for (index = 0; index < sizeof(permadata); ++index)
        *buf++ = ds1302_get_ram(index);
}

ISR(TIMER1_OVF_vect)
{
    update_display();
}

ISR(ADC_vect)   //ADC convertion complete interupt
{
//    uint8_t adcStatus = (uint8_t)(ADC >> 8);
    
}

void itoan(uint64_t i, char *str) {
    if (i == 0) {
        str[0] = '0';
        return;
    }
    uint8_t index = 0;
    uint64_t j = i;
    while (i != 0) {
        i /= 10;
        ++index;
    }

    while (j != 0) {
        str[index - 1] = '0' + (j % 10);
        j /= 10;
        --index;
    }
}

bool atoin(uint64_t *i, char *str) {
    *i = 0;
    uint8_t digit;
    while (str[0] != '\0') {
        *i *= 10;
        digit = str[0] - '0';
        if (digit > 9)
            return false;
        *i += digit;
        ++str;
    }
    return true;
}

bool process_input_string(char *str)
{
    if (strlen(str) < 2) {
        return false;
    }

    uint64_t *ptr;
    time_t time = 0;

    switch(str[1]) {
        case 'l':
            ptr = (uint64_t*)(&(permadata.lastset));
            break;
        case 'b':
            ptr = (uint64_t*)(&(permadata.driftbase));
            break;
        case 'd':
            ptr = (uint64_t*)(&(permadata.drift));
            break;
        case 't':
            ptr = (uint64_t*)(&time);
            break;
        default:
            return false;
    }

    char num_str[12] = "";
    char* num_ptr;
    switch(str[0]) {
        case 'r':
            if (str[1] == 't') {
                time = get_time();
                if (str[2] == '?')
                    time = process_time(time);
            }

            itoan(*ptr, num_str);
            usart_write_string(num_str, true);
            return true;
        case 'w':
            num_ptr = &(str[2]);
            if (!atoin(ptr, num_ptr))
                return false;
            usart_write_string("ok", true);

            if (str[1] == 't')
                set_time(time);
            else
                permawrite();

            return true;
        default:
            return false;
    }
    return false;
}

void process_usart_line(char *str)
{
    if (!process_input_string(str)) {
        usart_write_string("fail", true);
    }
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



void display_time(time_t time)
// populates led_matrix with data from ymdhms
{
    struct ymdhms_t t;
    ymdhms_from_time_t(&t, time);

    // handy trick to make things very simple
    // refer to comments @ the definition of LED_MAP
    uint8_t *tt = (uint8_t*)(&t);

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

    permaread();

    sei();
}

void time_train()
// the entire pipeline from ds1302 to the display
{
    time_t time = get_time();
    time = process_time(time);
    display_time(time);
}

int main(void)
{
    init();
    usart_write_string("42\n", true);

    for (;;) {
        _delay_ms(100);
        time_train();
    }
    return 0;
}
