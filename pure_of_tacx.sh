if		[ $1 = "--cp" ]
then
		echo "GroBdd : CP"
		time ./test_eval_tacx_to_pure_cp.native $2 $2.pure || exit
elif	[ $1 = "--nni" ]
then
		echo "GroBdd : NNI"
		time ./test_eval_tacx_to_pure_nni.native $2 $2.pure || exit
else
		echo "select --cp or --nni"
		exit
fi
echo "conversion pure -> dot"
time ./test_eval_pure_to_dot.native $1 $2.pure $2.pure.dot || exit
if [ $3 != "--no-dot" ]
then
	time dot -Tsvg -O $2.pure.dot || exit
	if [ $3 != "--no-view" ]
	then
		viewnior $2.pure.dot.svg || exit
	fi
fi
