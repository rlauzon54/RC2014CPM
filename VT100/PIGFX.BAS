10 GOSUB 5010

100 A2=0:GOSUB 5090:PRINT "Black";:GOSUB 5150:PRINT
110 A2=1:GOSUB 5090:PRINT "Red";:GOSUB 5150:PRINT
120 A2=2:GOSUB 5090:PRINT "Green";:GOSUB 5150:PRINT
130 A2=3:GOSUB 5090:PRINT "Yellow";:GOSUB 5150:PRINT
140 A2=4:GOSUB 5090:PRINT "Blue";:GOSUB 5150:PRINT
150 A2=5:GOSUB 5090:PRINT "Magenta";:GOSUB 5150:PRINT
160 A2=6:GOSUB 5090:PRINT "Cyan";:GOSUB 5150:PRINT
170 A2=7:GOSUB 5090:PRINT "White";:GOSUB 5150:PRINT
180 A2=8:GOSUB 5090:PRINT "Gray";:GOSUB 5150:PRINT
190 A2=9:GOSUB 5090:PRINT "Bright red";:GOSUB 5150:PRINT
200 A2=10:GOSUB 5090:PRINT "Bright Green";:GOSUB 5150:PRINT
210 A2=11:GOSUB 5090:PRINT "Bright Yellow";:GOSUB 5150:PRINT
220 A2=12:GOSUB 5090:PRINT "Bright Blue";:GOSUB 5150:PRINT
230 A2=13:GOSUB 5090:PRINT "Bright Megenta";:GOSUB 5150:PRINT
240 A2=14:GOSUB 5090:PRINT "Bright Cyan";:GOSUB 5150:PRINT
250 A2=15:GOSUB 5090:PRINT "Bright White";:GOSUB 5150:PRINT

260 input a$

300 A3=0:GOSUB 5120:PRINT "Black";:GOSUB 5150:PRINT
310 A3=1:GOSUB 5120:PRINT "Red";:GOSUB 5150:PRINT
320 A3=2:GOSUB 5120:PRINT "Green";:GOSUB 5150:PRINT
330 A3=3:GOSUB 5120:PRINT "Yellow";:GOSUB 5150:PRINT
340 A3=4:GOSUB 5120:PRINT "Blue";:GOSUB 5150:PRINT
350 A3=5:GOSUB 5120:PRINT "Magenta";:GOSUB 5150:PRINT
360 A3=6:GOSUB 5120:PRINT "Cyan";:GOSUB 5150:PRINT
370 A3=7:GOSUB 5120:PRINT "White";:GOSUB 5150:PRINT
380 A3=8:GOSUB 5120:PRINT "Gray";:GOSUB 5150:PRINT
390 A3=9:GOSUB 5120:PRINT "Bright red";:GOSUB 5150:PRINT
400 A3=10:GOSUB 5120:PRINT "Bright green";:GOSUB 5150:PRINT
410 A3=11:GOSUB 5120:PRINT "Bright Yellow";:GOSUB 5150:PRINT
420 A3=12:GOSUB 5120:PRINT "Bright Blue";:GOSUB 5150:PRINT
430 A3=13:GOSUB 5120:PRINT "Bright Megenta";:GOSUB 5150:PRINT
440 A3=14:GOSUB 5120:PRINT "Bright Cyan";:GOSUB 5150:PRINT
450 A3=15:GOSUB 5120:PRINT "Bright White";:GOSUB 5150:PRINT

460 input a$

500 print "RESET"

4090 A2=7:GOSUB 5090: A3=0:GOSUB 5120:PRINT "RESET 2"
4999 END

5000 REM CLEAR SCREEN
5010 PRINT CHR$(27);"[2J": RETURN

5020 REM Set cursor pos ro=row, co=col
5030 RO$=STR$(RO):RO$=RIGHT$(RO$,LEN(RO$)-1)
5040 CO$=STR$(CO):CO$=RIGHT$(CO$,LEN(CO$)-1)
5050 X$=CHR$(27)+"["+RO$+";"+CO$+"H"
5060 PRINT X$;
5070 RETURN

5080 REM SET Foreground color A2
5090 A2$=STR$(A2):A2$=RIGHT$(A2$,LEN(A2$)-1)
5100 X$=CHR$(27)+"[38;5;"+A2$+"m":PRINT X$;:RETURN

5110 REM SET Background color A3
5120 A3$=STR$(A3):A3$=RIGHT$(A3$,LEN(A3$)-1)
5130 X$=CHR$(27)+"[48;5;"+A3$+"m":PRINT X$;:RETURN

5140 REM RESET ATTRIBUTES
5150 X$=CHR$(27)+"[0m":PRINT X$;:RETURN
