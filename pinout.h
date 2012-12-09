#ifndef PINOUT_H
#define PINOUT_H
// pinout description
#include "macros.h"

//                         76543210

#define DDRB_STATE      B8(11111111)
#define DDRC_STATE      B8(00111100)
#define DDRD_STATE      B8(11111000)

// Decimal decoder map (cathode axis)
#define CNT_PORT        PORTC
#define CNT_SHIFT       2
const uint8_t CNT[] = {8, 6, 5, 9, 7, 0, 2, 4};

// Anode axis
#define ANODE_PORT      PORTB
#define ANODE_SHIFT     3


#endif
