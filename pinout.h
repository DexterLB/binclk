#ifndef PINOUT_H
#define PINOUT_H
// pinout description
#include "macros.h"

//                         76543210

#define DDRB_STATE      B8(11111111)
#define DDRC_STATE      B8(00111100)
#define DDRD_STATE      B8(11111000)

// Decimal decoder map (cathode axis)
#define CNT_N           8
#define CNT_N_PINS      4
#define CNT_PORT        PORTC
#define CNT_SHIFT       2
const uint8_t CNT[CNT_N] = {
      0x04, 0x03, 0x0A, 0x0C
    , 0x0B, 0x00, 0x01, 0x02
};
#define CNT_MASK        (((1<<CNT_N_PINS) - 1)<<CNT_SHIFT)

// Anode axis
#define ANODE_N         3
#define ANODE_N_PINS    ANODE_N
#define ANODE_PORT      PORTB
#define ANODE_SHIFT     3
#define ANODE_MASK      (((1<<ANODE_N_PINS) - 1)<<ANODE_SHIFT)

/*
 * 0 - year
 * 1 - month
 * 2 - day
 * 3 - weekday
 * 4 - hour
 * 5 - minute
 * 6 - second
 */
const uint8_t LED_MAP[CNT_N][ANODE_N][2] = {
      {{4, 4}, {6, 0}, {4, 3}}
    , {{5, 4}, {5, 5}, {5, 3}}
    , {{5, 1}, {5, 0}, {5, 2}}
    , {{4, 1}, {4, 0}, {4, 2}}
    , {{2, 4}, {2, 3}, {1, 3}}
    , {{3, 1}, {3, 0}, {3, 2}}
    , {{2, 1}, {2, 0}, {2, 2}}
    , {{1, 1}, {1, 0}, {1, 2}}
};

#define PWM_FREQ        480ul
#define PWM_TOP ((F_CPU/PWM_FREQ) - 1)


#endif
