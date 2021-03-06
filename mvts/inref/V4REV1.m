V4REV1 ;IW-KO-YS-TS,V4REV,MVTS V9.10;15/6/96;PART-94
 ;COPYRIGHT MUMPS SYSTEMS LABORATORY 1994-1996
 ;
 W !!,"19---V4REV1:  $REVERSE function  -1-"
 ;
1 S ^ABSN="40154",^ITEM="IV-154  expr is a string"
 S ^NEXT="2^V4REV1,V4REV2^V4REV,V4GET2^VV4" D ^V4PRESET
 S ^VCOMP=$REVERSE("abcdEF456GHIJ")
 S ^VCORR="JIHG654FEdcba" D ^VEXAMINE
 ;
2 S ^ABSN="40155",^ITEM="IV-155  expr is a character"
 S ^NEXT="3^V4REV1,V4REV2^V4REV,V4GET2^VV4" D ^V4PRESET
 S ^VCOMP=$RE("[")
 S ^VCORR="[" D ^VEXAMINE
 ;
3 S ^ABSN="40156",^ITEM="IV-156  expr is an empty string"
 S ^NEXT="4^V4REV1,V4REV2^V4REV,V4GET2^VV4" D ^V4PRESET
 S ^VCOMP=$re("")
 S ^VCORR="" D ^VEXAMINE
 ;
4 S ^ABSN="40157",^ITEM="IV-157  expr is an integer number"
 S ^NEXT="5^V4REV1,V4REV2^V4REV,V4GET2^VV4" D ^V4PRESET
 S ^VCOMP=$re(1234567890)
 S ^VCORR="0987654321" D ^VEXAMINE
 ;
5 S ^ABSN="40158",^ITEM="IV-158  expr is a number"
 S ^NEXT="6^V4REV1,V4REV2^V4REV,V4GET2^VV4" D ^V4PRESET
 S ^VCOMP=$Re(4745848.0400E-5)
 S ^VCORR="4084854.74" D ^VEXAMINE
 ;
6 S ^ABSN="40159",^ITEM="IV-159  expr is a negative number"
 S ^NEXT="V4REV2^V4REV,V4GET2^VV4" D ^V4PRESET
 S ^VCOMP=$Re(-000.05474580400E+5)
 S ^VCORR="4085.4745-" D ^VEXAMINE
 ;
END W !!,"End of 19 --- V4REV1",!
 K  Q
 ;
SUM S SUM=0 F I=1:1 S L=$T(+I) Q:L=""  F K=1:1:$L(L) S SUM=SUM+$A(L,K)
 Q
