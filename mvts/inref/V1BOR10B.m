V1BOR10B ;IW-YS-TS,V1BOR,MVTS V9.10;15/6/96;BINARY OPERATOR  RELATIONAL: ']   -B-
 ;COPYRIGHT MUMPS SYSTEMS LABORATORY 1978-1996
 W !!,"80---V1BOR10B: Binary operator  relational: ']   -B-",!
 ;
134 W !,"I-134  expratoms are numlit and strlit"
1341 S ^ABSN="11107",^ITEM="I-134.1  987']""987""",^NEXT="13411^V1BOR10B,V1BOR10C^V1BOR,V1BOL^VV1" D ^V1PRESET
 S ^VCOMP=987']"987",^VCORR="1" D ^VEXAMINE
13411 S ^ABSN="11108",^ITEM="I-134.1.1  '(987]""987"")",^NEXT="1342^V1BOR10B,V1BOR10C^V1BOR,V1BOL^VV1" D ^V1PRESET
 S ^VCOMP='(987]"987"),^VCORR="1" D ^VEXAMINE ;Test added in V7.4;16/9/89
1342 S ^ABSN="11109",^ITEM="I-134.2  3.1']""3.1ABD""",^NEXT="13421^V1BOR10B,V1BOR10C^V1BOR,V1BOL^VV1" D ^V1PRESET
 S ^VCOMP=3.1']"3.1ABD",^VCORR="1" D ^VEXAMINE
13421 S ^ABSN="11110",^ITEM="I-134.2.1  '(3.1]""3.1ABD"")",^NEXT="1343^V1BOR10B,V1BOR10C^V1BOR,V1BOL^VV1" D ^V1PRESET
 S ^VCOMP='(3.1]"3.1ABD"),^VCORR="1" D ^VEXAMINE ;Test added in V7.4;16/9/89
1343 S ^ABSN="11111",^ITEM="I-134.3  22.56']""22$56""",^NEXT="13431^V1BOR10B,V1BOR10C^V1BOR,V1BOL^VV1" D ^V1PRESET
 S ^VCOMP=22.56']"22$56",^VCORR="0" D ^VEXAMINE
13431 S ^ABSN="11112",^ITEM="I-134.3.1  '(22.56]""22$56"")",^NEXT="1344^V1BOR10B,V1BOR10C^V1BOR,V1BOL^VV1" D ^V1PRESET
 S ^VCOMP='(22.56]"22$56"),^VCORR="0" D ^VEXAMINE ;Test added in V7.4;16/9/89
1344 S ^ABSN="11113",^ITEM="I-134.4  99.2']"" ! """,^NEXT="13441^V1BOR10B,V1BOR10C^V1BOR,V1BOL^VV1" D ^V1PRESET
 S ^VCOMP=99.2']" ! ",^VCORR="0" D ^VEXAMINE
13441 S ^ABSN="11114",^ITEM="I-134.4.1  '(99.2]"" ! "")",^NEXT="1345^V1BOR10B,V1BOR10C^V1BOR,V1BOL^VV1" D ^V1PRESET
 S ^VCOMP='(99.2]" ! "),^VCORR="0" D ^VEXAMINE ;Test added in V7.4;16/9/89
1345 S ^ABSN="11115",^ITEM="I-134.5  -099.2']""-9 ! """,^NEXT="13451^V1BOR10B,V1BOR10C^V1BOR,V1BOL^VV1" D ^V1PRESET
 S ^VCOMP=-099.2']"-9 ! ",^VCORR="0" D ^VEXAMINE
13451 S ^ABSN="11116",^ITEM="I-134.5.1  '(-099.2]""-9 ! "")",^NEXT="V1BOR10C^V1BOR,V1BOL^VV1" D ^V1PRESET
 S ^VCOMP='(-099.2]"-9 ! "),^VCORR="0" D ^VEXAMINE ;Test added in V7.4;16/9/89
 ;
END W !!,"End of 80---V1BOR10B",!
 K  Q
SUM S SUM=0 F I=1:1 S L=$T(+I) Q:L=""  F K=1:1:$L(L) S SUM=SUM+$A(L,K)
 Q
