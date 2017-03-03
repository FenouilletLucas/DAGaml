	time ./test_eval_tacx_to_pure_nni.native $1 $1.pure \
&&	time ./test_eval_pure_to_dot.native --nni $1.pure $1.pure.dot \
&&	echo "#lines for dot:" $(wc -l $1.pure.dot) \
&&	time dot -Tsvg -O $1.pure.dot \
&&	viewnior $1.pure.dot.svg
