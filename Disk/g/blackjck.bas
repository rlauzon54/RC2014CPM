��a � ��():� P �a � �);"BLACK JACK":� .b � �);"CREATIVE COMPUTING  MORRISTOWN, NEW JERSEY" 8b �:�:� Qb
 � �A(Q)�Q��(Q��) �b � P(,),Q(),C(4),D(4),T(),S(),B() �b � R() �b( �--P(I,J) IS THE JTH CARD IN HAND I, Q(I) IS TOTAL OF HAND I c2 �--C IS THE DECK BEING DEALT FROM, D IS THE DISCARD PILE, Tc< �--T(I) IS THE TOTAL FOR PLAYER I, S(I) IS THE TOTAL THIS HAND FOR cF �--PLAYER I, B(I) IS TH BET FOR HAND I �cP �--R(I) IS THE LENGTH OF P(I,*) �cZ � � �cd �--SUBROUTINE TO GET A CARD.  RESULT IS PUT IN X. �cn � C�3 � �  dx �:� ��();"               " -dz � "  RESHUFFLING  " Nd| � "               ";��():� ad� � D�D �  � � kd� C�C� yd� C(C)�D(D) �d� � D �d� � C1�4 � C � � �d� C2���(��()�(C1�C�))�C �d� C3�C(C2) �d� C(C2)�C(C1) �d� C(C1)�C3 �d� � C1 �d� X�C(C) �d� C�C�  e� � 9e,�--SUBROUTINE TO EVALUATE HAND I.  TOTAL IS PUT INTO ie6�--Q(I). TOTALS HAVE THE FOLLOWING MEANING: �e@�--  2-10...HARD 2-10 �eJ�-- 11-21...SOFT 11-21 �eT�-- 22-32...HARD 11-21 �e^�--  33+....BUSTED �ehQ� �er� Q2� � R(I) �e|X�P(I,Q2) f�� � f�� Q2 f�Q(I)�Q f�� Hf��--SUBROUTINE TO ADD CARD X TO TOTAL Q. {f�X1�X: � X1�
 � X1�
:  �  SAME AS X1=10 MIN X �fQ1�Q�X1 �f� Q�� � N �f� X� � : �f&Q�Q� �f0� �f:Q�Q1��(Q1��) �fD� �fNQ�Q1�(Q�� � Q1�) �fX� Q�! � l gbQ�� gl� .g��--CARD PRINTING SUBROUTINE Jg��  D$ DEFINED ELSEWHERE `g�� ��(D$,�X�,); lg�� "  "; rg�� �g��--ALTERNATIVE PRINTING ROUTINE �g�� " ";��(D$,�X�,); �g� "   "; �g� �g �--SUBROUTINE TO PLAY OUT A HAND. h*�--NO SPLITTING OR BLACKJACKS ALLOWED h4H1� &h>� � /hHH1� AhR� H � �,� Kh\� d  [hfB(I)�B(I)� ohp� "RECEIVED A"; yhz� � �h�� L �h�� Q� � �  �h�� �h�� ( �h�� �h�� d  �h�� "RECEIVED A"; �h�� � �h�� L �h�� Q� � � �h�� "HIT"; i�� > -iL�--SUBROUTINE TO ADD A CARD TO ROW I =iVR(I)�R(I)� Mi`P(I,R(I))�X XijQ�Q(I) bit� � mi~Q(I)�Q ~i�� Q�� � � �i�� "...BUSTED" �i�� � �i�� �i��--SUBROUTINE TO DISCARD ROW I �i�� R(I)�� � � �i�� �i�D�D� �i�D(D)�P(I,R(I)) 
j�R(I)�R(I)� j�� � 2j�--PRINTS TOTAL OF HAND I 8j� Kj(AA�Q(I): � H _j-� "TOTAL IS";AA ej2� �jx�--SUBROUTINE TO READ REPLY �j��  I$ DEFINED ELSEWHERE �j�� H$: H$���(H$,) �j�� H� � H1 �  �j�� H$���(I$,H,) � � �j�� H &k�� "TYPE ";��(I$,,H1�);" OR ";��(I$,H1,);" PLEASE"; 0k�� � >k�H�(H�)� Dk�� _k��--PROGRAM STARTS HERE qk��--INITIALIZE �k�D$�"N A  2  3  4  5  6  7N 8  9 10  J  Q  K" �k�I$�"H,S,D,/," �k� I� �  �k� J��I� � �I �kD(J)�I �k"� J �k,� I �k6D�4 l@C�5 &lJ� "DO YOU WANT INSTRUCTIONS"; /lT� H$ Wl^� ��(H$,)�"N" � ��(H$,)�"n" � � �lh� ��():� "   This is the game of 21. As many as 7 players may play the" �lr� "game. On each deal, bets will be asked for, and the" "m|� "players' bets should be typed in. The cards will then be" ]m�� "dealt, and each player in turn plays his hand. The" �m�� "first response should be either 'D', indicating that the" �m�� "player is doubling down, 'S', indicating that he is" n�� "standing, 'H', indicating he wants another card, or '/'," Zn�� "indicating that he wants to split his cards. After the" �n�� "initial response, all further responses should be 'S' or" �n�� "'H', unless the cards were split, in which case doubling" o�� "down is again permitted. In order to collect for" Lo�� "Blackjack, the initial response should be 'S'." Ro�� �o�� "   To stop the game, enter a negative number for any bet.": � �o��:� "NUMBER OF PLAYERS"; �o�� N �o�� �o�� N� � N� � N���(N) � � �o�� I� � N p�� "NAME OF PLAYER #";I;:� PLAYER$(I) !p�� I <p�� I� � : T(I)�: � I GpD1�N� `p� �D1�C��4 � � x  rp� C� � C�C� �p&� I� � N: Z(I)�: � I �p0� I� � : B(I)�: � I �p:� I� � : Q(I)�: � I �pD� I� � : S(I)�: � I �pN� I� � : R(I)�: � I qX� "BETS:":� "----":� uqb� I� � N: � PLAYER$(I);: � Z(I):� Z(I)�� � � "HOUSE LIMIT IS $500.":� PLAYER$(I);:� Z(I) �qc� Z(I)� � � "MENU" �qd� I �qg� �ql� I� � N �qv� Z(I)�� � Z(I)�� � �:� "HOUSE LIMIT IS $500.": �:� X �q�B(I)�Z(I) �q�� I r�� "PLAYER"; r�� I� � N +r�� I;"   "; 3r�� I Br�� "DEALER" Rr�� "------"; `r�� I� � N pr�� "------"; xr�� I �r�� "------" �r�� J� �  �r�� �); �r�� I� � D1 �r�� d  �r�P(I,J)�X �r�� J� � I��N � � � �r� I �r� �r� J s � I� � D1 s*R(I)� s4� I 1s>�--TEST FOR INSURANCE GsH� P(D1,)� � � `sR�:� "ANY INSURANCE"; is\� H$ �sf� ��(H$,)��"Y" � � �sp�:� "INSURANCE BETS":� "--------------" �sz� I� � N: � PLAYER$(I);: � Z(I): � I �s�� I� � N =t�� Z(I)� � Z(I)�B(I)� � � "MAXIMUM INSURANCE BET IS HALF THE INITIAL BET.":� p Et�� I St�� I� � N xt�S(I)�Z(I)�(�(�(P(D1,)��
))�) �t�� I �t��--TEST FOR DEALER BLACKJACK �t�L1�: L2� �t�� P(D1,)� � P(D1,)� � L1�: L2� u�� P(D1,)� � P(D1,)� � L1�: L2� u�� L1�� � L2�� � 	 Yu��:� "DEALER HAS A";��(D$,�P(D1,)�,);" IN THE HOLE "; ou�� "FOR BLACKJACK" ~u�� I� � D1 �u�� , �u�� I �u	� D �u	�--NO DEALER BLACKJACK �u	� P(D1,)� � P(D1,)�
 � .	 �u$	�:� "NO DEALER BLACKJACK." v.	�--NOW PLAY THE HANDS v8	� I� � N 3vB	�:� PLAYER$(I); <vL	H1� FvV	� � `v`	� H � �	,j	,�	,(
 }vj	�--PLAYER WANTS TO STAND �vt	� , �v~	� Q(I)�� � �	 �v�	� ��();"              ";��() �v�	� ��();"  BLACKJACK!  ";��() w�	� ��();"              ";��() $w�	S(I)�S(I)�  @��B(I) /w�	B(I)� 9w�	� � Cw�	� T Mw�	� ( Ww�	� T zw�	�--PLAYER WANTS TO DOUBLE DOWN �w�	� , �w�	� \ �w�	� T �w�	�--PLAYER WANTS TO BE HIT �w 
� , �w

H1� �w
� � �w
� T �w(
�--PLAYER WANTS TO SPLIT x2
L1�P(I,): � P(I,)�
 � L1�
 @x4
L2�P(I,): � P(I,)�
 � L2�
 Rx6
� L1�L2 � P
 sx<
�:� "SPLITTING NOT ALLOWED." }xF
� B	 �xP
�--PLAY OUT SPLIT �xZ
I1�I�D1 �xd
R(I1)� �xn
P(I1,)�P(I,) �xx
B(I�D1)�B(I) �x�
� d  �x�
�:� "FIRST HAND RECEIVES A"; y�
� � y�
P(I,)�X y�
� , !y�
� +y�
� d  My�
�:� "SECOND HAND RECEIVES A"; Vy�
I�I1 `y�
� � my�
P(I,)�X wy�
� , }y�
� �yI�I1�D1 �y� P(I,)� � T �y�--NOW PLAY THE TWO HANDS �y"� "HAND";�(I�D1); �y,�   �y6I�I�D1 �y@� I�I1 � " zJI�I1�D1 zT� I z^� , =zh�--TEST FOR PLAYING DEALER'S HAND Kzr� I� � N jz|� R(I)� � R(I�D1)� � � rz�� I �z��:� "DEALER HAD A"; �z�X�P(D1,) �z�� � �z�� " CONCEALED." �z�� D �z��:� "DEALER HAS A";��(D$,�P(D1,)�,);" CONCEALED "; {�I�D1 {�AA�Q(I): � H 1{�� "FOR A TOTAL OF";AA C{�� AA� � : R{�� "DRAWS"; \{�� d  f{�� � p{� L �{AA�Q: � H �{� Q� � AA� � � �{Q(I)�Q�(Q�)� �{&� Q� � D �{0AA�Q: � H �{5� "---TOTAL IS";AA �{:�  |D�--TALLY THE RESULT |N�  "|XZ$�"LOSES PUSHESWINS " (|]� 6|b� I� � N I|lAA�Q(I): � H _|nAB�Q(I�D1): � R s|pAC�Q(D1): � \ �|rS(I)�S(I)�B(I)���(AA�AC)�B(I�D1)���(AB�AC) �|tB(I�D1)� �|�� PLAYER$(I);" "; �|�� ��(Z$,��(S(I))��,);::��" "; �|�� S(I)�� � � }�:��PRINT "      ";  }�� � 9}�� � "$$##";��(S(I)); L}�T(I)�T(I)�S(I) v}�� �#);"TOTAL =";:� � "$$#,###-";T(I) �}�� � �}�T(D1)�T(D1)�S(I) �}�I�I�D1 �}�� � �}�I�I�D1 �}� I �}�:� "DEALER'S TOTAL =";:� �*);:� � "$$#,###-";T(D1) �}� ~� � ~ �  ~*� "MENU" 6~HAA�AA��(AA��): � O~RAB�AB��(AB��): � h~\AC�AC��(AC��): �   ##-";T(D1) �}� ~� � ~ �  ~*� "MENU" 6~HAA�AA��(AA��): � O~RAB�AB��(AB��