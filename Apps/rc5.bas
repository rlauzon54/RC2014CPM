10 REM ******************************************************************
20 REM *                                                                *
30 REM *          PROGRAM NAME: RC5%                                    *
40 REM *                                                                *
50 REM *     COMPUTES THE NEAREST STANDARD VALUE OF 5% RESISTORS OR     *
60 REM *     CAPACITORS GIVEN A CALCULATED VALUE INPUT                  *
70 REM *          BY: M.F. KAVANAUGH--BRADLEY UNIVERSITY                *
80 REM *                                                                *
90 REM ******************************************************************
100 PRINT:PRINT "   DO YOU WISH:"
110 PRINT "     (R)ESISTOR (1 OHM-100 MEG)"
120 PRINT "     (C)APACITOR (1PF-1000 MFD)"
130 PRINT "     (E)XIT"
140 PRINT:INPUT I$
150 IF I$="R" GOTO 500
160 IF I$="C" GOTO 1000
170 IF I$="E" GOTO 9000 ELSE GOTO 100
500 REM
510 REM ********************* RESISTORS *********************************
520 REM
530 T$="RESISTORS":GOSUB 1530
540 PRINT "ENTER THE RESISTOR VALUES USING THE POWER OF TEN FORMAT."
550 PRINT "ERRORS MAY BE CORRECTED AFTER ALL VALUES HAVE BEEN ENTERED."
560 FOR I=1 TO N:GOSUB 1640:PRINT:NEXT I
561 FOR I=1 TO N: V$(I)="":NEXT I
562 GOSUB 1570
590 FOR I= 1 TO N
600 IF V(I)>=1E+06 THEN V(I)=V(I)/1E+06:V$(I)="M":GOTO 630
610 IF V(I)>=1000! THEN V(I)=V(I)/1000:V$(I)="K":GOTO 630
620 V$(I)="OHMS"
630 NEXT I
632 GOSUB 1920
640 REM ***** DISPLAY STANDARD VALUE ***************
650 GOSUB 1750:GOTO 1820
1000 REM
1010 REM ******************* CAPACITORS **********************************
1020 REM
1030 T$="CAPACITORS":GOSUB 1530
1040 PRINT "ENTER THE VALUE OF CAPACITOR,IN MFD.,USING THE POWER OF TEN FORMAT."
1050 PRINT "ERRORS MAY BE CORRECTED AFTER ALL THE VALUES HAVE BEEN ENTERED."
1060 FOR I=1 TO N:GOSUB 1640:PRINT:NEXT I
1061 FOR I= 1 TO N:V$(I)="":NEXT I
1062 GOSUB 1570
1090 FOR I=1 TO N:V(I)=V(I)*1E+06:NEXT I        
1120 FOR I=1 TO N
1130 IF V(I)>=1000! THEN V(I)=V(I)/1E+06:V$(I)="MFD":GOTO 1150
1140 V$(I)="PF"
1150 NEXT I
1152 GOSUB 1920
1160 REM ***** DISPLAY STANDARD VALUES *************
1170 GOSUB 1750
1180 GOTO 1820
1500 REM
1510 REM ******************** ENTER VALUES *******************************
1520 REM
1530 PRINT:PRINT "NUMBER OF ";T$;" TO BE ENTERED:":INPUT N
1540 IF N<=100 GOTO 1550
1545 PRINT "100 MAX":GOTO 1530
1550 PRINT:RETURN
1560 REM ******** CHECK INPUT VALUES ***************
1570 GOSUB 1750
1580 INPUT "ARE THESE VALUES CORRECT (Y/N)";A$
1590 IF A$="Y" THEN RETURN
1600 IF A$="N" GOTO 1610 ELSE 1580
1610 INPUT "ENTER COMPONENT VALUE TO BE CHANGED";I:PRINT
1620 GOSUB 1640:GOTO 1570
1630 REM ******* VALUE AND RANGE TEST **************
1640 PRINT I$;I;"=":INPUT; V(I)
1650 IF I$="C" GOTO 1690
1660 IF V(I)<1 GOTO 1720
1670 IF V(I)>1E+08 GOTO 1730
1680 RETURN
1690 IF V(I)<.000001 GOTO 1720
1700 IF V(I)>1000! GOTO 1730
1710 RETURN
1720 PRINT:PRINT I$;I;" IS TOO SMALL":PRINT:GOTO 1640
1730 PRINT:PRINT I$;I;" IS TOO LARGE":PRINT:GOTO 1640
1740 REM ******** PUT VALUES ON TERMINAL ***********
1750 PRINT:FOR I=1 TO N STEP 4
1760 IF I<=N THEN PRINT TAB(2);I$;I;"=";V(I);V$(I);
1770 IF (I+1)<=N THEN PRINT TAB(20);I$;I+1;"=";V(I+1);V$(I+1);
1780 IF (I+2)<=N THEN PRINT TAB(38);I$;I+2;"=";V(I+2);V$(I+2);
1790 IF (I+3)<=N THEN PRINT TAB(56);I$;I+3;"=";V(I+3);V$(I+3)
1800 NEXT I:PRINT:RETURN
1810 REM ******* PUT VALUES ON A PRINTER ***********
1820 PRINT:INPUT "DO YOU WANT HARDCOPY (Y/N)";HC$
1830 IF HC$="N" GOTO 100
1840 IF HC$<>"Y" GOTO 1820
1850 LPRINT: FOR I=1 TO N STEP 4
1860 IF I<=N THEN LPRINT TAB(2);I$;I;"=";V(I);V$(I);
1870 IF (I+1)<=N THEN LPRINT TAB(20);I$;I+1;"=";V(I+1);V$(I+1);
1880 IF (I+2)<=N THEN LPRINT TAB(38);I$;I+2;"=";V(I+2);V$(I+2);
1890 IF (I+3)<=N THEN LPRINT TAB(56);I$;I+3;"=";V(I+3);V$(I+3)
1900 NEXT I:LPRINT:RETURN
1910 REM ******* FIND STANDARD VALUES **************
1920 PRINT:PRINT "     CALCULATING STANDARD VALUES"
1930 FOR I=1 TO N:L=1
1940 IF V(I)>10 THEN L=L*10:V(I)=V(I)/10:GOTO 1940
1945 IF V(I)<1 THEN L=L/10:V(I)=V(I)*10:GOTO 1945
1950 READ D2
1960 D1=D2:READ D2:IF V(I)>D2 GOTO 1960
1970 MD=(D1+D2)/2:IF V(I)<MD THEN V(I)=D1*L:GOTO 1990
1980 V(I)=D2*L
1990 RESTORE:NEXT I:RETURN
2000 REM ********* STANDARD VALUE TABEL ************
2010 DATA 1.0,1.1,1.2,1.3,1.5,1.6,1.8,2.0,2.2,2.4,2.7,3.0,3.3
2020 DATA 3.6,3.9,4.3,4.7,5.1,5.6,6.2,6.8,7.5,8.2,9.1,10,11
9000 PRINT:PRINT "GOODBYE":PRINT:END
