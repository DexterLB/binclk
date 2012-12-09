#ifndef BIT_OPERATIONS_H
#define BIT_OPERATIONS_H
// Bit Field Conversion for PORT Access 
typedef struct 
{ 
unsigned bit0:1; 
unsigned bit1:1; 
unsigned bit2:1; 
unsigned bit3:1; 
unsigned bit4:1; 
unsigned bit5:1; 
unsigned bit6:1; 
unsigned bit7:1; 
} BYTE_BITFIELD; 

// Data Direction 
#define ddra (*((volatile BYTE_BITFIELD*)(&DDRA))) 
#define ddrb (*((volatile BYTE_BITFIELD*)(&DDRB))) 
#define ddrc (*((volatile BYTE_BITFIELD*)(&DDRC))) 
#define ddrd (*((volatile BYTE_BITFIELD*)(&DDRD))) 

// Output Port 
#define outa (*((volatile BYTE_BITFIELD*)(&PORTA))) 
#define outb (*((volatile BYTE_BITFIELD*)(&PORTB))) 
#define outc (*((volatile BYTE_BITFIELD*)(&PORTC))) 
#define outd (*((volatile BYTE_BITFIELD*)(&PORTD))) 

// Input Port 
#define ina (*((volatile BYTE_BITFIELD*)(&PINA))) 
#define inb (*((volatile BYTE_BITFIELD*)(&PINB))) 
#define inc (*((volatile BYTE_BITFIELD*)(&PINC))) 
#define ind (*((volatile BYTE_BITFIELD*)(&PIND))) 

#endif
