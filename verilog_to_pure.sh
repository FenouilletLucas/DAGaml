for file in $@
do
	workfile=$(python extract_name.py $file)
	./test_upgrade_benchmark_v_to_tacx_cp.native $file $workfile.cp.tacx
	./pure_of_tacx.sh --cp $workfile.cp.tacx --no-dot
	./test_upgrade_tacx_cp_to_nni.native $workfile.cp.tacx $workfile.nni.tacx
	./test_upgrade_tacx_cp_to_cpx.native $workfile.cp.tacx $workfile.cpx.tacx
	./pure_of_tacx.sh --nni $workfile.nni.tacx --no-dot
	./pure_of_tacx.sh --cpx $workfile.cpx.tacx --no-dot
done
