#define F_CPU 8000000ul

#define DDRB_STATE 0xFF
#define DDRC_STATE 0xCF
#define DDRD_STATE 0xFF

#include <avr/interrupt.h>
#include <avr/io.h>
#include <util/delay.h>


#include "bit_operations.h"
#include "BitPort.h"
#include "pinout.h"
#include "compat.h"
