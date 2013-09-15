#ifndef DEF_H
#define DEF_H
#include "macros.h"
#include <stdint.h>

// CPU base frequency
#define F_CPU 7327800ul

// USART BAUD rate
#define BAUDRATE 19200

//                         76543210

#define DDRB_STATE      B8(11111111)
#define DDRC_STATE      B8(00111100)
#define DDRD_STATE      B8(11111000)

#define PWM_FREQ        480
#define PWM_TOP ((F_CPU/PWM_FREQ) - 1)

#endif
