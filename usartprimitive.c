#include "usartprimitive.h"
#include <stdint.h>
#include <avr/io.h>
#include <inttypes.h>
#include <stdio.h>
#include <string.h>

#ifndef bool
	#define bool unsigned char
#endif


void usart_init(void)
{
	//Set baud rate
	UBRRL=UBRRVAL; //low byte
	UBRRH=(UBRRVAL>>8); //high byte

	//Set data frame format: asynchronous mode,no parity, 1 stop bit, 8 bit size
	UCSRC=(1<<URSEL)|(0<<UMSEL)|(0<<UPM1)|(0<<UPM0)|
	(0<<USBS)|(0<<UCSZ2)|(1<<UCSZ1)|(1<<UCSZ0);

	//Enable Transmitter and Receiver
	UCSRB=(1<<RXEN)|(1<<TXEN);
}

void usart_enable_interrupt(void) {
    UCSRB |= (1<<RXCIE);
}

void usart_write_byte(char c)
{
	// Wait if a byte is being transmitted
	while((UCSRA&(1<<UDRE)) == 0);

	// Transmit data
	UDR = c; 
}

char usart_read_byte(void)
{
	 // Wait until a byte has been received
	while((UCSRA&(1<<RXC)) == 0);

	// Return received data
	return UDR;
}

void usart_read_line(char* str, const uint16_t max_size)
{
    char* iter;
    for (iter = str; (iter < str + max_size - 1) && (*iter != '\n'); ++iter) {
        *iter = usart_read_byte();
    }
    *(++iter) = '\0';
}

void usart_write_string(char* str)
{
    char* iter;
    for (iter = str; iter < str + strlen(str); ++iter) {
        usart_write_byte(*iter);
    }
}
