#NUMS=/usr/lib/ocaml/nums
#LIBS=-lib /usr/lib64/ocaml/nums
LIBS=-lib /usr/lib/ocaml/nums
SRCS=-Is tools,src,bitv,grobdd
NPROC=$(shell nproc)
OB=ocamlbuild -j $(NPROC) -r $(LIBS) $(SRCS)

all: tests

tests:
	$(OB) \
		test/test_udag.native \
		test/test_urdag.native \
		test/test_ubdag.native \
		test/test_subdag.native \
		test/test_grobdd_cp.native \
		test/test_nqueens_cp.native \
		test/test_nsum_cp.native \
		test/test_myuint_of_int.native \
		test/test_cqueens_cp.native \
		test/test_tcqueens_cp.native \
		test/test_rtcqueens_cp.native \
		test/test_tacx_cp.native \
		test/test_eval_tacx_to_pure_cp.native \
		test/test_eval_tacx_to_pure_nni.native \
		test/test_upgrade_tacx_cp_to_nni.native \
		test/test_noreg_nni_cons.native \
		test/test_eval_pure_to_dot.native

full:
	$(OB) \
		bitv/bitv.native \
		grobdd/cpGops.native \
		grobdd/cp.native \
		grobdd/bsev.native \
		grobdd/bsevTest.native \
		grobdd/nniGops.native \
		grobdd/nni.native \


extra:
	$(OB) \
		grobdd/oops.native \
		grobdd/myUint.native \
		grobdd/cpxV0Gops.native \
		test/test_bin_of_int.native \

extraephe:
		$(OB) \
		ephe/udag.native \
		ephe/ubdag.native \
		ephe/subdag.native


clean:
	ocamlbuild -clean
	rm -rf _build
	rm -f *.native *.d.byte
