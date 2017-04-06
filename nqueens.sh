for i in $(seq 2 8)
do
    echo "starting $i-queen(s)"
    echo "  -> generation of $i-tcqueens.cp.tacx"
    ./test_tcqueens_cp.native $i workdir/$i-tcqueens.cp.tacc &> workdir/$i-tcqueens.make-cp.log
    echo "  -> generation of $i-tcqueens.nni.tacx"
    ./test_upgrade_tacx_cp_to_nni.native workdir/$i-tcqueens.cp.tacx workdir/$i-tcqueens.nni.tacx workdir/$i-tcqueens.nni.tacx.dot &> workdir/$i-tcqueens.cp-to-nni.log
    echo "  -> generation of $i-tcqueens.cpx.tacx"
    ./test_upgrade_tacx_cp_to_cpx.native workdir/$i-tcqueens.cp.tacx workdir/$i-tcqueens.cpx.tacx workdir/$i-tcqueens.cpx.tacx.dot &> workdir/$i-tcqueens.cp-to-cpx.log
    echo "  -> generation of $i-tcqueens.cpx.propa.tacx"
    ./test_propa_tacx_cpx.native workdir/$i-tcqueens.cpx.tacx workdir/$i-tcqueens.cpx.propa.tacx workdir/$i-tcqueens.cpx.propa.tacx.dot &> workdir/$i-tcqueens.propa-cpx.log
    echo "  -> generation of $i-tcqueens.cp.pure"
    ./pure_of_tacx.sh --cp workdir/$i-tcqueens.cp.tacx   --no-dot &> workdir/$i-tcqueens.solve-cp.log
    echo "  -> generation of $i-tcqueens.nni.pure"
    ./pure_of_tacx.sh --nni workdir/$i-tcqueens.nni.tacx --no-dot &> workdir/$i-tcqueens.solve-nni.log
    echo "  -> generation of $i-tcqueens.cpx.pure"
    ./pure_of_tacx.sh --cpx workdir/$i-tcqueens.cpx.tacx --no-dot &> workdir/$i-tcqueens.solve-cpx.log
    echo "  -> generation of $i-tcqueens.cpx.propa.pure"
    ./pure_of_tacx.sh --cpx workdir/$i-tcqueens.cpx.propa.tacx --no-dot &> workdir/$i-tcqueens.solve-propa-cpx.log
done

echo "summarize solve-cpx.log"
python nqueens-parser-cpx.py workdir/*-tcqueens.solve-cpx.log
echo "summarize solve-propa-cpx.log"
python nqueens-parser-cpx.py workdir/*-tcqueens.solve-propa-cpx.log
