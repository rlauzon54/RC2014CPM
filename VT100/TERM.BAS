10 GOSUB 5010
15 PRINT "Normal"
20 A1=1:A2=37:A3=40:GOSUB 5090:PRINT "Bright";:GOSUB 5140:PRINT
30 A1=2:A2=37:A3=40:GOSUB 5090:PRINT "Dim";:GOSUB 5140:PRINT
40 A1=4:A2=37:A3=40:GOSUB 5090:PRINT "Underscore";:GOSUB 5140:PRINT
50 A1=5:A2=37:A3=40:GOSUB 5090:PRINT "Blink";:GOSUB 5140:PRINT
60 A1=7:A2=37:A3=40:GOSUB 5090:PRINT "Reverse";:GOSUB 5140:PRINT
70 A1=8:A2=37:A3=40:GOSUB 5090:PRINT "Hidden";:GOSUB 5140:PRINT

100 A1=2:A2=30:A3=47:GOSUB 5090:PRINT "Black";:GOSUB 5140:PRINT
110 A1=2:A2=31:A3=40:GOSUB 5090:PRINT "Red";:GOSUB 5140:PRINT
120 A1=2:A2=32:A3=40:GOSUB 5090:PRINT "Green";:GOSUB 5140:PRINT
130 A1=2:A2=33:A3=40:GOSUB 5090:PRINT "Yellow";:GOSUB 5140:PRINT
140 A1=2:A2=34:A3=40:GOSUB 5090:PRINT "Blue";:GOSUB 5140:PRINT
150 A1=2:A2=35:A3=40:GOSUB 5090:PRINT "Magenta";:GOSUB 5140:PRINT
160 A1=2:A2=36:A3=40:GOSUB 5090:PRINT "Cyan";:GOSUB 5140:PRINT
170 A1=2:A2=37:A3=40:GOSUB 5090:PRINT "White";:GOSUB 5140:PRINT

200 A1=2:A2=37:A3=40:GOSUB 5090:PRINT "Black";:GOSUB 5140:PRINT
210 A1=2:A2=30:A3=41:GOSUB 5090:PRINT "Red";:GOSUB 5140:PRINT
220 A1=2:A2=30:A3=42:GOSUB 5090:PRINT "Green";:GOSUB 5140:PRINT
230 A1=2:A2=30:A3=43:GOSUB 5090:PRINT "Yellow";:GOSUB 5140:PRINT
240 A1=2:A2=37:A3=44:GOSUB 5090:PRINT "Blue";:GOSUB 5140:PRINT
250 A1=2:A2=30:A3=45:GOSUB 5090:PRINT "Magenta";:GOSUB 5140:PRINT
260 A1=2:A2=30:A3=46:GOSUB 5090:PRINT "Cyan";:GOSUB 5140:PRINT
270 A1=2:A2=30:A3=47:GOSUB 5090:PRINT "White";:GOSUB 5140:PRINT

4999 END
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
