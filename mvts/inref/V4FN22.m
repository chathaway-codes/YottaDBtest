V4FN22 ;IW-KO-YS-TS,V4FNUM,MVTS V9.10;15/6/96;PART-94
 ;COPYRIGHT MUMPS SYSTEMS LABORATORY 1994-1996
 ;
 W !!,"12---V4FN22:  $FNUMBER function  -2-"
 ;
 W !,"fncodt=""t"""
 ;
1 S ^ABSN="40093",^ITEM="IV-93  $FN(-00,""t"")"
 S ^NEXT="2^V4FN22,V4FN23^V4FNUM,V4REV^VV4" D ^V4PRESET
 S ^VCOMP=$FN(-00,"t")
 S ^VCORR="0 " D ^VEXAMINE
 ;
2 S ^ABSN="40094",^ITEM="IV-94  $FN(1,""t"")"
 S ^NEXT="3^V4FN22,V4FN23^V4FNUM,V4REV^VV4" D ^V4PRESET
 S ^VCOMP=$FN(1,"t")
 S ^VCORR="1 " D ^VEXAMINE
 ;
3 S ^ABSN="40095",^ITEM="IV-95  $FN(-1,""t"")"
 S ^NEXT="4^V4FN22,V4FN23^V4FNUM,V4REV^VV4" D ^V4PRESET
 S ^VCOMP=$FN(-1,"t")
 S ^VCORR="1-" D ^VEXAMINE
 ;
4 S ^ABSN="40096",^ITEM="IV-96  $FN(0020.00000,""t"")"
 S ^NEXT="5^V4FN22,V4FN23^V4FNUM,V4REV^VV4" D ^V4PRESET
 S ^VCOMP=$FN(0020.00000,"t")
 S ^VCORR="20 " D ^VEXAMINE
 ;
5 S ^ABSN="40097",^ITEM="IV-97  $FN(31267,""t"")"
 S ^NEXT="6^V4FN22,V4FN23^V4FNUM,V4REV^VV4" D ^V4PRESET
 S ^VCOMP=$FN(31267,"t")
 S ^VCORR="31267 " D ^VEXAMINE
 ;
6 S ^ABSN="40098",^ITEM="IV-98  $FN(000000000000000000000000262999219,""t"")"
 S ^NEXT="7^V4FN22,V4FN23^V4FNUM,V4REV^VV4" D ^V4PRESET
 S ^VCOMP=$FN(000000000000000000000000262999219,"t")
 S ^VCORR="262999219 " D ^VEXAMINE
 ;
7 S ^ABSN="40099",^ITEM="IV-99  $FN(-000000000000000000000000262999219,""t"")"
 S ^NEXT="8^V4FN22,V4FN23^V4FNUM,V4REV^VV4" D ^V4PRESET
 S ^VCOMP=$FN(-000000000000000000000000262999219,"t")
 S ^VCORR="262999219-" D ^VEXAMINE
 ;
8 S ^ABSN="40100",^ITEM="IV-100  $fn(123456789,""t"")"
 S ^NEXT="9^V4FN22,V4FN23^V4FNUM,V4REV^VV4" D ^V4PRESET
 S ^VCOMP=$fn(123456789,"t")
 S ^VCORR="123456789 " D ^VEXAMINE
 ;
9 S ^ABSN="40101",^ITEM="IV-101  $FN(31267,""t,"")"
 S ^NEXT="10^V4FN22,V4FN23^V4FNUM,V4REV^VV4" D ^V4PRESET
 S ^VCOMP=$FN(31267,"t,")
 S ^VCORR="31,267 " D ^VEXAMINE
 ;
10 S ^ABSN="40102",^ITEM="IV-102  $FN(-31267,""t,"")"
 S ^NEXT="V4FN23^V4FNUM,V4REV^VV4" D ^V4PRESET
 S ^VCOMP=$FN(-31267,"t,")
 S ^VCORR="31,267-" D ^VEXAMINE
 ;
END W !!,"End of 12 --- V4FN22",!
 K  Q
 ;
SUM S SUM=0 F I=1:1 S L=$T(+I) Q:L=""  F K=1:1:$L(L) S SUM=SUM+$A(L,K)
 Q
