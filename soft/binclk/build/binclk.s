
build/binclk.elf:     file format elf32-avr


Disassembly of section .text:

00000000 <__vectors>:
       0:	16 c0       	rjmp	.+44     	; 0x2e <__ctors_end>
       2:	30 c0       	rjmp	.+96     	; 0x64 <__bad_interrupt>
       4:	2f c0       	rjmp	.+94     	; 0x64 <__bad_interrupt>
       6:	2e c0       	rjmp	.+92     	; 0x64 <__bad_interrupt>
       8:	2d c0       	rjmp	.+90     	; 0x64 <__bad_interrupt>
       a:	2c c0       	rjmp	.+88     	; 0x64 <__bad_interrupt>
       c:	2b c0       	rjmp	.+86     	; 0x64 <__bad_interrupt>
       e:	2a c0       	rjmp	.+84     	; 0x64 <__bad_interrupt>
      10:	51 c1       	rjmp	.+674    	; 0x2b4 <__vector_8>
      12:	28 c0       	rjmp	.+80     	; 0x64 <__bad_interrupt>
      14:	27 c0       	rjmp	.+78     	; 0x64 <__bad_interrupt>
      16:	2a c3       	rjmp	.+1620   	; 0x66c <__vector_11>
      18:	25 c0       	rjmp	.+74     	; 0x64 <__bad_interrupt>
      1a:	24 c0       	rjmp	.+72     	; 0x64 <__bad_interrupt>
      1c:	6c c4       	rjmp	.+2264   	; 0x8f6 <__vector_14>
      1e:	22 c0       	rjmp	.+68     	; 0x64 <__bad_interrupt>
      20:	21 c0       	rjmp	.+66     	; 0x64 <__bad_interrupt>
      22:	20 c0       	rjmp	.+64     	; 0x64 <__bad_interrupt>
      24:	1f c0       	rjmp	.+62     	; 0x64 <__bad_interrupt>

00000026 <ResetTime>:
      26:	80 00 00 01 01 01 00 00                             ........

0000002e <__ctors_end>:
      2e:	11 24       	eor	r1, r1
      30:	1f be       	out	0x3f, r1	; 63
      32:	cf e5       	ldi	r28, 0x5F	; 95
      34:	d4 e0       	ldi	r29, 0x04	; 4
      36:	de bf       	out	0x3e, r29	; 62
      38:	cd bf       	out	0x3d, r28	; 61

0000003a <__do_copy_data>:
      3a:	11 e0       	ldi	r17, 0x01	; 1
      3c:	a0 e6       	ldi	r26, 0x60	; 96
      3e:	b0 e0       	ldi	r27, 0x00	; 0
      40:	e8 e4       	ldi	r30, 0x48	; 72
      42:	f9 e1       	ldi	r31, 0x19	; 25
      44:	02 c0       	rjmp	.+4      	; 0x4a <__SREG__+0xb>
      46:	05 90       	lpm	r0, Z+
      48:	0d 92       	st	X+, r0
      4a:	a6 32       	cpi	r26, 0x26	; 38
      4c:	b1 07       	cpc	r27, r17
      4e:	d9 f7       	brne	.-10     	; 0x46 <__SREG__+0x7>

00000050 <__do_clear_bss>:
      50:	11 e0       	ldi	r17, 0x01	; 1
      52:	a6 e2       	ldi	r26, 0x26	; 38
      54:	b1 e0       	ldi	r27, 0x01	; 1
      56:	01 c0       	rjmp	.+2      	; 0x5a <.do_clear_bss_start>

00000058 <.do_clear_bss_loop>:
      58:	1d 92       	st	X+, r1

0000005a <.do_clear_bss_start>:
      5a:	a2 37       	cpi	r26, 0x72	; 114
      5c:	b1 07       	cpc	r27, r17
      5e:	e1 f7       	brne	.-8      	; 0x58 <.do_clear_bss_loop>
      60:	f1 da       	rcall	.-2590   	; 0xfffff644 <__eeprom_end+0xff7ef644>
      62:	70 cc       	rjmp	.-1824   	; 0xfffff944 <__eeprom_end+0xff7ef944>

00000064 <__bad_interrupt>:
      64:	cd cf       	rjmp	.-102    	; 0x0 <__vectors>

00000066 <soft_reset>:
#endif

inline void soft_reset()
// soft reset of MCU
{
    wdt_enable(WDTO_30MS);
      66:	29 e0       	ldi	r18, 0x09	; 9
      68:	88 e1       	ldi	r24, 0x18	; 24
      6a:	90 e0       	ldi	r25, 0x00	; 0
      6c:	0f b6       	in	r0, 0x3f	; 63
      6e:	f8 94       	cli
      70:	a8 95       	wdr
      72:	81 bd       	out	0x21, r24	; 33
      74:	0f be       	out	0x3f, r0	; 63
      76:	21 bd       	out	0x21, r18	; 33
      78:	ff cf       	rjmp	.-2      	; 0x78 <soft_reset+0x12>

0000007a <set_time>:
    for(;;);
}

void set_time(time_t time)
// set time to chip
{
      7a:	0f 93       	push	r16
      7c:	1f 93       	push	r17
      7e:	cf 93       	push	r28
      80:	df 93       	push	r29
      82:	cd b7       	in	r28, 0x3d	; 61
      84:	de b7       	in	r29, 0x3e	; 62
      86:	27 97       	sbiw	r28, 0x07	; 7
      88:	0f b6       	in	r0, 0x3f	; 63
      8a:	f8 94       	cli
      8c:	de bf       	out	0x3e, r29	; 62
      8e:	0f be       	out	0x3f, r0	; 63
      90:	cd bf       	out	0x3d, r28	; 61
    struct ymdhms_t t;
    ymdhms_from_time_t(&t, time);
      92:	89 01       	movw	r16, r18
      94:	9a 01       	movw	r18, r20
      96:	ab 01       	movw	r20, r22
      98:	bc 01       	movw	r22, r24
      9a:	ce 01       	movw	r24, r28
      9c:	01 96       	adiw	r24, 0x01	; 1
      9e:	58 d8       	rcall	.-3920   	; 0xfffff150 <__eeprom_end+0xff7ef150>
    ds1302_set_time(&t);
      a0:	ce 01       	movw	r24, r28
      a2:	01 96       	adiw	r24, 0x01	; 1
      a4:	85 d5       	rcall	.+2826   	; 0xbb0 <ds1302_set_time>
}
      a6:	27 96       	adiw	r28, 0x07	; 7
      a8:	0f b6       	in	r0, 0x3f	; 63
      aa:	f8 94       	cli
      ac:	de bf       	out	0x3e, r29	; 62
      ae:	0f be       	out	0x3f, r0	; 63
      b0:	cd bf       	out	0x3d, r28	; 61
      b2:	df 91       	pop	r29
      b4:	cf 91       	pop	r28
      b6:	1f 91       	pop	r17
      b8:	0f 91       	pop	r16
      ba:	08 95       	ret

000000bc <get_time>:

time_t get_time()
// get time from chip
{   
      bc:	cf 93       	push	r28
      be:	df 93       	push	r29
      c0:	cd b7       	in	r28, 0x3d	; 61
      c2:	de b7       	in	r29, 0x3e	; 62
      c4:	27 97       	sbiw	r28, 0x07	; 7
      c6:	0f b6       	in	r0, 0x3f	; 63
      c8:	f8 94       	cli
      ca:	de bf       	out	0x3e, r29	; 62
      cc:	0f be       	out	0x3f, r0	; 63
      ce:	cd bf       	out	0x3d, r28	; 61
    struct ymdhms_t t;
    ds1302_get_time(&t);
      d0:	ce 01       	movw	r24, r28
      d2:	01 96       	adiw	r24, 0x01	; 1
      d4:	e2 d4       	rcall	.+2500   	; 0xa9a <ds1302_get_time>
    return time_t_from_ymdhms(&t);
      d6:	ce 01       	movw	r24, r28
      d8:	01 96       	adiw	r24, 0x01	; 1
      da:	5c d6       	rcall	.+3256   	; 0xd94 <time_t_from_ymdhms>
}
      dc:	27 96       	adiw	r28, 0x07	; 7
      de:	0f b6       	in	r0, 0x3f	; 63
      e0:	f8 94       	cli
      e2:	de bf       	out	0x3e, r29	; 62
      e4:	0f be       	out	0x3f, r0	; 63
      e6:	cd bf       	out	0x3d, r28	; 61
      e8:	df 91       	pop	r29
      ea:	cf 91       	pop	r28
      ec:	08 95       	ret

000000ee <process_time>:

time_t process_time(time_t time)
// operations made to time each time it's read
{
      ee:	2f 92       	push	r2
      f0:	3f 92       	push	r3
      f2:	4f 92       	push	r4
      f4:	5f 92       	push	r5
      f6:	6f 92       	push	r6
      f8:	7f 92       	push	r7
      fa:	8f 92       	push	r8
      fc:	9f 92       	push	r9
      fe:	af 92       	push	r10
     100:	bf 92       	push	r11
     102:	cf 92       	push	r12
     104:	df 92       	push	r13
     106:	ef 92       	push	r14
     108:	ff 92       	push	r15
     10a:	0f 93       	push	r16
     10c:	1f 93       	push	r17
     10e:	cf 93       	push	r28
     110:	df 93       	push	r29
     112:	00 d0       	rcall	.+0      	; 0x114 <process_time+0x26>
     114:	00 d0       	rcall	.+0      	; 0x116 <process_time+0x28>
     116:	00 d0       	rcall	.+0      	; 0x118 <process_time+0x2a>
     118:	cd b7       	in	r28, 0x3d	; 61
     11a:	de b7       	in	r29, 0x3e	; 62
     11c:	29 01       	movw	r4, r18
     11e:	3a 01       	movw	r6, r20
     120:	4b 01       	movw	r8, r22
     122:	8e 83       	std	Y+6, r24	; 0x06
     124:	9d 83       	std	Y+5, r25	; 0x05
    // drift compensation
    if (permadata.drift)
     126:	20 90 68 01 	lds	r2, 0x0168
     12a:	30 90 69 01 	lds	r3, 0x0169
     12e:	b0 91 6a 01 	lds	r27, 0x016A
     132:	bc 83       	std	Y+4, r27	; 0x04
     134:	f0 91 6b 01 	lds	r31, 0x016B
     138:	e0 91 6c 01 	lds	r30, 0x016C
     13c:	b0 91 6d 01 	lds	r27, 0x016D
     140:	80 91 6e 01 	lds	r24, 0x016E
     144:	8a 83       	std	Y+2, r24	; 0x02
     146:	a0 91 6f 01 	lds	r26, 0x016F
     14a:	ab 83       	std	Y+3, r26	; 0x03
     14c:	91 01       	movw	r18, r2
     14e:	4c 81       	ldd	r20, Y+4	; 0x04
     150:	5f 2f       	mov	r21, r31
     152:	6e 2f       	mov	r22, r30
     154:	7b 2f       	mov	r23, r27
     156:	9a 2f       	mov	r25, r26
     158:	a0 e0       	ldi	r26, 0x00	; 0
     15a:	dc db       	rcall	.-2120   	; 0xfffff914 <__eeprom_end+0xff7ef914>
     15c:	49 f1       	breq	.+82     	; 0x1b0 <process_time+0xc2>
        time += (time - permadata.driftbase) / permadata.drift;
     15e:	92 01       	movw	r18, r4
     160:	a3 01       	movw	r20, r6
     162:	b4 01       	movw	r22, r8
     164:	8e 81       	ldd	r24, Y+6	; 0x06
     166:	9d 81       	ldd	r25, Y+5	; 0x05
     168:	a0 90 60 01 	lds	r10, 0x0160
     16c:	b0 90 61 01 	lds	r11, 0x0161
     170:	c0 90 62 01 	lds	r12, 0x0162
     174:	d0 90 63 01 	lds	r13, 0x0163
     178:	e0 90 64 01 	lds	r14, 0x0164
     17c:	f0 90 65 01 	lds	r15, 0x0165
     180:	00 91 66 01 	lds	r16, 0x0166
     184:	10 91 67 01 	lds	r17, 0x0167
     188:	bc db       	rcall	.-2184   	; 0xfffff902 <__eeprom_end+0xff7ef902>
     18a:	51 01       	movw	r10, r2
     18c:	cc 80       	ldd	r12, Y+4	; 0x04
     18e:	df 2e       	mov	r13, r31
     190:	ee 2e       	mov	r14, r30
     192:	fb 2e       	mov	r15, r27
     194:	0a 81       	ldd	r16, Y+2	; 0x02
     196:	1b 81       	ldd	r17, Y+3	; 0x03
     198:	cd da       	rcall	.-2662   	; 0xfffff734 <__eeprom_end+0xff7ef734>
     19a:	52 01       	movw	r10, r4
     19c:	63 01       	movw	r12, r6
     19e:	74 01       	movw	r14, r8
     1a0:	0e 81       	ldd	r16, Y+6	; 0x06
     1a2:	1d 81       	ldd	r17, Y+5	; 0x05
     1a4:	99 db       	rcall	.-2254   	; 0xfffff8d8 <__eeprom_end+0xff7ef8d8>
     1a6:	29 01       	movw	r4, r18
     1a8:	3a 01       	movw	r6, r20
     1aa:	4b 01       	movw	r8, r22
     1ac:	8e 83       	std	Y+6, r24	; 0x06
     1ae:	9d 83       	std	Y+5, r25	; 0x05
    return time;
}
     1b0:	92 01       	movw	r18, r4
     1b2:	a3 01       	movw	r20, r6
     1b4:	b4 01       	movw	r22, r8
     1b6:	8e 81       	ldd	r24, Y+6	; 0x06
     1b8:	9d 81       	ldd	r25, Y+5	; 0x05
     1ba:	26 96       	adiw	r28, 0x06	; 6
     1bc:	0f b6       	in	r0, 0x3f	; 63
     1be:	f8 94       	cli
     1c0:	de bf       	out	0x3e, r29	; 62
     1c2:	0f be       	out	0x3f, r0	; 63
     1c4:	cd bf       	out	0x3d, r28	; 61
     1c6:	df 91       	pop	r29
     1c8:	cf 91       	pop	r28
     1ca:	1f 91       	pop	r17
     1cc:	0f 91       	pop	r16
     1ce:	ff 90       	pop	r15
     1d0:	ef 90       	pop	r14
     1d2:	df 90       	pop	r13
     1d4:	cf 90       	pop	r12
     1d6:	bf 90       	pop	r11
     1d8:	af 90       	pop	r10
     1da:	9f 90       	pop	r9
     1dc:	8f 90       	pop	r8
     1de:	7f 90       	pop	r7
     1e0:	6f 90       	pop	r6
     1e2:	5f 90       	pop	r5
     1e4:	4f 90       	pop	r4
     1e6:	3f 90       	pop	r3
     1e8:	2f 90       	pop	r2
     1ea:	08 95       	ret

000001ec <update_display>:

void update_display()
// A single iteration for the dynamic LED display
{
    // turn off LEDs before we do anything
    ANODE_PORT &= ~ANODE_MASK;
     1ec:	88 b3       	in	r24, 0x18	; 24
     1ee:	87 7c       	andi	r24, 0xC7	; 199
     1f0:	88 bb       	out	0x18, r24	; 24

    // increment matrix counter
    if (++led_index >= CNT_N) led_index = 0;
     1f2:	80 91 26 01 	lds	r24, 0x0126
     1f6:	8f 5f       	subi	r24, 0xFF	; 255
     1f8:	88 30       	cpi	r24, 0x08	; 8
     1fa:	18 f4       	brcc	.+6      	; 0x202 <update_display+0x16>
     1fc:	80 93 26 01 	sts	0x0126, r24
     200:	02 c0       	rjmp	.+4      	; 0x206 <update_display+0x1a>
     202:	10 92 26 01 	sts	0x0126, r1

    // set port to desired value
    CNT_PORT |= CNT[led_index] << CNT_SHIFT;
     206:	25 b3       	in	r18, 0x15	; 21
     208:	e0 91 26 01 	lds	r30, 0x0126
     20c:	f0 e0       	ldi	r31, 0x00	; 0
     20e:	e0 57       	subi	r30, 0x70	; 112
     210:	ff 4f       	sbci	r31, 0xFF	; 255
     212:	80 81       	ld	r24, Z
     214:	34 e0       	ldi	r19, 0x04	; 4
     216:	83 9f       	mul	r24, r19
     218:	c0 01       	movw	r24, r0
     21a:	11 24       	eor	r1, r1
     21c:	28 2b       	or	r18, r24
     21e:	25 bb       	out	0x15, r18	; 21
    CNT_PORT &= ~CNT_MASK | (CNT[led_index] << CNT_SHIFT);
     220:	25 b3       	in	r18, 0x15	; 21
     222:	e0 91 26 01 	lds	r30, 0x0126
     226:	f0 e0       	ldi	r31, 0x00	; 0
     228:	e0 57       	subi	r30, 0x70	; 112
     22a:	ff 4f       	sbci	r31, 0xFF	; 255
     22c:	80 81       	ld	r24, Z
     22e:	34 e0       	ldi	r19, 0x04	; 4
     230:	83 9f       	mul	r24, r19
     232:	c0 01       	movw	r24, r0
     234:	11 24       	eor	r1, r1
     236:	83 6c       	ori	r24, 0xC3	; 195
     238:	82 23       	and	r24, r18
     23a:	85 bb       	out	0x15, r24	; 21

    ANODE_PORT |= led_matrix[led_index] << ANODE_SHIFT;
     23c:	28 b3       	in	r18, 0x18	; 24
     23e:	e0 91 26 01 	lds	r30, 0x0126
     242:	f0 e0       	ldi	r31, 0x00	; 0
     244:	e9 5d       	subi	r30, 0xD9	; 217
     246:	fe 4f       	sbci	r31, 0xFE	; 254
     248:	80 81       	ld	r24, Z
     24a:	38 e0       	ldi	r19, 0x08	; 8
     24c:	83 9f       	mul	r24, r19
     24e:	c0 01       	movw	r24, r0
     250:	11 24       	eor	r1, r1
     252:	28 2b       	or	r18, r24
     254:	28 bb       	out	0x18, r18	; 24
    ANODE_PORT &= ~ANODE_MASK | (led_matrix[led_index] << ANODE_SHIFT);
     256:	28 b3       	in	r18, 0x18	; 24
     258:	e0 91 26 01 	lds	r30, 0x0126
     25c:	f0 e0       	ldi	r31, 0x00	; 0
     25e:	e9 5d       	subi	r30, 0xD9	; 217
     260:	fe 4f       	sbci	r31, 0xFE	; 254
     262:	80 81       	ld	r24, Z
     264:	38 e0       	ldi	r19, 0x08	; 8
     266:	83 9f       	mul	r24, r19
     268:	c0 01       	movw	r24, r0
     26a:	11 24       	eor	r1, r1
     26c:	87 6c       	ori	r24, 0xC7	; 199
     26e:	82 23       	and	r24, r18
     270:	88 bb       	out	0x18, r24	; 24
     272:	08 95       	ret

00000274 <permawrite>:
}

void permawrite(void)
// write permadata to timechip's RAM
{
     274:	1f 93       	push	r17
     276:	cf 93       	push	r28
     278:	df 93       	push	r29
     27a:	c8 e5       	ldi	r28, 0x58	; 88
     27c:	d1 e0       	ldi	r29, 0x01	; 1
    uint8_t *buf;
    uint8_t index;
    buf = (uint8_t*)(&permadata);
    for (index = 0; index < sizeof(permadata); ++index)
     27e:	10 e0       	ldi	r17, 0x00	; 0
        ds1302_set_ram(index, *buf++);
     280:	69 91       	ld	r22, Y+
     282:	81 2f       	mov	r24, r17
     284:	04 d5       	rcall	.+2568   	; 0xc8e <ds1302_set_ram>
// write permadata to timechip's RAM
{
    uint8_t *buf;
    uint8_t index;
    buf = (uint8_t*)(&permadata);
    for (index = 0; index < sizeof(permadata); ++index)
     286:	1f 5f       	subi	r17, 0xFF	; 255
     288:	18 31       	cpi	r17, 0x18	; 24
     28a:	d1 f7       	brne	.-12     	; 0x280 <permawrite+0xc>
        ds1302_set_ram(index, *buf++);
}
     28c:	df 91       	pop	r29
     28e:	cf 91       	pop	r28
     290:	1f 91       	pop	r17
     292:	08 95       	ret

00000294 <permaread>:

void permaread(void)
// read permadata from timechip's RAM
{
     294:	1f 93       	push	r17
     296:	cf 93       	push	r28
     298:	df 93       	push	r29
     29a:	c8 e5       	ldi	r28, 0x58	; 88
     29c:	d1 e0       	ldi	r29, 0x01	; 1
    uint8_t *buf;
    uint8_t index;
    buf = (uint8_t*)(&permadata);
    for (index = 0; index < sizeof(permadata); ++index)
     29e:	10 e0       	ldi	r17, 0x00	; 0
        *buf++ = ds1302_get_ram(index);
     2a0:	81 2f       	mov	r24, r17
     2a2:	ee d4       	rcall	.+2524   	; 0xc80 <ds1302_get_ram>
     2a4:	89 93       	st	Y+, r24
// read permadata from timechip's RAM
{
    uint8_t *buf;
    uint8_t index;
    buf = (uint8_t*)(&permadata);
    for (index = 0; index < sizeof(permadata); ++index)
     2a6:	1f 5f       	subi	r17, 0xFF	; 255
     2a8:	18 31       	cpi	r17, 0x18	; 24
     2aa:	d1 f7       	brne	.-12     	; 0x2a0 <permaread+0xc>
        *buf++ = ds1302_get_ram(index);
}
     2ac:	df 91       	pop	r29
     2ae:	cf 91       	pop	r28
     2b0:	1f 91       	pop	r17
     2b2:	08 95       	ret

000002b4 <__vector_8>:

ISR(TIMER1_OVF_vect)
// TIMER1 interrupt vector. This is the same timer that does the LED PWM,
// so this function is executed in sync with the 0->1 PWM front
{
     2b4:	1f 92       	push	r1
     2b6:	0f 92       	push	r0
     2b8:	0f b6       	in	r0, 0x3f	; 63
     2ba:	0f 92       	push	r0
     2bc:	11 24       	eor	r1, r1
     2be:	2f 93       	push	r18
     2c0:	3f 93       	push	r19
     2c2:	4f 93       	push	r20
     2c4:	5f 93       	push	r21
     2c6:	6f 93       	push	r22
     2c8:	7f 93       	push	r23
     2ca:	8f 93       	push	r24
     2cc:	9f 93       	push	r25
     2ce:	af 93       	push	r26
     2d0:	bf 93       	push	r27
     2d2:	ef 93       	push	r30
     2d4:	ff 93       	push	r31
    update_display();
     2d6:	8a df       	rcall	.-236    	; 0x1ec <update_display>
}
     2d8:	ff 91       	pop	r31
     2da:	ef 91       	pop	r30
     2dc:	bf 91       	pop	r27
     2de:	af 91       	pop	r26
     2e0:	9f 91       	pop	r25
     2e2:	8f 91       	pop	r24
     2e4:	7f 91       	pop	r23
     2e6:	6f 91       	pop	r22
     2e8:	5f 91       	pop	r21
     2ea:	4f 91       	pop	r20
     2ec:	3f 91       	pop	r19
     2ee:	2f 91       	pop	r18
     2f0:	0f 90       	pop	r0
     2f2:	0f be       	out	0x3f, r0	; 63
     2f4:	0f 90       	pop	r0
     2f6:	1f 90       	pop	r1
     2f8:	18 95       	reti

000002fa <itoan>:

void itoan(uint64_t i, char *str)
// convert uint64_t to string (decimal)
{
     2fa:	2f 92       	push	r2
     2fc:	3f 92       	push	r3
     2fe:	4f 92       	push	r4
     300:	5f 92       	push	r5
     302:	6f 92       	push	r6
     304:	7f 92       	push	r7
     306:	8f 92       	push	r8
     308:	9f 92       	push	r9
     30a:	af 92       	push	r10
     30c:	bf 92       	push	r11
     30e:	cf 92       	push	r12
     310:	df 92       	push	r13
     312:	ef 92       	push	r14
     314:	ff 92       	push	r15
     316:	0f 93       	push	r16
     318:	1f 93       	push	r17
     31a:	cf 93       	push	r28
     31c:	df 93       	push	r29
     31e:	cd b7       	in	r28, 0x3d	; 61
     320:	de b7       	in	r29, 0x3e	; 62
     322:	29 97       	sbiw	r28, 0x09	; 9
     324:	0f b6       	in	r0, 0x3f	; 63
     326:	f8 94       	cli
     328:	de bf       	out	0x3e, r29	; 62
     32a:	0f be       	out	0x3f, r0	; 63
     32c:	cd bf       	out	0x3d, r28	; 61
     32e:	19 01       	movw	r2, r18
     330:	2a 01       	movw	r4, r20
     332:	3b 01       	movw	r6, r22
     334:	4c 01       	movw	r8, r24
     336:	1e 83       	std	Y+6, r17	; 0x06
     338:	0d 83       	std	Y+5, r16	; 0x05
    if (i == 0) {
     33a:	a0 e0       	ldi	r26, 0x00	; 0
     33c:	eb da       	rcall	.-2602   	; 0xfffff914 <__eeprom_end+0xff7ef914>
     33e:	09 f4       	brne	.+2      	; 0x342 <itoan+0x48>
     340:	54 c0       	rjmp	.+168    	; 0x3ea <itoan+0xf0>
     342:	b2 2d       	mov	r27, r2
     344:	3f 82       	std	Y+7, r3	; 0x07
     346:	49 86       	std	Y+9, r4	; 0x09
     348:	5a 82       	std	Y+2, r5	; 0x02
     34a:	6b 82       	std	Y+3, r6	; 0x03
     34c:	7c 82       	std	Y+4, r7	; 0x04
     34e:	f8 2d       	mov	r31, r8
     350:	e9 2d       	mov	r30, r9
     352:	19 82       	std	Y+1, r1	; 0x01
        return;
    }
    uint8_t index = 0;
    uint64_t j = i;
    while (i != 0) {
        i /= 10;
     354:	9a e0       	ldi	r25, 0x0A	; 10
     356:	a9 2e       	mov	r10, r25
     358:	b1 2c       	mov	r11, r1
     35a:	c1 2c       	mov	r12, r1
     35c:	d1 2c       	mov	r13, r1
     35e:	e1 2c       	mov	r14, r1
     360:	f1 2c       	mov	r15, r1
     362:	00 e0       	ldi	r16, 0x00	; 0
     364:	10 e0       	ldi	r17, 0x00	; 0
     366:	2b 2f       	mov	r18, r27
     368:	3f 81       	ldd	r19, Y+7	; 0x07
     36a:	49 85       	ldd	r20, Y+9	; 0x09
     36c:	5a 81       	ldd	r21, Y+2	; 0x02
     36e:	6b 81       	ldd	r22, Y+3	; 0x03
     370:	7c 81       	ldd	r23, Y+4	; 0x04
     372:	8f 2f       	mov	r24, r31
     374:	9e 2f       	mov	r25, r30
     376:	de d9       	rcall	.-3140   	; 0xfffff734 <__eeprom_end+0xff7ef734>
     378:	b2 2f       	mov	r27, r18
     37a:	3f 83       	std	Y+7, r19	; 0x07
     37c:	49 87       	std	Y+9, r20	; 0x09
     37e:	5a 83       	std	Y+2, r21	; 0x02
     380:	6b 83       	std	Y+3, r22	; 0x03
     382:	7c 83       	std	Y+4, r23	; 0x04
     384:	f8 2f       	mov	r31, r24
     386:	e9 2f       	mov	r30, r25
        ++index;
     388:	29 81       	ldd	r18, Y+1	; 0x01
     38a:	2f 5f       	subi	r18, 0xFF	; 255
     38c:	29 83       	std	Y+1, r18	; 0x01
        str[0] = '0';
        return;
    }
    uint8_t index = 0;
    uint64_t j = i;
    while (i != 0) {
     38e:	2b 2f       	mov	r18, r27
     390:	a0 e0       	ldi	r26, 0x00	; 0
     392:	c0 da       	rcall	.-2688   	; 0xfffff914 <__eeprom_end+0xff7ef914>
     394:	f9 f6       	brne	.-66     	; 0x354 <itoan+0x5a>
        i /= 10;
        ++index;
    }

    while (j != 0) {
        str[index - 1] = '0' + (j % 10);
     396:	8d 81       	ldd	r24, Y+5	; 0x05
     398:	9e 81       	ldd	r25, Y+6	; 0x06
     39a:	a9 81       	ldd	r26, Y+1	; 0x01
     39c:	8a 0f       	add	r24, r26
     39e:	91 1d       	adc	r25, r1
     3a0:	01 97       	sbiw	r24, 0x01	; 1
     3a2:	98 87       	std	Y+8, r25	; 0x08
     3a4:	8f 83       	std	Y+7, r24	; 0x07
     3a6:	8a e0       	ldi	r24, 0x0A	; 10
     3a8:	a8 2e       	mov	r10, r24
     3aa:	b1 2c       	mov	r11, r1
     3ac:	c1 2c       	mov	r12, r1
     3ae:	d1 2c       	mov	r13, r1
     3b0:	e1 2c       	mov	r14, r1
     3b2:	f1 2c       	mov	r15, r1
     3b4:	00 e0       	ldi	r16, 0x00	; 0
     3b6:	10 e0       	ldi	r17, 0x00	; 0
     3b8:	91 01       	movw	r18, r2
     3ba:	a2 01       	movw	r20, r4
     3bc:	b3 01       	movw	r22, r6
     3be:	c4 01       	movw	r24, r8
     3c0:	b7 d9       	rcall	.-3218   	; 0xfffff730 <__eeprom_end+0xff7ef730>
     3c2:	20 5d       	subi	r18, 0xD0	; 208
     3c4:	ef 81       	ldd	r30, Y+7	; 0x07
     3c6:	f8 85       	ldd	r31, Y+8	; 0x08
     3c8:	20 83       	st	Z, r18
        j /= 10;
     3ca:	91 01       	movw	r18, r2
     3cc:	a2 01       	movw	r20, r4
     3ce:	b3 01       	movw	r22, r6
     3d0:	c4 01       	movw	r24, r8
     3d2:	b0 d9       	rcall	.-3232   	; 0xfffff734 <__eeprom_end+0xff7ef734>
     3d4:	19 01       	movw	r2, r18
     3d6:	2a 01       	movw	r4, r20
     3d8:	3b 01       	movw	r6, r22
     3da:	4c 01       	movw	r8, r24
        --index;
     3dc:	f9 81       	ldd	r31, Y+1	; 0x01
     3de:	f1 50       	subi	r31, 0x01	; 1
     3e0:	f9 83       	std	Y+1, r31	; 0x01
    while (i != 0) {
        i /= 10;
        ++index;
    }

    while (j != 0) {
     3e2:	a0 e0       	ldi	r26, 0x00	; 0
     3e4:	97 da       	rcall	.-2770   	; 0xfffff914 <__eeprom_end+0xff7ef914>
     3e6:	b9 f6       	brne	.-82     	; 0x396 <itoan+0x9c>
     3e8:	04 c0       	rjmp	.+8      	; 0x3f2 <itoan+0xf8>

void itoan(uint64_t i, char *str)
// convert uint64_t to string (decimal)
{
    if (i == 0) {
        str[0] = '0';
     3ea:	80 e3       	ldi	r24, 0x30	; 48
     3ec:	ad 81       	ldd	r26, Y+5	; 0x05
     3ee:	be 81       	ldd	r27, Y+6	; 0x06
     3f0:	8c 93       	st	X, r24
    while (j != 0) {
        str[index - 1] = '0' + (j % 10);
        j /= 10;
        --index;
    }
}
     3f2:	29 96       	adiw	r28, 0x09	; 9
     3f4:	0f b6       	in	r0, 0x3f	; 63
     3f6:	f8 94       	cli
     3f8:	de bf       	out	0x3e, r29	; 62
     3fa:	0f be       	out	0x3f, r0	; 63
     3fc:	cd bf       	out	0x3d, r28	; 61
     3fe:	df 91       	pop	r29
     400:	cf 91       	pop	r28
     402:	1f 91       	pop	r17
     404:	0f 91       	pop	r16
     406:	ff 90       	pop	r15
     408:	ef 90       	pop	r14
     40a:	df 90       	pop	r13
     40c:	cf 90       	pop	r12
     40e:	bf 90       	pop	r11
     410:	af 90       	pop	r10
     412:	9f 90       	pop	r9
     414:	8f 90       	pop	r8
     416:	7f 90       	pop	r7
     418:	6f 90       	pop	r6
     41a:	5f 90       	pop	r5
     41c:	4f 90       	pop	r4
     41e:	3f 90       	pop	r3
     420:	2f 90       	pop	r2
     422:	08 95       	ret

00000424 <atoin>:

bool atoin(uint64_t *i, char *str)
// convert string (decimal) to uint64_t
{
     424:	2f 92       	push	r2
     426:	3f 92       	push	r3
     428:	4f 92       	push	r4
     42a:	5f 92       	push	r5
     42c:	6f 92       	push	r6
     42e:	7f 92       	push	r7
     430:	8f 92       	push	r8
     432:	9f 92       	push	r9
     434:	af 92       	push	r10
     436:	bf 92       	push	r11
     438:	cf 92       	push	r12
     43a:	df 92       	push	r13
     43c:	ef 92       	push	r14
     43e:	ff 92       	push	r15
     440:	0f 93       	push	r16
     442:	1f 93       	push	r17
     444:	cf 93       	push	r28
     446:	df 93       	push	r29
     448:	fc 01       	movw	r30, r24
    *i = 0;
     44a:	10 82       	st	Z, r1
     44c:	11 82       	std	Z+1, r1	; 0x01
     44e:	12 82       	std	Z+2, r1	; 0x02
     450:	13 82       	std	Z+3, r1	; 0x03
     452:	14 82       	std	Z+4, r1	; 0x04
     454:	15 82       	std	Z+5, r1	; 0x05
     456:	16 82       	std	Z+6, r1	; 0x06
     458:	17 82       	std	Z+7, r1	; 0x07
     45a:	db 01       	movw	r26, r22
     45c:	ed 01       	movw	r28, r26
    uint8_t digit;
    while (str[0] != '\0') {
     45e:	8c 91       	ld	r24, X
     460:	88 23       	and	r24, r24
     462:	d9 f1       	breq	.+118    	; 0x4da <__stack+0x7b>
        *i *= 10;
     464:	20 81       	ld	r18, Z
     466:	31 81       	ldd	r19, Z+1	; 0x01
     468:	42 81       	ldd	r20, Z+2	; 0x02
     46a:	53 81       	ldd	r21, Z+3	; 0x03
     46c:	64 81       	ldd	r22, Z+4	; 0x04
     46e:	75 81       	ldd	r23, Z+5	; 0x05
     470:	86 81       	ldd	r24, Z+6	; 0x06
     472:	97 81       	ldd	r25, Z+7	; 0x07
     474:	01 e0       	ldi	r16, 0x01	; 1
     476:	f9 d9       	rcall	.-3086   	; 0xfffff86a <__eeprom_end+0xff7ef86a>
     478:	19 01       	movw	r2, r18
     47a:	2a 01       	movw	r4, r20
     47c:	3b 01       	movw	r6, r22
     47e:	4c 01       	movw	r8, r24
     480:	02 e0       	ldi	r16, 0x02	; 2
     482:	f3 d9       	rcall	.-3098   	; 0xfffff86a <__eeprom_end+0xff7ef86a>
     484:	59 01       	movw	r10, r18
     486:	6a 01       	movw	r12, r20
     488:	7b 01       	movw	r14, r22
     48a:	8c 01       	movw	r16, r24
     48c:	91 01       	movw	r18, r2
     48e:	a2 01       	movw	r20, r4
     490:	b3 01       	movw	r22, r6
     492:	c4 01       	movw	r24, r8
     494:	21 da       	rcall	.-3006   	; 0xfffff8d8 <__eeprom_end+0xff7ef8d8>
     496:	59 01       	movw	r10, r18
     498:	6a 01       	movw	r12, r20
     49a:	7b 01       	movw	r14, r22
     49c:	8c 01       	movw	r16, r24
     49e:	20 83       	st	Z, r18
     4a0:	b1 82       	std	Z+1, r11	; 0x01
     4a2:	42 83       	std	Z+2, r20	; 0x02
     4a4:	d3 82       	std	Z+3, r13	; 0x03
     4a6:	64 83       	std	Z+4, r22	; 0x04
     4a8:	f5 82       	std	Z+5, r15	; 0x05
     4aa:	86 83       	std	Z+6, r24	; 0x06
     4ac:	17 83       	std	Z+7, r17	; 0x07
     4ae:	11 96       	adiw	r26, 0x01	; 1
        digit = str[0] - '0';
     4b0:	28 81       	ld	r18, Y
     4b2:	20 53       	subi	r18, 0x30	; 48
        if (digit > 9)
     4b4:	2a 30       	cpi	r18, 0x0A	; 10
     4b6:	98 f4       	brcc	.+38     	; 0x4de <__stack+0x7f>
            return false;
        *i += digit;
     4b8:	30 e0       	ldi	r19, 0x00	; 0
     4ba:	40 e0       	ldi	r20, 0x00	; 0
     4bc:	50 e0       	ldi	r21, 0x00	; 0
     4be:	60 e0       	ldi	r22, 0x00	; 0
     4c0:	70 e0       	ldi	r23, 0x00	; 0
     4c2:	80 e0       	ldi	r24, 0x00	; 0
     4c4:	90 e0       	ldi	r25, 0x00	; 0
     4c6:	08 da       	rcall	.-3056   	; 0xfffff8d8 <__eeprom_end+0xff7ef8d8>
     4c8:	20 83       	st	Z, r18
     4ca:	31 83       	std	Z+1, r19	; 0x01
     4cc:	42 83       	std	Z+2, r20	; 0x02
     4ce:	53 83       	std	Z+3, r21	; 0x03
     4d0:	64 83       	std	Z+4, r22	; 0x04
     4d2:	75 83       	std	Z+5, r23	; 0x05
     4d4:	86 83       	std	Z+6, r24	; 0x06
     4d6:	97 83       	std	Z+7, r25	; 0x07
     4d8:	c1 cf       	rjmp	.-126    	; 0x45c <atoin+0x38>
        ++str;
    }
    return true;
     4da:	81 e0       	ldi	r24, 0x01	; 1
     4dc:	01 c0       	rjmp	.+2      	; 0x4e0 <__stack+0x81>
    uint8_t digit;
    while (str[0] != '\0') {
        *i *= 10;
        digit = str[0] - '0';
        if (digit > 9)
            return false;
     4de:	80 e0       	ldi	r24, 0x00	; 0
        *i += digit;
        ++str;
    }
    return true;
}
     4e0:	df 91       	pop	r29
     4e2:	cf 91       	pop	r28
     4e4:	1f 91       	pop	r17
     4e6:	0f 91       	pop	r16
     4e8:	ff 90       	pop	r15
     4ea:	ef 90       	pop	r14
     4ec:	df 90       	pop	r13
     4ee:	cf 90       	pop	r12
     4f0:	bf 90       	pop	r11
     4f2:	af 90       	pop	r10
     4f4:	9f 90       	pop	r9
     4f6:	8f 90       	pop	r8
     4f8:	7f 90       	pop	r7
     4fa:	6f 90       	pop	r6
     4fc:	5f 90       	pop	r5
     4fe:	4f 90       	pop	r4
     500:	3f 90       	pop	r3
     502:	2f 90       	pop	r2
     504:	08 95       	ret

00000506 <process_input_command>:

bool process_input_command(char *str)
// interpret simple commands
{
     506:	ef 92       	push	r14
     508:	ff 92       	push	r15
     50a:	0f 93       	push	r16
     50c:	1f 93       	push	r17
     50e:	cf 93       	push	r28
     510:	df 93       	push	r29
     512:	cd b7       	in	r28, 0x3d	; 61
     514:	de b7       	in	r29, 0x3e	; 62
     516:	64 97       	sbiw	r28, 0x14	; 20
     518:	0f b6       	in	r0, 0x3f	; 63
     51a:	f8 94       	cli
     51c:	de bf       	out	0x3e, r29	; 62
     51e:	0f be       	out	0x3f, r0	; 63
     520:	cd bf       	out	0x3d, r28	; 61
     522:	8c 01       	movw	r16, r24
     *
     * ESC clears the buffer and cancels any previously unfinished command.
     *
     */

    if (str[0] == 'q') {
     524:	dc 01       	movw	r26, r24
     526:	9c 91       	ld	r25, X
     528:	91 37       	cpi	r25, 0x71	; 113
     52a:	09 f4       	brne	.+2      	; 0x52e <process_input_command+0x28>
        soft_reset();
     52c:	9c dd       	rcall	.-1224   	; 0x66 <soft_reset>
        return true;    // *evil face*
    }

    if (strlen(str) < 2) {
     52e:	f8 01       	movw	r30, r16
     530:	01 90       	ld	r0, Z+
     532:	00 20       	and	r0, r0
     534:	e9 f7       	brne	.-6      	; 0x530 <process_input_command+0x2a>
     536:	31 97       	sbiw	r30, 0x01	; 1
     538:	e0 1b       	sub	r30, r16
     53a:	f1 0b       	sbc	r31, r17
     53c:	32 97       	sbiw	r30, 0x02	; 2
     53e:	08 f4       	brcc	.+2      	; 0x542 <process_input_command+0x3c>
     540:	7f c0       	rjmp	.+254    	; 0x640 <process_input_command+0x13a>
        return false;
    }

    uint64_t *ptr;
    time_t time = 0;
     542:	1d 86       	std	Y+13, r1	; 0x0d
     544:	1e 86       	std	Y+14, r1	; 0x0e
     546:	1f 86       	std	Y+15, r1	; 0x0f
     548:	18 8a       	std	Y+16, r1	; 0x10
     54a:	19 8a       	std	Y+17, r1	; 0x11
     54c:	1a 8a       	std	Y+18, r1	; 0x12
     54e:	1b 8a       	std	Y+19, r1	; 0x13
     550:	1c 8a       	std	Y+20, r1	; 0x14

    switch(str[1]) {
     552:	f8 01       	movw	r30, r16
     554:	81 81       	ldd	r24, Z+1	; 0x01
     556:	84 36       	cpi	r24, 0x64	; 100
     558:	c1 f0       	breq	.+48     	; 0x58a <process_input_command+0x84>
     55a:	40 f4       	brcc	.+16     	; 0x56c <process_input_command+0x66>
     55c:	82 36       	cpi	r24, 0x62	; 98
     55e:	09 f0       	breq	.+2      	; 0x562 <process_input_command+0x5c>
     560:	6f c0       	rjmp	.+222    	; 0x640 <process_input_command+0x13a>
        case 'l':
            ptr = (uint64_t*)(&(permadata.lastset));
            break;
        case 'b':
            ptr = (uint64_t*)(&(permadata.driftbase));
     562:	20 e6       	ldi	r18, 0x60	; 96
     564:	e2 2e       	mov	r14, r18
     566:	21 e0       	ldi	r18, 0x01	; 1
     568:	f2 2e       	mov	r15, r18
     56a:	13 c0       	rjmp	.+38     	; 0x592 <process_input_command+0x8c>
    }

    uint64_t *ptr;
    time_t time = 0;

    switch(str[1]) {
     56c:	8c 36       	cpi	r24, 0x6C	; 108
     56e:	41 f0       	breq	.+16     	; 0x580 <process_input_command+0x7a>
     570:	84 37       	cpi	r24, 0x74	; 116
     572:	09 f0       	breq	.+2      	; 0x576 <process_input_command+0x70>
     574:	65 c0       	rjmp	.+202    	; 0x640 <process_input_command+0x13a>
            break;
        case 'd':
            ptr = (uint64_t*)(&(permadata.drift));
            break;
        case 't':
            ptr = (uint64_t*)(&time);
     576:	7e 01       	movw	r14, r28
     578:	fd e0       	ldi	r31, 0x0D	; 13
     57a:	ef 0e       	add	r14, r31
     57c:	f1 1c       	adc	r15, r1
            break;
     57e:	09 c0       	rjmp	.+18     	; 0x592 <process_input_command+0x8c>
    uint64_t *ptr;
    time_t time = 0;

    switch(str[1]) {
        case 'l':
            ptr = (uint64_t*)(&(permadata.lastset));
     580:	48 e5       	ldi	r20, 0x58	; 88
     582:	e4 2e       	mov	r14, r20
     584:	41 e0       	ldi	r20, 0x01	; 1
     586:	f4 2e       	mov	r15, r20
     588:	04 c0       	rjmp	.+8      	; 0x592 <process_input_command+0x8c>
            break;
        case 'b':
            ptr = (uint64_t*)(&(permadata.driftbase));
            break;
        case 'd':
            ptr = (uint64_t*)(&(permadata.drift));
     58a:	38 e6       	ldi	r19, 0x68	; 104
     58c:	e3 2e       	mov	r14, r19
     58e:	31 e0       	ldi	r19, 0x01	; 1
     590:	f3 2e       	mov	r15, r19
            break;
        default:
            return false;
    }

    char num_str[12] = "";
     592:	19 82       	std	Y+1, r1	; 0x01
     594:	1a 82       	std	Y+2, r1	; 0x02
     596:	1b 82       	std	Y+3, r1	; 0x03
     598:	1c 82       	std	Y+4, r1	; 0x04
     59a:	fe 01       	movw	r30, r28
     59c:	35 96       	adiw	r30, 0x05	; 5
     59e:	28 e0       	ldi	r18, 0x08	; 8
     5a0:	df 01       	movw	r26, r30
     5a2:	1d 92       	st	X+, r1
     5a4:	2a 95       	dec	r18
     5a6:	e9 f7       	brne	.-6      	; 0x5a2 <process_input_command+0x9c>
    char* num_ptr;
    switch(str[0]) {
     5a8:	92 37       	cpi	r25, 0x72	; 114
     5aa:	19 f0       	breq	.+6      	; 0x5b2 <process_input_command+0xac>
     5ac:	97 37       	cpi	r25, 0x77	; 119
     5ae:	59 f1       	breq	.+86     	; 0x606 <process_input_command+0x100>
     5b0:	47 c0       	rjmp	.+142    	; 0x640 <process_input_command+0x13a>
        case 'r':
            if (str[1] == 't') {
     5b2:	84 37       	cpi	r24, 0x74	; 116
     5b4:	b9 f4       	brne	.+46     	; 0x5e4 <process_input_command+0xde>
                time = get_time();
     5b6:	82 dd       	rcall	.-1276   	; 0xbc <get_time>
     5b8:	2d 87       	std	Y+13, r18	; 0x0d
     5ba:	3e 87       	std	Y+14, r19	; 0x0e
     5bc:	4f 87       	std	Y+15, r20	; 0x0f
     5be:	58 8b       	std	Y+16, r21	; 0x10
     5c0:	69 8b       	std	Y+17, r22	; 0x11
     5c2:	7a 8b       	std	Y+18, r23	; 0x12
     5c4:	8b 8b       	std	Y+19, r24	; 0x13
     5c6:	9c 8b       	std	Y+20, r25	; 0x14
                if (str[2] == '?')
     5c8:	d8 01       	movw	r26, r16
     5ca:	12 96       	adiw	r26, 0x02	; 2
     5cc:	ec 91       	ld	r30, X
     5ce:	ef 33       	cpi	r30, 0x3F	; 63
     5d0:	49 f4       	brne	.+18     	; 0x5e4 <process_input_command+0xde>
                    time = process_time(time);
     5d2:	8d dd       	rcall	.-1254   	; 0xee <process_time>
     5d4:	2d 87       	std	Y+13, r18	; 0x0d
     5d6:	3e 87       	std	Y+14, r19	; 0x0e
     5d8:	4f 87       	std	Y+15, r20	; 0x0f
     5da:	58 8b       	std	Y+16, r21	; 0x10
     5dc:	69 8b       	std	Y+17, r22	; 0x11
     5de:	7a 8b       	std	Y+18, r23	; 0x12
     5e0:	8b 8b       	std	Y+19, r24	; 0x13
     5e2:	9c 8b       	std	Y+20, r25	; 0x14
            }

            itoan(*ptr, num_str);
     5e4:	f7 01       	movw	r30, r14
     5e6:	20 81       	ld	r18, Z
     5e8:	31 81       	ldd	r19, Z+1	; 0x01
     5ea:	42 81       	ldd	r20, Z+2	; 0x02
     5ec:	53 81       	ldd	r21, Z+3	; 0x03
     5ee:	64 81       	ldd	r22, Z+4	; 0x04
     5f0:	75 81       	ldd	r23, Z+5	; 0x05
     5f2:	8e 01       	movw	r16, r28
     5f4:	0f 5f       	subi	r16, 0xFF	; 255
     5f6:	1f 4f       	sbci	r17, 0xFF	; 255
     5f8:	86 81       	ldd	r24, Z+6	; 0x06
     5fa:	97 81       	ldd	r25, Z+7	; 0x07
     5fc:	7e de       	rcall	.-772    	; 0x2fa <itoan>
            usart_write_string(num_str, true);
     5fe:	61 e0       	ldi	r22, 0x01	; 1
     600:	c8 01       	movw	r24, r16
     602:	86 d3       	rcall	.+1804   	; 0xd10 <usart_write_string>
     604:	1b c0       	rjmp	.+54     	; 0x63c <process_input_command+0x136>
            return true;
        case 'w':
            num_ptr = &(str[2]);
     606:	b8 01       	movw	r22, r16
     608:	6e 5f       	subi	r22, 0xFE	; 254
     60a:	7f 4f       	sbci	r23, 0xFF	; 255
            if (!atoin(ptr, num_ptr))
     60c:	c7 01       	movw	r24, r14
     60e:	0a df       	rcall	.-492    	; 0x424 <atoin>
     610:	88 23       	and	r24, r24
     612:	b1 f0       	breq	.+44     	; 0x640 <process_input_command+0x13a>
                return false;
            usart_write_string("ok", true);
     614:	61 e0       	ldi	r22, 0x01	; 1
     616:	80 e0       	ldi	r24, 0x00	; 0
     618:	91 e0       	ldi	r25, 0x01	; 1
     61a:	7a d3       	rcall	.+1780   	; 0xd10 <usart_write_string>

            if (str[1] == 't')
     61c:	d8 01       	movw	r26, r16
     61e:	11 96       	adiw	r26, 0x01	; 1
     620:	8c 91       	ld	r24, X
     622:	84 37       	cpi	r24, 0x74	; 116
     624:	51 f4       	brne	.+20     	; 0x63a <process_input_command+0x134>
                set_time(time);
     626:	2d 85       	ldd	r18, Y+13	; 0x0d
     628:	3e 85       	ldd	r19, Y+14	; 0x0e
     62a:	4f 85       	ldd	r20, Y+15	; 0x0f
     62c:	58 89       	ldd	r21, Y+16	; 0x10
     62e:	69 89       	ldd	r22, Y+17	; 0x11
     630:	7a 89       	ldd	r23, Y+18	; 0x12
     632:	8b 89       	ldd	r24, Y+19	; 0x13
     634:	9c 89       	ldd	r25, Y+20	; 0x14
     636:	21 dd       	rcall	.-1470   	; 0x7a <set_time>
     638:	01 c0       	rjmp	.+2      	; 0x63c <process_input_command+0x136>
            else
                permawrite();
     63a:	1c de       	rcall	.-968    	; 0x274 <permawrite>

            return true;
     63c:	81 e0       	ldi	r24, 0x01	; 1
     63e:	01 c0       	rjmp	.+2      	; 0x642 <process_input_command+0x13c>
        default:
            return false;
     640:	80 e0       	ldi	r24, 0x00	; 0
    }
    return false;
}
     642:	64 96       	adiw	r28, 0x14	; 20
     644:	0f b6       	in	r0, 0x3f	; 63
     646:	f8 94       	cli
     648:	de bf       	out	0x3e, r29	; 62
     64a:	0f be       	out	0x3f, r0	; 63
     64c:	cd bf       	out	0x3d, r28	; 61
     64e:	df 91       	pop	r29
     650:	cf 91       	pop	r28
     652:	1f 91       	pop	r17
     654:	0f 91       	pop	r16
     656:	ff 90       	pop	r15
     658:	ef 90       	pop	r14
     65a:	08 95       	ret

0000065c <process_usart_line>:

void process_usart_line(char *str)
// process line from USART (called upon receiving \n or buffer overflow)
{
    if (!process_input_command(str)) {
     65c:	54 df       	rcall	.-344    	; 0x506 <process_input_command>
     65e:	81 11       	cpse	r24, r1
     660:	04 c0       	rjmp	.+8      	; 0x66a <process_usart_line+0xe>
        usart_write_string("fail", true);
     662:	61 e0       	ldi	r22, 0x01	; 1
     664:	83 e0       	ldi	r24, 0x03	; 3
     666:	91 e0       	ldi	r25, 0x01	; 1
     668:	53 c3       	rjmp	.+1702   	; 0xd10 <usart_write_string>
     66a:	08 95       	ret

0000066c <__vector_11>:
    }
}

ISR(USART_RXC_vect)
// USART character received interrupt
{
     66c:	1f 92       	push	r1
     66e:	0f 92       	push	r0
     670:	0f b6       	in	r0, 0x3f	; 63
     672:	0f 92       	push	r0
     674:	11 24       	eor	r1, r1
     676:	df 92       	push	r13
     678:	ef 92       	push	r14
     67a:	ff 92       	push	r15
     67c:	0f 93       	push	r16
     67e:	1f 93       	push	r17
     680:	2f 93       	push	r18
     682:	3f 93       	push	r19
     684:	4f 93       	push	r20
     686:	5f 93       	push	r21
     688:	6f 93       	push	r22
     68a:	7f 93       	push	r23
     68c:	8f 93       	push	r24
     68e:	9f 93       	push	r25
     690:	af 93       	push	r26
     692:	bf 93       	push	r27
     694:	ef 93       	push	r30
     696:	ff 93       	push	r31
     698:	cf 93       	push	r28
     69a:	df 93       	push	r29
     69c:	cd b7       	in	r28, 0x3d	; 61
     69e:	de b7       	in	r29, 0x3e	; 62
     6a0:	2c 97       	sbiw	r28, 0x0c	; 12
     6a2:	de bf       	out	0x3e, r29	; 62
     6a4:	cd bf       	out	0x3d, r28	; 61
    static char buf[40] = {};
    static uint8_t index = 0;
    char c;

    c = usart_read_byte();
     6a6:	17 d3       	rcall	.+1582   	; 0xcd6 <usart_read_byte>

#ifdef BRCAL
    // Brightness calibration mode
    // LED brightness is controlled with the 'ujik' keys
    // the 'o' key displays current brightness status
    switch(c) {
     6a8:	8b 36       	cpi	r24, 0x6B	; 107
     6aa:	51 f1       	breq	.+84     	; 0x700 <__vector_11+0x94>
     6ac:	28 f4       	brcc	.+10     	; 0x6b8 <__vector_11+0x4c>
     6ae:	89 36       	cpi	r24, 0x69	; 105
     6b0:	e9 f0       	breq	.+58     	; 0x6ec <__vector_11+0x80>
     6b2:	8a 36       	cpi	r24, 0x6A	; 106
     6b4:	81 f0       	breq	.+32     	; 0x6d6 <__vector_11+0x6a>
     6b6:	83 c0       	rjmp	.+262    	; 0x7be <__vector_11+0x152>
     6b8:	8f 36       	cpi	r24, 0x6F	; 111
     6ba:	69 f1       	breq	.+90     	; 0x716 <__vector_11+0xaa>
     6bc:	85 37       	cpi	r24, 0x75	; 117
     6be:	09 f0       	breq	.+2      	; 0x6c2 <__vector_11+0x56>
     6c0:	7e c0       	rjmp	.+252    	; 0x7be <__vector_11+0x152>
        case 'u':
            if (OCR1A < PWM_TOP) ++OCR1A;
     6c2:	8a b5       	in	r24, 0x2a	; 42
     6c4:	9b b5       	in	r25, 0x2b	; 43
     6c6:	81 3a       	cpi	r24, 0xA1	; 161
     6c8:	9b 43       	sbci	r25, 0x3B	; 59
     6ca:	08 f0       	brcs	.+2      	; 0x6ce <__vector_11+0x62>
     6cc:	98 c0       	rjmp	.+304    	; 0x7fe <__vector_11+0x192>
     6ce:	8a b5       	in	r24, 0x2a	; 42
     6d0:	9b b5       	in	r25, 0x2b	; 43
     6d2:	01 96       	adiw	r24, 0x01	; 1
     6d4:	08 c0       	rjmp	.+16     	; 0x6e6 <__vector_11+0x7a>
            return;
        case 'j':
            if (OCR1A > 0) --OCR1A;
     6d6:	8a b5       	in	r24, 0x2a	; 42
     6d8:	9b b5       	in	r25, 0x2b	; 43
     6da:	89 2b       	or	r24, r25
     6dc:	09 f4       	brne	.+2      	; 0x6e0 <__vector_11+0x74>
     6de:	8f c0       	rjmp	.+286    	; 0x7fe <__vector_11+0x192>
     6e0:	8a b5       	in	r24, 0x2a	; 42
     6e2:	9b b5       	in	r25, 0x2b	; 43
     6e4:	01 97       	sbiw	r24, 0x01	; 1
     6e6:	9b bd       	out	0x2b, r25	; 43
     6e8:	8a bd       	out	0x2a, r24	; 42
     6ea:	89 c0       	rjmp	.+274    	; 0x7fe <__vector_11+0x192>
            return;
        case 'i':
            if (OCR1B < PWM_TOP) ++OCR1B;
     6ec:	88 b5       	in	r24, 0x28	; 40
     6ee:	99 b5       	in	r25, 0x29	; 41
     6f0:	81 3a       	cpi	r24, 0xA1	; 161
     6f2:	9b 43       	sbci	r25, 0x3B	; 59
     6f4:	08 f0       	brcs	.+2      	; 0x6f8 <__vector_11+0x8c>
     6f6:	83 c0       	rjmp	.+262    	; 0x7fe <__vector_11+0x192>
     6f8:	88 b5       	in	r24, 0x28	; 40
     6fa:	99 b5       	in	r25, 0x29	; 41
     6fc:	01 96       	adiw	r24, 0x01	; 1
     6fe:	08 c0       	rjmp	.+16     	; 0x710 <__vector_11+0xa4>
            return;
        case 'k':
            if (OCR1B > 0) --OCR1B;
     700:	88 b5       	in	r24, 0x28	; 40
     702:	99 b5       	in	r25, 0x29	; 41
     704:	89 2b       	or	r24, r25
     706:	09 f4       	brne	.+2      	; 0x70a <__vector_11+0x9e>
     708:	7a c0       	rjmp	.+244    	; 0x7fe <__vector_11+0x192>
     70a:	88 b5       	in	r24, 0x28	; 40
     70c:	99 b5       	in	r25, 0x29	; 41
     70e:	01 97       	sbiw	r24, 0x01	; 1
     710:	99 bd       	out	0x29, r25	; 41
     712:	88 bd       	out	0x28, r24	; 40
     714:	74 c0       	rjmp	.+232    	; 0x7fe <__vector_11+0x192>
            return;
        case 'o':

            usart_write_string("OCR1A: ", false);
     716:	60 e0       	ldi	r22, 0x00	; 0
     718:	88 e0       	ldi	r24, 0x08	; 8
     71a:	91 e0       	ldi	r25, 0x01	; 1
     71c:	f9 d2       	rcall	.+1522   	; 0xd10 <usart_write_string>
            char num_str[12] = "";                  // empty string to store value
     71e:	19 82       	std	Y+1, r1	; 0x01
     720:	1a 82       	std	Y+2, r1	; 0x02
     722:	1b 82       	std	Y+3, r1	; 0x03
     724:	1c 82       	std	Y+4, r1	; 0x04
     726:	fe 01       	movw	r30, r28
     728:	35 96       	adiw	r30, 0x05	; 5
     72a:	88 e0       	ldi	r24, 0x08	; 8
     72c:	df 01       	movw	r26, r30
     72e:	1d 92       	st	X+, r1
     730:	8a 95       	dec	r24
     732:	e9 f7       	brne	.-6      	; 0x72e <__vector_11+0xc2>
            itoan((uint64_t)OCR1A, num_str);        // convert value to string
     734:	4a b5       	in	r20, 0x2a	; 42
     736:	5b b5       	in	r21, 0x2b	; 43
     738:	fe 01       	movw	r30, r28
     73a:	31 96       	adiw	r30, 0x01	; 1
     73c:	7f 01       	movw	r14, r30
     73e:	8f 01       	movw	r16, r30
     740:	9a 01       	movw	r18, r20
     742:	40 e0       	ldi	r20, 0x00	; 0
     744:	50 e0       	ldi	r21, 0x00	; 0
     746:	60 e0       	ldi	r22, 0x00	; 0
     748:	70 e0       	ldi	r23, 0x00	; 0
     74a:	80 e0       	ldi	r24, 0x00	; 0
     74c:	90 e0       	ldi	r25, 0x00	; 0
     74e:	d5 dd       	rcall	.-1110   	; 0x2fa <itoan>
            usart_write_string(num_str, false);
     750:	60 e0       	ldi	r22, 0x00	; 0
     752:	c7 01       	movw	r24, r14
     754:	dd d2       	rcall	.+1466   	; 0xd10 <usart_write_string>


            usart_write_string(", OCR1B: ", false);
     756:	60 e0       	ldi	r22, 0x00	; 0
     758:	80 e1       	ldi	r24, 0x10	; 16
     75a:	91 e0       	ldi	r25, 0x01	; 1
     75c:	d9 d2       	rcall	.+1458   	; 0xd10 <usart_write_string>
            memset(num_str, 0, sizeof num_str);     // set the string to empty again
     75e:	5c e0       	ldi	r21, 0x0C	; 12
     760:	d5 2e       	mov	r13, r21
     762:	d7 01       	movw	r26, r14
     764:	ed 2d       	mov	r30, r13
     766:	1d 92       	st	X+, r1
     768:	ea 95       	dec	r30
     76a:	e9 f7       	brne	.-6      	; 0x766 <__vector_11+0xfa>
            itoan((uint64_t)OCR1B, num_str);        // convert value to string
     76c:	48 b5       	in	r20, 0x28	; 40
     76e:	59 b5       	in	r21, 0x29	; 41
     770:	9a 01       	movw	r18, r20
     772:	40 e0       	ldi	r20, 0x00	; 0
     774:	50 e0       	ldi	r21, 0x00	; 0
     776:	60 e0       	ldi	r22, 0x00	; 0
     778:	70 e0       	ldi	r23, 0x00	; 0
     77a:	80 e0       	ldi	r24, 0x00	; 0
     77c:	90 e0       	ldi	r25, 0x00	; 0
     77e:	bd dd       	rcall	.-1158   	; 0x2fa <itoan>
            usart_write_string(num_str, false);
     780:	60 e0       	ldi	r22, 0x00	; 0
     782:	c7 01       	movw	r24, r14
     784:	c5 d2       	rcall	.+1418   	; 0xd10 <usart_write_string>

            usart_write_string(", ADC: ", false);
     786:	60 e0       	ldi	r22, 0x00	; 0
     788:	8a e1       	ldi	r24, 0x1A	; 26
     78a:	91 e0       	ldi	r25, 0x01	; 1
     78c:	c1 d2       	rcall	.+1410   	; 0xd10 <usart_write_string>
            memset(num_str, 0, sizeof num_str);     // set the string to empty again
     78e:	d7 01       	movw	r26, r14
     790:	1d 92       	st	X+, r1
     792:	da 94       	dec	r13
     794:	e9 f7       	brne	.-6      	; 0x790 <__vector_11+0x124>
            itoan((uint64_t)lastAdc, num_str);      // convert value to string
     796:	40 91 70 01 	lds	r20, 0x0170
     79a:	50 91 71 01 	lds	r21, 0x0171
     79e:	9a 01       	movw	r18, r20
     7a0:	40 e0       	ldi	r20, 0x00	; 0
     7a2:	50 e0       	ldi	r21, 0x00	; 0
     7a4:	60 e0       	ldi	r22, 0x00	; 0
     7a6:	70 e0       	ldi	r23, 0x00	; 0
     7a8:	80 e0       	ldi	r24, 0x00	; 0
     7aa:	90 e0       	ldi	r25, 0x00	; 0
     7ac:	a6 dd       	rcall	.-1204   	; 0x2fa <itoan>
            usart_write_string(num_str, false);
     7ae:	60 e0       	ldi	r22, 0x00	; 0
     7b0:	c7 01       	movw	r24, r14
     7b2:	ae d2       	rcall	.+1372   	; 0xd10 <usart_write_string>

            usart_write_string("", true);           // newline
     7b4:	61 e0       	ldi	r22, 0x01	; 1
     7b6:	85 e2       	ldi	r24, 0x25	; 37
     7b8:	91 e0       	ldi	r25, 0x01	; 1
     7ba:	aa d2       	rcall	.+1364   	; 0xd10 <usart_write_string>
            return;
     7bc:	20 c0       	rjmp	.+64     	; 0x7fe <__vector_11+0x192>
     7be:	e0 91 57 01 	lds	r30, 0x0157
    }
#endif

    if ((c == '\0') || (c == '\n') || (c == '\r') || (c == 0x1B /* ESC */)
     7c2:	88 23       	and	r24, r24
     7c4:	41 f0       	breq	.+16     	; 0x7d6 <__vector_11+0x16a>
     7c6:	8a 30       	cpi	r24, 0x0A	; 10
     7c8:	31 f0       	breq	.+12     	; 0x7d6 <__vector_11+0x16a>
     7ca:	8d 30       	cpi	r24, 0x0D	; 13
     7cc:	21 f0       	breq	.+8      	; 0x7d6 <__vector_11+0x16a>
     7ce:	8b 31       	cpi	r24, 0x1B	; 27
     7d0:	11 f0       	breq	.+4      	; 0x7d6 <__vector_11+0x16a>
            || (index >= sizeof buf - 2)) {
     7d2:	e6 32       	cpi	r30, 0x26	; 38
     7d4:	60 f0       	brcs	.+24     	; 0x7ee <__vector_11+0x182>
        // command finished. terminate the buffer
        buf[index] = '\0';
     7d6:	f0 e0       	ldi	r31, 0x00	; 0
     7d8:	e1 5d       	subi	r30, 0xD1	; 209
     7da:	fe 4f       	sbci	r31, 0xFE	; 254
     7dc:	10 82       	st	Z, r1
        
        if (c != 0x1B)  // only process line if not terminated by ESC
     7de:	8b 31       	cpi	r24, 0x1B	; 27
     7e0:	19 f0       	breq	.+6      	; 0x7e8 <__vector_11+0x17c>
            process_usart_line(buf);
     7e2:	8f e2       	ldi	r24, 0x2F	; 47
     7e4:	91 e0       	ldi	r25, 0x01	; 1
     7e6:	3a df       	rcall	.-396    	; 0x65c <process_usart_line>

        index = 0;  // reset buffer for new command
     7e8:	10 92 57 01 	sts	0x0157, r1
        return;
     7ec:	08 c0       	rjmp	.+16     	; 0x7fe <__vector_11+0x192>
    }
    
    // otherwise just add character to buffer
    buf[index++] = c;
     7ee:	91 e0       	ldi	r25, 0x01	; 1
     7f0:	9e 0f       	add	r25, r30
     7f2:	90 93 57 01 	sts	0x0157, r25
     7f6:	f0 e0       	ldi	r31, 0x00	; 0
     7f8:	e1 5d       	subi	r30, 0xD1	; 209
     7fa:	fe 4f       	sbci	r31, 0xFE	; 254
     7fc:	80 83       	st	Z, r24
}
     7fe:	2c 96       	adiw	r28, 0x0c	; 12
     800:	0f b6       	in	r0, 0x3f	; 63
     802:	f8 94       	cli
     804:	de bf       	out	0x3e, r29	; 62
     806:	0f be       	out	0x3f, r0	; 63
     808:	cd bf       	out	0x3d, r28	; 61
     80a:	df 91       	pop	r29
     80c:	cf 91       	pop	r28
     80e:	ff 91       	pop	r31
     810:	ef 91       	pop	r30
     812:	bf 91       	pop	r27
     814:	af 91       	pop	r26
     816:	9f 91       	pop	r25
     818:	8f 91       	pop	r24
     81a:	7f 91       	pop	r23
     81c:	6f 91       	pop	r22
     81e:	5f 91       	pop	r21
     820:	4f 91       	pop	r20
     822:	3f 91       	pop	r19
     824:	2f 91       	pop	r18
     826:	1f 91       	pop	r17
     828:	0f 91       	pop	r16
     82a:	ff 90       	pop	r15
     82c:	ef 90       	pop	r14
     82e:	df 90       	pop	r13
     830:	0f 90       	pop	r0
     832:	0f be       	out	0x3f, r0	; 63
     834:	0f 90       	pop	r0
     836:	1f 90       	pop	r1
     838:	18 95       	reti

0000083a <display_time>:



void display_time(time_t time)
// populate led_matrix with data from time
{
     83a:	cf 92       	push	r12
     83c:	df 92       	push	r13
     83e:	ff 92       	push	r15
     840:	0f 93       	push	r16
     842:	1f 93       	push	r17
     844:	cf 93       	push	r28
     846:	df 93       	push	r29
     848:	cd b7       	in	r28, 0x3d	; 61
     84a:	de b7       	in	r29, 0x3e	; 62
     84c:	27 97       	sbiw	r28, 0x07	; 7
     84e:	0f b6       	in	r0, 0x3f	; 63
     850:	f8 94       	cli
     852:	de bf       	out	0x3e, r29	; 62
     854:	0f be       	out	0x3f, r0	; 63
     856:	cd bf       	out	0x3d, r28	; 61
    struct ymdhms_t t;
    ymdhms_from_time_t(&t, time);   // convert from time_t to human-readable
     858:	89 01       	movw	r16, r18
     85a:	9a 01       	movw	r18, r20
     85c:	ab 01       	movw	r20, r22
     85e:	bc 01       	movw	r22, r24
     860:	ce 01       	movw	r24, r28
     862:	01 96       	adiw	r24, 0x01	; 1
     864:	75 d4       	rcall	.+2282   	; 0x1150 <ymdhms_from_time_t>
     866:	e7 e2       	ldi	r30, 0x27	; 39
     868:	f1 e0       	ldi	r31, 0x01	; 1
     86a:	40 e6       	ldi	r20, 0x60	; 96
     86c:	50 e0       	ldi	r21, 0x00	; 0



void display_time(time_t time)
// populate led_matrix with data from time
{
     86e:	60 e0       	ldi	r22, 0x00	; 0
     870:	70 e0       	ldi	r23, 0x00	; 0
     872:	20 e0       	ldi	r18, 0x00	; 0
     874:	30 e0       	ldi	r19, 0x00	; 0
     876:	f1 2c       	mov	r15, r1
     878:	6a 01       	movw	r12, r20
     87a:	c6 0e       	add	r12, r22
     87c:	d7 1e       	adc	r13, r23
            // "loop" over all the bits of this line in led_matrix
            // LED_MAP[i][j][0] represents the index in tt
            // LED_MAP[i][j][1] represents the
            // bit number of the respective value.
            led_matrix[i] |=
                bitval(tt[LED_MAP[i][j][0]]
     87e:	d6 01       	movw	r26, r12
     880:	8c 91       	ld	r24, X
     882:	01 e0       	ldi	r16, 0x01	; 1
     884:	10 e0       	ldi	r17, 0x00	; 0
     886:	0c 0f       	add	r16, r28
     888:	1d 1f       	adc	r17, r29
     88a:	08 0f       	add	r16, r24
     88c:	11 1d       	adc	r17, r1
     88e:	d8 01       	movw	r26, r16
     890:	8c 91       	ld	r24, X
     892:	90 e0       	ldi	r25, 0x00	; 0
     894:	d6 01       	movw	r26, r12
     896:	11 96       	adiw	r26, 0x01	; 1
     898:	0c 90       	ld	r0, X
     89a:	02 c0       	rjmp	.+4      	; 0x8a0 <display_time+0x66>
     89c:	95 95       	asr	r25
     89e:	87 95       	ror	r24
     8a0:	0a 94       	dec	r0
     8a2:	e2 f7       	brpl	.-8      	; 0x89c <display_time+0x62>
     8a4:	81 70       	andi	r24, 0x01	; 1
     8a6:	99 27       	eor	r25, r25
                        , LED_MAP[i][j][1]) << j;
     8a8:	02 2e       	mov	r0, r18
     8aa:	01 c0       	rjmp	.+2      	; 0x8ae <display_time+0x74>
     8ac:	88 0f       	add	r24, r24
     8ae:	0a 94       	dec	r0
     8b0:	ea f7       	brpl	.-6      	; 0x8ac <display_time+0x72>
        for (j = 0; j < ANODE_N; ++j) {
            // "loop" over all the bits of this line in led_matrix
            // LED_MAP[i][j][0] represents the index in tt
            // LED_MAP[i][j][1] represents the
            // bit number of the respective value.
            led_matrix[i] |=
     8b2:	8f 29       	or	r24, r15
     8b4:	2f 5f       	subi	r18, 0xFF	; 255
     8b6:	3f 4f       	sbci	r19, 0xFF	; 255
     8b8:	6e 5f       	subi	r22, 0xFE	; 254
     8ba:	7f 4f       	sbci	r23, 0xFF	; 255
    uint8_t *tt = (uint8_t*)(&t);

    uint8_t i, j;
    for (i = 0; i < CNT_N; ++i) {
        led_matrix[i] = 0;
        for (j = 0; j < ANODE_N; ++j) {
     8bc:	23 30       	cpi	r18, 0x03	; 3
     8be:	31 05       	cpc	r19, r1
     8c0:	11 f0       	breq	.+4      	; 0x8c6 <display_time+0x8c>
            // "loop" over all the bits of this line in led_matrix
            // LED_MAP[i][j][0] represents the index in tt
            // LED_MAP[i][j][1] represents the
            // bit number of the respective value.
            led_matrix[i] |=
     8c2:	f8 2e       	mov	r15, r24
     8c4:	d9 cf       	rjmp	.-78     	; 0x878 <display_time+0x3e>
     8c6:	81 93       	st	Z+, r24
     8c8:	4a 5f       	subi	r20, 0xFA	; 250
     8ca:	5f 4f       	sbci	r21, 0xFF	; 255
    // handy trick to make things very simple
    // refer to comments @ the definition of LED_MAP
    uint8_t *tt = (uint8_t*)(&t);

    uint8_t i, j;
    for (i = 0; i < CNT_N; ++i) {
     8cc:	b1 e0       	ldi	r27, 0x01	; 1
     8ce:	ef 32       	cpi	r30, 0x2F	; 47
     8d0:	fb 07       	cpc	r31, r27
     8d2:	69 f6       	brne	.-102    	; 0x86e <display_time+0x34>
            led_matrix[i] |=
                bitval(tt[LED_MAP[i][j][0]]
                        , LED_MAP[i][j][1]) << j;
        }
    }
}
     8d4:	27 96       	adiw	r28, 0x07	; 7
     8d6:	0f b6       	in	r0, 0x3f	; 63
     8d8:	f8 94       	cli
     8da:	de bf       	out	0x3e, r29	; 62
     8dc:	0f be       	out	0x3f, r0	; 63
     8de:	cd bf       	out	0x3d, r28	; 61
     8e0:	df 91       	pop	r29
     8e2:	cf 91       	pop	r28
     8e4:	1f 91       	pop	r17
     8e6:	0f 91       	pop	r16
     8e8:	ff 90       	pop	r15
     8ea:	df 90       	pop	r13
     8ec:	cf 90       	pop	r12
     8ee:	08 95       	ret

000008f0 <time_train>:

void time_train()
// the entire pipeline from the timechip to the display
{
    // get current time from the chip, and send it to the display buffer
    time_t time = get_time();
     8f0:	e5 db       	rcall	.-2102   	; 0xbc <get_time>
    time = process_time(time);
     8f2:	fd db       	rcall	.-2054   	; 0xee <process_time>
    display_time(time);
     8f4:	a2 cf       	rjmp	.-188    	; 0x83a <display_time>

000008f6 <__vector_14>:
}

ISR(ADC_vect)
//ADC convertion complete interupt
{
     8f6:	1f 92       	push	r1
     8f8:	0f 92       	push	r0
     8fa:	0f b6       	in	r0, 0x3f	; 63
     8fc:	0f 92       	push	r0
     8fe:	11 24       	eor	r1, r1
     900:	8f 93       	push	r24
     902:	9f 93       	push	r25
#ifdef BRCAL
    lastAdc = ADC;
     904:	84 b1       	in	r24, 0x04	; 4
     906:	95 b1       	in	r25, 0x05	; 5
     908:	90 93 71 01 	sts	0x0171, r25
     90c:	80 93 70 01 	sts	0x0170, r24
#endif
//    uint8_t adcStatus = (uint8_t)(ADC >> 8);

}
     910:	9f 91       	pop	r25
     912:	8f 91       	pop	r24
     914:	0f 90       	pop	r0
     916:	0f be       	out	0x3f, r0	; 63
     918:	0f 90       	pop	r0
     91a:	1f 90       	pop	r1
     91c:	18 95       	reti

0000091e <ds1302_shiftout>:

void ds1302_shiftout(unsigned char AData)
  {
    unsigned char Bits=8;

    DDR(SIO_PORT)|=_BV(SIO_PIN);           // Set SIO to output
     91e:	8b 9a       	sbi	0x11, 3	; 17
     920:	98 e0       	ldi	r25, 0x08	; 8
    while (Bits)
      {
        if (AData & _BV(0))                // LSB sent first
     922:	80 ff       	sbrs	r24, 0
     924:	02 c0       	rjmp	.+4      	; 0x92a <ds1302_shiftout+0xc>
          SIO_PORT|=_BV(SIO_PIN);
     926:	93 9a       	sbi	0x12, 3	; 18
     928:	01 c0       	rjmp	.+2      	; 0x92c <ds1302_shiftout+0xe>
        else SIO_PORT&=~_BV(SIO_PIN);
     92a:	93 98       	cbi	0x12, 3	; 18
        Delay_ns(DS1302_TDC);
     92c:	00 00       	nop
        SCLK_PORT|=_BV(SCLK_PIN);          // Cycle SCLK
     92e:	94 9a       	sbi	0x12, 4	; 18
        Delay_ns(DS1302_CH);
     930:	00 c0       	rjmp	.+0      	; 0x932 <ds1302_shiftout+0x14>
        SCLK_PORT&=~_BV(SCLK_PIN);
     932:	94 98       	cbi	0x12, 4	; 18
        Delay_ns(DS1302_CL);
     934:	00 c0       	rjmp	.+0      	; 0x936 <ds1302_shiftout+0x18>
        AData>>=1;                         // Prepare to send next bit
     936:	86 95       	lsr	r24
     938:	91 50       	subi	r25, 0x01	; 1
void ds1302_shiftout(unsigned char AData)
  {
    unsigned char Bits=8;

    DDR(SIO_PORT)|=_BV(SIO_PIN);           // Set SIO to output
    while (Bits)
     93a:	99 f7       	brne	.-26     	; 0x922 <ds1302_shiftout+0x4>
        SCLK_PORT&=~_BV(SCLK_PIN);
        Delay_ns(DS1302_CL);
        AData>>=1;                         // Prepare to send next bit
        Bits--;
      }
    DDR(SIO_PORT)&=~_BV(SIO_PIN);          // Set SIO back to input
     93c:	8b 98       	cbi	0x11, 3	; 17
     93e:	08 95       	ret

00000940 <ds1302_shiftin>:
  }

unsigned char ds1302_shiftin()
  {
     940:	48 e0       	ldi	r20, 0x08	; 8
    unsigned char Bits=8;
    unsigned int ui1=0;
     942:	80 e0       	ldi	r24, 0x00	; 0
     944:	90 e0       	ldi	r25, 0x00	; 0

    while (Bits)
      {
        ui1>>=1;
     946:	96 95       	lsr	r25
     948:	87 95       	ror	r24
        ui1|=(PIN(SIO_PORT) & _BV(SIO_PIN))?128:0;       // LSB received first
     94a:	83 9b       	sbis	0x10, 3	; 16
     94c:	03 c0       	rjmp	.+6      	; 0x954 <ds1302_shiftin+0x14>
     94e:	20 e8       	ldi	r18, 0x80	; 128
     950:	30 e0       	ldi	r19, 0x00	; 0
     952:	02 c0       	rjmp	.+4      	; 0x958 <ds1302_shiftin+0x18>
     954:	20 e0       	ldi	r18, 0x00	; 0
     956:	30 e0       	ldi	r19, 0x00	; 0
     958:	82 2b       	or	r24, r18
     95a:	93 2b       	or	r25, r19
        SCLK_PORT|=_BV(SCLK_PIN);                        // Cycle SCLK
     95c:	94 9a       	sbi	0x12, 4	; 18
        Delay_ns(DS1302_CH);
     95e:	00 c0       	rjmp	.+0      	; 0x960 <ds1302_shiftin+0x20>
        SCLK_PORT&=~_BV(SCLK_PIN);
     960:	94 98       	cbi	0x12, 4	; 18
        Delay_ns(DS1302_CL);
     962:	00 c0       	rjmp	.+0      	; 0x964 <ds1302_shiftin+0x24>
     964:	41 50       	subi	r20, 0x01	; 1
unsigned char ds1302_shiftin()
  {
    unsigned char Bits=8;
    unsigned int ui1=0;

    while (Bits)
     966:	79 f7       	brne	.-34     	; 0x946 <ds1302_shiftin+0x6>
        SCLK_PORT&=~_BV(SCLK_PIN);
        Delay_ns(DS1302_CL);
        Bits--;
      }
    return ui1;
  }
     968:	08 95       	ret

0000096a <ds1302_getbyte>:

unsigned char ds1302_getbyte(unsigned char AAddress)
  {
    unsigned char c1;

    CE_PORT|=_BV(CE_PIN);                                // Set CE high
     96a:	92 9a       	sbi	0x12, 2	; 18
    Delay_ns(DS1302_TCC);
     96c:	92 e0       	ldi	r25, 0x02	; 2
     96e:	9a 95       	dec	r25
     970:	f1 f7       	brne	.-4      	; 0x96e <ds1302_getbyte+0x4>
     972:	00 c0       	rjmp	.+0      	; 0x974 <ds1302_getbyte+0xa>
    ds1302_shiftout(AAddress | _BV(0));                  // Send command byte
     974:	81 60       	ori	r24, 0x01	; 1
     976:	d3 df       	rcall	.-90     	; 0x91e <ds1302_shiftout>
    c1=ds1302_shiftin();                                 // Get result
     978:	e3 df       	rcall	.-58     	; 0x940 <ds1302_shiftin>
    CE_PORT&=~_BV(CE_PIN);                               // Take CE back low
     97a:	92 98       	cbi	0x12, 2	; 18
    Delay_ns(DS1302_CWH);
     97c:	92 e0       	ldi	r25, 0x02	; 2
     97e:	9a 95       	dec	r25
     980:	f1 f7       	brne	.-4      	; 0x97e <ds1302_getbyte+0x14>
     982:	00 c0       	rjmp	.+0      	; 0x984 <ds1302_getbyte+0x1a>
    return c1;
  }
     984:	08 95       	ret

00000986 <ds1302_setbyte>:

void ds1302_setbyte(unsigned char AAddress, unsigned char AValue)
  {
     986:	cf 93       	push	r28
     988:	df 93       	push	r29
     98a:	1f 92       	push	r1
     98c:	cd b7       	in	r28, 0x3d	; 61
     98e:	de b7       	in	r29, 0x3e	; 62
    CE_PORT|=_BV(CE_PIN);                                // Set CE high
     990:	92 9a       	sbi	0x12, 2	; 18
    Delay_ns(DS1302_TCC);
     992:	92 e0       	ldi	r25, 0x02	; 2
     994:	9a 95       	dec	r25
     996:	f1 f7       	brne	.-4      	; 0x994 <ds1302_setbyte+0xe>
     998:	00 c0       	rjmp	.+0      	; 0x99a <ds1302_setbyte+0x14>
    ds1302_shiftout(AAddress & ~_BV(0));                 // Send command byte
     99a:	8e 7f       	andi	r24, 0xFE	; 254
     99c:	69 83       	std	Y+1, r22	; 0x01
     99e:	bf df       	rcall	.-130    	; 0x91e <ds1302_shiftout>
    ds1302_shiftout(AValue);                             // Send value
     9a0:	69 81       	ldd	r22, Y+1	; 0x01
     9a2:	86 2f       	mov	r24, r22
     9a4:	bc df       	rcall	.-136    	; 0x91e <ds1302_shiftout>
    CE_PORT&=~_BV(CE_PIN);                               // Take CE back low
     9a6:	92 98       	cbi	0x12, 2	; 18
    Delay_ns(DS1302_CWH);
     9a8:	e2 e0       	ldi	r30, 0x02	; 2
     9aa:	ea 95       	dec	r30
     9ac:	f1 f7       	brne	.-4      	; 0x9aa <ds1302_setbyte+0x24>
     9ae:	00 c0       	rjmp	.+0      	; 0x9b0 <ds1302_setbyte+0x2a>
  }
     9b0:	0f 90       	pop	r0
     9b2:	df 91       	pop	r29
     9b4:	cf 91       	pop	r28
     9b6:	08 95       	ret

000009b8 <ds1302_reset_time>:
      ds1302_clear();                                    // Clear if no signature found
    return 1;                                            // Device is present
  }

void ds1302_reset_time()
  {
     9b8:	cf 93       	push	r28
     9ba:	df 93       	push	r29
    unsigned char c1;
    
    ds1302_setbyte(0x8e,0x00);                           // Disable WP
     9bc:	60 e0       	ldi	r22, 0x00	; 0
     9be:	8e e8       	ldi	r24, 0x8E	; 142
     9c0:	e2 df       	rcall	.-60     	; 0x986 <ds1302_setbyte>
    ds1302_setbyte(0x90,TCS_REGISTER_DEFAULT);           // Set TCS to default
     9c2:	60 e0       	ldi	r22, 0x00	; 0
     9c4:	80 e9       	ldi	r24, 0x90	; 144
     9c6:	df df       	rcall	.-66     	; 0x986 <ds1302_setbyte>
    CE_PORT|=_BV(CE_PIN);                                // Set CE high
     9c8:	92 9a       	sbi	0x12, 2	; 18
    Delay_ns(DS1302_TCC);
     9ca:	82 e0       	ldi	r24, 0x02	; 2
     9cc:	8a 95       	dec	r24
     9ce:	f1 f7       	brne	.-4      	; 0x9cc <ds1302_reset_time+0x14>
     9d0:	00 c0       	rjmp	.+0      	; 0x9d2 <ds1302_reset_time+0x1a>
    ds1302_shiftout(0xbe);                               // Burst write of time sets all registers in sync with each other
     9d2:	8e eb       	ldi	r24, 0xBE	; 190
     9d4:	a4 df       	rcall	.-184    	; 0x91e <ds1302_shiftout>
     9d6:	c6 e2       	ldi	r28, 0x26	; 38
     9d8:	d0 e0       	ldi	r29, 0x00	; 0
    for (c1=0;c1<8;c1++)
      ds1302_shiftout(pgm_read_word(ResetTime+c1));
     9da:	fe 01       	movw	r30, r28
     9dc:	85 91       	lpm	r24, Z+
     9de:	94 91       	lpm	r25, Z
     9e0:	9e df       	rcall	.-196    	; 0x91e <ds1302_shiftout>
     9e2:	21 96       	adiw	r28, 0x01	; 1
    ds1302_setbyte(0x8e,0x00);                           // Disable WP
    ds1302_setbyte(0x90,TCS_REGISTER_DEFAULT);           // Set TCS to default
    CE_PORT|=_BV(CE_PIN);                                // Set CE high
    Delay_ns(DS1302_TCC);
    ds1302_shiftout(0xbe);                               // Burst write of time sets all registers in sync with each other
    for (c1=0;c1<8;c1++)
     9e4:	80 e0       	ldi	r24, 0x00	; 0
     9e6:	ce 32       	cpi	r28, 0x2E	; 46
     9e8:	d8 07       	cpc	r29, r24
     9ea:	b9 f7       	brne	.-18     	; 0x9da <ds1302_reset_time+0x22>
      ds1302_shiftout(pgm_read_word(ResetTime+c1));
    CE_PORT&=~_BV(CE_PIN);                               // Take CE back low
     9ec:	92 98       	cbi	0x12, 2	; 18
    Delay_ns(DS1302_CWH);
     9ee:	82 e0       	ldi	r24, 0x02	; 2
     9f0:	8a 95       	dec	r24
     9f2:	f1 f7       	brne	.-4      	; 0x9f0 <ds1302_reset_time+0x38>
     9f4:	00 c0       	rjmp	.+0      	; 0x9f6 <ds1302_reset_time+0x3e>
    ds1302_setbyte(0x8e,0x80);                           // Reenable WP
     9f6:	60 e8       	ldi	r22, 0x80	; 128
     9f8:	8e e8       	ldi	r24, 0x8E	; 142
  }
     9fa:	df 91       	pop	r29
     9fc:	cf 91       	pop	r28
    ds1302_shiftout(0xbe);                               // Burst write of time sets all registers in sync with each other
    for (c1=0;c1<8;c1++)
      ds1302_shiftout(pgm_read_word(ResetTime+c1));
    CE_PORT&=~_BV(CE_PIN);                               // Take CE back low
    Delay_ns(DS1302_CWH);
    ds1302_setbyte(0x8e,0x80);                           // Reenable WP
     9fe:	c3 cf       	rjmp	.-122    	; 0x986 <ds1302_setbyte>

00000a00 <ds1302_clear>:
  }

void ds1302_clear()
  {
     a00:	cf 93       	push	r28
    unsigned char c1;

    ds1302_reset_time();
     a02:	da df       	rcall	.-76     	; 0x9b8 <ds1302_reset_time>
    ds1302_setbyte(0x8e,0x00);                           // Disable WP
     a04:	60 e0       	ldi	r22, 0x00	; 0
     a06:	8e e8       	ldi	r24, 0x8E	; 142
     a08:	be df       	rcall	.-132    	; 0x986 <ds1302_setbyte>
    CE_PORT|=_BV(CE_PIN);                                // Set CE high
     a0a:	92 9a       	sbi	0x12, 2	; 18
    Delay_ns(DS1302_TCC);
     a0c:	82 e0       	ldi	r24, 0x02	; 2
     a0e:	8a 95       	dec	r24
     a10:	f1 f7       	brne	.-4      	; 0xa0e <ds1302_clear+0xe>
     a12:	00 c0       	rjmp	.+0      	; 0xa14 <ds1302_clear+0x14>
    ds1302_shiftout(0xfe);                               // Burst write RAM
     a14:	8e ef       	ldi	r24, 0xFE	; 254
     a16:	83 df       	rcall	.-250    	; 0x91e <ds1302_shiftout>
     a18:	cc e1       	ldi	r28, 0x1C	; 28
    for (c1=0;c1<28;c1++)                                // Set RAM to zeros
      ds1302_shiftout(0);
     a1a:	80 e0       	ldi	r24, 0x00	; 0
     a1c:	80 df       	rcall	.-256    	; 0x91e <ds1302_shiftout>
     a1e:	c1 50       	subi	r28, 0x01	; 1
    ds1302_reset_time();
    ds1302_setbyte(0x8e,0x00);                           // Disable WP
    CE_PORT|=_BV(CE_PIN);                                // Set CE high
    Delay_ns(DS1302_TCC);
    ds1302_shiftout(0xfe);                               // Burst write RAM
    for (c1=0;c1<28;c1++)                                // Set RAM to zeros
     a20:	e1 f7       	brne	.-8      	; 0xa1a <ds1302_clear+0x1a>
      ds1302_shiftout(0);
    ds1302_shiftout(SIG1);                               // Write signature to RAM
     a22:	89 ec       	ldi	r24, 0xC9	; 201
     a24:	7c df       	rcall	.-264    	; 0x91e <ds1302_shiftout>
    ds1302_shiftout(SIG2);
     a26:	89 ef       	ldi	r24, 0xF9	; 249
     a28:	7a df       	rcall	.-268    	; 0x91e <ds1302_shiftout>
    ds1302_shiftout(SIG3);
     a2a:	81 e3       	ldi	r24, 0x31	; 49
     a2c:	78 df       	rcall	.-272    	; 0x91e <ds1302_shiftout>
    CE_PORT&=~_BV(CE_PIN);                               // Take CE back low
     a2e:	92 98       	cbi	0x12, 2	; 18
    Delay_ns(DS1302_CWH);
     a30:	82 e0       	ldi	r24, 0x02	; 2
     a32:	8a 95       	dec	r24
     a34:	f1 f7       	brne	.-4      	; 0xa32 <ds1302_clear+0x32>
     a36:	00 c0       	rjmp	.+0      	; 0xa38 <ds1302_clear+0x38>
    ds1302_setbyte(0x8e,0x80);                           // Reenable WP
     a38:	60 e8       	ldi	r22, 0x80	; 128
     a3a:	8e e8       	ldi	r24, 0x8E	; 142
  }
     a3c:	cf 91       	pop	r28
    ds1302_shiftout(SIG1);                               // Write signature to RAM
    ds1302_shiftout(SIG2);
    ds1302_shiftout(SIG3);
    CE_PORT&=~_BV(CE_PIN);                               // Take CE back low
    Delay_ns(DS1302_CWH);
    ds1302_setbyte(0x8e,0x80);                           // Reenable WP
     a3e:	a3 cf       	rjmp	.-186    	; 0x986 <ds1302_setbyte>

00000a40 <ds1302_init>:
    CE_PORT&=~_BV(CE_PIN);                               // Take CE back low
    Delay_ns(DS1302_CWH);
  }

unsigned char ds1302_init()
  {
     a40:	cf 93       	push	r28
    unsigned char c1,c2;

    CE_PORT&=~_BV(CE_PIN);                               // Default port configuration
     a42:	92 98       	cbi	0x12, 2	; 18
    DDR(CE_PORT)|=_BV(CE_PIN);                           // CE output, low
     a44:	8a 9a       	sbi	0x11, 2	; 17
    SCLK_PORT&=~_BV(SCLK_PIN);                           // SCLK output, low
     a46:	94 98       	cbi	0x12, 4	; 18
    DDR(SCLK_PORT)|=_BV(SCLK_PIN);
     a48:	8c 9a       	sbi	0x11, 4	; 17
    SIO_PORT&=~_BV(SIO_PIN);                             // SIO input, no pullup
     a4a:	93 98       	cbi	0x12, 3	; 18
    DDR(SIO_PORT)&=~_BV(SIO_PIN);
     a4c:	8b 98       	cbi	0x11, 3	; 17

    c1=ds1302_getbyte(0x8f);                             // Test device presence (read WP byte)
     a4e:	8f e8       	ldi	r24, 0x8F	; 143
     a50:	8c df       	rcall	.-232    	; 0x96a <ds1302_getbyte>
    if (c1!=0x00 && c1!=0x80)                            // Result should always be 0x00 or 0x80
     a52:	98 2f       	mov	r25, r24
     a54:	9f 77       	andi	r25, 0x7F	; 127
     a56:	11 f0       	breq	.+4      	; 0xa5c <ds1302_init+0x1c>
      return 0;
     a58:	80 e0       	ldi	r24, 0x00	; 0
     a5a:	1d c0       	rjmp	.+58     	; 0xa96 <ds1302_init+0x56>
    c1^=_BV(7);                                          // Flip bit and see if we can write/reread it
     a5c:	c0 e8       	ldi	r28, 0x80	; 128
     a5e:	c8 0f       	add	r28, r24
    ds1302_setbyte(0x8e,c1);
     a60:	6c 2f       	mov	r22, r28
     a62:	8e e8       	ldi	r24, 0x8E	; 142
     a64:	90 df       	rcall	.-224    	; 0x986 <ds1302_setbyte>
    c2=ds1302_getbyte(0x8f);
     a66:	8f e8       	ldi	r24, 0x8F	; 143
     a68:	80 df       	rcall	.-256    	; 0x96a <ds1302_getbyte>
    if (c1!=c2)                                          // New result should match written flipped bit
     a6a:	c8 13       	cpse	r28, r24
     a6c:	f5 cf       	rjmp	.-22     	; 0xa58 <ds1302_init+0x18>
      return 0;
    if (!c2)
     a6e:	c1 11       	cpse	r28, r1
     a70:	03 c0       	rjmp	.+6      	; 0xa78 <ds1302_init+0x38>
      ds1302_setbyte(0x8e,0x80);                         // Leave WP set
     a72:	60 e8       	ldi	r22, 0x80	; 128
     a74:	8e e8       	ldi	r24, 0x8E	; 142
     a76:	87 df       	rcall	.-242    	; 0x986 <ds1302_setbyte>

    if (ds1302_getbyte(0xf9)!=SIG1 ||                    // Look for signature
     a78:	89 ef       	ldi	r24, 0xF9	; 249
     a7a:	77 df       	rcall	.-274    	; 0x96a <ds1302_getbyte>
     a7c:	89 3c       	cpi	r24, 0xC9	; 201
     a7e:	11 f0       	breq	.+4      	; 0xa84 <ds1302_init+0x44>
        ds1302_getbyte(0xfb)!=SIG2 ||
        ds1302_getbyte(0xfd)!=SIG3)
      ds1302_clear();                                    // Clear if no signature found
     a80:	bf df       	rcall	.-130    	; 0xa00 <ds1302_clear>
     a82:	08 c0       	rjmp	.+16     	; 0xa94 <ds1302_init+0x54>
      return 0;
    if (!c2)
      ds1302_setbyte(0x8e,0x80);                         // Leave WP set

    if (ds1302_getbyte(0xf9)!=SIG1 ||                    // Look for signature
        ds1302_getbyte(0xfb)!=SIG2 ||
     a84:	8b ef       	ldi	r24, 0xFB	; 251
     a86:	71 df       	rcall	.-286    	; 0x96a <ds1302_getbyte>
    if (c1!=c2)                                          // New result should match written flipped bit
      return 0;
    if (!c2)
      ds1302_setbyte(0x8e,0x80);                         // Leave WP set

    if (ds1302_getbyte(0xf9)!=SIG1 ||                    // Look for signature
     a88:	89 3f       	cpi	r24, 0xF9	; 249
     a8a:	d1 f7       	brne	.-12     	; 0xa80 <ds1302_init+0x40>
        ds1302_getbyte(0xfb)!=SIG2 ||
        ds1302_getbyte(0xfd)!=SIG3)
     a8c:	8d ef       	ldi	r24, 0xFD	; 253
     a8e:	6d df       	rcall	.-294    	; 0x96a <ds1302_getbyte>
      return 0;
    if (!c2)
      ds1302_setbyte(0x8e,0x80);                         // Leave WP set

    if (ds1302_getbyte(0xf9)!=SIG1 ||                    // Look for signature
        ds1302_getbyte(0xfb)!=SIG2 ||
     a90:	81 33       	cpi	r24, 0x31	; 49
     a92:	b1 f7       	brne	.-20     	; 0xa80 <ds1302_init+0x40>
        ds1302_getbyte(0xfd)!=SIG3)
      ds1302_clear();                                    // Clear if no signature found
    return 1;                                            // Device is present
     a94:	81 e0       	ldi	r24, 0x01	; 1
  }
     a96:	cf 91       	pop	r28
     a98:	08 95       	ret

00000a9a <ds1302_get_time>:
    Delay_ns(DS1302_CWH);
    ds1302_setbyte(0x8e,0x80);                           // Reenable WP
  }

unsigned char ds1302_get_time(struct ymdhms_t *ATime)
  {
     a9a:	cf 92       	push	r12
     a9c:	df 92       	push	r13
     a9e:	ef 92       	push	r14
     aa0:	ff 92       	push	r15
     aa2:	0f 93       	push	r16
     aa4:	1f 93       	push	r17
     aa6:	cf 93       	push	r28
     aa8:	df 93       	push	r29
     aaa:	cd b7       	in	r28, 0x3d	; 61
     aac:	de b7       	in	r29, 0x3e	; 62
     aae:	28 97       	sbiw	r28, 0x08	; 8
     ab0:	0f b6       	in	r0, 0x3f	; 63
     ab2:	f8 94       	cli
     ab4:	de bf       	out	0x3e, r29	; 62
     ab6:	0f be       	out	0x3f, r0	; 63
     ab8:	cd bf       	out	0x3d, r28	; 61
     aba:	8c 01       	movw	r16, r24
    unsigned char c1,s1[8];

    CE_PORT|=_BV(CE_PIN);                                // Set CE high
     abc:	92 9a       	sbi	0x12, 2	; 18
    Delay_ns(DS1302_TCC);
     abe:	22 e0       	ldi	r18, 0x02	; 2
     ac0:	2a 95       	dec	r18
     ac2:	f1 f7       	brne	.-4      	; 0xac0 <ds1302_get_time+0x26>
     ac4:	00 c0       	rjmp	.+0      	; 0xac6 <ds1302_get_time+0x2c>
    ds1302_shiftout(0xbf);                               // Burst read of time gets all registers in sync with each other
     ac6:	8f eb       	ldi	r24, 0xBF	; 191
     ac8:	2a df       	rcall	.-428    	; 0x91e <ds1302_shiftout>
     aca:	ce 01       	movw	r24, r28
     acc:	01 96       	adiw	r24, 0x01	; 1
     ace:	7c 01       	movw	r14, r24
     ad0:	6e 01       	movw	r12, r28
     ad2:	99 e0       	ldi	r25, 0x09	; 9
     ad4:	c9 0e       	add	r12, r25
     ad6:	d1 1c       	adc	r13, r1
    for (c1=0;c1<8;c1++)
      s1[c1]=ds1302_shiftin();
     ad8:	33 df       	rcall	.-410    	; 0x940 <ds1302_shiftin>
     ada:	f7 01       	movw	r30, r14
     adc:	81 93       	st	Z+, r24
     ade:	7f 01       	movw	r14, r30
    unsigned char c1,s1[8];

    CE_PORT|=_BV(CE_PIN);                                // Set CE high
    Delay_ns(DS1302_TCC);
    ds1302_shiftout(0xbf);                               // Burst read of time gets all registers in sync with each other
    for (c1=0;c1<8;c1++)
     ae0:	ec 15       	cp	r30, r12
     ae2:	fd 05       	cpc	r31, r13
     ae4:	c9 f7       	brne	.-14     	; 0xad8 <ds1302_get_time+0x3e>
      s1[c1]=ds1302_shiftin();
    CE_PORT&=~_BV(CE_PIN);                               // Take CE back low
     ae6:	92 98       	cbi	0x12, 2	; 18
    Delay_ns(DS1302_CWH);
     ae8:	f2 e0       	ldi	r31, 0x02	; 2
     aea:	fa 95       	dec	r31
     aec:	f1 f7       	brne	.-4      	; 0xaea <ds1302_get_time+0x50>
     aee:	00 c0       	rjmp	.+0      	; 0xaf0 <ds1302_get_time+0x56>
    if (s1[0] & _BV(7))                                  // If CH is set then clock is not set, return 0
     af0:	29 81       	ldd	r18, Y+1	; 0x01
     af2:	27 fd       	sbrc	r18, 7
     af4:	4d c0       	rjmp	.+154    	; 0xb90 <ds1302_get_time+0xf6>
      return 0;
                                                         // Convert from BCD
    ATime->second=((s1[0] & (_BV(4)|_BV(5)|_BV(6)))>>4)*10         +(s1[0] & (_BV(0)|_BV(1)|_BV(2)|_BV(3)));
     af6:	92 2f       	mov	r25, r18
     af8:	90 77       	andi	r25, 0x70	; 112
     afa:	96 95       	lsr	r25
     afc:	96 95       	lsr	r25
     afe:	96 95       	lsr	r25
     b00:	89 2f       	mov	r24, r25
     b02:	88 0f       	add	r24, r24
     b04:	88 0f       	add	r24, r24
     b06:	89 0f       	add	r24, r25
     b08:	2f 70       	andi	r18, 0x0F	; 15
     b0a:	82 0f       	add	r24, r18
     b0c:	f8 01       	movw	r30, r16
     b0e:	86 83       	std	Z+6, r24	; 0x06
    ATime->minute=((s1[1] & (_BV(4)|_BV(5)|_BV(6)))>>4)*10         +(s1[1] & (_BV(0)|_BV(1)|_BV(2)|_BV(3)));
     b10:	2a 81       	ldd	r18, Y+2	; 0x02
     b12:	92 2f       	mov	r25, r18
     b14:	90 77       	andi	r25, 0x70	; 112
     b16:	96 95       	lsr	r25
     b18:	96 95       	lsr	r25
     b1a:	96 95       	lsr	r25
     b1c:	89 2f       	mov	r24, r25
     b1e:	88 0f       	add	r24, r24
     b20:	88 0f       	add	r24, r24
     b22:	89 0f       	add	r24, r25
     b24:	2f 70       	andi	r18, 0x0F	; 15
     b26:	82 0f       	add	r24, r18
     b28:	85 83       	std	Z+5, r24	; 0x05
    ATime->hour  =((s1[2] & (_BV(4)|_BV(5)))>>4)*10                +(s1[2] & (_BV(0)|_BV(1)|_BV(2)|_BV(3)));
     b2a:	2b 81       	ldd	r18, Y+3	; 0x03
     b2c:	92 2f       	mov	r25, r18
     b2e:	90 73       	andi	r25, 0x30	; 48
     b30:	96 95       	lsr	r25
     b32:	96 95       	lsr	r25
     b34:	96 95       	lsr	r25
     b36:	89 2f       	mov	r24, r25
     b38:	88 0f       	add	r24, r24
     b3a:	88 0f       	add	r24, r24
     b3c:	89 0f       	add	r24, r25
     b3e:	2f 70       	andi	r18, 0x0F	; 15
     b40:	82 0f       	add	r24, r18
     b42:	84 83       	std	Z+4, r24	; 0x04
    ATime->day   =((s1[3] & (_BV(4)|_BV(5)))>>4)*10                +(s1[3] & (_BV(0)|_BV(1)|_BV(2)|_BV(3)));
     b44:	2c 81       	ldd	r18, Y+4	; 0x04
     b46:	92 2f       	mov	r25, r18
     b48:	90 73       	andi	r25, 0x30	; 48
     b4a:	96 95       	lsr	r25
     b4c:	96 95       	lsr	r25
     b4e:	96 95       	lsr	r25
     b50:	89 2f       	mov	r24, r25
     b52:	88 0f       	add	r24, r24
     b54:	88 0f       	add	r24, r24
     b56:	89 0f       	add	r24, r25
     b58:	2f 70       	andi	r18, 0x0F	; 15
     b5a:	82 0f       	add	r24, r18
     b5c:	82 83       	std	Z+2, r24	; 0x02
    ATime->month =((s1[4] & (_BV(4)))>>4)*10                       +(s1[4] & (_BV(0)|_BV(1)|_BV(2)|_BV(3)));
     b5e:	9d 81       	ldd	r25, Y+5	; 0x05
     b60:	94 fb       	bst	r25, 4
     b62:	22 27       	eor	r18, r18
     b64:	20 f9       	bld	r18, 0
     b66:	22 0f       	add	r18, r18
     b68:	82 2f       	mov	r24, r18
     b6a:	88 0f       	add	r24, r24
     b6c:	88 0f       	add	r24, r24
     b6e:	82 0f       	add	r24, r18
     b70:	9f 70       	andi	r25, 0x0F	; 15
     b72:	89 0f       	add	r24, r25
     b74:	81 83       	std	Z+1, r24	; 0x01
    ATime->year  =((s1[6] & (_BV(4)|_BV(5)|_BV(6)|_BV(7)))>>4)*10  +(s1[6] & (_BV(0)|_BV(1)|_BV(2)|_BV(3)));
     b76:	8f 81       	ldd	r24, Y+7	; 0x07
     b78:	98 2f       	mov	r25, r24
     b7a:	92 95       	swap	r25
     b7c:	9f 70       	andi	r25, 0x0F	; 15
     b7e:	8f 70       	andi	r24, 0x0F	; 15
     b80:	fa e0       	ldi	r31, 0x0A	; 10
     b82:	9f 9f       	mul	r25, r31
     b84:	80 0d       	add	r24, r0
     b86:	11 24       	eor	r1, r1
     b88:	f8 01       	movw	r30, r16
     b8a:	80 83       	st	Z, r24
    return 1;
     b8c:	81 e0       	ldi	r24, 0x01	; 1
     b8e:	01 c0       	rjmp	.+2      	; 0xb92 <ds1302_get_time+0xf8>
    for (c1=0;c1<8;c1++)
      s1[c1]=ds1302_shiftin();
    CE_PORT&=~_BV(CE_PIN);                               // Take CE back low
    Delay_ns(DS1302_CWH);
    if (s1[0] & _BV(7))                                  // If CH is set then clock is not set, return 0
      return 0;
     b90:	80 e0       	ldi	r24, 0x00	; 0
    ATime->hour  =((s1[2] & (_BV(4)|_BV(5)))>>4)*10                +(s1[2] & (_BV(0)|_BV(1)|_BV(2)|_BV(3)));
    ATime->day   =((s1[3] & (_BV(4)|_BV(5)))>>4)*10                +(s1[3] & (_BV(0)|_BV(1)|_BV(2)|_BV(3)));
    ATime->month =((s1[4] & (_BV(4)))>>4)*10                       +(s1[4] & (_BV(0)|_BV(1)|_BV(2)|_BV(3)));
    ATime->year  =((s1[6] & (_BV(4)|_BV(5)|_BV(6)|_BV(7)))>>4)*10  +(s1[6] & (_BV(0)|_BV(1)|_BV(2)|_BV(3)));
    return 1;
  }
     b92:	28 96       	adiw	r28, 0x08	; 8
     b94:	0f b6       	in	r0, 0x3f	; 63
     b96:	f8 94       	cli
     b98:	de bf       	out	0x3e, r29	; 62
     b9a:	0f be       	out	0x3f, r0	; 63
     b9c:	cd bf       	out	0x3d, r28	; 61
     b9e:	df 91       	pop	r29
     ba0:	cf 91       	pop	r28
     ba2:	1f 91       	pop	r17
     ba4:	0f 91       	pop	r16
     ba6:	ff 90       	pop	r15
     ba8:	ef 90       	pop	r14
     baa:	df 90       	pop	r13
     bac:	cf 90       	pop	r12
     bae:	08 95       	ret

00000bb0 <ds1302_set_time>:

void ds1302_set_time(struct ymdhms_t *ATime)
  {
     bb0:	ef 92       	push	r14
     bb2:	ff 92       	push	r15
     bb4:	0f 93       	push	r16
     bb6:	1f 93       	push	r17
     bb8:	cf 93       	push	r28
     bba:	df 93       	push	r29
     bbc:	cd b7       	in	r28, 0x3d	; 61
     bbe:	de b7       	in	r29, 0x3e	; 62
     bc0:	28 97       	sbiw	r28, 0x08	; 8
     bc2:	0f b6       	in	r0, 0x3f	; 63
     bc4:	f8 94       	cli
     bc6:	de bf       	out	0x3e, r29	; 62
     bc8:	0f be       	out	0x3f, r0	; 63
     bca:	cd bf       	out	0x3d, r28	; 61
     bcc:	fc 01       	movw	r30, r24
    unsigned char c1,s1[8];
                                                         // Convert to BCD
    s1[0]=((ATime->second/10)<<4)+ATime->second%10;
     bce:	86 81       	ldd	r24, Z+6	; 0x06
     bd0:	2a e0       	ldi	r18, 0x0A	; 10
     bd2:	62 2f       	mov	r22, r18
     bd4:	8d d5       	rcall	.+2842   	; 0x16f0 <__udivmodqi4>
     bd6:	30 e1       	ldi	r19, 0x10	; 16
     bd8:	83 9f       	mul	r24, r19
     bda:	90 0d       	add	r25, r0
     bdc:	11 24       	eor	r1, r1
     bde:	99 83       	std	Y+1, r25	; 0x01
    s1[1]=((ATime->minute/10)<<4)+ATime->minute%10;
     be0:	85 81       	ldd	r24, Z+5	; 0x05
     be2:	86 d5       	rcall	.+2828   	; 0x16f0 <__udivmodqi4>
     be4:	30 e1       	ldi	r19, 0x10	; 16
     be6:	83 9f       	mul	r24, r19
     be8:	90 0d       	add	r25, r0
     bea:	11 24       	eor	r1, r1
     bec:	9a 83       	std	Y+2, r25	; 0x02
    s1[2]=((ATime->hour/10)<<4)  +ATime->hour%10;
     bee:	84 81       	ldd	r24, Z+4	; 0x04
     bf0:	7f d5       	rcall	.+2814   	; 0x16f0 <__udivmodqi4>
     bf2:	30 e1       	ldi	r19, 0x10	; 16
     bf4:	83 9f       	mul	r24, r19
     bf6:	90 0d       	add	r25, r0
     bf8:	11 24       	eor	r1, r1
     bfa:	9b 83       	std	Y+3, r25	; 0x03
    s1[3]=((ATime->day/10)<<4)   +ATime->day%10;
     bfc:	82 81       	ldd	r24, Z+2	; 0x02
     bfe:	78 d5       	rcall	.+2800   	; 0x16f0 <__udivmodqi4>
     c00:	30 e1       	ldi	r19, 0x10	; 16
     c02:	83 9f       	mul	r24, r19
     c04:	90 0d       	add	r25, r0
     c06:	11 24       	eor	r1, r1
     c08:	9c 83       	std	Y+4, r25	; 0x04
    s1[4]=((ATime->month/10)<<4) +ATime->month%10;
     c0a:	81 81       	ldd	r24, Z+1	; 0x01
     c0c:	71 d5       	rcall	.+2786   	; 0x16f0 <__udivmodqi4>
     c0e:	30 e1       	ldi	r19, 0x10	; 16
     c10:	83 9f       	mul	r24, r19
     c12:	90 0d       	add	r25, r0
     c14:	11 24       	eor	r1, r1
     c16:	9d 83       	std	Y+5, r25	; 0x05
    s1[6]=((ATime->year/10)<<4)  +ATime->year%10;
     c18:	80 81       	ld	r24, Z
     c1a:	6a d5       	rcall	.+2772   	; 0x16f0 <__udivmodqi4>
     c1c:	e0 e1       	ldi	r30, 0x10	; 16
     c1e:	8e 9f       	mul	r24, r30
     c20:	90 0d       	add	r25, r0
     c22:	11 24       	eor	r1, r1
     c24:	9f 83       	std	Y+7, r25	; 0x07
    s1[7]=0;
     c26:	18 86       	std	Y+8, r1	; 0x08

    ds1302_setbyte(0x8e,0x00);                           // Disable WP
     c28:	60 e0       	ldi	r22, 0x00	; 0
     c2a:	8e e8       	ldi	r24, 0x8E	; 142
     c2c:	ac de       	rcall	.-680    	; 0x986 <ds1302_setbyte>
    CE_PORT|=_BV(CE_PIN);                                // Set CE high
     c2e:	92 9a       	sbi	0x12, 2	; 18
    Delay_ns(DS1302_TCC);
     c30:	f2 e0       	ldi	r31, 0x02	; 2
     c32:	fa 95       	dec	r31
     c34:	f1 f7       	brne	.-4      	; 0xc32 <ds1302_set_time+0x82>
     c36:	00 c0       	rjmp	.+0      	; 0xc38 <ds1302_set_time+0x88>
    ds1302_shiftout(0xbe);                               // Burst write of time sets all registers in sync with each other
     c38:	8e eb       	ldi	r24, 0xBE	; 190
     c3a:	71 de       	rcall	.-798    	; 0x91e <ds1302_shiftout>
     c3c:	8e 01       	movw	r16, r28
     c3e:	0f 5f       	subi	r16, 0xFF	; 255
     c40:	1f 4f       	sbci	r17, 0xFF	; 255
     c42:	7e 01       	movw	r14, r28
     c44:	29 e0       	ldi	r18, 0x09	; 9
     c46:	e2 0e       	add	r14, r18
     c48:	f1 1c       	adc	r15, r1
    for (c1=0;c1<8;c1++)
      ds1302_shiftout(s1[c1]);
     c4a:	f8 01       	movw	r30, r16
     c4c:	81 91       	ld	r24, Z+
     c4e:	8f 01       	movw	r16, r30
     c50:	66 de       	rcall	.-820    	; 0x91e <ds1302_shiftout>

    ds1302_setbyte(0x8e,0x00);                           // Disable WP
    CE_PORT|=_BV(CE_PIN);                                // Set CE high
    Delay_ns(DS1302_TCC);
    ds1302_shiftout(0xbe);                               // Burst write of time sets all registers in sync with each other
    for (c1=0;c1<8;c1++)
     c52:	0e 15       	cp	r16, r14
     c54:	1f 05       	cpc	r17, r15
     c56:	c9 f7       	brne	.-14     	; 0xc4a <ds1302_set_time+0x9a>
      ds1302_shiftout(s1[c1]);
    CE_PORT&=~_BV(CE_PIN);                               // Take CE back low
     c58:	92 98       	cbi	0x12, 2	; 18
    Delay_ns(DS1302_CWH);
     c5a:	f2 e0       	ldi	r31, 0x02	; 2
     c5c:	fa 95       	dec	r31
     c5e:	f1 f7       	brne	.-4      	; 0xc5c <ds1302_set_time+0xac>
     c60:	00 c0       	rjmp	.+0      	; 0xc62 <ds1302_set_time+0xb2>
    ds1302_setbyte(0x8e,0x80);                           // Reenable WP
     c62:	60 e8       	ldi	r22, 0x80	; 128
     c64:	8e e8       	ldi	r24, 0x8E	; 142
  }
     c66:	28 96       	adiw	r28, 0x08	; 8
     c68:	0f b6       	in	r0, 0x3f	; 63
     c6a:	f8 94       	cli
     c6c:	de bf       	out	0x3e, r29	; 62
     c6e:	0f be       	out	0x3f, r0	; 63
     c70:	cd bf       	out	0x3d, r28	; 61
     c72:	df 91       	pop	r29
     c74:	cf 91       	pop	r28
     c76:	1f 91       	pop	r17
     c78:	0f 91       	pop	r16
     c7a:	ff 90       	pop	r15
     c7c:	ef 90       	pop	r14
    ds1302_shiftout(0xbe);                               // Burst write of time sets all registers in sync with each other
    for (c1=0;c1<8;c1++)
      ds1302_shiftout(s1[c1]);
    CE_PORT&=~_BV(CE_PIN);                               // Take CE back low
    Delay_ns(DS1302_CWH);
    ds1302_setbyte(0x8e,0x80);                           // Reenable WP
     c7e:	83 ce       	rjmp	.-762    	; 0x986 <ds1302_setbyte>

00000c80 <ds1302_get_ram>:
  }

unsigned char ds1302_get_ram(unsigned char AAddress)
  {
    if (AAddress<28)
     c80:	8c 31       	cpi	r24, 0x1C	; 28
     c82:	18 f4       	brcc	.+6      	; 0xc8a <ds1302_get_ram+0xa>
      return ds1302_getbyte(0xc1+2*AAddress);
     c84:	88 0f       	add	r24, r24
     c86:	8f 53       	subi	r24, 0x3F	; 63
     c88:	70 ce       	rjmp	.-800    	; 0x96a <ds1302_getbyte>
    else return 0;
  }
     c8a:	80 e0       	ldi	r24, 0x00	; 0
     c8c:	08 95       	ret

00000c8e <ds1302_set_ram>:

void ds1302_set_ram(unsigned char AAddress, unsigned char AValue)
  {
     c8e:	cf 93       	push	r28
     c90:	df 93       	push	r29
     c92:	c8 2f       	mov	r28, r24
     c94:	d6 2f       	mov	r29, r22
    if (AAddress<28)
     c96:	8c 31       	cpi	r24, 0x1C	; 28
     c98:	68 f4       	brcc	.+26     	; 0xcb4 <ds1302_set_ram+0x26>
      {
        ds1302_setbyte(0x8e,0x00);                           // Disable WP
     c9a:	60 e0       	ldi	r22, 0x00	; 0
     c9c:	8e e8       	ldi	r24, 0x8E	; 142
     c9e:	73 de       	rcall	.-794    	; 0x986 <ds1302_setbyte>
        ds1302_setbyte(0xc0+2*AAddress,AValue);              // Write
     ca0:	8c 2f       	mov	r24, r28
     ca2:	88 0f       	add	r24, r24
     ca4:	6d 2f       	mov	r22, r29
     ca6:	80 54       	subi	r24, 0x40	; 64
     ca8:	6e de       	rcall	.-804    	; 0x986 <ds1302_setbyte>
        ds1302_setbyte(0x8e,0x80);                           // Reenable WP
     caa:	60 e8       	ldi	r22, 0x80	; 128
     cac:	8e e8       	ldi	r24, 0x8E	; 142
      }
  }
     cae:	df 91       	pop	r29
     cb0:	cf 91       	pop	r28
  {
    if (AAddress<28)
      {
        ds1302_setbyte(0x8e,0x00);                           // Disable WP
        ds1302_setbyte(0xc0+2*AAddress,AValue);              // Write
        ds1302_setbyte(0x8e,0x80);                           // Reenable WP
     cb2:	69 ce       	rjmp	.-814    	; 0x986 <ds1302_setbyte>
      }
  }
     cb4:	df 91       	pop	r29
     cb6:	cf 91       	pop	r28
     cb8:	08 95       	ret

00000cba <usart_init>:


void usart_init(void)
{
	//Set baud rate
	UBRRL=UBRRVAL; //low byte
     cba:	86 e1       	ldi	r24, 0x16	; 22
     cbc:	89 b9       	out	0x09, r24	; 9
	UBRRH=(UBRRVAL>>8); //high byte
     cbe:	10 bc       	out	0x20, r1	; 32

	//Set data frame format: asynchronous mode,no parity, 1 stop bit, 8 bit size
	UCSRC=(1<<URSEL)|(0<<UMSEL)|(0<<UPM1)|(0<<UPM0)|
     cc0:	86 e8       	ldi	r24, 0x86	; 134
     cc2:	80 bd       	out	0x20, r24	; 32
	(0<<USBS)|(0<<UCSZ2)|(1<<UCSZ1)|(1<<UCSZ0);

	//Enable Transmitter and Receiver
	UCSRB=(1<<RXEN)|(1<<TXEN);
     cc4:	88 e1       	ldi	r24, 0x18	; 24
     cc6:	8a b9       	out	0x0a, r24	; 10
     cc8:	08 95       	ret

00000cca <usart_enable_interrupt>:
}

void usart_enable_interrupt(void) {
    UCSRB |= (1<<RXCIE);
     cca:	57 9a       	sbi	0x0a, 7	; 10
     ccc:	08 95       	ret

00000cce <usart_write_byte>:
}

void usart_write_byte(char c)
{
	// Wait if a byte is being transmitted
	while((UCSRA&(1<<UDRE)) == 0);
     cce:	5d 9b       	sbis	0x0b, 5	; 11
     cd0:	fe cf       	rjmp	.-4      	; 0xcce <usart_write_byte>

	// Transmit data
	UDR = c; 
     cd2:	8c b9       	out	0x0c, r24	; 12
     cd4:	08 95       	ret

00000cd6 <usart_read_byte>:
}

char usart_read_byte(void)
{
	 // Wait until a byte has been received
	while((UCSRA&(1<<RXC)) == 0);
     cd6:	5f 9b       	sbis	0x0b, 7	; 11
     cd8:	fe cf       	rjmp	.-4      	; 0xcd6 <usart_read_byte>

	// Return received data
	return UDR;
     cda:	8c b1       	in	r24, 0x0c	; 12
}
     cdc:	08 95       	ret

00000cde <usart_read_line>:

void usart_read_line(char* str, const uint16_t max_size)
{
     cde:	0f 93       	push	r16
     ce0:	1f 93       	push	r17
     ce2:	cf 93       	push	r28
     ce4:	df 93       	push	r29
     ce6:	8b 01       	movw	r16, r22
    char* iter;
    for (iter = str; (iter < str + max_size - 1) && (*iter != '\n'); ++iter) {
     ce8:	ec 01       	movw	r28, r24
     cea:	01 50       	subi	r16, 0x01	; 1
     cec:	11 09       	sbc	r17, r1
     cee:	08 0f       	add	r16, r24
     cf0:	19 1f       	adc	r17, r25
     cf2:	c0 17       	cp	r28, r16
     cf4:	d1 07       	cpc	r29, r17
     cf6:	30 f0       	brcs	.+12     	; 0xd04 <usart_read_line+0x26>
        *iter = usart_read_byte();
    }
    *(++iter) = '\0';
     cf8:	19 82       	std	Y+1, r1	; 0x01
}
     cfa:	df 91       	pop	r29
     cfc:	cf 91       	pop	r28
     cfe:	1f 91       	pop	r17
     d00:	0f 91       	pop	r16
     d02:	08 95       	ret
}

void usart_read_line(char* str, const uint16_t max_size)
{
    char* iter;
    for (iter = str; (iter < str + max_size - 1) && (*iter != '\n'); ++iter) {
     d04:	88 81       	ld	r24, Y
     d06:	8a 30       	cpi	r24, 0x0A	; 10
     d08:	b9 f3       	breq	.-18     	; 0xcf8 <usart_read_line+0x1a>
        *iter = usart_read_byte();
     d0a:	e5 df       	rcall	.-54     	; 0xcd6 <usart_read_byte>
     d0c:	89 93       	st	Y+, r24
     d0e:	f1 cf       	rjmp	.-30     	; 0xcf2 <usart_read_line+0x14>

00000d10 <usart_write_string>:
    }
    *(++iter) = '\0';
}

void usart_write_string(char* str, bool line)
{
     d10:	ef 92       	push	r14
     d12:	ff 92       	push	r15
     d14:	0f 93       	push	r16
     d16:	1f 93       	push	r17
     d18:	cf 93       	push	r28
     d1a:	df 93       	push	r29
     d1c:	1f 92       	push	r1
     d1e:	cd b7       	in	r28, 0x3d	; 61
     d20:	de b7       	in	r29, 0x3e	; 62
     d22:	8c 01       	movw	r16, r24
    char* iter;
    for (iter = str; iter < str + strlen(str); ++iter) {
     d24:	7c 01       	movw	r14, r24
     d26:	f8 01       	movw	r30, r16
     d28:	01 90       	ld	r0, Z+
     d2a:	00 20       	and	r0, r0
     d2c:	e9 f7       	brne	.-6      	; 0xd28 <usart_write_string+0x18>
     d2e:	31 97       	sbiw	r30, 0x01	; 1
     d30:	ee 16       	cp	r14, r30
     d32:	ff 06       	cpc	r15, r31
     d34:	38 f4       	brcc	.+14     	; 0xd44 <usart_write_string+0x34>
        usart_write_byte(*iter);
     d36:	f7 01       	movw	r30, r14
     d38:	81 91       	ld	r24, Z+
     d3a:	7f 01       	movw	r14, r30
     d3c:	69 83       	std	Y+1, r22	; 0x01
     d3e:	c7 df       	rcall	.-114    	; 0xcce <usart_write_byte>
     d40:	69 81       	ldd	r22, Y+1	; 0x01
     d42:	f1 cf       	rjmp	.-30     	; 0xd26 <usart_write_string+0x16>
    }
    if (line) {
     d44:	66 23       	and	r22, r22
     d46:	49 f0       	breq	.+18     	; 0xd5a <usart_write_string+0x4a>
        usart_write_byte('\n');
     d48:	8a e0       	ldi	r24, 0x0A	; 10
    }
}
     d4a:	0f 90       	pop	r0
     d4c:	df 91       	pop	r29
     d4e:	cf 91       	pop	r28
     d50:	1f 91       	pop	r17
     d52:	0f 91       	pop	r16
     d54:	ff 90       	pop	r15
     d56:	ef 90       	pop	r14
    char* iter;
    for (iter = str; iter < str + strlen(str); ++iter) {
        usart_write_byte(*iter);
    }
    if (line) {
        usart_write_byte('\n');
     d58:	ba cf       	rjmp	.-140    	; 0xcce <usart_write_byte>
    }
}
     d5a:	0f 90       	pop	r0
     d5c:	df 91       	pop	r29
     d5e:	cf 91       	pop	r28
     d60:	1f 91       	pop	r17
     d62:	0f 91       	pop	r16
     d64:	ff 90       	pop	r15
     d66:	ef 90       	pop	r14
     d68:	08 95       	ret

00000d6a <is_year_leap>:
    {0,31,59,90,120,151,181,212,243,273,304,334,365},   // 365 days, non-leap
    {0,31,60,91,121,152,182,213,244,274,305,335,366}    // 366 days, leap
};

bool is_year_leap(uint16_t year)
{
     d6a:	9c 01       	movw	r18, r24
    return !(year % 4) && (year % 100 || !(year % 400));
     d6c:	83 70       	andi	r24, 0x03	; 3
     d6e:	99 27       	eor	r25, r25
     d70:	89 2b       	or	r24, r25
     d72:	71 f4       	brne	.+28     	; 0xd90 <is_year_leap+0x26>
     d74:	c9 01       	movw	r24, r18
     d76:	64 e6       	ldi	r22, 0x64	; 100
     d78:	70 e0       	ldi	r23, 0x00	; 0
     d7a:	c6 d4       	rcall	.+2444   	; 0x1708 <__udivmodhi4>
     d7c:	89 2b       	or	r24, r25
     d7e:	11 f0       	breq	.+4      	; 0xd84 <is_year_leap+0x1a>
     d80:	81 e0       	ldi	r24, 0x01	; 1
     d82:	08 95       	ret
     d84:	c9 01       	movw	r24, r18
     d86:	60 e9       	ldi	r22, 0x90	; 144
     d88:	71 e0       	ldi	r23, 0x01	; 1
     d8a:	be d4       	rcall	.+2428   	; 0x1708 <__udivmodhi4>
     d8c:	89 2b       	or	r24, r25
     d8e:	c1 f3       	breq	.-16     	; 0xd80 <is_year_leap+0x16>
     d90:	80 e0       	ldi	r24, 0x00	; 0
}
     d92:	08 95       	ret

00000d94 <time_t_from_ymdhms>:


time_t time_t_from_ymdhms(struct ymdhms_t* t)
{
     d94:	2f 92       	push	r2
     d96:	3f 92       	push	r3
     d98:	4f 92       	push	r4
     d9a:	5f 92       	push	r5
     d9c:	6f 92       	push	r6
     d9e:	7f 92       	push	r7
     da0:	8f 92       	push	r8
     da2:	9f 92       	push	r9
     da4:	af 92       	push	r10
     da6:	bf 92       	push	r11
     da8:	cf 92       	push	r12
     daa:	df 92       	push	r13
     dac:	ef 92       	push	r14
     dae:	ff 92       	push	r15
     db0:	0f 93       	push	r16
     db2:	1f 93       	push	r17
     db4:	cf 93       	push	r28
     db6:	df 93       	push	r29
     db8:	cd b7       	in	r28, 0x3d	; 61
     dba:	de b7       	in	r29, 0x3e	; 62
     dbc:	63 97       	sbiw	r28, 0x13	; 19
     dbe:	0f b6       	in	r0, 0x3f	; 63
     dc0:	f8 94       	cli
     dc2:	de bf       	out	0x3e, r29	; 62
     dc4:	0f be       	out	0x3f, r0	; 63
     dc6:	cd bf       	out	0x3d, r28	; 61
     dc8:	1c 01       	movw	r2, r24
    uint16_t year = t->year + 2000;
     dca:	dc 01       	movw	r26, r24
     dcc:	0c 91       	ld	r16, X
     dce:	10 e0       	ldi	r17, 0x00	; 0
     dd0:	00 53       	subi	r16, 0x30	; 48
     dd2:	18 4f       	sbci	r17, 0xF8	; 248

    uint8_t tm_sec = t->second;
    uint8_t tm_min = t->minute;
     dd4:	15 96       	adiw	r26, 0x05	; 5
     dd6:	6c 90       	ld	r6, X
    uint8_t tm_hour = t->hour;
    uint8_t tm_year = year - 1900;

    uint16_t tm_yday = daysSinceJan1st[is_year_leap(year)][t->month - 1]
     dd8:	c8 01       	movw	r24, r16
     dda:	c7 df       	rcall	.-114    	; 0xd6a <is_year_leap>
     ddc:	8d 87       	std	Y+13, r24	; 0x0d
    uint16_t year = t->year + 2000;

    uint8_t tm_sec = t->second;
    uint8_t tm_min = t->minute;
    uint8_t tm_hour = t->hour;
    uint8_t tm_year = year - 1900;
     dde:	b4 e9       	ldi	r27, 0x94	; 148
     de0:	b0 0f       	add	r27, r16
     de2:	b9 87       	std	Y+9, r27	; 0x09
    uint16_t tm_yday = daysSinceJan1st[is_year_leap(year)][t->month - 1]
        + t->day - 1;


    return (
            (time_t)tm_sec + (time_t)tm_min*60 + (time_t)tm_hour*3600
     de4:	f1 01       	movw	r30, r2
     de6:	26 81       	ldd	r18, Z+6	; 0x06
            + (time_t)tm_yday*86400
     de8:	30 e0       	ldi	r19, 0x00	; 0
     dea:	40 e0       	ldi	r20, 0x00	; 0
     dec:	50 e0       	ldi	r21, 0x00	; 0
     dee:	60 e0       	ldi	r22, 0x00	; 0
     df0:	70 e0       	ldi	r23, 0x00	; 0
     df2:	80 e0       	ldi	r24, 0x00	; 0
     df4:	90 e0       	ldi	r25, 0x00	; 0
     df6:	35 51       	subi	r19, 0x15	; 21
     df8:	44 49       	sbci	r20, 0x94	; 148
     dfa:	53 48       	sbci	r21, 0x83	; 131
     dfc:	61 09       	sbc	r22, r1
     dfe:	71 09       	sbc	r23, r1
     e00:	81 09       	sbc	r24, r1
     e02:	91 09       	sbc	r25, r1
     e04:	72 2e       	mov	r7, r18
     e06:	83 2e       	mov	r8, r19
     e08:	94 2e       	mov	r9, r20
     e0a:	59 83       	std	Y+1, r21	; 0x01
     e0c:	56 2e       	mov	r5, r22
     e0e:	b7 2f       	mov	r27, r23
     e10:	a8 2f       	mov	r26, r24
     e12:	49 2e       	mov	r4, r25
    uint16_t tm_yday = daysSinceJan1st[is_year_leap(year)][t->month - 1]
        + t->day - 1;


    return (
            (time_t)tm_sec + (time_t)tm_min*60 + (time_t)tm_hour*3600
     e14:	a4 80       	ldd	r10, Z+4	; 0x04
     e16:	2a 2d       	mov	r18, r10
     e18:	30 e0       	ldi	r19, 0x00	; 0
     e1a:	40 e0       	ldi	r20, 0x00	; 0
     e1c:	50 e0       	ldi	r21, 0x00	; 0
     e1e:	60 e0       	ldi	r22, 0x00	; 0
     e20:	70 e0       	ldi	r23, 0x00	; 0
     e22:	80 e0       	ldi	r24, 0x00	; 0
     e24:	90 e0       	ldi	r25, 0x00	; 0
     e26:	04 e0       	ldi	r16, 0x04	; 4
     e28:	20 d5       	rcall	.+2624   	; 0x186a <__ashldi3>
     e2a:	b1 2c       	mov	r11, r1
     e2c:	c1 2c       	mov	r12, r1
     e2e:	d1 2c       	mov	r13, r1
     e30:	e1 2c       	mov	r14, r1
     e32:	f1 2c       	mov	r15, r1
     e34:	00 e0       	ldi	r16, 0x00	; 0
     e36:	10 e0       	ldi	r17, 0x00	; 0
     e38:	64 d5       	rcall	.+2760   	; 0x1902 <__subdi3>
     e3a:	59 01       	movw	r10, r18
     e3c:	6a 01       	movw	r12, r20
     e3e:	7b 01       	movw	r14, r22
     e40:	e8 2f       	mov	r30, r24
     e42:	19 2f       	mov	r17, r25
     e44:	04 e0       	ldi	r16, 0x04	; 4
     e46:	11 d5       	rcall	.+2594   	; 0x186a <__ashldi3>
     e48:	0e 2f       	mov	r16, r30
     e4a:	5b d5       	rcall	.+2742   	; 0x1902 <__subdi3>
     e4c:	04 e0       	ldi	r16, 0x04	; 4
     e4e:	0d d5       	rcall	.+2586   	; 0x186a <__ashldi3>
     e50:	59 01       	movw	r10, r18
     e52:	6a 01       	movw	r12, r20
     e54:	7b 01       	movw	r14, r22
     e56:	8c 01       	movw	r16, r24
            + (time_t)tm_yday*86400
            + ((time_t)tm_year-70)*31536000 
     e58:	27 2d       	mov	r18, r7
     e5a:	38 2d       	mov	r19, r8
     e5c:	49 2d       	mov	r20, r9
     e5e:	59 81       	ldd	r21, Y+1	; 0x01
     e60:	65 2d       	mov	r22, r5
     e62:	7b 2f       	mov	r23, r27
     e64:	8a 2f       	mov	r24, r26
     e66:	94 2d       	mov	r25, r4
     e68:	37 d5       	rcall	.+2670   	; 0x18d8 <__adddi3>
     e6a:	49 01       	movw	r8, r18
     e6c:	e4 2f       	mov	r30, r20
     e6e:	75 2e       	mov	r7, r21
     e70:	b6 2f       	mov	r27, r22
     e72:	a7 2f       	mov	r26, r23
     e74:	58 2e       	mov	r5, r24
     e76:	49 2e       	mov	r4, r25
    uint16_t tm_yday = daysSinceJan1st[is_year_leap(year)][t->month - 1]
        + t->day - 1;


    return (
            (time_t)tm_sec + (time_t)tm_min*60 + (time_t)tm_hour*3600
     e78:	26 2d       	mov	r18, r6
     e7a:	30 e0       	ldi	r19, 0x00	; 0
     e7c:	40 e0       	ldi	r20, 0x00	; 0
     e7e:	50 e0       	ldi	r21, 0x00	; 0
     e80:	60 e0       	ldi	r22, 0x00	; 0
     e82:	70 e0       	ldi	r23, 0x00	; 0
     e84:	cb 01       	movw	r24, r22
     e86:	69 82       	std	Y+1, r6	; 0x01
     e88:	3a 83       	std	Y+2, r19	; 0x02
     e8a:	4b 83       	std	Y+3, r20	; 0x03
     e8c:	5c 83       	std	Y+4, r21	; 0x04
     e8e:	6d 83       	std	Y+5, r22	; 0x05
     e90:	7e 83       	std	Y+6, r23	; 0x06
     e92:	8f 83       	std	Y+7, r24	; 0x07
     e94:	98 87       	std	Y+8, r25	; 0x08
     e96:	60 e0       	ldi	r22, 0x00	; 0
     e98:	70 e0       	ldi	r23, 0x00	; 0
     e9a:	80 e0       	ldi	r24, 0x00	; 0
     e9c:	90 e0       	ldi	r25, 0x00	; 0
     e9e:	04 e0       	ldi	r16, 0x04	; 4
     ea0:	e4 d4       	rcall	.+2504   	; 0x186a <__ashldi3>
     ea2:	a9 80       	ldd	r10, Y+1	; 0x01
     ea4:	ba 80       	ldd	r11, Y+2	; 0x02
     ea6:	cb 80       	ldd	r12, Y+3	; 0x03
     ea8:	dc 80       	ldd	r13, Y+4	; 0x04
     eaa:	e1 2c       	mov	r14, r1
     eac:	f1 2c       	mov	r15, r1
     eae:	00 e0       	ldi	r16, 0x00	; 0
     eb0:	10 e0       	ldi	r17, 0x00	; 0
     eb2:	27 d5       	rcall	.+2638   	; 0x1902 <__subdi3>
     eb4:	02 e0       	ldi	r16, 0x02	; 2
     eb6:	d9 d4       	rcall	.+2482   	; 0x186a <__ashldi3>
     eb8:	59 01       	movw	r10, r18
     eba:	6a 01       	movw	r12, r20
     ebc:	7b 01       	movw	r14, r22
     ebe:	8c 01       	movw	r16, r24
            + (time_t)tm_yday*86400
            + ((time_t)tm_year-70)*31536000 
                + (((time_t)tm_year-69)/4)*86400
     ec0:	94 01       	movw	r18, r8
     ec2:	4e 2f       	mov	r20, r30
     ec4:	57 2d       	mov	r21, r7
     ec6:	6b 2f       	mov	r22, r27
     ec8:	7a 2f       	mov	r23, r26
     eca:	85 2d       	mov	r24, r5
     ecc:	94 2d       	mov	r25, r4
     ece:	04 d5       	rcall	.+2568   	; 0x18d8 <__adddi3>
     ed0:	29 83       	std	Y+1, r18	; 0x01
     ed2:	3a 87       	std	Y+10, r19	; 0x0a
     ed4:	2a 01       	movw	r4, r20
     ed6:	3b 01       	movw	r6, r22
     ed8:	8b 87       	std	Y+11, r24	; 0x0b
     eda:	9c 87       	std	Y+12, r25	; 0x0c


    return (
            (time_t)tm_sec + (time_t)tm_min*60 + (time_t)tm_hour*3600
            + (time_t)tm_yday*86400
            + ((time_t)tm_year-70)*31536000 
     edc:	29 85       	ldd	r18, Y+9	; 0x09
     ede:	30 e0       	ldi	r19, 0x00	; 0
     ee0:	40 e0       	ldi	r20, 0x00	; 0
     ee2:	50 e0       	ldi	r21, 0x00	; 0
     ee4:	60 e0       	ldi	r22, 0x00	; 0
     ee6:	70 e0       	ldi	r23, 0x00	; 0
     ee8:	80 e0       	ldi	r24, 0x00	; 0
     eea:	90 e0       	ldi	r25, 0x00	; 0
     eec:	03 e0       	ldi	r16, 0x03	; 3
     eee:	bd d4       	rcall	.+2426   	; 0x186a <__ashldi3>
     ef0:	49 01       	movw	r8, r18
     ef2:	4f 87       	std	Y+15, r20	; 0x0f
     ef4:	5e 87       	std	Y+14, r21	; 0x0e
     ef6:	b6 2f       	mov	r27, r22
     ef8:	a7 2f       	mov	r26, r23
     efa:	f8 2f       	mov	r31, r24
     efc:	e9 2f       	mov	r30, r25
     efe:	b5 d4       	rcall	.+2410   	; 0x186a <__ashldi3>
     f00:	59 01       	movw	r10, r18
     f02:	6a 01       	movw	r12, r20
     f04:	7b 01       	movw	r14, r22
     f06:	8c 01       	movw	r16, r24
     f08:	94 01       	movw	r18, r8
     f0a:	4f 85       	ldd	r20, Y+15	; 0x0f
     f0c:	5e 85       	ldd	r21, Y+14	; 0x0e
     f0e:	6b 2f       	mov	r22, r27
     f10:	7a 2f       	mov	r23, r26
     f12:	8f 2f       	mov	r24, r31
     f14:	9e 2f       	mov	r25, r30
     f16:	e0 d4       	rcall	.+2496   	; 0x18d8 <__adddi3>
     f18:	a9 84       	ldd	r10, Y+9	; 0x09
     f1a:	b1 2c       	mov	r11, r1
     f1c:	c1 2c       	mov	r12, r1
     f1e:	d1 2c       	mov	r13, r1
     f20:	e1 2c       	mov	r14, r1
     f22:	f1 2c       	mov	r15, r1
     f24:	00 e0       	ldi	r16, 0x00	; 0
     f26:	10 e0       	ldi	r17, 0x00	; 0
     f28:	d7 d4       	rcall	.+2478   	; 0x18d8 <__adddi3>
     f2a:	59 01       	movw	r10, r18
     f2c:	6a 01       	movw	r12, r20
     f2e:	7b 01       	movw	r14, r22
     f30:	e8 2f       	mov	r30, r24
     f32:	19 2f       	mov	r17, r25
     f34:	04 e0       	ldi	r16, 0x04	; 4
     f36:	99 d4       	rcall	.+2354   	; 0x186a <__ashldi3>
     f38:	0e 2f       	mov	r16, r30
     f3a:	e3 d4       	rcall	.+2502   	; 0x1902 <__subdi3>
     f3c:	59 01       	movw	r10, r18
     f3e:	6a 01       	movw	r12, r20
     f40:	7b 01       	movw	r14, r22
     f42:	e8 2f       	mov	r30, r24
     f44:	19 2f       	mov	r17, r25
     f46:	04 e0       	ldi	r16, 0x04	; 4
     f48:	90 d4       	rcall	.+2336   	; 0x186a <__ashldi3>
     f4a:	0e 2f       	mov	r16, r30
     f4c:	da d4       	rcall	.+2484   	; 0x1902 <__subdi3>
     f4e:	59 01       	movw	r10, r18
     f50:	6a 01       	movw	r12, r20
     f52:	7b 01       	movw	r14, r22
     f54:	e8 2f       	mov	r30, r24
     f56:	19 2f       	mov	r17, r25
     f58:	04 e0       	ldi	r16, 0x04	; 4
     f5a:	87 d4       	rcall	.+2318   	; 0x186a <__ashldi3>
     f5c:	0e 2f       	mov	r16, r30
     f5e:	d1 d4       	rcall	.+2466   	; 0x1902 <__subdi3>
     f60:	07 e0       	ldi	r16, 0x07	; 7
     f62:	83 d4       	rcall	.+2310   	; 0x186a <__ashldi3>
     f64:	59 01       	movw	r10, r18
     f66:	6a 01       	movw	r12, r20
     f68:	7b 01       	movw	r14, r22
     f6a:	8c 01       	movw	r16, r24
                + (((time_t)tm_year-69)/4)*86400
            - (((time_t)tm_year-1)/100)*86400 
     f6c:	29 81       	ldd	r18, Y+1	; 0x01
     f6e:	3a 85       	ldd	r19, Y+10	; 0x0a
     f70:	a2 01       	movw	r20, r4
     f72:	b3 01       	movw	r22, r6
     f74:	8b 85       	ldd	r24, Y+11	; 0x0b
     f76:	9c 85       	ldd	r25, Y+12	; 0x0c
     f78:	af d4       	rcall	.+2398   	; 0x18d8 <__adddi3>
     f7a:	29 01       	movw	r4, r18
     f7c:	3a 01       	movw	r6, r20
     f7e:	4b 01       	movw	r8, r22
     f80:	8a 87       	std	Y+10, r24	; 0x0a
     f82:	99 83       	std	Y+1, r25	; 0x01
     f84:	29 85       	ldd	r18, Y+9	; 0x09
     f86:	30 e0       	ldi	r19, 0x00	; 0
     f88:	40 e0       	ldi	r20, 0x00	; 0
     f8a:	50 e0       	ldi	r21, 0x00	; 0
     f8c:	60 e0       	ldi	r22, 0x00	; 0
     f8e:	70 e0       	ldi	r23, 0x00	; 0
     f90:	80 e0       	ldi	r24, 0x00	; 0
     f92:	90 e0       	ldi	r25, 0x00	; 0
     f94:	af ef       	ldi	r26, 0xFF	; 255
     f96:	a9 d4       	rcall	.+2386   	; 0x18ea <__adddi3_s8>
     f98:	e4 e6       	ldi	r30, 0x64	; 100
     f9a:	ae 2e       	mov	r10, r30
     f9c:	b1 2c       	mov	r11, r1
     f9e:	c1 2c       	mov	r12, r1
     fa0:	d1 2c       	mov	r13, r1
     fa2:	e1 2c       	mov	r14, r1
     fa4:	f1 2c       	mov	r15, r1
     fa6:	00 e0       	ldi	r16, 0x00	; 0
     fa8:	10 e0       	ldi	r17, 0x00	; 0
     faa:	c4 d3       	rcall	.+1928   	; 0x1734 <__udivdi3>
     fac:	59 01       	movw	r10, r18
     fae:	6a 01       	movw	r12, r20
     fb0:	7b 01       	movw	r14, r22
     fb2:	e8 2f       	mov	r30, r24
     fb4:	19 2f       	mov	r17, r25
     fb6:	02 e0       	ldi	r16, 0x02	; 2
     fb8:	58 d4       	rcall	.+2224   	; 0x186a <__ashldi3>
     fba:	0e 2f       	mov	r16, r30
     fbc:	a2 d4       	rcall	.+2372   	; 0x1902 <__subdi3>
     fbe:	59 01       	movw	r10, r18
     fc0:	6a 01       	movw	r12, r20
     fc2:	7b 01       	movw	r14, r22
     fc4:	e8 2f       	mov	r30, r24
     fc6:	19 2f       	mov	r17, r25
     fc8:	04 e0       	ldi	r16, 0x04	; 4
     fca:	4f d4       	rcall	.+2206   	; 0x186a <__ashldi3>
     fcc:	0e 2f       	mov	r16, r30
     fce:	99 d4       	rcall	.+2354   	; 0x1902 <__subdi3>
     fd0:	59 01       	movw	r10, r18
     fd2:	6a 01       	movw	r12, r20
     fd4:	7b 01       	movw	r14, r22
     fd6:	e8 2f       	mov	r30, r24
     fd8:	19 2f       	mov	r17, r25
     fda:	04 e0       	ldi	r16, 0x04	; 4
     fdc:	46 d4       	rcall	.+2188   	; 0x186a <__ashldi3>
     fde:	0e 2f       	mov	r16, r30
     fe0:	90 d4       	rcall	.+2336   	; 0x1902 <__subdi3>
     fe2:	07 e0       	ldi	r16, 0x07	; 7
     fe4:	42 d4       	rcall	.+2180   	; 0x186a <__ashldi3>
     fe6:	59 01       	movw	r10, r18
     fe8:	6a 01       	movw	r12, r20
     fea:	7b 01       	movw	r14, r22
     fec:	8c 01       	movw	r16, r24
                + (((time_t)tm_year+299)/400)*86400
     fee:	92 01       	movw	r18, r4
     ff0:	a3 01       	movw	r20, r6
     ff2:	b4 01       	movw	r22, r8
     ff4:	8a 85       	ldd	r24, Y+10	; 0x0a
     ff6:	99 81       	ldd	r25, Y+1	; 0x01
     ff8:	84 d4       	rcall	.+2312   	; 0x1902 <__subdi3>
     ffa:	2a 8b       	std	Y+18, r18	; 0x12
     ffc:	39 83       	std	Y+1, r19	; 0x01
     ffe:	4a 87       	std	Y+10, r20	; 0x0a
    1000:	5b 87       	std	Y+11, r21	; 0x0b
    1002:	6c 87       	std	Y+12, r22	; 0x0c
    1004:	7e 87       	std	Y+14, r23	; 0x0e
    1006:	8f 87       	std	Y+15, r24	; 0x0f
    1008:	98 8b       	std	Y+16, r25	; 0x10

    return (
            (time_t)tm_sec + (time_t)tm_min*60 + (time_t)tm_hour*3600
            + (time_t)tm_yday*86400
            + ((time_t)tm_year-70)*31536000 
                + (((time_t)tm_year-69)/4)*86400
    100a:	29 85       	ldd	r18, Y+9	; 0x09
    100c:	30 e0       	ldi	r19, 0x00	; 0
    100e:	40 e0       	ldi	r20, 0x00	; 0
    1010:	50 e0       	ldi	r21, 0x00	; 0
    1012:	60 e0       	ldi	r22, 0x00	; 0
    1014:	70 e0       	ldi	r23, 0x00	; 0
    1016:	80 e0       	ldi	r24, 0x00	; 0
    1018:	90 e0       	ldi	r25, 0x00	; 0
    101a:	ab eb       	ldi	r26, 0xBB	; 187
    101c:	66 d4       	rcall	.+2252   	; 0x18ea <__adddi3_s8>
    101e:	02 e0       	ldi	r16, 0x02	; 2
    1020:	3f d4       	rcall	.+2174   	; 0x18a0 <__lshrdi3>
    1022:	29 8b       	std	Y+17, r18	; 0x11
    1024:	43 2e       	mov	r4, r19
    1026:	54 2e       	mov	r5, r20
    1028:	65 2e       	mov	r6, r21
    102a:	76 2e       	mov	r7, r22
    102c:	87 2e       	mov	r8, r23
    102e:	98 2e       	mov	r9, r24
    1030:	9b 8b       	std	Y+19, r25	; 0x13
            - (((time_t)tm_year-1)/100)*86400 
                + (((time_t)tm_year+299)/400)*86400
    1032:	29 85       	ldd	r18, Y+9	; 0x09
    1034:	30 e0       	ldi	r19, 0x00	; 0
    1036:	40 e0       	ldi	r20, 0x00	; 0
    1038:	50 e0       	ldi	r21, 0x00	; 0
    103a:	60 e0       	ldi	r22, 0x00	; 0
    103c:	70 e0       	ldi	r23, 0x00	; 0
    103e:	80 e0       	ldi	r24, 0x00	; 0
    1040:	90 e0       	ldi	r25, 0x00	; 0
    1042:	25 5d       	subi	r18, 0xD5	; 213
    1044:	3e 4f       	sbci	r19, 0xFE	; 254
    1046:	4f 4f       	sbci	r20, 0xFF	; 255
    1048:	5f 4f       	sbci	r21, 0xFF	; 255
    104a:	6f 4f       	sbci	r22, 0xFF	; 255
    104c:	7f 4f       	sbci	r23, 0xFF	; 255
    104e:	8f 4f       	sbci	r24, 0xFF	; 255
    1050:	9f 4f       	sbci	r25, 0xFF	; 255
    1052:	f0 e9       	ldi	r31, 0x90	; 144
    1054:	af 2e       	mov	r10, r31
    1056:	bb 24       	eor	r11, r11
    1058:	b3 94       	inc	r11
    105a:	c1 2c       	mov	r12, r1
    105c:	d1 2c       	mov	r13, r1
    105e:	e1 2c       	mov	r14, r1
    1060:	f1 2c       	mov	r15, r1
    1062:	00 e0       	ldi	r16, 0x00	; 0
    1064:	10 e0       	ldi	r17, 0x00	; 0
    1066:	66 d3       	rcall	.+1740   	; 0x1734 <__udivdi3>
    1068:	59 01       	movw	r10, r18
    106a:	6a 01       	movw	r12, r20
    106c:	7b 01       	movw	r14, r22
    106e:	8c 01       	movw	r16, r24
    1070:	29 89       	ldd	r18, Y+17	; 0x11
    1072:	34 2d       	mov	r19, r4
    1074:	45 2d       	mov	r20, r5
    1076:	56 2d       	mov	r21, r6
    1078:	67 2d       	mov	r22, r7
    107a:	78 2d       	mov	r23, r8
    107c:	89 2d       	mov	r24, r9
    107e:	9b 89       	ldd	r25, Y+19	; 0x13
    1080:	2b d4       	rcall	.+2134   	; 0x18d8 <__adddi3>
    uint8_t tm_sec = t->second;
    uint8_t tm_min = t->minute;
    uint8_t tm_hour = t->hour;
    uint8_t tm_year = year - 1900;

    uint16_t tm_yday = daysSinceJan1st[is_year_leap(year)][t->month - 1]
    1082:	f1 01       	movw	r30, r2
    1084:	a2 81       	ldd	r26, Z+2	; 0x02
    1086:	ea 2e       	mov	r14, r26
    1088:	f1 2c       	mov	r15, r1
    108a:	f1 e0       	ldi	r31, 0x01	; 1
    108c:	ef 1a       	sub	r14, r31
    108e:	f1 08       	sbc	r15, r1
    1090:	d1 01       	movw	r26, r2
    1092:	11 96       	adiw	r26, 0x01	; 1
    1094:	1c 91       	ld	r17, X
    1096:	ad 85       	ldd	r26, Y+13	; 0x0d
    1098:	bd e0       	ldi	r27, 0x0D	; 13
    109a:	ab 9f       	mul	r26, r27
    109c:	f0 01       	movw	r30, r0
    109e:	11 24       	eor	r1, r1
    10a0:	e1 0f       	add	r30, r17
    10a2:	f1 1d       	adc	r31, r1
    10a4:	ee 0f       	add	r30, r30
    10a6:	ff 1f       	adc	r31, r31
    10a8:	ee 0f       	add	r30, r30
    10aa:	ff 1f       	adc	r31, r31
    10ac:	ec 56       	subi	r30, 0x6C	; 108
    10ae:	ff 4f       	sbci	r31, 0xFF	; 255
    10b0:	01 90       	ld	r0, Z+
    10b2:	f0 81       	ld	r31, Z
    10b4:	e0 2d       	mov	r30, r0
    10b6:	ee 0e       	add	r14, r30
    10b8:	ff 1e       	adc	r15, r31
    10ba:	57 01       	movw	r10, r14
    10bc:	c1 2c       	mov	r12, r1
    10be:	d1 2c       	mov	r13, r1
    10c0:	e1 2c       	mov	r14, r1
    10c2:	f1 2c       	mov	r15, r1
    10c4:	00 e0       	ldi	r16, 0x00	; 0
    10c6:	10 e0       	ldi	r17, 0x00	; 0
    10c8:	07 d4       	rcall	.+2062   	; 0x18d8 <__adddi3>
    10ca:	59 01       	movw	r10, r18
    10cc:	6a 01       	movw	r12, r20
    10ce:	7b 01       	movw	r14, r22
    10d0:	e8 2f       	mov	r30, r24
    10d2:	19 2f       	mov	r17, r25
    10d4:	02 e0       	ldi	r16, 0x02	; 2
    10d6:	c9 d3       	rcall	.+1938   	; 0x186a <__ashldi3>
    10d8:	0e 2f       	mov	r16, r30
    10da:	13 d4       	rcall	.+2086   	; 0x1902 <__subdi3>
    10dc:	59 01       	movw	r10, r18
    10de:	6a 01       	movw	r12, r20
    10e0:	7b 01       	movw	r14, r22
    10e2:	e8 2f       	mov	r30, r24
    10e4:	19 2f       	mov	r17, r25
    10e6:	04 e0       	ldi	r16, 0x04	; 4
    10e8:	c0 d3       	rcall	.+1920   	; 0x186a <__ashldi3>
    10ea:	0e 2f       	mov	r16, r30
    10ec:	0a d4       	rcall	.+2068   	; 0x1902 <__subdi3>
    10ee:	59 01       	movw	r10, r18
    10f0:	6a 01       	movw	r12, r20
    10f2:	7b 01       	movw	r14, r22
    10f4:	e8 2f       	mov	r30, r24
    10f6:	19 2f       	mov	r17, r25
    10f8:	04 e0       	ldi	r16, 0x04	; 4
    10fa:	b7 d3       	rcall	.+1902   	; 0x186a <__ashldi3>
    10fc:	0e 2f       	mov	r16, r30
    10fe:	01 d4       	rcall	.+2050   	; 0x1902 <__subdi3>
    1100:	07 e0       	ldi	r16, 0x07	; 7
    1102:	b3 d3       	rcall	.+1894   	; 0x186a <__ashldi3>
    1104:	59 01       	movw	r10, r18
    1106:	6a 01       	movw	r12, r20
    1108:	7b 01       	movw	r14, r22
    110a:	8c 01       	movw	r16, r24
        + t->day - 1;


    return (
    110c:	2a 89       	ldd	r18, Y+18	; 0x12
    110e:	39 81       	ldd	r19, Y+1	; 0x01
    1110:	4a 85       	ldd	r20, Y+10	; 0x0a
    1112:	5b 85       	ldd	r21, Y+11	; 0x0b
    1114:	6c 85       	ldd	r22, Y+12	; 0x0c
    1116:	7e 85       	ldd	r23, Y+14	; 0x0e
    1118:	8f 85       	ldd	r24, Y+15	; 0x0f
    111a:	98 89       	ldd	r25, Y+16	; 0x10
    111c:	dd d3       	rcall	.+1978   	; 0x18d8 <__adddi3>
            - (((time_t)tm_year-1)/100)*86400 
                + (((time_t)tm_year+299)/400)*86400
           );

    // Taken from POSIX manual
}
    111e:	63 96       	adiw	r28, 0x13	; 19
    1120:	0f b6       	in	r0, 0x3f	; 63
    1122:	f8 94       	cli
    1124:	de bf       	out	0x3e, r29	; 62
    1126:	0f be       	out	0x3f, r0	; 63
    1128:	cd bf       	out	0x3d, r28	; 61
    112a:	df 91       	pop	r29
    112c:	cf 91       	pop	r28
    112e:	1f 91       	pop	r17
    1130:	0f 91       	pop	r16
    1132:	ff 90       	pop	r15
    1134:	ef 90       	pop	r14
    1136:	df 90       	pop	r13
    1138:	cf 90       	pop	r12
    113a:	bf 90       	pop	r11
    113c:	af 90       	pop	r10
    113e:	9f 90       	pop	r9
    1140:	8f 90       	pop	r8
    1142:	7f 90       	pop	r7
    1144:	6f 90       	pop	r6
    1146:	5f 90       	pop	r5
    1148:	4f 90       	pop	r4
    114a:	3f 90       	pop	r3
    114c:	2f 90       	pop	r2
    114e:	08 95       	ret

00001150 <ymdhms_from_time_t>:

struct ymdhms_t* ymdhms_from_time_t(struct ymdhms_t* t, time_t sec)
{
    1150:	2f 92       	push	r2
    1152:	3f 92       	push	r3
    1154:	4f 92       	push	r4
    1156:	5f 92       	push	r5
    1158:	6f 92       	push	r6
    115a:	7f 92       	push	r7
    115c:	8f 92       	push	r8
    115e:	9f 92       	push	r9
    1160:	af 92       	push	r10
    1162:	bf 92       	push	r11
    1164:	cf 92       	push	r12
    1166:	df 92       	push	r13
    1168:	ef 92       	push	r14
    116a:	ff 92       	push	r15
    116c:	0f 93       	push	r16
    116e:	1f 93       	push	r17
    1170:	cf 93       	push	r28
    1172:	df 93       	push	r29
    1174:	cd b7       	in	r28, 0x3d	; 61
    1176:	de b7       	in	r29, 0x3e	; 62
    1178:	a0 97       	sbiw	r28, 0x20	; 32
    117a:	0f b6       	in	r0, 0x3f	; 63
    117c:	f8 94       	cli
    117e:	de bf       	out	0x3e, r29	; 62
    1180:	0f be       	out	0x3f, r0	; 63
    1182:	cd bf       	out	0x3d, r28	; 61
    1184:	9e 87       	std	Y+14, r25	; 0x0e
    1186:	8d 87       	std	Y+13, r24	; 0x0d
    1188:	b2 2f       	mov	r27, r18
    118a:	a3 2f       	mov	r26, r19
    118c:	f4 2f       	mov	r31, r20
    118e:	e5 2f       	mov	r30, r21
    1190:	cb 01       	movw	r24, r22
    uint16_t yday;
    bool     leap;
    uint8_t  hour, min;
    uint8_t  month, mday, wday;

    sec += 11644473600; // move bias to 1601
    1192:	98 01       	movw	r18, r16
    1194:	4b 2f       	mov	r20, r27
    1196:	5a 2f       	mov	r21, r26
    1198:	6f 2f       	mov	r22, r31
    119a:	7e 2f       	mov	r23, r30
    119c:	3f 56       	subi	r19, 0x6F	; 111
    119e:	4f 4e       	sbci	r20, 0xEF	; 239
    11a0:	59 44       	sbci	r21, 0x49	; 73
    11a2:	6d 4f       	sbci	r22, 0xFD	; 253
    11a4:	7f 4f       	sbci	r23, 0xFF	; 255
    11a6:	8f 4f       	sbci	r24, 0xFF	; 255
    11a8:	9f 4f       	sbci	r25, 0xFF	; 255
    11aa:	29 01       	movw	r4, r18
    11ac:	3a 01       	movw	r6, r20
    11ae:	4b 01       	movw	r8, r22
    11b0:	1c 01       	movw	r2, r24

    wday = (uint8_t)((sec / 86400 + 1) % 7); // day of week
    11b2:	60 e8       	ldi	r22, 0x80	; 128
    11b4:	a6 2e       	mov	r10, r22
    11b6:	71 e5       	ldi	r23, 0x51	; 81
    11b8:	b7 2e       	mov	r11, r23
    11ba:	cc 24       	eor	r12, r12
    11bc:	c3 94       	inc	r12
    11be:	d1 2c       	mov	r13, r1
    11c0:	e1 2c       	mov	r14, r1
    11c2:	f1 2c       	mov	r15, r1
    11c4:	00 e0       	ldi	r16, 0x00	; 0
    11c6:	10 e0       	ldi	r17, 0x00	; 0
    11c8:	92 01       	movw	r18, r4
    11ca:	a3 01       	movw	r20, r6
    11cc:	b4 01       	movw	r22, r8
    11ce:	c1 01       	movw	r24, r2
    11d0:	b1 d2       	rcall	.+1378   	; 0x1734 <__udivdi3>
    11d2:	a1 e0       	ldi	r26, 0x01	; 1
    11d4:	8a d3       	rcall	.+1812   	; 0x18ea <__adddi3_s8>
    11d6:	e7 e0       	ldi	r30, 0x07	; 7
    11d8:	ae 2e       	mov	r10, r30
    11da:	b1 2c       	mov	r11, r1
    11dc:	c1 2c       	mov	r12, r1
    11de:	a8 d2       	rcall	.+1360   	; 0x1730 <__umoddi3>
    11e0:	2b 8b       	std	Y+19, r18	; 0x13

    // Remove multiples of 400 years (incl. 97 leap days)
    quadricentennials = (uint16_t)(sec / 12622780800ULL); // 400*365.2425*24*3600
    11e2:	f0 e8       	ldi	r31, 0x80	; 128
    11e4:	af 2e       	mov	r10, r31
    11e6:	a9 e5       	ldi	r26, 0x59	; 89
    11e8:	ba 2e       	mov	r11, r26
    11ea:	b0 e6       	ldi	r27, 0x60	; 96
    11ec:	cb 2e       	mov	r12, r27
    11ee:	80 ef       	ldi	r24, 0xF0	; 240
    11f0:	d8 2e       	mov	r13, r24
    11f2:	92 e0       	ldi	r25, 0x02	; 2
    11f4:	e9 2e       	mov	r14, r25
    11f6:	92 01       	movw	r18, r4
    11f8:	a3 01       	movw	r20, r6
    11fa:	b4 01       	movw	r22, r8
    11fc:	c1 01       	movw	r24, r2
    11fe:	9a d2       	rcall	.+1332   	; 0x1734 <__udivdi3>
    1200:	28 8b       	std	Y+16, r18	; 0x10
    1202:	39 8b       	std	Y+17, r19	; 0x11
    sec %= 12622780800ULL;
    1204:	92 01       	movw	r18, r4
    1206:	a3 01       	movw	r20, r6
    1208:	b4 01       	movw	r22, r8
    120a:	c1 01       	movw	r24, r2
    120c:	91 d2       	rcall	.+1314   	; 0x1730 <__umoddi3>
    120e:	39 01       	movw	r6, r18
    1210:	4a 01       	movw	r8, r20
    1212:	1b 01       	movw	r2, r22
    1214:	58 2e       	mov	r5, r24
    1216:	49 2e       	mov	r4, r25

    // Remove multiples of 100 years (incl. 24 leap days), can't be more than 3
    // (because multiples of 4*100=400 years (incl. leap days) have been removed)
    centennials = (uint16_t)(sec / 3155673600ULL); // 100*(365+24/100)*24*3600
    1218:	a1 2c       	mov	r10, r1
    121a:	22 ec       	ldi	r18, 0xC2	; 194
    121c:	b2 2e       	mov	r11, r18
    121e:	37 e1       	ldi	r19, 0x17	; 23
    1220:	c3 2e       	mov	r12, r19
    1222:	4c eb       	ldi	r20, 0xBC	; 188
    1224:	d4 2e       	mov	r13, r20
    1226:	e1 2c       	mov	r14, r1
    1228:	93 01       	movw	r18, r6
    122a:	a4 01       	movw	r20, r8
    122c:	83 d2       	rcall	.+1286   	; 0x1734 <__udivdi3>
    122e:	29 87       	std	Y+9, r18	; 0x09
    1230:	3a 87       	std	Y+10, r19	; 0x0a
    if (centennials > 3)
    1232:	29 85       	ldd	r18, Y+9	; 0x09
    1234:	3a 85       	ldd	r19, Y+10	; 0x0a
    1236:	24 30       	cpi	r18, 0x04	; 4
    1238:	31 05       	cpc	r19, r1
    123a:	21 f4       	brne	.+8      	; 0x1244 <ymdhms_from_time_t+0xf4>
    {
        centennials = 3;
    123c:	43 e0       	ldi	r20, 0x03	; 3
    123e:	50 e0       	ldi	r21, 0x00	; 0
    1240:	5a 87       	std	Y+10, r21	; 0x0a
    1242:	49 87       	std	Y+9, r20	; 0x09
    }
    sec -= centennials * 3155673600ULL;
    1244:	a9 85       	ldd	r26, Y+9	; 0x09
    1246:	ba 85       	ldd	r27, Y+10	; 0x0a
    1248:	9d 01       	movw	r18, r26
    124a:	40 e0       	ldi	r20, 0x00	; 0
    124c:	50 e0       	ldi	r21, 0x00	; 0
    124e:	60 e0       	ldi	r22, 0x00	; 0
    1250:	70 e0       	ldi	r23, 0x00	; 0
    1252:	cb 01       	movw	r24, r22
    1254:	a1 2c       	mov	r10, r1
    1256:	b2 ec       	ldi	r27, 0xC2	; 194
    1258:	bb 2e       	mov	r11, r27
    125a:	17 e1       	ldi	r17, 0x17	; 23
    125c:	c1 2e       	mov	r12, r17
    125e:	0c eb       	ldi	r16, 0xBC	; 188
    1260:	d0 2e       	mov	r13, r16
    1262:	e1 2c       	mov	r14, r1
    1264:	f1 2c       	mov	r15, r1
    1266:	00 e0       	ldi	r16, 0x00	; 0
    1268:	10 e0       	ldi	r17, 0x00	; 0
    126a:	29 83       	std	Y+1, r18	; 0x01
    126c:	3a 83       	std	Y+2, r19	; 0x02
    126e:	4b 83       	std	Y+3, r20	; 0x03
    1270:	5c 83       	std	Y+4, r21	; 0x04
    1272:	6d 83       	std	Y+5, r22	; 0x05
    1274:	7e 83       	std	Y+6, r23	; 0x06
    1276:	8f 83       	std	Y+7, r24	; 0x07
    1278:	98 87       	std	Y+8, r25	; 0x08
    127a:	40 e0       	ldi	r20, 0x00	; 0
    127c:	50 e0       	ldi	r21, 0x00	; 0
    127e:	60 e0       	ldi	r22, 0x00	; 0
    1280:	70 e0       	ldi	r23, 0x00	; 0
    1282:	80 e0       	ldi	r24, 0x00	; 0
    1284:	90 e0       	ldi	r25, 0x00	; 0
    1286:	61 d2       	rcall	.+1218   	; 0x174a <__muldi3>
    1288:	59 01       	movw	r10, r18
    128a:	6a 01       	movw	r12, r20
    128c:	7b 01       	movw	r14, r22
    128e:	8c 01       	movw	r16, r24
    1290:	93 01       	movw	r18, r6
    1292:	a4 01       	movw	r20, r8
    1294:	b1 01       	movw	r22, r2
    1296:	85 2d       	mov	r24, r5
    1298:	94 2d       	mov	r25, r4
    129a:	33 d3       	rcall	.+1638   	; 0x1902 <__subdi3>
    129c:	39 01       	movw	r6, r18
    129e:	4a 01       	movw	r8, r20
    12a0:	6d 8b       	std	Y+21, r22	; 0x15
    12a2:	7c 8b       	std	Y+20, r23	; 0x14
    12a4:	8f 87       	std	Y+15, r24	; 0x0f
    12a6:	9a 8b       	std	Y+18, r25	; 0x12

    // Remove multiples of 4 years (incl. 1 leap day), can't be more than 24
    // (because multiples of 25*4=100 years (incl. leap days) have been removed)
    quadrennials = (uint16_t)(sec / 126230400); // 4*(365+1/4)*24*3600
    12a8:	20 e8       	ldi	r18, 0x80	; 128
    12aa:	a2 2e       	mov	r10, r18
    12ac:	3f e1       	ldi	r19, 0x1F	; 31
    12ae:	b3 2e       	mov	r11, r19
    12b0:	46 e8       	ldi	r20, 0x86	; 134
    12b2:	c4 2e       	mov	r12, r20
    12b4:	57 e0       	ldi	r21, 0x07	; 7
    12b6:	d5 2e       	mov	r13, r21
    12b8:	e1 2c       	mov	r14, r1
    12ba:	f1 2c       	mov	r15, r1
    12bc:	00 e0       	ldi	r16, 0x00	; 0
    12be:	10 e0       	ldi	r17, 0x00	; 0
    12c0:	93 01       	movw	r18, r6
    12c2:	a4 01       	movw	r20, r8
    12c4:	37 d2       	rcall	.+1134   	; 0x1734 <__udivdi3>
    12c6:	2b 87       	std	Y+11, r18	; 0x0b
    12c8:	3c 87       	std	Y+12, r19	; 0x0c
    12ca:	eb 85       	ldd	r30, Y+11	; 0x0b
    12cc:	fc 85       	ldd	r31, Y+12	; 0x0c
    12ce:	79 97       	sbiw	r30, 0x19	; 25
    12d0:	20 f0       	brcs	.+8      	; 0x12da <ymdhms_from_time_t+0x18a>
    12d2:	28 e1       	ldi	r18, 0x18	; 24
    12d4:	30 e0       	ldi	r19, 0x00	; 0
    12d6:	3c 87       	std	Y+12, r19	; 0x0c
    12d8:	2b 87       	std	Y+11, r18	; 0x0b
    if (quadrennials > 24)
    {
        quadrennials = 24;
    }
    sec -= quadrennials * 126230400ULL;
    12da:	6b 85       	ldd	r22, Y+11	; 0x0b
    12dc:	7c 85       	ldd	r23, Y+12	; 0x0c
    12de:	ab 01       	movw	r20, r22
    12e0:	60 e0       	ldi	r22, 0x00	; 0
    12e2:	70 e0       	ldi	r23, 0x00	; 0
    12e4:	80 e0       	ldi	r24, 0x00	; 0
    12e6:	90 e0       	ldi	r25, 0x00	; 0
    12e8:	dc 01       	movw	r26, r24
    12ea:	49 83       	std	Y+1, r20	; 0x01
    12ec:	5a 83       	std	Y+2, r21	; 0x02
    12ee:	6b 83       	std	Y+3, r22	; 0x03
    12f0:	7c 83       	std	Y+4, r23	; 0x04
    12f2:	8d 83       	std	Y+5, r24	; 0x05
    12f4:	9e 83       	std	Y+6, r25	; 0x06
    12f6:	af 83       	std	Y+7, r26	; 0x07
    12f8:	b8 87       	std	Y+8, r27	; 0x08
    12fa:	9a 01       	movw	r18, r20
    12fc:	40 e0       	ldi	r20, 0x00	; 0
    12fe:	50 e0       	ldi	r21, 0x00	; 0
    1300:	60 e0       	ldi	r22, 0x00	; 0
    1302:	70 e0       	ldi	r23, 0x00	; 0
    1304:	80 e0       	ldi	r24, 0x00	; 0
    1306:	90 e0       	ldi	r25, 0x00	; 0
    1308:	05 e0       	ldi	r16, 0x05	; 5
    130a:	af d2       	rcall	.+1374   	; 0x186a <__ashldi3>
    130c:	a9 80       	ldd	r10, Y+1	; 0x01
    130e:	ba 80       	ldd	r11, Y+2	; 0x02
    1310:	c1 2c       	mov	r12, r1
    1312:	d1 2c       	mov	r13, r1
    1314:	e1 2c       	mov	r14, r1
    1316:	f1 2c       	mov	r15, r1
    1318:	00 e0       	ldi	r16, 0x00	; 0
    131a:	10 e0       	ldi	r17, 0x00	; 0
    131c:	f2 d2       	rcall	.+1508   	; 0x1902 <__subdi3>
    131e:	01 e0       	ldi	r16, 0x01	; 1
    1320:	a4 d2       	rcall	.+1352   	; 0x186a <__ashldi3>
    1322:	00 e0       	ldi	r16, 0x00	; 0
    1324:	ee d2       	rcall	.+1500   	; 0x1902 <__subdi3>
    1326:	03 e0       	ldi	r16, 0x03	; 3
    1328:	a0 d2       	rcall	.+1344   	; 0x186a <__ashldi3>
    132a:	00 e0       	ldi	r16, 0x00	; 0
    132c:	ea d2       	rcall	.+1492   	; 0x1902 <__subdi3>
    132e:	19 01       	movw	r2, r18
    1330:	2a 01       	movw	r4, r20
    1332:	b6 2f       	mov	r27, r22
    1334:	a7 2f       	mov	r26, r23
    1336:	f8 2f       	mov	r31, r24
    1338:	e9 2f       	mov	r30, r25
    133a:	03 e0       	ldi	r16, 0x03	; 3
    133c:	96 d2       	rcall	.+1324   	; 0x186a <__ashldi3>
    133e:	59 01       	movw	r10, r18
    1340:	6a 01       	movw	r12, r20
    1342:	7b 01       	movw	r14, r22
    1344:	8c 01       	movw	r16, r24
    1346:	91 01       	movw	r18, r2
    1348:	a2 01       	movw	r20, r4
    134a:	6b 2f       	mov	r22, r27
    134c:	7a 2f       	mov	r23, r26
    134e:	8f 2f       	mov	r24, r31
    1350:	9e 2f       	mov	r25, r30
    1352:	c2 d2       	rcall	.+1412   	; 0x18d8 <__adddi3>
    1354:	59 01       	movw	r10, r18
    1356:	6a 01       	movw	r12, r20
    1358:	7b 01       	movw	r14, r22
    135a:	e8 2f       	mov	r30, r24
    135c:	19 2f       	mov	r17, r25
    135e:	04 e0       	ldi	r16, 0x04	; 4
    1360:	84 d2       	rcall	.+1288   	; 0x186a <__ashldi3>
    1362:	0e 2f       	mov	r16, r30
    1364:	ce d2       	rcall	.+1436   	; 0x1902 <__subdi3>
    1366:	59 01       	movw	r10, r18
    1368:	6a 01       	movw	r12, r20
    136a:	7b 01       	movw	r14, r22
    136c:	e8 2f       	mov	r30, r24
    136e:	19 2f       	mov	r17, r25
    1370:	04 e0       	ldi	r16, 0x04	; 4
    1372:	7b d2       	rcall	.+1270   	; 0x186a <__ashldi3>
    1374:	0e 2f       	mov	r16, r30
    1376:	c5 d2       	rcall	.+1418   	; 0x1902 <__subdi3>
    1378:	07 e0       	ldi	r16, 0x07	; 7
    137a:	77 d2       	rcall	.+1262   	; 0x186a <__ashldi3>
    137c:	59 01       	movw	r10, r18
    137e:	6a 01       	movw	r12, r20
    1380:	7b 01       	movw	r14, r22
    1382:	8c 01       	movw	r16, r24
    1384:	93 01       	movw	r18, r6
    1386:	a4 01       	movw	r20, r8
    1388:	6d 89       	ldd	r22, Y+21	; 0x15
    138a:	7c 89       	ldd	r23, Y+20	; 0x14
    138c:	8f 85       	ldd	r24, Y+15	; 0x0f
    138e:	9a 89       	ldd	r25, Y+18	; 0x12
    1390:	b8 d2       	rcall	.+1392   	; 0x1902 <__subdi3>
    1392:	29 83       	std	Y+1, r18	; 0x01
    1394:	3f 87       	std	Y+15, r19	; 0x0f
    1396:	4a 8b       	std	Y+18, r20	; 0x12
    1398:	5c 8b       	std	Y+20, r21	; 0x14
    139a:	6d 8b       	std	Y+21, r22	; 0x15
    139c:	7e 8b       	std	Y+22, r23	; 0x16
    139e:	8f 8b       	std	Y+23, r24	; 0x17
    13a0:	98 8f       	std	Y+24, r25	; 0x18

    // Remove multiples of years (incl. 0 leap days), can't be more than 3
    // (because multiples of 4 years (incl. leap days) have been removed)
    annuals = (uint16_t)(sec / 31536000); // 365*24*3600
    13a2:	e0 e8       	ldi	r30, 0x80	; 128
    13a4:	ae 2e       	mov	r10, r30
    13a6:	f3 e3       	ldi	r31, 0x33	; 51
    13a8:	bf 2e       	mov	r11, r31
    13aa:	a1 ee       	ldi	r26, 0xE1	; 225
    13ac:	ca 2e       	mov	r12, r26
    13ae:	dd 24       	eor	r13, r13
    13b0:	d3 94       	inc	r13
    13b2:	e1 2c       	mov	r14, r1
    13b4:	f1 2c       	mov	r15, r1
    13b6:	00 e0       	ldi	r16, 0x00	; 0
    13b8:	10 e0       	ldi	r17, 0x00	; 0
    13ba:	bc d1       	rcall	.+888    	; 0x1734 <__udivdi3>
    13bc:	2d 8f       	std	Y+29, r18	; 0x1d
    13be:	3e 8f       	std	Y+30, r19	; 0x1e
    13c0:	ad 8d       	ldd	r26, Y+29	; 0x1d
    13c2:	be 8d       	ldd	r27, Y+30	; 0x1e
    13c4:	14 97       	sbiw	r26, 0x04	; 4
    13c6:	20 f0       	brcs	.+8      	; 0x13d0 <ymdhms_from_time_t+0x280>
    13c8:	e3 e0       	ldi	r30, 0x03	; 3
    13ca:	f0 e0       	ldi	r31, 0x00	; 0
    13cc:	fe 8f       	std	Y+30, r31	; 0x1e
    13ce:	ed 8f       	std	Y+29, r30	; 0x1d
    if (annuals > 3)
    {
        annuals = 3;
    }
    sec -= annuals * 31536000ULL;
    13d0:	ad 8d       	ldd	r26, Y+29	; 0x1d
    13d2:	be 8d       	ldd	r27, Y+30	; 0x1e
    13d4:	1d 01       	movw	r2, r26
    13d6:	9d 01       	movw	r18, r26
    13d8:	40 e0       	ldi	r20, 0x00	; 0
    13da:	50 e0       	ldi	r21, 0x00	; 0
    13dc:	60 e0       	ldi	r22, 0x00	; 0
    13de:	70 e0       	ldi	r23, 0x00	; 0
    13e0:	80 e0       	ldi	r24, 0x00	; 0
    13e2:	90 e0       	ldi	r25, 0x00	; 0
    13e4:	03 e0       	ldi	r16, 0x03	; 3
    13e6:	41 d2       	rcall	.+1154   	; 0x186a <__ashldi3>
    13e8:	d9 01       	movw	r26, r18
    13ea:	48 a3       	std	Y+32, r20	; 0x20
    13ec:	5f 8f       	std	Y+31, r21	; 0x1f
    13ee:	6b 8f       	std	Y+27, r22	; 0x1b
    13f0:	7c 8f       	std	Y+28, r23	; 0x1c
    13f2:	f8 2f       	mov	r31, r24
    13f4:	e9 2f       	mov	r30, r25
    13f6:	39 d2       	rcall	.+1138   	; 0x186a <__ashldi3>
    13f8:	59 01       	movw	r10, r18
    13fa:	6a 01       	movw	r12, r20
    13fc:	7b 01       	movw	r14, r22
    13fe:	8c 01       	movw	r16, r24
    1400:	9d 01       	movw	r18, r26
    1402:	48 a1       	ldd	r20, Y+32	; 0x20
    1404:	5f 8d       	ldd	r21, Y+31	; 0x1f
    1406:	6b 8d       	ldd	r22, Y+27	; 0x1b
    1408:	7c 8d       	ldd	r23, Y+28	; 0x1c
    140a:	8f 2f       	mov	r24, r31
    140c:	9e 2f       	mov	r25, r30
    140e:	64 d2       	rcall	.+1224   	; 0x18d8 <__adddi3>
    1410:	51 01       	movw	r10, r2
    1412:	c1 2c       	mov	r12, r1
    1414:	d1 2c       	mov	r13, r1
    1416:	e1 2c       	mov	r14, r1
    1418:	f1 2c       	mov	r15, r1
    141a:	00 e0       	ldi	r16, 0x00	; 0
    141c:	10 e0       	ldi	r17, 0x00	; 0
    141e:	5c d2       	rcall	.+1208   	; 0x18d8 <__adddi3>
    1420:	59 01       	movw	r10, r18
    1422:	6a 01       	movw	r12, r20
    1424:	7b 01       	movw	r14, r22
    1426:	e8 2f       	mov	r30, r24
    1428:	19 2f       	mov	r17, r25
    142a:	04 e0       	ldi	r16, 0x04	; 4
    142c:	1e d2       	rcall	.+1084   	; 0x186a <__ashldi3>
    142e:	0e 2f       	mov	r16, r30
    1430:	68 d2       	rcall	.+1232   	; 0x1902 <__subdi3>
    1432:	59 01       	movw	r10, r18
    1434:	6a 01       	movw	r12, r20
    1436:	7b 01       	movw	r14, r22
    1438:	e8 2f       	mov	r30, r24
    143a:	19 2f       	mov	r17, r25
    143c:	04 e0       	ldi	r16, 0x04	; 4
    143e:	15 d2       	rcall	.+1066   	; 0x186a <__ashldi3>
    1440:	0e 2f       	mov	r16, r30
    1442:	5f d2       	rcall	.+1214   	; 0x1902 <__subdi3>
    1444:	59 01       	movw	r10, r18
    1446:	6a 01       	movw	r12, r20
    1448:	7b 01       	movw	r14, r22
    144a:	e8 2f       	mov	r30, r24
    144c:	19 2f       	mov	r17, r25
    144e:	04 e0       	ldi	r16, 0x04	; 4
    1450:	0c d2       	rcall	.+1048   	; 0x186a <__ashldi3>
    1452:	0e 2f       	mov	r16, r30
    1454:	56 d2       	rcall	.+1196   	; 0x1902 <__subdi3>
    1456:	07 e0       	ldi	r16, 0x07	; 7
    1458:	08 d2       	rcall	.+1040   	; 0x186a <__ashldi3>
    145a:	59 01       	movw	r10, r18
    145c:	6a 01       	movw	r12, r20
    145e:	7b 01       	movw	r14, r22
    1460:	8c 01       	movw	r16, r24
    1462:	29 81       	ldd	r18, Y+1	; 0x01
    1464:	3f 85       	ldd	r19, Y+15	; 0x0f
    1466:	4a 89       	ldd	r20, Y+18	; 0x12
    1468:	5c 89       	ldd	r21, Y+20	; 0x14
    146a:	6d 89       	ldd	r22, Y+21	; 0x15
    146c:	7e 89       	ldd	r23, Y+22	; 0x16
    146e:	8f 89       	ldd	r24, Y+23	; 0x17
    1470:	98 8d       	ldd	r25, Y+24	; 0x18
    1472:	47 d2       	rcall	.+1166   	; 0x1902 <__subdi3>
    1474:	29 01       	movw	r4, r18
    1476:	3a 01       	movw	r6, r20
    1478:	4b 01       	movw	r8, r22
    147a:	8a 8b       	std	Y+18, r24	; 0x12
    147c:	9f 87       	std	Y+15, r25	; 0x0f

    // Calculate the year and find out if it's leap
    year = 1601 + quadricentennials * 400 + centennials * 100 + quadrennials * 4 + annuals;
    147e:	20 e9       	ldi	r18, 0x90	; 144
    1480:	31 e0       	ldi	r19, 0x01	; 1
    1482:	e8 89       	ldd	r30, Y+16	; 0x10
    1484:	f9 89       	ldd	r31, Y+17	; 0x11
    1486:	e2 9f       	mul	r30, r18
    1488:	c0 01       	movw	r24, r0
    148a:	e3 9f       	mul	r30, r19
    148c:	90 0d       	add	r25, r0
    148e:	f2 9f       	mul	r31, r18
    1490:	90 0d       	add	r25, r0
    1492:	11 24       	eor	r1, r1
    1494:	1c 01       	movw	r2, r24
    1496:	ff eb       	ldi	r31, 0xBF	; 191
    1498:	2f 1a       	sub	r2, r31
    149a:	f9 ef       	ldi	r31, 0xF9	; 249
    149c:	3f 0a       	sbc	r3, r31
    149e:	24 e6       	ldi	r18, 0x64	; 100
    14a0:	49 85       	ldd	r20, Y+9	; 0x09
    14a2:	5a 85       	ldd	r21, Y+10	; 0x0a
    14a4:	24 9f       	mul	r18, r20
    14a6:	c0 01       	movw	r24, r0
    14a8:	25 9f       	mul	r18, r21
    14aa:	90 0d       	add	r25, r0
    14ac:	11 24       	eor	r1, r1
    14ae:	28 0e       	add	r2, r24
    14b0:	39 1e       	adc	r3, r25
    14b2:	8b 85       	ldd	r24, Y+11	; 0x0b
    14b4:	9c 85       	ldd	r25, Y+12	; 0x0c
    14b6:	88 0f       	add	r24, r24
    14b8:	99 1f       	adc	r25, r25
    14ba:	88 0f       	add	r24, r24
    14bc:	99 1f       	adc	r25, r25
    14be:	28 0e       	add	r2, r24
    14c0:	39 1e       	adc	r3, r25
    14c2:	ad 8d       	ldd	r26, Y+29	; 0x1d
    14c4:	be 8d       	ldd	r27, Y+30	; 0x1e
    14c6:	2a 0e       	add	r2, r26
    14c8:	3b 1e       	adc	r3, r27
    leap = is_year_leap(year);
    14ca:	c1 01       	movw	r24, r2
    14cc:	4e dc       	rcall	.-1892   	; 0xd6a <is_year_leap>
    14ce:	89 87       	std	Y+9, r24	; 0x09

    // Calculate the day of the year and the time
    yday = sec / 86400;
    14d0:	30 e8       	ldi	r19, 0x80	; 128
    14d2:	a3 2e       	mov	r10, r19
    14d4:	41 e5       	ldi	r20, 0x51	; 81
    14d6:	b4 2e       	mov	r11, r20
    14d8:	cc 24       	eor	r12, r12
    14da:	c3 94       	inc	r12
    14dc:	d1 2c       	mov	r13, r1
    14de:	e1 2c       	mov	r14, r1
    14e0:	f1 2c       	mov	r15, r1
    14e2:	00 e0       	ldi	r16, 0x00	; 0
    14e4:	10 e0       	ldi	r17, 0x00	; 0
    14e6:	92 01       	movw	r18, r4
    14e8:	a3 01       	movw	r20, r6
    14ea:	b4 01       	movw	r22, r8
    14ec:	8a 89       	ldd	r24, Y+18	; 0x12
    14ee:	9f 85       	ldd	r25, Y+15	; 0x0f
    14f0:	21 d1       	rcall	.+578    	; 0x1734 <__udivdi3>
    14f2:	2b 87       	std	Y+11, r18	; 0x0b
    14f4:	29 83       	std	Y+1, r18	; 0x01
    14f6:	3a 83       	std	Y+2, r19	; 0x02
    sec %= 86400;
    14f8:	92 01       	movw	r18, r4
    14fa:	a3 01       	movw	r20, r6
    14fc:	b4 01       	movw	r22, r8
    14fe:	8a 89       	ldd	r24, Y+18	; 0x12
    1500:	9f 85       	ldd	r25, Y+15	; 0x0f
    1502:	16 d1       	rcall	.+556    	; 0x1730 <__umoddi3>
    1504:	29 01       	movw	r4, r18
    1506:	3a 01       	movw	r6, r20
    1508:	4b 01       	movw	r8, r22
    150a:	8a 8b       	std	Y+18, r24	; 0x12
    150c:	9f 87       	std	Y+15, r25	; 0x0f
    hour = sec / 3600;
    150e:	50 e1       	ldi	r21, 0x10	; 16
    1510:	a5 2e       	mov	r10, r21
    1512:	6e e0       	ldi	r22, 0x0E	; 14
    1514:	b6 2e       	mov	r11, r22
    1516:	c1 2c       	mov	r12, r1
    1518:	92 01       	movw	r18, r4
    151a:	a3 01       	movw	r20, r6
    151c:	b4 01       	movw	r22, r8
    151e:	0a d1       	rcall	.+532    	; 0x1734 <__udivdi3>
    1520:	28 8b       	std	Y+16, r18	; 0x10
    sec %= 3600;
    1522:	92 01       	movw	r18, r4
    1524:	a3 01       	movw	r20, r6
    1526:	b4 01       	movw	r22, r8
    1528:	8a 89       	ldd	r24, Y+18	; 0x12
    152a:	9f 85       	ldd	r25, Y+15	; 0x0f
    152c:	01 d1       	rcall	.+514    	; 0x1730 <__umoddi3>
    152e:	29 01       	movw	r4, r18
    1530:	3a 01       	movw	r6, r20
    1532:	4b 01       	movw	r8, r22
    1534:	8c 8b       	std	Y+20, r24	; 0x14
    1536:	9a 8b       	std	Y+18, r25	; 0x12
    min = sec / 60;
    1538:	7c e3       	ldi	r23, 0x3C	; 60
    153a:	a7 2e       	mov	r10, r23
    153c:	b1 2c       	mov	r11, r1
    153e:	92 01       	movw	r18, r4
    1540:	a3 01       	movw	r20, r6
    1542:	b4 01       	movw	r22, r8
    1544:	f7 d0       	rcall	.+494    	; 0x1734 <__udivdi3>
    1546:	2f 87       	std	Y+15, r18	; 0x0f
    sec %= 60;
    1548:	92 01       	movw	r18, r4
    154a:	a3 01       	movw	r20, r6
    154c:	b4 01       	movw	r22, r8
    154e:	8c 89       	ldd	r24, Y+20	; 0x14
    1550:	9a 89       	ldd	r25, Y+18	; 0x12
    1552:	ee d0       	rcall	.+476    	; 0x1730 <__umoddi3>
    1554:	f2 2e       	mov	r15, r18
    1556:	e9 85       	ldd	r30, Y+9	; 0x09
    1558:	b4 e3       	ldi	r27, 0x34	; 52
    155a:	eb 9f       	mul	r30, r27
    155c:	b0 01       	movw	r22, r0
    155e:	11 24       	eor	r1, r1
    1560:	68 56       	subi	r22, 0x68	; 104
    1562:	7f 4f       	sbci	r23, 0xFF	; 255
    1564:	41 e0       	ldi	r20, 0x01	; 1
    1566:	50 e0       	ldi	r21, 0x00	; 0

    // Calculate the month
    for (mday = month = 1; month < 13; month++)
    {
        if (yday < daysSinceJan1st[leap][month])
    1568:	ce 2e       	mov	r12, r30
    156a:	d1 2c       	mov	r13, r1
    156c:	29 81       	ldd	r18, Y+1	; 0x01
    156e:	3a 81       	ldd	r19, Y+2	; 0x02
    1570:	c9 01       	movw	r24, r18
    1572:	a0 e0       	ldi	r26, 0x00	; 0
    1574:	b0 e0       	ldi	r27, 0x00	; 0
    1576:	e4 2e       	mov	r14, r20
    1578:	fa 01       	movw	r30, r20
    157a:	ee 0f       	add	r30, r30
    157c:	ff 1f       	adc	r31, r31
    157e:	ee 0f       	add	r30, r30
    1580:	ff 1f       	adc	r31, r31
    1582:	e6 0f       	add	r30, r22
    1584:	f7 1f       	adc	r31, r23
    1586:	00 81       	ld	r16, Z
    1588:	11 81       	ldd	r17, Z+1	; 0x01
    158a:	22 81       	ldd	r18, Z+2	; 0x02
    158c:	33 81       	ldd	r19, Z+3	; 0x03
    158e:	80 17       	cp	r24, r16
    1590:	91 07       	cpc	r25, r17
    1592:	a2 07       	cpc	r26, r18
    1594:	b3 07       	cpc	r27, r19
    1596:	98 f4       	brcc	.+38     	; 0x15be <ymdhms_from_time_t+0x46e>
        {
            mday += yday - daysSinceJan1st[leap][month - 1];
    1598:	8b 85       	ldd	r24, Y+11	; 0x0b
    159a:	8f 5f       	subi	r24, 0xFF	; 255
    159c:	9d e0       	ldi	r25, 0x0D	; 13
    159e:	9c 9d       	mul	r25, r12
    15a0:	d0 01       	movw	r26, r0
    15a2:	9d 9d       	mul	r25, r13
    15a4:	b0 0d       	add	r27, r0
    15a6:	11 24       	eor	r1, r1
    15a8:	a4 0f       	add	r26, r20
    15aa:	b5 1f       	adc	r27, r21
    15ac:	aa 0f       	add	r26, r26
    15ae:	bb 1f       	adc	r27, r27
    15b0:	aa 0f       	add	r26, r26
    15b2:	bb 1f       	adc	r27, r27
    15b4:	ac 56       	subi	r26, 0x6C	; 108
    15b6:	bf 4f       	sbci	r27, 0xFF	; 255
    15b8:	9c 91       	ld	r25, X
    15ba:	89 1b       	sub	r24, r25
            break;
    15bc:	08 c0       	rjmp	.+16     	; 0x15ce <ymdhms_from_time_t+0x47e>
    15be:	4f 5f       	subi	r20, 0xFF	; 255
    15c0:	5f 4f       	sbci	r21, 0xFF	; 255
    sec %= 3600;
    min = sec / 60;
    sec %= 60;

    // Calculate the month
    for (mday = month = 1; month < 13; month++)
    15c2:	4d 30       	cpi	r20, 0x0D	; 13
    15c4:	51 05       	cpc	r21, r1
    15c6:	b9 f6       	brne	.-82     	; 0x1576 <ymdhms_from_time_t+0x426>
    15c8:	bd e0       	ldi	r27, 0x0D	; 13
    15ca:	eb 2e       	mov	r14, r27
    15cc:	81 e0       	ldi	r24, 0x01	; 1
    }

    // Contributed by Alexey Frunze
    // http://stackoverflow.com/a/11197532/968261

    t->second  = sec;
    15ce:	ad 85       	ldd	r26, Y+13	; 0x0d
    15d0:	be 85       	ldd	r27, Y+14	; 0x0e
    15d2:	16 96       	adiw	r26, 0x06	; 6
    15d4:	fc 92       	st	X, r15
    15d6:	16 97       	sbiw	r26, 0x06	; 6
    t->minute  = min;
    15d8:	ef 85       	ldd	r30, Y+15	; 0x0f
    15da:	15 96       	adiw	r26, 0x05	; 5
    15dc:	ec 93       	st	X, r30
    15de:	15 97       	sbiw	r26, 0x05	; 5
    t->hour    = hour;
    15e0:	f8 89       	ldd	r31, Y+16	; 0x10
    15e2:	14 96       	adiw	r26, 0x04	; 4
    15e4:	fc 93       	st	X, r31
    15e6:	14 97       	sbiw	r26, 0x04	; 4
    t->day     = mday;
    15e8:	12 96       	adiw	r26, 0x02	; 2
    15ea:	8c 93       	st	X, r24
    15ec:	12 97       	sbiw	r26, 0x02	; 2
    t->month   = month;
    15ee:	11 96       	adiw	r26, 0x01	; 1
    15f0:	ec 92       	st	X, r14
    15f2:	11 97       	sbiw	r26, 0x01	; 1
    t->year    = year - 2000;       // since 2000
    15f4:	80 e3       	ldi	r24, 0x30	; 48
    15f6:	82 0d       	add	r24, r2
    15f8:	8c 93       	st	X, r24
    t->weekday = wday ? wday : 7;   // fix sunday to be the last day
    15fa:	2b 89       	ldd	r18, Y+19	; 0x13
    15fc:	21 11       	cpse	r18, r1
    15fe:	02 c0       	rjmp	.+4      	; 0x1604 <ymdhms_from_time_t+0x4b4>
    1600:	87 e0       	ldi	r24, 0x07	; 7
    1602:	01 c0       	rjmp	.+2      	; 0x1606 <ymdhms_from_time_t+0x4b6>
    1604:	8b 89       	ldd	r24, Y+19	; 0x13
    1606:	ad 85       	ldd	r26, Y+13	; 0x0d
    1608:	be 85       	ldd	r27, Y+14	; 0x0e
    160a:	13 96       	adiw	r26, 0x03	; 3
    160c:	8c 93       	st	X, r24
    160e:	13 97       	sbiw	r26, 0x03	; 3
    return t;
}
    1610:	cd 01       	movw	r24, r26
    1612:	a0 96       	adiw	r28, 0x20	; 32
    1614:	0f b6       	in	r0, 0x3f	; 63
    1616:	f8 94       	cli
    1618:	de bf       	out	0x3e, r29	; 62
    161a:	0f be       	out	0x3f, r0	; 63
    161c:	cd bf       	out	0x3d, r28	; 61
    161e:	df 91       	pop	r29
    1620:	cf 91       	pop	r28
    1622:	1f 91       	pop	r17
    1624:	0f 91       	pop	r16
    1626:	ff 90       	pop	r15
    1628:	ef 90       	pop	r14
    162a:	df 90       	pop	r13
    162c:	cf 90       	pop	r12
    162e:	bf 90       	pop	r11
    1630:	af 90       	pop	r10
    1632:	9f 90       	pop	r9
    1634:	8f 90       	pop	r8
    1636:	7f 90       	pop	r7
    1638:	6f 90       	pop	r6
    163a:	5f 90       	pop	r5
    163c:	4f 90       	pop	r4
    163e:	3f 90       	pop	r3
    1640:	2f 90       	pop	r2
    1642:	08 95       	ret

00001644 <main>:

int main(void)
{
    1644:	cf 93       	push	r28
    1646:	df 93       	push	r29
    1648:	cd b7       	in	r28, 0x3d	; 61
    164a:	de b7       	in	r29, 0x3e	; 62
    164c:	27 97       	sbiw	r28, 0x07	; 7
    164e:	0f b6       	in	r0, 0x3f	; 63
    1650:	f8 94       	cli
    1652:	de bf       	out	0x3e, r29	; 62
    1654:	0f be       	out	0x3f, r0	; 63
    1656:	cd bf       	out	0x3d, r28	; 61
}

static inline void init(void)
// main init
{
    DDRB = DDRB_STATE;
    1658:	8f ef       	ldi	r24, 0xFF	; 255
    165a:	87 bb       	out	0x17, r24	; 23
    DDRC = DDRC_STATE;
    165c:	8c e3       	ldi	r24, 0x3C	; 60
    165e:	84 bb       	out	0x14, r24	; 20
    DDRD = DDRD_STATE;
    1660:	88 ef       	ldi	r24, 0xF8	; 248
    1662:	81 bb       	out	0x11, r24	; 17

    TIMSK = 0;
    1664:	19 be       	out	0x39, r1	; 57

static inline void display_init(void)
// PWM and dynamic indication init
{
    // Both PWM channels set to non-inverting Fast PWM
    TCCR1A =  (0<<COM1A0) | (1<<COM1A1) | (0<<COM1B0) | (1<<COM1B1);
    1666:	80 ea       	ldi	r24, 0xA0	; 160
    1668:	8f bd       	out	0x2f, r24	; 47
    TCCR1A |= (0<<WGM10)  | (1<<WGM11);
    166a:	8f b5       	in	r24, 0x2f	; 47
    166c:	82 60       	ori	r24, 0x02	; 2
    166e:	8f bd       	out	0x2f, r24	; 47
    TCCR1B =  (1<<WGM12)  | (1<<WGM13);
    1670:	88 e1       	ldi	r24, 0x18	; 24
    1672:	8e bd       	out	0x2e, r24	; 46

    // No prescaler
    TCCR1B |= (1<<CS10)   | (0<<CS11)   | (0<<CS12);
    1674:	8e b5       	in	r24, 0x2e	; 46
    1676:	81 60       	ori	r24, 0x01	; 1
    1678:	8e bd       	out	0x2e, r24	; 46

    // Set frequency
    ICR1 = PWM_TOP;
    167a:	81 ea       	ldi	r24, 0xA1	; 161
    167c:	9b e3       	ldi	r25, 0x3B	; 59
    167e:	97 bd       	out	0x27, r25	; 39
    1680:	86 bd       	out	0x26, r24	; 38

    OCR1A = PWM_TOP/8;  // set brightness. fixme
    1682:	84 e7       	ldi	r24, 0x74	; 116
    1684:	97 e0       	ldi	r25, 0x07	; 7
    1686:	9b bd       	out	0x2b, r25	; 43
    1688:	8a bd       	out	0x2a, r24	; 42
    OCR1B = PWM_TOP/512;
    168a:	8d e1       	ldi	r24, 0x1D	; 29
    168c:	90 e0       	ldi	r25, 0x00	; 0
    168e:	99 bd       	out	0x29, r25	; 41
    1690:	88 bd       	out	0x28, r24	; 40

    // Enable Timer1 overflow interrupt
    TIMSK |= (1<<TOIE1);
    1692:	89 b7       	in	r24, 0x39	; 57
    1694:	84 60       	ori	r24, 0x04	; 4
    1696:	89 bf       	out	0x39, r24	; 57

static inline void adc_init(void)
// Init ADC, duh!
{
    // Internal 2.56V ref, no left align, ADC0 input
    ADMUX = (1<<REFS0) | (1<<REFS1) | (0<<ADLAR);
    1698:	80 ec       	ldi	r24, 0xC0	; 192
    169a:	87 b9       	out	0x07, r24	; 7

    // Enable ADC and ADC interrupt
    ADCSRA = (1<<ADEN) | (1<<ADIE)
    169c:	8f e8       	ldi	r24, 0x8F	; 143
    169e:	86 b9       	out	0x06, r24	; 6

    TIMSK = 0;

    display_init();
    adc_init();
    usart_init();
    16a0:	0c db       	rcall	.-2536   	; 0xcba <usart_init>
    usart_enable_interrupt();
    16a2:	13 db       	rcall	.-2522   	; 0xcca <usart_enable_interrupt>

    ds1302_init();
    16a4:	cd d9       	rcall	.-3174   	; 0xa40 <ds1302_init>

    struct ymdhms_t initial;
    if (!ds1302_get_time(&initial)) {
    16a6:	ce 01       	movw	r24, r28
    16a8:	01 96       	adiw	r24, 0x01	; 1
    16aa:	f7 d9       	rcall	.-3090   	; 0xa9a <ds1302_get_time>
    16ac:	81 11       	cpse	r24, r1
    16ae:	0e c0       	rjmp	.+28     	; 0x16cc <main+0x88>
        // set time to Epoch if this is a first run
        ymdhms_from_time_t(&initial, 0);
    16b0:	00 e0       	ldi	r16, 0x00	; 0
    16b2:	10 e0       	ldi	r17, 0x00	; 0
    16b4:	20 e0       	ldi	r18, 0x00	; 0
    16b6:	30 e0       	ldi	r19, 0x00	; 0
    16b8:	40 e0       	ldi	r20, 0x00	; 0
    16ba:	50 e0       	ldi	r21, 0x00	; 0
    16bc:	60 e0       	ldi	r22, 0x00	; 0
    16be:	70 e0       	ldi	r23, 0x00	; 0
    16c0:	ce 01       	movw	r24, r28
    16c2:	01 96       	adiw	r24, 0x01	; 1
    16c4:	45 dd       	rcall	.-1398   	; 0x1150 <ymdhms_from_time_t>
        ds1302_set_time(&initial);
    16c6:	ce 01       	movw	r24, r28
    16c8:	01 96       	adiw	r24, 0x01	; 1
    16ca:	72 da       	rcall	.-2844   	; 0xbb0 <ds1302_set_time>
    }

    permaread();    // read data from timechip's ram for quick use
    16cc:	e3 d5       	rcall	.+3014   	; 0x2294 <__data_load_end+0x886>

    sei();
    16ce:	78 94       	sei
}

int main(void)
{
    init();
    usart_write_string("42\n", true);
    16d0:	61 e0       	ldi	r22, 0x01	; 1
    16d2:	82 e2       	ldi	r24, 0x22	; 34
    16d4:	91 e0       	ldi	r25, 0x01	; 1
    16d6:	1c db       	rcall	.-2504   	; 0xd10 <usart_write_string>
	#else
		//round up by default
		__ticks_dc = (uint32_t)(ceil(fabs(__tmp)));
	#endif

	__builtin_avr_delay_cycles(__ticks_dc);
    16d8:	2b e7       	ldi	r18, 0x7B	; 123
    16da:	8c e3       	ldi	r24, 0x3C	; 60
    16dc:	92 e0       	ldi	r25, 0x02	; 2
    16de:	21 50       	subi	r18, 0x01	; 1
    16e0:	80 40       	sbci	r24, 0x00	; 0
    16e2:	90 40       	sbci	r25, 0x00	; 0
    16e4:	e1 f7       	brne	.-8      	; 0x16de <main+0x9a>
    16e6:	00 c0       	rjmp	.+0      	; 0x16e8 <main+0xa4>
    16e8:	00 00       	nop

    // main loop
    for (;;) {
        _delay_ms(100);
        time_train();
    16ea:	02 d9       	rcall	.-3580   	; 0x8f0 <time_train>
}

static inline void adc_start(void)
// Start ADC conversion
{
    ADCSRA |= (1<<ADSC);
    16ec:	36 9a       	sbi	0x06, 6	; 6
    16ee:	f4 cf       	rjmp	.-24     	; 0x16d8 <main+0x94>

000016f0 <__udivmodqi4>:
    16f0:	99 1b       	sub	r25, r25
    16f2:	79 e0       	ldi	r23, 0x09	; 9
    16f4:	04 c0       	rjmp	.+8      	; 0x16fe <__udivmodqi4_ep>

000016f6 <__udivmodqi4_loop>:
    16f6:	99 1f       	adc	r25, r25
    16f8:	96 17       	cp	r25, r22
    16fa:	08 f0       	brcs	.+2      	; 0x16fe <__udivmodqi4_ep>
    16fc:	96 1b       	sub	r25, r22

000016fe <__udivmodqi4_ep>:
    16fe:	88 1f       	adc	r24, r24
    1700:	7a 95       	dec	r23
    1702:	c9 f7       	brne	.-14     	; 0x16f6 <__udivmodqi4_loop>
    1704:	80 95       	com	r24
    1706:	08 95       	ret

00001708 <__udivmodhi4>:
    1708:	aa 1b       	sub	r26, r26
    170a:	bb 1b       	sub	r27, r27
    170c:	51 e1       	ldi	r21, 0x11	; 17
    170e:	07 c0       	rjmp	.+14     	; 0x171e <__udivmodhi4_ep>

00001710 <__udivmodhi4_loop>:
    1710:	aa 1f       	adc	r26, r26
    1712:	bb 1f       	adc	r27, r27
    1714:	a6 17       	cp	r26, r22
    1716:	b7 07       	cpc	r27, r23
    1718:	10 f0       	brcs	.+4      	; 0x171e <__udivmodhi4_ep>
    171a:	a6 1b       	sub	r26, r22
    171c:	b7 0b       	sbc	r27, r23

0000171e <__udivmodhi4_ep>:
    171e:	88 1f       	adc	r24, r24
    1720:	99 1f       	adc	r25, r25
    1722:	5a 95       	dec	r21
    1724:	a9 f7       	brne	.-22     	; 0x1710 <__udivmodhi4_loop>
    1726:	80 95       	com	r24
    1728:	90 95       	com	r25
    172a:	bc 01       	movw	r22, r24
    172c:	cd 01       	movw	r24, r26
    172e:	08 95       	ret

00001730 <__umoddi3>:
    1730:	68 94       	set
    1732:	01 c0       	rjmp	.+2      	; 0x1736 <__udivdi3_umoddi3>

00001734 <__udivdi3>:
    1734:	e8 94       	clt

00001736 <__udivdi3_umoddi3>:
    1736:	8f 92       	push	r8
    1738:	9f 92       	push	r9
    173a:	cf 93       	push	r28
    173c:	df 93       	push	r29
    173e:	56 d0       	rcall	.+172    	; 0x17ec <__udivmod64>
    1740:	df 91       	pop	r29
    1742:	cf 91       	pop	r28
    1744:	9f 90       	pop	r9
    1746:	8f 90       	pop	r8
    1748:	08 95       	ret

0000174a <__muldi3>:
    174a:	df 93       	push	r29
    174c:	cf 93       	push	r28
    174e:	1f 93       	push	r17
    1750:	0f 93       	push	r16
    1752:	9a 9d       	mul	r25, r10
    1754:	f0 2d       	mov	r31, r0
    1756:	21 9f       	mul	r18, r17
    1758:	f0 0d       	add	r31, r0
    175a:	8b 9d       	mul	r24, r11
    175c:	f0 0d       	add	r31, r0
    175e:	8a 9d       	mul	r24, r10
    1760:	e0 2d       	mov	r30, r0
    1762:	f1 0d       	add	r31, r1
    1764:	03 9f       	mul	r16, r19
    1766:	f0 0d       	add	r31, r0
    1768:	02 9f       	mul	r16, r18
    176a:	e0 0d       	add	r30, r0
    176c:	f1 1d       	adc	r31, r1
    176e:	4e 9d       	mul	r20, r14
    1770:	e0 0d       	add	r30, r0
    1772:	f1 1d       	adc	r31, r1
    1774:	5e 9d       	mul	r21, r14
    1776:	f0 0d       	add	r31, r0
    1778:	4f 9d       	mul	r20, r15
    177a:	f0 0d       	add	r31, r0
    177c:	7f 93       	push	r23
    177e:	6f 93       	push	r22
    1780:	bf 92       	push	r11
    1782:	af 92       	push	r10
    1784:	5f 93       	push	r21
    1786:	4f 93       	push	r20
    1788:	d5 01       	movw	r26, r10
    178a:	d0 d0       	rcall	.+416    	; 0x192c <__umulhisi3>
    178c:	8b 01       	movw	r16, r22
    178e:	ac 01       	movw	r20, r24
    1790:	d7 01       	movw	r26, r14
    1792:	cc d0       	rcall	.+408    	; 0x192c <__umulhisi3>
    1794:	eb 01       	movw	r28, r22
    1796:	e8 0f       	add	r30, r24
    1798:	f9 1f       	adc	r31, r25
    179a:	d6 01       	movw	r26, r12
    179c:	1f d0       	rcall	.+62     	; 0x17dc <__muldi3_6>
    179e:	2f 91       	pop	r18
    17a0:	3f 91       	pop	r19
    17a2:	d6 01       	movw	r26, r12
    17a4:	c3 d0       	rcall	.+390    	; 0x192c <__umulhisi3>
    17a6:	c6 0f       	add	r28, r22
    17a8:	d7 1f       	adc	r29, r23
    17aa:	e8 1f       	adc	r30, r24
    17ac:	f9 1f       	adc	r31, r25
    17ae:	af 91       	pop	r26
    17b0:	bf 91       	pop	r27
    17b2:	14 d0       	rcall	.+40     	; 0x17dc <__muldi3_6>
    17b4:	2f 91       	pop	r18
    17b6:	3f 91       	pop	r19
    17b8:	b9 d0       	rcall	.+370    	; 0x192c <__umulhisi3>
    17ba:	c6 0f       	add	r28, r22
    17bc:	d7 1f       	adc	r29, r23
    17be:	e8 1f       	adc	r30, r24
    17c0:	f9 1f       	adc	r31, r25
    17c2:	d6 01       	movw	r26, r12
    17c4:	b3 d0       	rcall	.+358    	; 0x192c <__umulhisi3>
    17c6:	e6 0f       	add	r30, r22
    17c8:	f7 1f       	adc	r31, r23
    17ca:	98 01       	movw	r18, r16
    17cc:	be 01       	movw	r22, r28
    17ce:	cf 01       	movw	r24, r30
    17d0:	11 24       	eor	r1, r1
    17d2:	0f 91       	pop	r16
    17d4:	1f 91       	pop	r17
    17d6:	cf 91       	pop	r28
    17d8:	df 91       	pop	r29
    17da:	08 95       	ret

000017dc <__muldi3_6>:
    17dc:	a7 d0       	rcall	.+334    	; 0x192c <__umulhisi3>
    17de:	46 0f       	add	r20, r22
    17e0:	57 1f       	adc	r21, r23
    17e2:	c8 1f       	adc	r28, r24
    17e4:	d9 1f       	adc	r29, r25
    17e6:	08 f4       	brcc	.+2      	; 0x17ea <__muldi3_6+0xe>
    17e8:	31 96       	adiw	r30, 0x01	; 1
    17ea:	08 95       	ret

000017ec <__udivmod64>:
    17ec:	88 24       	eor	r8, r8
    17ee:	99 24       	eor	r9, r9
    17f0:	f4 01       	movw	r30, r8
    17f2:	e4 01       	movw	r28, r8
    17f4:	b0 e4       	ldi	r27, 0x40	; 64
    17f6:	1b 2e       	mov	r1, r27
    17f8:	d4 01       	movw	r26, r8
    17fa:	9d 15       	cp	r25, r13
    17fc:	8e 04       	cpc	r8, r14
    17fe:	9f 04       	cpc	r9, r15
    1800:	e0 07       	cpc	r30, r16
    1802:	f1 07       	cpc	r31, r17
    1804:	38 f4       	brcc	.+14     	; 0x1814 <__udivmod64+0x28>
    1806:	fc 01       	movw	r30, r24
    1808:	4b 01       	movw	r8, r22
    180a:	ca 01       	movw	r24, r20
    180c:	b9 01       	movw	r22, r18
    180e:	ad 01       	movw	r20, r26
    1810:	9e 01       	movw	r18, r28
    1812:	16 94       	lsr	r1
    1814:	22 0f       	add	r18, r18
    1816:	33 1f       	adc	r19, r19
    1818:	44 1f       	adc	r20, r20
    181a:	55 1f       	adc	r21, r21
    181c:	66 1f       	adc	r22, r22
    181e:	77 1f       	adc	r23, r23
    1820:	88 1f       	adc	r24, r24
    1822:	99 1f       	adc	r25, r25
    1824:	88 1c       	adc	r8, r8
    1826:	99 1c       	adc	r9, r9
    1828:	ee 1f       	adc	r30, r30
    182a:	ff 1f       	adc	r31, r31
    182c:	cc 1f       	adc	r28, r28
    182e:	dd 1f       	adc	r29, r29
    1830:	aa 1f       	adc	r26, r26
    1832:	bb 1f       	adc	r27, r27
    1834:	8a 14       	cp	r8, r10
    1836:	9b 04       	cpc	r9, r11
    1838:	ec 05       	cpc	r30, r12
    183a:	fd 05       	cpc	r31, r13
    183c:	ce 05       	cpc	r28, r14
    183e:	df 05       	cpc	r29, r15
    1840:	a0 07       	cpc	r26, r16
    1842:	b1 07       	cpc	r27, r17
    1844:	48 f0       	brcs	.+18     	; 0x1858 <__udivmod64+0x6c>
    1846:	8a 18       	sub	r8, r10
    1848:	9b 08       	sbc	r9, r11
    184a:	ec 09       	sbc	r30, r12
    184c:	fd 09       	sbc	r31, r13
    184e:	ce 09       	sbc	r28, r14
    1850:	df 09       	sbc	r29, r15
    1852:	a0 0b       	sbc	r26, r16
    1854:	b1 0b       	sbc	r27, r17
    1856:	21 60       	ori	r18, 0x01	; 1
    1858:	1a 94       	dec	r1
    185a:	e1 f6       	brne	.-72     	; 0x1814 <__udivmod64+0x28>
    185c:	2e f4       	brtc	.+10     	; 0x1868 <__udivmod64+0x7c>
    185e:	94 01       	movw	r18, r8
    1860:	af 01       	movw	r20, r30
    1862:	be 01       	movw	r22, r28
    1864:	cd 01       	movw	r24, r26
    1866:	00 0c       	add	r0, r0
    1868:	08 95       	ret

0000186a <__ashldi3>:
    186a:	0f 93       	push	r16
    186c:	08 30       	cpi	r16, 0x08	; 8
    186e:	90 f0       	brcs	.+36     	; 0x1894 <__ashldi3+0x2a>
    1870:	98 2f       	mov	r25, r24
    1872:	87 2f       	mov	r24, r23
    1874:	76 2f       	mov	r23, r22
    1876:	65 2f       	mov	r22, r21
    1878:	54 2f       	mov	r21, r20
    187a:	43 2f       	mov	r20, r19
    187c:	32 2f       	mov	r19, r18
    187e:	22 27       	eor	r18, r18
    1880:	08 50       	subi	r16, 0x08	; 8
    1882:	f4 cf       	rjmp	.-24     	; 0x186c <__ashldi3+0x2>
    1884:	22 0f       	add	r18, r18
    1886:	33 1f       	adc	r19, r19
    1888:	44 1f       	adc	r20, r20
    188a:	55 1f       	adc	r21, r21
    188c:	66 1f       	adc	r22, r22
    188e:	77 1f       	adc	r23, r23
    1890:	88 1f       	adc	r24, r24
    1892:	99 1f       	adc	r25, r25
    1894:	0a 95       	dec	r16
    1896:	b2 f7       	brpl	.-20     	; 0x1884 <__ashldi3+0x1a>
    1898:	0f 91       	pop	r16
    189a:	08 95       	ret

0000189c <__ashrdi3>:
    189c:	97 fb       	bst	r25, 7
    189e:	10 f8       	bld	r1, 0

000018a0 <__lshrdi3>:
    18a0:	16 94       	lsr	r1
    18a2:	00 08       	sbc	r0, r0
    18a4:	0f 93       	push	r16
    18a6:	08 30       	cpi	r16, 0x08	; 8
    18a8:	98 f0       	brcs	.+38     	; 0x18d0 <__lshrdi3+0x30>
    18aa:	08 50       	subi	r16, 0x08	; 8
    18ac:	23 2f       	mov	r18, r19
    18ae:	34 2f       	mov	r19, r20
    18b0:	45 2f       	mov	r20, r21
    18b2:	56 2f       	mov	r21, r22
    18b4:	67 2f       	mov	r22, r23
    18b6:	78 2f       	mov	r23, r24
    18b8:	89 2f       	mov	r24, r25
    18ba:	90 2d       	mov	r25, r0
    18bc:	f4 cf       	rjmp	.-24     	; 0x18a6 <__lshrdi3+0x6>
    18be:	05 94       	asr	r0
    18c0:	97 95       	ror	r25
    18c2:	87 95       	ror	r24
    18c4:	77 95       	ror	r23
    18c6:	67 95       	ror	r22
    18c8:	57 95       	ror	r21
    18ca:	47 95       	ror	r20
    18cc:	37 95       	ror	r19
    18ce:	27 95       	ror	r18
    18d0:	0a 95       	dec	r16
    18d2:	aa f7       	brpl	.-22     	; 0x18be <__lshrdi3+0x1e>
    18d4:	0f 91       	pop	r16
    18d6:	08 95       	ret

000018d8 <__adddi3>:
    18d8:	2a 0d       	add	r18, r10
    18da:	3b 1d       	adc	r19, r11
    18dc:	4c 1d       	adc	r20, r12
    18de:	5d 1d       	adc	r21, r13
    18e0:	6e 1d       	adc	r22, r14
    18e2:	7f 1d       	adc	r23, r15
    18e4:	80 1f       	adc	r24, r16
    18e6:	91 1f       	adc	r25, r17
    18e8:	08 95       	ret

000018ea <__adddi3_s8>:
    18ea:	00 24       	eor	r0, r0
    18ec:	a7 fd       	sbrc	r26, 7
    18ee:	00 94       	com	r0
    18f0:	2a 0f       	add	r18, r26
    18f2:	30 1d       	adc	r19, r0
    18f4:	40 1d       	adc	r20, r0
    18f6:	50 1d       	adc	r21, r0
    18f8:	60 1d       	adc	r22, r0
    18fa:	70 1d       	adc	r23, r0
    18fc:	80 1d       	adc	r24, r0
    18fe:	90 1d       	adc	r25, r0
    1900:	08 95       	ret

00001902 <__subdi3>:
    1902:	2a 19       	sub	r18, r10
    1904:	3b 09       	sbc	r19, r11
    1906:	4c 09       	sbc	r20, r12
    1908:	5d 09       	sbc	r21, r13
    190a:	6e 09       	sbc	r22, r14
    190c:	7f 09       	sbc	r23, r15
    190e:	80 0b       	sbc	r24, r16
    1910:	91 0b       	sbc	r25, r17
    1912:	08 95       	ret

00001914 <__cmpdi2_s8>:
    1914:	00 24       	eor	r0, r0
    1916:	a7 fd       	sbrc	r26, 7
    1918:	00 94       	com	r0
    191a:	2a 17       	cp	r18, r26
    191c:	30 05       	cpc	r19, r0
    191e:	40 05       	cpc	r20, r0
    1920:	50 05       	cpc	r21, r0
    1922:	60 05       	cpc	r22, r0
    1924:	70 05       	cpc	r23, r0
    1926:	80 05       	cpc	r24, r0
    1928:	90 05       	cpc	r25, r0
    192a:	08 95       	ret

0000192c <__umulhisi3>:
    192c:	a2 9f       	mul	r26, r18
    192e:	b0 01       	movw	r22, r0
    1930:	b3 9f       	mul	r27, r19
    1932:	c0 01       	movw	r24, r0
    1934:	a3 9f       	mul	r26, r19
    1936:	01 d0       	rcall	.+2      	; 0x193a <__umulhisi3+0xe>
    1938:	b2 9f       	mul	r27, r18
    193a:	70 0d       	add	r23, r0
    193c:	81 1d       	adc	r24, r1
    193e:	11 24       	eor	r1, r1
    1940:	91 1d       	adc	r25, r1
    1942:	08 95       	ret

00001944 <_exit>:
    1944:	f8 94       	cli

00001946 <__stop_program>:
    1946:	ff cf       	rjmp	.-2      	; 0x1946 <__stop_program>
