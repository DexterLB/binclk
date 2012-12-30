// Hardware USART simple access module

#ifndef _USARTPRIMITIVE_H
#define _USARTPRIMITIVE_H

#include "def.h"

#define UBRRVAL ((F_CPU/(BAUDRATE*16UL))-1)

#include <stdint.h>
#include <avr/io.h>
#include <inttypes.h>
#include <stdio.h>
#include <string.h>

void usart_init(void);
void usart_enable_interrupt(void);
void usart_write_byte(char c);
char usart_read_byte(void);
void usart_read_line(char* str, const uint16_t max_size);
void usart_write_string(char* str);

#endif
