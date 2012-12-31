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


static const uint32_t daysSinceJan1st[2][13]=
{
    {0,31,59,90,120,151,181,212,243,273,304,334,365}, // 365 days, non-leap
    {0,31,60,91,121,152,182,213,244,274,305,335,366}    // 366 days, leap
};

bool is_year_leap(uint16_t year)
{
    return !(year % 4) && (year % 100 || !(year % 400));
}


time_t time_t_from_ymdhms(struct ymdhms_t* t)
{
    uint16_t year = t->year + 2000;

    uint8_t tm_sec = t->second;
    uint8_t tm_min = t->minute;
    uint8_t tm_hour = t->hour;
    uint8_t tm_year = year - 1900;

    uint16_t tm_yday = daysSinceJan1st[is_year_leap(year)][t->month - 1]
        + t->day - 1;


    return (
            (time_t)tm_sec + (time_t)tm_min*60 + (time_t)tm_hour*3600
            + (time_t)tm_yday*86400
            + ((time_t)tm_year-70)*31536000 
                + (((time_t)tm_year-69)/4)*86400
            - (((time_t)tm_year-1)/100)*86400 
                + (((time_t)tm_year+299)/400)*86400
           );

    // Taken from POSIX manual
}

struct ymdhms_t* ymdhms_from_time_t(struct ymdhms_t* t, time_t sec)
{
    uint16_t quadricentennials, centennials, quadrennials, annuals/*1-ennial?*/;
    uint16_t year;
    uint16_t yday;
    bool     leap;
    uint8_t  hour, min;
    uint8_t  month, mday, wday;

    sec += 11644473600; // move bias to 1601

    wday = (uint8_t)((sec / 86400 + 1) % 7); // day of week

    // Remove multiples of 400 years (incl. 97 leap days)
    quadricentennials = (uint16_t)(sec / 12622780800ULL); // 400*365.2425*24*3600
    sec %= 12622780800ULL;

    // Remove multiples of 100 years (incl. 24 leap days), can't be more than 3
    // (because multiples of 4*100=400 years (incl. leap days) have been removed)
    centennials = (uint16_t)(sec / 3155673600ULL); // 100*(365+24/100)*24*3600
    if (centennials > 3)
    {
        centennials = 3;
    }
    sec -= centennials * 3155673600ULL;

    // Remove multiples of 4 years (incl. 1 leap day), can't be more than 24
    // (because multiples of 25*4=100 years (incl. leap days) have been removed)
    quadrennials = (uint16_t)(sec / 126230400); // 4*(365+1/4)*24*3600
    if (quadrennials > 24)
    {
        quadrennials = 24;
    }
    sec -= quadrennials * 126230400ULL;

    // Remove multiples of years (incl. 0 leap days), can't be more than 3
    // (because multiples of 4 years (incl. leap days) have been removed)
    annuals = (uint16_t)(sec / 31536000); // 365*24*3600
    if (annuals > 3)
    {
        annuals = 3;
    }
    sec -= annuals * 31536000ULL;

    // Calculate the year and find out if it's leap
    year = 1601 + quadricentennials * 400 + centennials * 100 + quadrennials * 4 + annuals;
    leap = is_year_leap(year);

    // Calculate the day of the year and the time
    yday = sec / 86400;
    sec %= 86400;
    hour = sec / 3600;
    sec %= 3600;
    min = sec / 60;
    sec %= 60;

    // Calculate the month
    for (mday = month = 1; month < 13; month++)
    {
        if (yday < daysSinceJan1st[leap][month])
        {
            mday += yday - daysSinceJan1st[leap][month - 1];
            break;
        }
    }

    /*
    // Fill in C's "struct tm"
    memset(pTm, 0, sizeof(*pTm));
    pTm->tm_sec = sec;                    // [0,59]
    pTm->tm_min = min;                    // [0,59]
    pTm->tm_hour = hour;                // [0,23]
    pTm->tm_mday = mday;                // [1,31]    (day of month)
    pTm->tm_mon = month - 1;        // [0,11]    (month)
    pTm->tm_year = year - 1900; // 70+         (year since 1900)
    pTm->tm_wday = wday;                // [0,6]     (day since Sunday AKA day of week)
    pTm->tm_yday = yday;                // [0,365] (day since January 1st AKA day of year)
    pTm->tm_isdst = -1;                 // daylight saving time flag
    return pTm;
    */

    // Contributed by Alexey Frunze
    // http://stackoverflow.com/a/11197532/968261

    t->second  = sec;
    t->minute  = min;
    t->hour    = hour;
    t->day     = mday;
    t->month   = month;
    t->year    = year - 2000;    // since 2000
    t->weekday = wday;
    return t;
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
    char str[40] = "";
    for (;;) {
        _delay_ms(500);
        ds1302_get_time(&t);
        time_t ct = time_t_from_ymdhms(&t);
        sprintf(str, "current time_t: %lu\n", (uint32_t)ct);
        usart_write_string(str);
    }
    return 0;
}   // main()
