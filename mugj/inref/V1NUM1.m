V1NUM1	;NUMERIC LITERAL -1-;YS-TS,V1NUM,VALIDATION VERSION 7.1;31-AUG-1987;
	;COPYRIGHT MUMPS SYSTEM LABORATORY 1978
	S PASS=0,FAIL=0
	W !!,"V1NUM1: TEST OF NUMERIC LITERALS -1-",!
662	W !,"I-662  deletion of leading zero, while expr>1"
	S ITEM="I-662.1  1" S VCOMP=1,VCORR=1 D EXAMINER
	S ITEM="I-662.2  02" S VCOMP=02,VCORR=2 D EXAMINER
	S ITEM="I-662.3  0003" S VCOMP=0003,VCORR=3 D EXAMINER
	S ITEM="I-662.4  00004" S VCOMP=00004,VCORR=4 D EXAMINER
	S ITEM="I-662.5  0000050" S VCOMP=0000050,VCORR=50 D EXAMINER
	S ITEM="I-662.6  0000006" S VCOMP=0000006,VCORR=6 D EXAMINER
	S ITEM="I-662.7  00000007000" S VCOMP=00000007000,VCORR=7000 D EXAMINER
	S ITEM="I-662.8  000000000000000000" S VCOMP=000000000000000000,VCORR=0 D EXAMINER
	S ITEM="I-662.9  0000000000000000000000000000000000000000000000012300" S VCOMP=0000000000000000000000000000000000000000000000012300,VCORR=12300 D EXAMINER
	S ITEM="I-662.10  0000050.002" S VCOMP=0000050.002,VCORR=50.002 D EXAMINER
	S ITEM="I-662.11  000000645.23000" S VCOMP=000000645.23000,VCORR=645.23 D EXAMINER
	;
663	W !,"I-663  deletion of leading zero, while expr<1"
	S ITEM="I-663.1  -1" S VCOMP=-1,VCORR=-1 D EXAMINER
	S ITEM="I-663.2  -02" S VCOMP=-02,VCORR=-2 D EXAMINER
	S ITEM="I-663.3  -0003" S VCOMP=-0003,VCORR=-3 D EXAMINER
	S ITEM="I-663.4  -00004" S VCOMP=-00004,VCORR=-4 D EXAMINER
	S ITEM="I-663.5  -0000050" S VCOMP=-0000050,VCORR=-50 D EXAMINER
	S ITEM="I-663.6  -0000006" S VCOMP=-0000006,VCORR=-6 D EXAMINER
	S ITEM="I-663.7  -00000007000" S VCOMP=-00000007000,VCORR=-7000 D EXAMINER
	S ITEM="I-663.8  -000000000000000000" S VCOMP=-000000000000000000,VCORR=0 D EXAMINER
	S ITEM="I-663.9  -0000000000000000000000000000000000000000000000012300" S VCOMP=-0000000000000000000000000000000000000000000000012300,VCORR=-12300 D EXAMINER
	S ITEM="I-663.10  -0000006.034501" S VCOMP=-0000006.034501,VCORR=-6.034501 D EXAMINER
	S ITEM="I-663.11  -00000007000.00900000" S VCOMP=-00000007000.00900000,VCORR=-7000.00900000 D EXAMINER
	;
664	W !,"I-664  deletion of trailing zero, while expr is integer"
	S ITEM="I-664.1  1." S VCOMP=1.,VCORR=1 D EXAMINER
	S ITEM="I-664.2  2.000000" S VCOMP=2.000000,VCORR=2 D EXAMINER
	S ITEM="I-664.3  3200.0000000000" S VCOMP=3200.0000000000,VCORR=3200 D EXAMINER
	S ITEM="I-664.4  -3.00000000" S VCOMP=-3.00000000,VCORR=-3 D EXAMINER
	S ITEM="I-664.5  -300.0000000000" S VCOMP=-300.0000000000,VCORR=-300 D EXAMINER
	S ITEM="I-664.6  -.0000000000000000000" S VCOMP=-.0000000000000000000,VCORR=0 D EXAMINER
	;
END	W !!,"END OF V1NUM1",!
	S ROUTINE="V1NUM1",TESTS=28,AUTO=28,VISUAL=0 D ^VREPORT
	K  Q
	;
EXAMINER	I VCORR=VCOMP S PASS=PASS+1 W !,"   PASS  ",ITEM W:$Y>55 # Q
	S FAIL=FAIL+1 W !,"** FAIL  ",ITEM W:$Y>55 #
	W !,"           COMPUTED =""",VCOMP,"""" W:$Y>55 #
	W !,"           CORRECT  =""",VCORR,"""" W:$Y>55 #
