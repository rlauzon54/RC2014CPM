10 REM Hex-Binary-Decimal converter
20 REM Set up
30 GOSUB 430
40 REM Set up the display
50 GOSUB 5010
60 GOSUB 580
70 REM Get the input string.  LK$=the valid input characters, ST=current base index
80 LK$ = LEFT$(CK$,BS(ST))
90 RO=1:CO=15:GOSUB 5030:PRINT ST$(ST);:GOSUB 5160
100 REM Clear input area
110 RO=3:CO=15:GOSUB 5030:GOSUB 5160
120 REM Input routine
130 INPUT IN$
140 REM Change base command
150 IF IN$="BIN" THEN ST=0: GOTO 80
151 IF IN$="DEC" THEN ST=1: GOTO 80
152 IF IN$="HEX" THEN ST=2: GOTO 80
160 REM No input - end program
170 IF IN$="" THEN GOSUB 5010: END
180 REM Validate input
190 IS$=LK$:V=1
200 FOR I=1 TO LEN(IN$)
210	CH$=MID$(IN$,I,1):GOSUB 890
220 IF IS=0 THEN V=-1
230 NEXT
240 IF V=1 THEN 290
250 GOTO 110
260 REM Base convert
270 REM If the input base is decimal, just get the value of the input
280 REM otherwise, set the base and convert the input to decimal
290 IF ST=1 THEN DC=VAL(IN$):GOTO 310
300 B=BS(ST): GOSUB 820
310 IF DC < 1E+14 THEN DC$=STR$(DC):GOTO 330
320 DC$="overflow": DC=-1
330 B =2
340 GOSUB 670
350 RO=4:CO=15:GOSUB 5030:PRINT OP$; " b";:GOSUB 5160
360 RO=5:CO=14:GOSUB 5030:PRINT DC$; " d";:GOSUB 5160
370 B = 16
380 GOSUB 670
390 RO=6:CO=15:GOSUB 5030:PRINT OP$; " h";:GOSUB 5160
400 GOTO 110
410 REM Subroutines
420 REM Initialize
430 DIM VA$(16), ST$(3), BS(3)
440 FOR CT=0 TO 16
450 READ VA$(CT)
460 NEXT CT
470 DATA 0,1,2,3,4,5,6,7,8,9,A,B,C,D,E,F,G
480 ST$(0)="Binary":BS(0)=2
490 ST$(1)="Decimal":BS(1)=10
500 ST$(2)="Hexadecimal":BS(2)=16
510 CK$="0123456789ABCDEF"
520 ST=0
530 RETURN
540 ST=ST+1:IF ST=3 THEN ST=0
550 RETURN
560 REM
570 REM Set up the screen
580 RO=1:CO=1:GOSUB 5030:A1=7:A2=37:A3=40:GOSUB 5090:PRINT "Input base: "
590 RO=3:CO=1:GOSUB 5030:PRINT "Input Value:"
600 RO=4:CO=1:GOSUB 5030:PRINT "Binary:     "
610 RO=5:CO=1:GOSUB 5030:PRINT "Decimal:    "
620 RO=6:CO=1:GOSUB 5030:PRINT "Hexadecimal:": GOSUB 5140
630 RO=8:CO=2:GOSUB 5030:PRINT "BIN,DEC,HEX - Change input Base  No data - Exit";
640 RETURN
650 REM
660 REM Convert from decimal
670 IF DC = 0 THEN OP$="0": RETURN
680 IF DC = -1 THEN OP$="Overflow": RETURN
690 WK=DC
700 MAG = INT(LOG(WK)/LOG(B))
710 OP$ = ""
720 REM
730 FOR CT = MAG TO 0 STEP -1
740 TM = INT(WK/(B^CT))
750 OP$ = OP$ + VA$(TM)
760 WK = WK - TM * B ^ CT
770 NEXT CT
780 REM
790 IF LEN(OP$) > 22 THEN OP$ = "Overflow"
800 RETURN
810 REM Convert to decimal
820 DC=0:IS$=CK$
830 FOR CT=1 TO LEN(IN$)
840 CH$=MID$(IN$,CT,1):GOSUB 890
850 DC = DC * B + IS -1
860 NEXT CT
870 RETURN
880 REM Instr(IS$,CH$) return IS
890 IS=0
900 FOR I1=1 TO LEN(IS$)
910 IF MID$(IS$,I1,1)=CH$ THEN IS=I1
920 NEXT I1
930 RETURN

5000 REM CLEAR SCREEN
5010 PRINT CHR$(27);"[2J": RETURN
5020 REM Set cursor pos ro=row, co=col
5030 RO$=STR$(RO):RO$=RIGHT$(RO$,LEN(RO$)-1)
5040 CO$=STR$(CO):CO$=RIGHT$(CO$,LEN(CO$)-1)
5050 X$=CHR$(27)+"["+RO$+";"+CO$+"H"
5060 PRINT X$;
5070 RETURN
5080 REM SET ATTRIBUTES A1=attribute, A2=Foreground color, A3=Background color
5090 A1$=STR$(A1):A1$=RIGHT$(A1$,LEN(A1$)-1)
5100 A2$=STR$(A2):A2$=RIGHT$(A2$,LEN(A2$)-1)
5110 A3$=STR$(A3):A3$=RIGHT$(A3$,LEN(A3$)-1)
5120 X$=CHR$(27)+"["+A1$+";"+A2$+";"+A3$+"m":PRINT X$;:RETURN
5130 REM RESET ATTRIBUTES
5140 X$=CHR$(27)+"[0m":PRINT X$;:RETURN
5150 REM Erase to end of line
5160 PRINT CHR$(27)+"[K";:RETURN
