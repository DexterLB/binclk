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
#define CNT_PORT        PORTC
#define CNT_SHIFT       2
const uint8_t CNT[CNT_N] = {
      0x04, 0x03, 0x0A, 0x0C
    , 0x0B, 0x00, 0x01, 0x02
};
#define CNT_MASK        (B8(1111)<<CNT_SHIFT)

// Anode axis
#define ANODE_PORT      PORTB
#define ANODE_SHIFT     3
#define ANODE_MASK      (B8(111)<<ANODE_SHIFT)

#define PWM_FREQ        480ul
#define PWM_TOP ((F_CPU/PWM_FREQ) - 1)


#endif
