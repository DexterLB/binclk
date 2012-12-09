#ifndef BITPORT_H
#define BITPORT_H
//Bit operations header
//Made by geneo


#define bit(x) (1 << (x))
#define setbits(x,y) ((x) |= (y))
#define clearbits(x,y) ((x) &= (~(y)))
#define setbit(x,y) setbits((x), (bit((y))))        /* EXAMPLE SETBIT(PORTB,2) sets the 2 bit of PORTB */ 
#define clearbit(x,y) clearbits((x), (bit((y))))

#define clearbit(x,y) clearbits((x), (bit((y))))
#define bitset(x,y) ((x) & (bit(y)))
#define bitclear(x,y) !bitset((x), (y))
#define bitsset(x,y) (((x) & (y)) == (y))
#define bitsclear(x,y) (((x) & (y)) == 0)
#define bitval(x,y) (((x)>>(y)) & 1) 
#define ibitset(x,y) !bitclear((x), (y))
#endif
