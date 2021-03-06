V3MAX1 ;IW-YS-TS,V3MAX,MVTS V9.10;15/6/96;MAXIMUM RANGE -1-
 ;COPYRIGHT MUMPS SYSTEMS LABORATORY 1978-1996
 W !!,"       Moved from V1MAX1"
 W !!,"26---V3MAX1: Maximum range -1-",!
 ;
1 W !,"I,III-330  Numeric range ( 10 power -25 to 10 power 25 )"
 S ^ABSN="30330",^ITEM="I,III-330  Numeric range ( 10 power -25 to 10 power 25 )"
 S ^NEXT="2^V3MAX1,V3NST1^VV3" D ^V3PRESET
 S ^VCOMP=""
 S A=-1E25,B=1E-25,C=999999999999E-25,D=.999999999999E25
 S A1="-1E25",B1="1E-25",C1="999999999999E-25",D1=".999999999999E25"
 S ^VCOMP=A_" "_-B_" "_C_" "_D_" "_(A-A1)_(B-B1)_(C1-C)_(D-D1)
 S ^VCORR="-10000000000000000000000000 -.0000000000000000000000001 .0000000000000999999999999 9999999999990000000000000 0000" D ^VEXAMINE
 ;
2 W !,"I,III-331  Significant digit up to 12 digits"
 S ^ABSN="30331",^ITEM="I,III-331  Local data"
 S ^NEXT="3^V3MAX1,V3NST1^VV3" D ^V3PRESET
 S ^VCOMP=""
 S A=-.999999999999E25,A1="-.999999999999E25",B=-999999999999E-25,C=999999999999E-25,D=+".999999999999E25"
 S ^VCOMP=A_" "_B_" "_C_" "_D_" "_+A1_" "_(A1+.899999999998E25)
 S ^VCORR="-9999999999990000000000000 -.0000000000000999999999999 .0000000000000999999999999 9999999999990000000000000 -9999999999990000000000000 -1000000000010000000000000" D ^VEXAMINE
 ;
3 S ^ABSN="30332",^ITEM="I,III-332  Global data"
 S ^NEXT="V3MAX2^V3MAX,V3NST1^VV3" D ^V3PRESET
 S ^VCOMP=""
 S ^V1=-.999999999999E25,^V1(1)=-999999999999E-25,^V1(2)=999999999999E-25,^V1(3)=+".999999999999E25",^V1(4)="-.999999999999E25"
 S ^VCOMP=^V1_" "_^V1(1)_" "_^V1(2)_" "_^V1(3)_" "_+^V1(4)
 S ^VCORR="-9999999999990000000000000 -.0000000000000999999999999 .0000000000000999999999999 9999999999990000000000000 -9999999999990000000000000" D ^VEXAMINE
 ;
END W !!,"End of 26 --- V3MAX1",!
 K  K ^V1 Q
SUM S SUM=0 F I=1:1 S L=$T(+I) Q:L=""  F K=1:1:$L(L) S SUM=SUM+$A(L,K)
 Q
