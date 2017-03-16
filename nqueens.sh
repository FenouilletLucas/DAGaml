for i in $(seq 1 8)
do
	./test_tcqueens_cp.native $i workdir/$i-tcqueens.cp.tacc
	./test_upgrade_tacx_cp_to_nni.native workdir/$i-tcqueens.cp.tacx workdir/$i-tcqueens.nni.tacx
	./pure_of_tacx.sh --cp workdir/$i-tcqueens.cp.tacx --no-view
	./pure_of_tacx.sh --nni workdir/$i-tcqueens.nni.tacx --no-view
done
