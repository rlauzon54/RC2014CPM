;Copyright 1982 Infocom, Inc.  All rights reserved.

;Configuration Program for INTERLOGIC(tm) CP/M Files

;Configured for basic no-frills terminal

;This program should be edited to specify terminal and
;printer parameters for your CP/M system.  Edit this
;file, then assemble, load, and run the program.
;Complete documentation of the setup procedure will
;be found in your INTERLOGIC Reference Card.

;Terminal and printer specific parameters start at
;the label CPMCPL, about 20 lines below.  Nothing
;prior to that label should be altered.

ORG	100H

LPDL	EQU 100H
BDOS	EQU 05H
FCB	EQU 05CH

PSTRNG	EQU 9
OPEN	EQU 15
CLOSE	EQU 16
WRITES	EQU 21
SETDMA	EQU 26

START:	JMP CPMSTR

;Setup parameters begin here.  Refer to the INTERLOGIC
;Reference Card for CP/M for complete documentation for
;editing this file.

CPMCPL: DB 63		;Characters/line (132 maximum)
CPMLPP: DB 0		;Lines/screen (NOT including status line)
CPMFN:	DB 'ENCHANTE'
			;File name (DO NOT CHANGE THIS)
CPMCLF: DB 1		;1 if LF should print after CR on screen
CPMLLF: DB 1		;1 if LF should print after CR on printer
CPMINV: DB 0		;Number to add to ASCII value of characters
			;to have them print in inverse video.
			;This is not applicable on many terminals.

;The following strings have a count field followed by up
;to 32 characters.

TINIT:	DB 0		;Initialize the terminal.  
			;Should position the cursor at the
			;lower left corner of the screen.
			;On terminals with the facility, a
			;scrolling region should be established
			;to include all but the top line on
			;the screen.  Also, clearing the screen
			;is desirable.

	DS 32-$+TINIT+1
TRESET: DB 0		;Reset the terminal at end of game.
			;For example, if a scrolling region
			;was established, reset it to include the
			;entire screen.  Clearing the screen is
			;NOT desirable.			

	DS 32-$+TRESET+1
BLINE:  DB 0		;Begin status line.
			;Should move the cursor to the upper
			;left corner of the screen.  If at all
			;possible, should go into inverse video.

	DS 32-$+BLINE+1
ELINE:  DB 0		;End status line.
			;Should move the cursor to the lower
			;left corner of the screen.  If status
			;line uses inverse video, this state
			;should be cleared.

	DS 32-$+ELINE+1	
PINIT:  DB 0		;Printer initialization.
			;If any setup is required prior to
			;using scripting.

	DS 200H-$

;The setup parameters end at this point.  Nothing below this point
;should be changed for any reason.

CPMSTR: LXI SP,PDL+LPDL
	LDA CPMCPL
	CPI 132
	JC CPMST1
	MVI A,132
	STA CPMCPL
CPMST1:	LXI H,FCB
	MVI B,36
L1:	MVI M,0
	INX H
	DCR B
	JNZ L1
	LXI H,FCB+1
	LXI D,CPMFN
	MVI B,8
L2:	LDAX D
	MOV M,A
	INX H
	INX D
	DCR B
	JNZ L2
	LXI D,EXT
	MVI B,3
L3:	LDAX D
	MOV M,A
	INX H
	INX D
	DCR B
	JNZ L3

	MVI C,OPEN
	LXI D,FCB
	CALL BDOS
	INR A
	LXI D,BADOPN
	JZ FINIS

	LXI D,100H
	CALL WRITEB
	LXI D,180H
	CALL WRITEB

	MVI C,CLOSE
	LXI D,FCB
	CALL BDOS
	INR A
	LXI D,BADCLS
	JZ FINIS
	LXI D,OK
FINIS:	MVI C,PSTRNG
	CALL BDOS
	JMP 0

WRITEB: MVI C,SETDMA
	CALL BDOS
	MVI C,WRITES
	LXI D,FCB
	CALL BDOS
	ORA A
	RZ
	MVI C,CLOSE
	LXI D,FCB
	CALL BDOS
	LXI D,BADWRT
	JMP FINIS

BADOPN: DB 0DH,0AH,'CAN NOT OPEN FILE$'

BADCLS: DB 0DH,0AH,'ERROR ON FILE CLOSE$'

BADWRT: DB 0DH,0AH,'WRITE ERROR$'

OK:	DB 0DH,0AH,'CONFIGURATION PROGRAM FINISHED',0DH,0AH,'$'

EXT:	DB 'COM'
PDL:	DS LPDL


END START
