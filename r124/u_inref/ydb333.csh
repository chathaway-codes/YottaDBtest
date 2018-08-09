#!/usr/local/bin/tcsh -f
#################################################################
#								#
# Copyright (c) 2018 YottaDB LLC. and/or its subsidiaries.	#
# All rights reserved.						#
#								#
#	This source code contains the intellectual property	#
#	of its copyright holder(s), and is made available	#
#	under a license.  If you do not know the terms of	#
#	the license, please stop and do not read further.	#
#								#
#################################################################
#
# Verifies that $VIEW("PROBECRIT","DEFAULT") will return values between 0 and 1000
#

$gtm_tst/com/dbcreate.csh mumps >& dbcreate.out

$gtm_exe/mumps -r %XCMD 'FOR i=1:1:100 WRITE $V("PROBECRIT","DEFAULT"),!' >& output.txt

$grep "CPT:" output.txt | awk -F "," '{print $1}' | awk -F ":" '{print $2}' >& cpt_values.txt

set num_unique_values=`sort cpt_values.txt | uniq | wc -l`

if ( $num_unique_values < 3 ) then
	echo "Only two values seen in cpt_values.txt; verify that time is accurate enough to get other values"
else
	echo "OK"
endif
