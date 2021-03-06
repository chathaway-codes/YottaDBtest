V4POW4 ;IW-KO-TS-YS,V4POWER,MVTS V9.10;15/6/96;POWER OPERATOR
 ;
 ;COPYRIGHT MUMPS SYSTEMS LABORATORY 1984-1996
 ;
 W !!,"102---V4POW4:  power operator  (A**P)  -4-"
 ;
 W !,"P=1/2"
 ;
1 S ^ABSN="40654",^ITEM="IV-654  2**0.5"
 S ^NEXT="2^V4POW4,V4POW5^V4POWER,V4RAND^VV4" D ^V4PRESET K
 S ^VCOMP=$j(2**0.5,0,6)
 S ^VCORR="1.414214" D ^VEXAMINE
 ;
2 S ^ABSN="40655",^ITEM="IV-655  3**0.5"
 S ^NEXT="3^V4POW4,V4POW5^V4POWER,V4RAND^VV4" D ^V4PRESET K
 S ^VCOMP=$j(3**0.5,0,6)
 S ^VCORR="1.732051" D ^VEXAMINE
 ;
3 S ^ABSN="40656",^ITEM="IV-656  5**0.5"
 S ^NEXT="4^V4POW4,V4POW5^V4POWER,V4RAND^VV4" D ^V4PRESET K
 S ^VCOMP=$j(5**0.5,0,6)
 S ^VCORR="2.236068" D ^VEXAMINE
 ;
4 S ^ABSN="40657",^ITEM="IV-657  10**0.5"
 S ^NEXT="5^V4POW4,V4POW5^V4POWER,V4RAND^VV4" D ^V4PRESET K
 S ^VCOMP=$j(10**0.5,0,6)
 S ^VCORR="3.162278" D ^VEXAMINE
 ;
 W !,"P=1/3"
 ;
5 S ^ABSN="40658",^ITEM="IV-658  2**(1/3)"
 S ^NEXT="6^V4POW4,V4POW5^V4POWER,V4RAND^VV4" D ^V4PRESET K
 S ^VCOMP=$j(2**(1/3),0,6)
 S ^VCORR="1.259921" D ^VEXAMINE
 ;
6 S ^ABSN="40659",^ITEM="IV-659  3**(1/3)"
 S ^NEXT="7^V4POW4,V4POW5^V4POWER,V4RAND^VV4" D ^V4PRESET K
 S ^VCOMP=$j(3**(1/3),0,6)
 S ^VCORR="1.442250" D ^VEXAMINE
 ;
 W !,"P=1/4"
 ;
7 S ^ABSN="40660",^ITEM="IV-660  2**0.25"
 S ^NEXT="8^V4POW4,V4POW5^V4POWER,V4RAND^VV4" D ^V4PRESET K
 S ^VCOMP=$j(2**0.25,0,6)
 S ^VCORR="1.189207" D ^VEXAMINE
 ;
 W !,"P=1.05"
 ;
8 S ^ABSN="40661",^ITEM="IV-661  5**1.05"
 S ^NEXT="V4POW5^V4POWER,V4RAND^VV4" D ^V4PRESET K
 S ^VCOMP=$j(5**1.05,0,6)
 S ^VCORR="5.418992" D ^VEXAMINE
 ;
END W !!,"End of 102 --- V4POW4",!
 K  Q
SUM S SUM=0 F I=1:1 S L=$T(+I) Q:L=""  F K=1:1:$L(L) S SUM=SUM+$A(L,K)
 Q
