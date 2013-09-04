;----------------------------------------------------------------------------------------
;
;	Program:	Bootloader_Mega8.asm 
;
;	Writer:		Herbert Dingfelder, DL5NEG
;				for contact information visit WWW.DL5NEG.DE
;
;	Based on:	AVR-Freaks Design Note #32
;
;	Function:	Bootloader for ATmega8, works via the UART with the normal 
;				AVRProg PC-Software
;
;	Hardware:	ATmega8 with a 7.3728MHz crystal
;
;	History:	
;
;	13.07.2004	- Source code adapted for Mega8, assembles without errors
;
;	15.07.2004	- Used crystal is not 7.3 but 3.686 MHz -> UART setting adapted
;				- Red LED on PORTB 0 is switched on within the boot section, 
;				  tested in Hardware and works -> processor starts correctly 
;				  within the boot section
;
;	18.07.2004	- Problem how to download the bootloader is solved: Simply use
;				  the AVRProg in the "mega8" mode, not in "mega8boot" mode.
;				  Since the Intel-Hex Format contains the address for the code
;				  in each line, the programmers recognizes that the code has to
;				  go to the bootrom part of the flash (provided that the
;				  ".org MY_BOOTSTART" is put at the beginning of the source code)
;				- UART communication between bootloader and host PC works
;				  (echo mode and character recognition tested and works)
;				- Crystal changed to 7.3728MHz in an attempt to fight "flushing"
;				  problems in AVRProg (without success), UART setting adapted
;				- AVRProg is able to read the flash correctly (tested, works)
;				- Reading and writing to EEPROM on host commands 'D' and 'd' works.
;				- Flash erase did not work in the NRWR section (the last 1024
;				  words of the flash) The original version from DesignNote #32
;				  was for ATmega163 which does not have  RWR/NRWR sections.
;				  Problem solved by implementing the wait_for_spm function that
;				  makes sure that a new SPM does only start when the previous one
;				  is completed. (tested, works now)
;				- function to reenable the RWW section implemented ->
;				  loading data into the application section tested and works fine
;				  (Still some problems with sync on the interface between AVRProg
;				  and the boot loader, messagebox "flushing" appears, fuse bits are
;				  read differently many times and software download needs to be
;				  started twice sometimes. As it is known that AVRProg is very sensible
;				  command/answer sync, this does not point towards real bootloader problems.
;				  It has to be tracked on the interface.)
;				  -> Good enough to work with temporarily, Version 1.0 released.
;				- Startup-function implemented for 10 second wait after power-on. If
;				  no ASCII(27) is received via UART within that time, the application starts.
;				  If the application section is empty (all cells are $FF) e.g. directly
;				  after uploading the bootloader itself, then software will wait forever
;				  for a ESC via the UART to start the bootloader software
;				  (while waiting for the ESC the LED blinks)
;				- Function pause implemented for delays in steps of 10ms (tested works)
;				- Command 'E' implemented for leaving the bootloader mode and start the 
;				  application
;				- With that entry end exit function the bootloader is fully usable, starting
;				  the downloaded application is tested and works perfectly
;				  -> Version 1.1 released
;				- Still known problem: the above mentioned sync problem in combination
;				  with AVRProg have to be identified and solved. 
;				- Only 2 Words are left in the bootloader memory. If Bugfixing needs more,
;				  the erease counter within the EEPROM can be skipped
;
;	24.07.2004	- Debug Session with Andy, DG9NDZ to find why AVRProg 1.37 still has some
;				  problems with the bootloader, especially in the "Advanced" Window. 		
;				  - Command 'v' for Hardware Version was not implemented -> fixed
;				  - Command ':' for tranparent command setting was not implemented
;					-> is now implemented in simple version, always returning \0
;				    By monitoring the PC/AVR interface it was found that AVRProg1.37 does 
;				    not use the defined commands r/F/N for reading the lock and fuse bits,
;				    but uses the universal command ':' to send the programming instructions
;				    directly. Additionally the calibration byte is read by the ':' command.
;				  - Command 'b' is send by AVRProg1.37 but is not implemented. It was found that
;				    it is fatal for the programming mode to implement 'b' to return 'Y'.
;				    To simply leave it out (returns ? for unknow command) works perfectly.
;
;	25.07.2004	- To implement all improvements found on 24.07.2004 without skipping lots of
;				  of other code made it necessary to increase the boot loader size to 512words
;				  (=1kByte). Code adapted.
;				- Command ':' enlarged to map r/F/N functionality
;				- Tested, current status: Works well in AVRProg both for flash reading and writing
;				  and also in the Advance window the lock and fuse bits are display correctly.
;				  Only week point remaining to press "write" in advance window, that causes a
;				  loose of sync between host and bootloader. No harm is done to the target device.
;				  -> Version 1.2 released.
;
;	26.07.2004	- Monitoring of interface from host reveals the root cause of the sync problem when
;				  writing the the lock and fuse bits. AVRProg1.37 uses the "new universal command"
;				  which is "." + 4 data bytes. This command was not implemented. As changing the 
;				  fuse bits is dangerous when the device is remote (one could lock himself out
;				  forever), the command is now implemented simply to ignore the inputs but correctly
;				  serve the interface to the host to avoid sync problems. Tested and works perfectly.
;				  -> Version 1.3 released
;
;	07.04.2005	- The code contained the "call" command, which is not supported by ATmega8. Obviously
;				  the AVR implementation is in a way that lets the software work anyhow. All "call"
;				  commands are now replaced by the supported "rcall" command now.
;				- The definition of E2END was missing in the mega8 definition file of the old 
;				  assembler, so it was included within this source file. Now the definition is
;				  available in the include file, so it is taken out of this file.
;				- Intended Assembler Version is now:
;				  AVR macro assembler 2.0.28 (build 121 Jan 11 2005 10:28:51)
;				- Configuration block implemented for easier user-defining of parameters like
;				  the number of wait cycles at power on or the LED pin.
;				- Code and Comments clean up
;				- Version 1.4 decleared which will be used for testing on hardware together with
;				  AVRProg Version 1.40.
;
;	09.04.2005	- Goodbye-Message implemented to inform user via UART that bootloader is left 
;				  when command 'E' was sent
;				- Tests on hardware successful
;				  -> Version 2.0 released
;
;	27.10.2005  - Minor bug corrected, LED pin was not correctly switched as output
;
;	21.04.2006	- Bug corrected, on command 'b' there was on 'N' returned to many
;
;
;
;
;	Before or after programming a new ATmega8 with this Boot Loader the fuse bits must
;	be set like this: 
;
;		The ATmega8 Fuse High bits must be programmed to configure the Boot size to 512 words
;		and to move the Reset Vector to word address 0xE00. (BOOTSZ1=0, BOOTSZ0=1)
;		
;		I.e. set the check box for BOOTRST in AVR-Prog-Advanced and set the
;		selector to 512 words, then press "write". It is important that this selected
;		size of the bootrom fits to the .org command within this source code, otherwise
;		the processor will not correctly start at the first line of this code after reset.
;		(Settings can be checked now or	later with "read").
;
;	Optional:
;
;		The Lock bits can be programmed to 0xEF to protect the Boot Flash Section from
;		unintentional changes and to allow accessing the Application Flash Section.
;
;		I.e. the setting for BLB0 and BLB1 in AVR-Prog-Advance:
;
;		BLB0 (sets the protection for the application section) must be set to 
;		Mode 1 (no protection) to allow full access of LPM and SPM commands within 
;		the application section.
;
;		BLB1 (sets the protection for the boot loader section) can be set to Mode 2
;		(SPM cannot write to boot section) or can be left to Mode 1 (no protection).
;
;		The Fuse bits must be programmed before programming the Lock bits.
;
;
; 	AVRProg Commands as defined by Atmel
;
;										Host Writes 	Host Reads
;										ID 		Data 	Data
;	Enter Programming Mode 				'P' 					13d		(implemented to ignore)
;	Auto Increment Address 				'a' 			dd				(fully implemented)
;	Set Address 						'A' 	ah al 			13d		(fully implemented)			
;	Write Program Memory, Low Byte 		'c' 	dd 				13d		(fully implemented)
;	Write Program Memory, High Byte 	'C' 	dd 				13d		(fully implemented)
;	Issue Page Write 					'm' 					13d		(fully implemented)
;	Read Lock Bits 						'r' 			dd				(fully implemented)
;	Read Program Memory 				'R' 			2*dd			(fully implemented)
;	Read EEPROM Memory 					'd' 			dd				(fully implemented)
;	Write EEPROM Memory					'D' 	dd 				13d		(fully implemented)
;	Chip Erase 							'e' 					13d		(implemented, erases appl. area only)
;	Write Lock Bits 					'l' 	dd 				13d		(implemented to ignore)
;	Read Fuse Bits 						'F' 			dd				(fully implemented)
;	Read High Fuse Bits 				'N' 			dd				(fully implemented)
;	Read Extended Fuse Bits 			'Q' 			dd				(not implemented)
;	Leave Programming Mode 				'L' 					13d		(implemented to ignore)
;	Select Device Type 					'T' 	dd 				13d		(implemented to ignore)
;	Read Signature Bytes 				's' 			3*dd			(fully implemented)
;	Return Supported Device Codes 		't' 			n*dd 	00d		(implemented, returns only Mega8)
;	Return Software Identifier 			'S' 			s[7]			(fully implemented)
;	Return Software Version 			'V' 			dd dd			(fully implemented)
;	Return Hardware Version				'v'								(fully implemented)
;	Return Programmer Type	 			'p' 			dd				(fully implemented)
;	Set LED 							'x' 	dd 				13d		(implemented to ignore)
;	Clear LED 							'y' 	dd 				13d		(implemented to ignore)
;	Exit Bootloader 					'E' 					{13d} 	(implemented 'E' is not confirmed)
;	Check Block Support 				'b' 			'Y' 2*dd		(implemented to return no)
;	Start Block Flash Load 				'B' 	2*dd 'F'		13d		(not implemented)
;												n*dd
;	Start Block EEPROM Load 			'B' 	2*dd 'E'		13d		(not implemented)	
;												n*dd
;	Start Block Flash Read 				'g' 	2*dd 'F'  n*dd			(not implemented)
;	Start Block EEPROM Read 			'g' 	2*dd 'E'  n*dd			(not implemented)
;	Universal Command (3 data bytes)	':'		3*dd	dd		13d		(implemented to ignore)
;	New Universal Command (4 data bytes)'.'		4*dd	dd		13d		(implemented to ignore)
;


;------------------------------- definition and includes --------------------------------

.INCLUDE "m8def.inc" 				; Include Register/Bit Definitions for the mega8

.def dummy   = r18					; Use Reg. R18 for temporary stuff
.def pa_10ms = r19					; used for selecting the pause time in steps of 10ms

.def uni_cmd1 = r20					; Universal command ':' send three bytes. These
.def uni_cmd2 = r21					; are stored for futher usage in r20, r21, r28
.def uni_cmd3 = r10

.equ VER_H = '2' 					; bootloader software version higher number
.equ VER_L = '1' 					; bootloader software version lower number

.equ VERH_H = '1' 					; bootloader hardware version higher number
.equ VERH_L = '0' 					; bootloader hardware version lower number

.equ DT  = 0x76 					; Device Type = 0x76 (ATmega8)

.equ SB1 = 0x07 					; Signature byte 1
.equ SB2 = 0x93 					; Signature byte 2
.equ SB3 = 0x1e 					; Signature byte 3

.equ UBR = 23 						; Baud rate = 19.2 kbps with fCK = 7.3728 MHz

.equ ESC = 27						; Ascii 27 = Escape

;	.equ E2END = 1FF				; This definition is missing in the m8def.inc file
									; that came with the older Assembler. In "Assembler2"
									; it is correct, so it is not required any more.

.equ MY_BOOTSTART = THIRDBOOTSTART	; here we define where the bootloader starts in the flash

;------------------------------ configuration parameters --------------------------------

.equ STUP_WT_CKL	= 40			; number of waiting loops (100ms) at power on
									; before the main application starts automatically




;------------------------------------- here we go ---------------------------------------

.org MY_BOOTSTART					; The code of this bootloader has to be located in
									; the bootloader area at the end of the flash. With
									; this .org it can be loaded into the device just 
									; like any other software (normal ATmega8 setting).

; ------------------------------- init stackpointer -------------------------------------

	ldi R24, low(RAMEND)			; SP = RAMEND
	ldi R25, high(RAMEND)
	out SPL, R24
	out SPH, R25 					

; ---------------------------------- init UART ------------------------------------------

	ldi R24, UBR 					; Baud rate = 19.2 bps
	out UBRRL, R24

	ldi R24,(1<<RXEN)|(1<<TXEN)		; Enable receiver & transmitter, 8-bit mode
	out UCSRB, R24

; -------------------------- check for action on UART -----------------------------------
; After power-on, the processor starts with the bootloader section. Ususally the user
; want the application to start automatircally. Only in special cases, a software update
; is required. So if no ESC (ASCII(27)) is received within the defined number of wait
; cycles after power-on, the application starts.

	ldi R24, 0xFF					; set PORTB to output
	out DDRB, R24

	ldi R24, 0x00					; nullify PORTB outputs (turn off all LEDs)
	out PORTB, R24

	ldi R17, STUP_WT_CKL			; Preset the number of loops
									; for the waiting periode

start_wait:
	

	ldi pa_10ms, 10
	rcall pause						; wait a moment

	sbis UCSRA,RXC 					; check for incoming data (if RXC==1)
	rjmp Lwait						; if not, continue at Lwait

	;--- some character was received ---
	in R16, UDR 					; fetch received character and put it into R16

	cpi R16, ESC					; if the received character was ESC
	breq bootload_start				; start the bootloader main loop
									; LED stays switched on (all other incomming characters
									; are simply ignored)

Lwait:
	dec R17							; decrement the loop counter
	brne start_wait					; and leave loop if counter has reached zero 

	rjmp FLASHEND+1					; Start the application program 
									; (flashend+1) = Address 0


;------------------- here starts the real bootloader functionality ----------------------
bootload_start:

	; To indicate to the user that the attemt to start the bootloader functionality
	; was successful, we send a message back on the UART.	

	ldi ZL,low( 2*uart_msg)			; load the start-address of the startup message 
	ldi ZH,high(2*uart_msg)			;	into the Z-Register

str_output: 
	lpm R16,Z+						; read one character of the string and increment 
									; string pointer (the Z-register)
	
	tst R16
	breq L10 						; exit the character output loop if character was '\0' 

	rcall uartSend 					; send the read character via the UART

	rjmp str_output					; go to start of loop for next character
	

;---------------------------------- start of main loop ----------------------------------


;-------------------- wait for a character from UART other than ESC ---------------------
L10:	
	rcall uartGet 					; repeat (R16 = uartGet)
	cpi R16, ESC					; while (R16 == ESCAPE)
	breq L10

;--------- Command 'E' leaves the bootloader mode and starts the application ------------

	cpi R16, 'E' 					; if(R16=='E') 'E' = Exit bootloader
	brne L11

	; Send goodbye-message on UART	

	ldi ZL,low( 2*goodbye_msg)		; load the start-address of the startup message 
	ldi ZH,high(2*goodbye_msg)		;	into the Z-Register

goodbye_output: 
	lpm R16,Z+						; read one character of the string and increment 
									; string pointer (the Z-register)
	
	tst R16
	breq leave_bootloader			; exit the character output loop if character was '\0' 

	rcall uartSend 					; send the read character via the UART

	rjmp goodbye_output				; go to start of loop for next character
	

leave_bootloader:
	rjmp FLASHEND+1					; Start the application program 
									; (flashend+1) = Address 0


;--------- Command 'a' is question from host for autoimcrement capability----------------
;				simple anser is 'Y' for yes, autoincrement is done
L11:

	cpi R16, 'a' 					; if(R16=='a') 'a' = Autoincrement?
	brne L12

	ldi R16,'Y' 					; Yes, autoincrement is quicker
	rjmp L70 						; uartSend(R16) Send the 'Y' and go up for next command


;--------- Command 'A' is setting the address for the next operation --------------------
; 		two bytes (in total) for high and low address are sent from the host
L12: 

	cpi R16,'A' 					; else if(R16=='A') write address
	brne L14

	rcall uartGet
	mov R27,R16 					; address high byte is stored in R27

	rcall uartGet
	mov R26,R16 					; address low byte is stored in R26
	
	lsl R26 						; address=address<<1
	rol R27 						; convert from byte address to word address
	
	rjmp L68 						; uartSend('\r') send CR and go up for next command


;--------- Command 'c' is write low byte to program memory ------------------------------
; the low byte is simply stored in a register, the actual writing to the flashes
; page-buffer is done later, after the high byte was received
L14: 
	cpi R16,'c' 					; else if(R16=='c') write program memory, low byte
	brne L16

	rcall uartGet					; read the byte to be written from host

	mov R22,R16 					; store data low byte in R22

	rjmp L68 						; uartSend('\r') send CR and go up for next command


;--------- Command 'C' is write high byte to program memory -----------------------------
; together with the (already received) low byte, the highbyte is writen to the flashes
; page buffer. When the page buffer is completely written, it can be transfered into
; the real flash by the "page write" command.
;
; If only SPMEN is written, the following SPM instruction will store the value in R1:R0 
; in the temporary page buffer addressed by the Z pointer. 

L16: 

	cpi R16,'C' 					; else if(R16=='C') write program memory,high byte
	brne L18
	
	rcall uartGet					; read the high byte from the host
	mov R23,R16 					; store the data high byte in R23

	movw ZL,R26 					; load the Z pointer with the current address
	
	movw R0,R22 					; transfer the data word (data high and low byte)
									; into registers R0 and R1
	
	rcall wait_for_spm				; make sure SPM is ready to accept a new task

	ldi R24, (1<<SPMEN)				; set SPMEN in SPMCR
	out SPMCR,R24 					; page load (fill temporary buffer)

	spm 							; Store program memory

	adiw R26,2 						; address=address+2
	rjmp L68 						; uartSend('\r') send CR and go up for next command


;-------------------------- Command 'e' is chip erase -----------------------------------
; "chip erase" for the boot loader means to erase all flash pages othen than the
; boot loader sector itself
L18: 

	cpi R16,'e' 					; else if(R16=='e') Chip erase
	brne L28

	; the loop that has to be performed to clear the application section is:
	; for(address=0; address < (2*MY_BOOTSTART); address += (2*PAGESIZE))
	; the "address" variable to be used are the registers R26 and R27
	
	clr R26 						; start with address 0
	clr R27

	rjmp L24						; continue the loop at the check for
									; "end-criteria reached"

;......... beginning of erase loop ............
L20: 

; If the PGERS bit is written to one at the same time as SPMEN, the next SPM 
; instruction within four clock cycles executes page erase. The page address 
; is taken from the high part of the Z pointer.

	rcall wait_for_spm				; make sure SPM is ready to accept a new task

	movw ZL,R26 					; load the Z-pointer with the address of the 
									; page to be erased

	ldi R24, (1<<PGERS) | (1<<SPMEN); simultaniously set PGERS and SPMEN in SPMCR
	out SPMCR,R24 					; 	to prepare for the page_erase

	spm 							; Store program memory
	nop

	subi R26,low(-2*PAGESIZE) 		; increment the address by the size of a page
	sbci R27,high(-2*PAGESIZE)		

	; this is the check for end-criteria reached, i.e. has the address already 
	; reached the beginning of the boot-loader section
L24: 
	ldi R24,low( 2*MY_BOOTSTART)	; load R24, R25 with the address where the boot-loader
	ldi R25,high(2*MY_BOOTSTART)	;	section starts

	cp R26,R24 						; do a word-compare to check if the address is still
	cpc R27,R25						; smaller than the address where the bootloader starts

	brlo L20						; if that is the case, go to the beginning of the erase loop

; ..... remember the number of flash-erases in the EEPROM .....
	ldi R26,low( E2END -1) 			; increment Chip Erase Counter located
	ldi R27,high(E2END -1) 			; at address E2END-1
	movw R22,R26 					; Save Chip Erase Counter Address in R22
	ldi R17,1 						; read EEPROM
	rcall EepromTalk
	mov R24,R16 					; R24 = Chip Erase Counter low byte
	rcall EepromTalk
	mov R25,R16 					; R25 = Chip Erase Counter high byte
	adiw R24,1 						; counter ++
	out EEDR,R24 					; EEDR = R24 Chip Erase Counter low byte
	movw R26,R22 					; R26 = Chip Erase Counter Address
	ldi R17,6 						; write EEPROM
	rcall EepromTalk
	out EEDR,R25 					; EEDR = R25 Chip Erase Counter high byte
	rcall EepromTalk
; ..........................................................

	rcall wait_for_spm				; make sure SPM is ready to accept a new task

	rcall enable_rww				; reenable the RWW section so it can be accessed again

	rjmp L68 						; uartSend('\r') send CR and go up for next command

;---------------------------- Command 'm' is write page ---------------------------------
; To execute page write, set up the address in the Z pointer, write 'X0000101' to SPMCR
; and execute SPM within four clock cycles after writing SPMCR. The data in R1 and R0
; is ignored. The page address must be written to PCPAGE. Other bits in the Z pointer will
; be ignored during this operation.
L28: 
	cpi R16,'m' 					; else if(R16== 'm') Write page
	brne L34

	rcall wait_for_spm				; make sure SPM is ready to accept a new task
		
	movw ZL,R26 					; load Z-pointer with address
	
	ldi R24, (1<<PGWRT) | (1<<SPMEN); set PGWRT and SPMEN in SPMCR to prepare for Write page
	out SPMCR,R24
	
	spm 							; Store program memory
	
	nop

	rcall enable_rww				; reenable the RWW section so it can be accessed again

L32: 
	rjmp L68 						; uartSend('\r') send CR and go up for next command


;--------------------- Command 'P' is enter programming mode ----------------------------
; nothing is done here, only the command is confirmed to host by sending CR
L34: 
	cpi R16,'P' 					; else if(R16=='P') Enter programming mode
	breq L32 						; uartSend('\r') Send CR to host and go up for next command


;--------------------- Command 'L' is leave programming mode ----------------------------
; nothing is done here, only the command is confirmed to host by sending CR
	cpi R16,'L' 					; else if(R16=='L') Leave programming mode
	breq L32 						; uartSend('\r') Send CR to host and go up for next command


;--------------------- Command 'p' is Return programmer type ----------------------------
; simply return an 'S' to indicate to host that this is a serial programmer
	
	cpi R16,'p' 					; else if (R16=='p') return programmer type
	brne L38

	ldi R16,'S' 					; uartSend('S') for type is serial
	rjmp L70 						; uartSend(R16) and go up for next command


;--------------------- Command 'R' is "Read one word from program memory" ---------------
; reads one word from the 'current' address that is stored in R26 and increments R26
L38: 
	cpi R16,'R' 					; else if(R16=='R') Read program memory
	brne L40

	movw ZL,R26 					; load Z-pointer with address of memory to be read

	lpm R24,Z+ 						; read program memory LSB; store LSB in R24 and Z pointer ++
	lpm R16,Z+ 						; read program memory MSB; store MSB in R16 and Z pointer ++

	rcall uartSend 					; uartSend(R16) write back MSB to host

	movw R26,ZL 					; increment the 'current' address += 2

	mov R16,R24 					; LSB stored in R16

	rjmp L70 						; uartSend(R16) write back the LSB to host and go
									; up for next command

;--------------------- Command 'D' is "write data to EEPROM" ----------------------------
L40: 
	cpi R16,'D' 					; else if (R16=='D') Write data to EEPROM
	brne L41
	rcall uartGet					; fetch the data to write from the UART
	out EEDR,R16 					; EEDR = uartGet() 
	ldi R17,6 						; write EEPROM
	rcall EepromTalk
	rjmp L68 						; uartSend('\r') Confirm the command to host with CR


;--------- Command 'b' is question from host for block mode capability-------------------
;		   simple anser is 'N', no bootloader does not support blockmode
L41:

	cpi R16, 'b' 					; if(R16=='b') 'b' = Blockmode?
	brne L42

	ldi R16,'N' 					; send 'N'
	rjmp L70 						; uartSend(R16) Send the 'N' and go up for next command

;--------------------- Command 'd' is "read data from EEPROM ----------------------------
L42: 
	cpi R16,'d' 					; else if (R16=='d') Read data from EEPROM
	brne L43
	ldi R17,1 						; read EEPROM
	rcall EepromTalk 				; R16 = EEPROM data
	rjmp L70 						; uartSend(R16)


;-------------------------- Command ':' is universal command ----------------------------
; Host sends 3 more bytes which must be used to determine the required action. AVRProg
; uses the ':' with parameters to do things that could simply be done by r/F/N. 
; We have to map recognized parameters to the refering action.

L43: 
	cpi R16,':' 					; else if(R16==':') Universal Command
	brne L44
	

	;.............. read in the parameters ...............................

	rcall uartGet 					; R16 = uartGet()
	mov uni_cmd1, r16				; store the read byte

	rcall uartGet 					; R16 = uartGet()
	mov uni_cmd2, r16				; store the read byte

	rcall uartGet 					; R16 = uartGet()
	mov uni_cmd3, r16				; store the read byte

	;.....................................................................

	clr r16							; preset r16 with zero, if parameters are not
									; recognized, zero will be returned to host

	;.....................................................................

	cpi uni_cmd1, 0x58				; check if 1st paramter is 0x58 
	brne cmd1_not_0x58

	cpi uni_cmd2, 0x00				; check if 2nd paramter is 0x00
	brne cmd2_not_0x00_1

	; -> 58 00 is read lock bits,
	ldi ZL,1 						; Z pointer = 0001 (-> readFuseAndLock will read lock)
	rcall readFuseAndLock			; go get the requested bits

cmd2_not_0x00_1:

	cpi uni_cmd2, 0x08				; check if 2nd paramter is 0x08
	brne cmd2_not_0x08

	; -> 58 08 is read fuse high bits,
	ldi ZL,3 						; Z pointer = 0003 (-> readFuseAndLock will read high fuse)
	rcall readFuseAndLock			; go get the requested bits

cmd2_not_0x08:

cmd1_not_0x58:

	cpi uni_cmd1, 0x50				; check if 1st paramter is 0x50 
	brne cmd1_not_0x50

	cpi uni_cmd2, 0x00				; check if 2nd paramter is 0x00
	brne cmd2_not_0x00_2

	; -> 50 00 is read fuse bits,
	clr ZL 							; Z-pointer = 0000 (-> readFuseAndLock will read fuse)
	rcall readFuseAndLock			; go get the requested bits

cmd2_not_0x00_2:

cmd1_not_0x50:
	
	rcall uartSend 					; uartSend(bits) send the read lock/fuse bits

	rjmp L68 						; uartSend('\r') and go up for next command



;--------------------- Command 'F' is "read fuse bits" ----------------------------------
L44: 
	cpi R16,'F' 					; else if(R16=='F') Read fuse bits
	brne L46
	clr ZL 							; Z-pointer = 0000 (-> readFuseAndLock will read fuse)
	rjmp L50 						; rcall readFuseAndLock


;--------------------- Command 'r' is "read lock bits" ----------------------------------
L46: 
	cpi R16,'r' 					; else if(R16=='r') Read lock bits
	brne L48
	ldi ZL,1 						; Z pointer = 0001 (-> readFuseAndLock will read lock)
	rjmp L50 						; rcall readFuseAndLock


;--------------------- Command 'N' is "read fuse high bits" -----------------------------
L48: 
	cpi R16,'N' 					; else if(R16=='N') Read high fuse bits
	brne L52
	ldi ZL,3 						; Z-pointer = 0003 (-> readFuseAndLock will read high fuse)


;-------- for all previous commands F,r,N hear we rcall the readFuseAndLock --------------
;		function that will read the bits that are indicated by the Z-register	
L50: 
	rcall readFuseAndLock
	rjmp L70 						; uartSend(R16)


;--------------------- Command 't' is Return supported devices code ---------------------
;				obviously we return only the device code of the mega8 here
L52: 
	cpi R16,'t' 					; else if(R16=='t') Return supported devices code
	brne L54

	ldi R16,DT 						; Device Type
	rcall uartSend 					; uartSend(DT) send Device Type of Mega8

	clr R16							; command set of AVRProg requires the termination of
									; the t-command with a \0 not with a CR as other commands
	rjmp L70 						; uartSend(0) and go up for next command

; ---------------- ignored commands that are not sensible for boot loader ---------------
; The following 4 commands only make sense for a general programmer, not for a bootloader.
; As theres commands come with an additional byte as parameter, with have to fetch that
; byte from the UART to avoid messing up the UART reading.
L54: 								

	cpi R16,'l' 					; 'l' = Write Boot Loader lockbits
	breq L56

	cpi R16,'x' 					; 'x' = Set LED
	breq L56

	cpi R16,'y' 					; 'y' = Clear LED
	breq L56

	cpi R16,'T' 					; 'T' = Select device type
	brne L60

L56: 
	rcall uartGet 					; R16 = uartGet()
	rjmp L68 						; uartSend('\r') and go up for next command


;--------------------- Command 'S' is Return software identifier ------------------------
L60: 
	cpi R16,'S' 					; else if(R16=='S') Return software identifier
	brne L62
	
	ldi ZL,low(2*Soft_Id)			; load address of String into Z-Register
	ldi ZH,high(2*Soft_Id)

L61: 
	lpm R16,Z+						; read one character of the string and increment string pointer
	
	tst R16
	breq L72 						; exit the character output loop charcter was '\0' 

	rcall uartSend 					; send the read character via the UART

	rjmp L61						; go to start of loop for next character


;--------------------- Command 'V' is Return software Version ---------------------------
L62: 
	cpi R16,'V' 					; else if (R16=='V') Return Software Version
	brne L63

	ldi R16, VER_H 					; send bootloader software version higher number
	rcall uartSend

	ldi R16, VER_L 					; send bootloader software version lower number
	rjmp L70 						; uartSend and go up for next command

;--------------------- Command 'v' is Return hardware Version ---------------------------
L63: 
	cpi R16,'v' 					; else if (R16=='v') Return hardware Version
	brne L64

	ldi R16, VERH_H 				; send bootloader software version higher number
	rcall uartSend

	ldi R16, VERH_L 				; send bootloader software version lower number
	rjmp L70 						; uartSend and go up for next command


;--------------------- Command 's' is Return Signature Byte -----------------------------
L64: 
	cpi R16,'s' 					; else if (R16=='s') Return Signature Byte
	brne L65

	ldi R16,SB1 					; uartSend(SB1) Signature Byte 1
	rcall uartSend

	ldi R16,SB2 					; uartSend(SB2) Signature Byte 2
	rcall uartSend

	ldi R16,SB3 					; uartSend(SB3) Signature Byte 3
	rjmp L70 						; uartSend and go up for next command


;--------------------- Command '.' is new universal command -----------------------------
; this command will be ignored, only the inteface will be handled correctly
L65: 
	cpi R16,'.' 					; else if (R16=='.') New Universal Command
	brne L66

	;.............. read in the 4 parameters ...............................

	rcall uartGet 					; R16 = uartGet()
	rcall uartGet 					; R16 = uartGet()
	rcall uartGet 					; R16 = uartGet()
	rcall uartGet 					; R16 = uartGet()
	
	; ......................................................................

	clr R16 						; uartSend(/0)
	rcall uartSend

	rjmp L68 						; uartSend('\r') and go up for next command


;++++++++++++++ handling the different commands is done till here +++++++++++++++++++++++
;			      only general completion for all commands below


;---------------------- failed commands can end up here ---------------------------------
;	an '?' is send via the UART to indicate fail host, then main loop starts again

L66: 
	ldi R16,'?' 					; else uartSend('?')
	rjmp L70 						; uartSend(R16)

;--------- successfully completed commands without return value can end up here ---------
;	an CR is sent via the UART to confirm execution to host, then main loop starts again

L68: 
	ldi R16,13 						; uartSend('\r')

;------------ successfully completed commands with return value can end up here ---------
;	         the return value is sent via the UART to confirm execution to host 
;							then main loop starts again
L70: 
	rcall uartSend 					; uartSend(R16)

L72: 
	rjmp L10						; jump up to beginning of main loop

;-------------------------- end of main loop --------------------------------------------



;================= end of main program, only subroutines from here on ===================



;------------------ reads fuse or lock bits (depending on Z-Reg.) -------------
readFuseAndLock:

	; An LPM instruction within three cycles after BLBSET and SPMEN are set in the SPMCR
	; Register, will read either the Lock bits or the Fuse bits 
	; (depending on Z0 in the Z pointer) into the destination register.

	rcall wait_for_spm				; make sure SPM is ready to accept a new task

	clr ZH 							; Z pointer high byte = 0

	ldi R24,(1<<BLBSET)|(1<<SPMEN)	; set BLBSET and SPMEN in SPMCR 
	out SPMCR,R24 					; read fuse and lock
	lpm R16,Z 						; read program memory

	ret

;------------- does an read or write on the EEPROM (depending on R17) ---------
; 					 if R17 == 6 then Write, if R17 == 1 then Read
EepromTalk: 					
	out EEARL,R26 					; EEARL = address low
	out EEARH,R27 					; EEARH = address high
	adiw R26,1 						; address++
	sbrc R17,1 						; skip if R17 == 1 (read Eeprom)
	sbi EECR,EEMWE 					; EEMWE = 1 (write Eeprom)
	out EECR,R17 					; EECR = R17 (6 write, 1 read)

L90: 
	sbic EECR,EEWE 					; wait until EEWE == 0
	rjmp L90
	in R16,EEDR 					; R16 = EEDR

	ret

;---------------- send one character via UART (parameter is r16) --------------
uartSend: 							
	sbis UCSRA,UDRE 				; wait for empty transmit buffer (until UDRE==1)
	rjmp uartSend
	out UDR,R16 					; UDR = R16, start transmission

	ret

;---------------- read one character from UART (returned in r16) --------------
uartGet:
	
	sbis UCSRA,RXC 					; wait for incoming data (until RXC==1)
	rjmp uartGet
	in R16,UDR 						; return received data in R16
	
	ret

;-------------------- wait for SPM to be ready for new tasks ------------------
; while( SPMCR_REG & (1<<SPMEN) )
wait_for_spm:
	
	in r16, SPMCR					; read the content of SPMCR into register
	andi r16, (1<<SPMEN)			; check if bit SPMEN is set
	brne wait_for_spm				; and do more loops if bit not yet cleared

Wait_ee:
	sbic EECR, EEWE					; check that no EEPROM write access is present
	rjmp Wait_ee

	ret


; ---------------------------- re-enable the RWW section ----------------------
; When programming (page erase or page write) to the RWW section, the RWW section
; is blocked for reading (the RWWSB will be set by hardware). To re-enable the RWW
; section, the user software must wait until the programming is completed (SPMEN will be
; cleared). Then, if the RWWSRE bit is written to one at the same time as SPMEN, the
; next SPM instruction within four clock cycles re-enables the RWW section.
; If this is not done, all addresses will read $FF even if they contain other values.
enable_rww:

	rcall wait_for_spm				; make sure SPM is ready to accept a new task 

	ldi r16, (1<<RWWSRE) | (1<<SPMEN) 	; set rwwsre and spmen in SPMCR to prepare
	out SPMCR, r16						; for reenabling the rww section

	spm								; initiate the reenabling

	ret

;---------------------------------- Pause -------------------------------------
; Delays the CPU the selected periode, parameter pa_10ms is in 10ms steps

pause:
	ldi dummy, 0b00000101			; set prescaler to 1024
	out TCCR0, dummy
	
	ldi dummy, 184					; preset the counter for 72 remaining
	out TCNT0, dummy				;	cycles till overflow

	in dummy, TIFR					; reset the overflow flag 
	sbr dummy, (1<<TOV0)	
	out TIFR, dummy

pw:	in dummy, TIFR					; check if overflow flag is set
	sbrs dummy, TOV0	
	rjmp pw							; if not, wait more

	;--- do this 10ms as often as requested in parameter pa_10ms
	dec pa_10ms						; decrement the counter
	brne pause						; and do the loop again if not zero yet

	ret
	
;-------------------------- data for identifier string ----------------------------------
Soft_Id: 

	.db "AVRB_M8", 0

;--------------- data for message on UART when bootloader starts ------------------------
uart_msg:

	.db "+--------------------------------------------------+",10,13
	.db "|   Bootloader for ATmega8, Version ", VER_H, '.',VER_L, " by DL5NEG  |",10,13
	.db "|       Use AVRProg to download new software.      |",10,13
	.db "| Press E to leave the bootloader and to start the |",10,13
	.db "|    application software from the flash memory.   |",10,13
	.db "+--------------------------------------------------+ ",10,13,10,13,0

;------------- data for message on UART when leaving the bootloader ---------------------
goodbye_msg:

	.db "Thanks for using DL5NEGs bootloader. ",10,13,10,13,0





