#!/usr/local/bin/tcsh -f
#################################################################
#								#
#	Copyright 2002, 2014 Fidelity Information Services, Inc	#
#								#
#	This source code contains the intellectual property	#
#	of its copyright holder(s), and is made available	#
#	under a license.  If you do not know the terms of	#
#	the license, please stop and do not read further.	#
#								#
#################################################################
setenv test_debug 1
echo "C9B11-001794: Test rundown/recover"
echo "They should succeed when <kill -9 pid> and <ipcrm -s sem> is done (no <ipcrm -m shm>)" # BYPASSOK
set gtm_process = 2
set iteration = 2

# This test does kill -9 followed by a MUPIP JOURNAL -RECOVER. A kill -9 could hit the running GT.M process while it
# is in the middle of executing wcs_wtstart. This could potentially leave some dirty buffers hanging in the shared
# memory. So, set the white box test case to avoid asserts in wcs_flu.c
setenv gtm_white_box_test_case_enable 1
setenv gtm_white_box_test_case_number 29
$gtm_tst/com/dbcreate.csh mumps 3 125 1000 4096 2048 4096 2000
echo "$MUPIP set -journal=enable,on,buff=2312,before -reg *" >>& jnl_on.log
$MUPIP set -journal=enable,on,buff=2312,before -reg "*" >>& jnl_on.log
@ count = 0
while ($count < $iteration)
	@ count = $count + 1
	echo "Start Iteration $count"
	echo "GTM Process starts in background..."
	setenv gtm_test_jobid $count
	$gtm_tst/com/imptp.csh $gtm_process  >>&! imptp.out
	sleep 20
	echo "Kill -9 <pid> : ipcrm -s <sem_id>"
	echo "Shared Memory is existing"
	$gtm_tst/com/get_dse_df.csh "BEFORE_CRASH" "" "-all"
	$gtm_tst/com/gtm_crash.csh "NO_SHM_REM"
	if ($?test_debug == 1) then
		\mkdir save_${count}; cp {*.dat,*.mj*} save_${count}
	endif
	if ($count == 1) then
		echo "$MUPIP rundown -reg *"
		$MUPIP rundown -reg "*" -override >& rundown.log	# keep output in a file to preserve original output order.
		$MUPIP rundown -relinkctl >&! rundown_ctl.logx
		# sort output for test reference file purposes. Also remove non-deterministic shmid before sorting.
		sed 's/[0-9][0-9]* /XXXX /g' rundown.log | sort -f
		if ($status) then
			echo "C9B11-001794 TEST FAILED in rundown"
			echo "Exit from test"
			exit 1
		endif
	endif
	echo "Recover..."
	echo "$MUPIP journal -recover -backward *"
	echo "$MUPIP journal -recover -backward *" >>& recover_${count}.log
	$MUPIP journal -recover -backward "*" >>& recover_${count}.log
	set stat1 = $status
	$grep "successful" recover_${count}.log
	set stat2 = $status
	ls *.mjl_forw_phase >& /dev/null
	set stat3 = $status
	if ($stat1 != 0 || $stat2 != 0 || $stat3 == 0) then
		echo "C9B11-001794 TEST FAILED in recover"
		cat  recover_${count}.log
		echo "Exit from test"
		exit 1
	endif
	cat *.mje*
	if ($count != $iteration) then
		$gtm_tst/com/dbcheck_filter.csh -nosprgde
	else
		$gtm_tst/com/dbcheck_filter.csh
	endif
	$gtm_tst/com/checkdb.csh
	echo "End Iteration $count"
end
$gtm_tst/$tst/u_inref/check_prev.csh | sed 's/Prev journal file name/Prev journal file name GTM_TEST_DEBUGINFO/'
echo "C9B11-001794 Test Finished"
