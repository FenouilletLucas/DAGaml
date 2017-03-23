for i in $(seq 1 8)
do
	./test_tcqueens_cp.native $i workdir/$i-tcqueens.cp.tacc
	./test_upgrade_tacx_cp_to_nni.native workdir/$i-tcqueens.cp.tacx workdir/$i-tcqueens.nni.tacx
	./test_upgrade_tacx_cp_to_cpx.native workdir/$i-tcqueens.cp.tacx workdir/$i-tcqueens.cpx.tacx
	./pure_of_tacx.sh --cp workdir/$i-tcqueens.cp.tacx   --no-dot
	./pure_of_tacx.sh --nni workdir/$i-tcqueens.nni.tacx --no-dot
	./pure_of_tacx.sh --cpx workdir/$i-tcqueens.cpx.tacx --no-dot
done
