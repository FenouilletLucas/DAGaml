mkdir workdir workdir/arithmetic workdir/mcnc-big20
for file in $@
do
	workfile=$(python extract_name.py $file)
	echo "$file -> $workfile"
	echo "    -  verilog to  cp.tacx"
	./test_upgrade_benchmark_v_to_tacx_cp.native $file $workfile.cp.tacx 		&> $workfile.v-to-cp.log
	echo "    -  cp.tacx to nni.tacx"
	./test_upgrade_tacx_cp_to_nni.native $workfile.cp.tacx $workfile.nni.tacx	&> $workfile.cp-to-nni.log
	echo "    -  cp.tacx to cpx.tacx"
	./test_upgrade_tacx_cp_to_cpx.native $workfile.cp.tacx $workfile.cpx.tacx	&> $workfile.cp-to-cpx.log
	echo "    -  cp.tacx to  cp.pure"
	./pure_of_tacx.sh --cp $workfile.cp.tacx --no-dot 				&> $workfile.solve-cp.log
	echo "    - nni.tacx to nni.pure"
	./pure_of_tacx.sh --nni $workfile.nni.tacx --no-dot				&> $workfile.solve-nni.log
	echo "    - cpx.tacx to cpx.pure"
	./pure_of_tacx.sh --cpx $workfile.cpx.tacx --no-dot				&> $workfile.solve-cpx.log
	echo "    -  cp.pure to bryant.pure"
	./test_dowgrade_pure_cp_to_bryant.native $workfile.cp.tacx.pure $workfile.bryant.pure	&> $workfile.cp-to-bryant.log
	echo "    -  cp.pure to zdd.pure"
	./test_dowgrade_pure_cp_to_zdd.native $workfile.cp.tacx.pure $workfile.zdd.pure	&> $workfile.cp-to-zdd.log
	echo "    -  summarize"
	echo $workfile > $workfile.stats.log
	./test_pure_stats.native --bryant $workfile.bryant.pure	>> $workfile.stats.log
	./test_pure_stats.native --zdd $workfile.zdd.pure	>> $workfile.stats.log
	./test_pure_stats.native --cp $workfile.cp.tacx.pure	>> $workfile.stats.log
	./test_pure_stats.native --nni $workfile.nni.tacx.pure	>> $workfile.stats.log
	./test_pure_stats.native --cpx $workfile.cpx.tacx.pure	>> $workfile.stats.log
done
