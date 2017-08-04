#NUMS=/usr/lib/ocaml/nums
LIBS=-lib /usr/lib64/ocaml/nums
#LIBS=-lib /usr/lib/ocaml/nums
SRCS=-Is tools,src,bitv,grobdd
NPROC=$(shell nproc)
OB=ocamlbuild -j $(NPROC) -r $(LIBS) $(SRCS)

all: tests

prod:
	$(OB) \
		test/test_nqueens_cp.native \
		test/test_cqueens_cp.native \
		test/test_tcqueens_cp.native \
		test/test_rtcqueens_cp.native \
		test/test_eval_tacx_to_pure_cp.native \
		test/test_eval_tacx_to_pure_nni.native \
		test/test_eval_tacx_to_pure_cpx.native \
		test/test_upgrade_tacx_cp_to_nni.native \
		test/test_upgrade_tacx_cp_to_cpx.native \
		test/test_upgrade_tacx_cp_to_cpx.d.byte \
		test/test_noreg_cp_cons.native \
		test/test_noreg_cp_cons.d.byte \
		test/test_noreg_nni_cons.native \
		test/test_eval_pure_to_dot.native

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
		test/test_eval_tacx_to_pure_cpx.native \
		test/test_eval_tacx_to_dot.native \
		test/test_upgrade_tacx_cp_to_nni.native \
		test/test_upgrade_tacx_cp_to_cpx.native \
		test/test_noreg_cp_cons.native \
		test/test_noreg_cp_cons.d.byte \
		test/test_noreg_nni_cons.native \
		test/test_eval_pure_to_dot.native \
		test/test_tacx_stats.native \
		test/test_pure_stats.native \
		test/test_upgrade_pure_cp_to_nni.native \
		test/test_upgrade_pure_cp_to_cpx.native \
		test/test_upgrade_benchmark_v_to_tacx_cp.native \
		test/test_upgrade_benchmark_pla_to_tacx_cp.native \
		test/test_upgrade_benchmark_cnf_to_tacx_cp.native \
		test/test_upgrade_benchmark_cnf_to_tacx_cp_v2.native \
		test/test_upgrade_benchmark_cnf_to_tacx_cp.d.byte \
		test/test_downgrade_pure_cp_to_bryant.native \
		test/test_downgrade_pure_cp_to_zdd.native \
		test/test_propa_tacx_cpx.native \
		test/test_roundup_tacx_cpx.native \
		test/test_roundup1_tacx_cpx.native \

full:
	$(OB) \
		grobdd/cpTypes.native \
		grobdd/cpGops.native \
		grobdd/cp.native \
		bitv/bitv.native \
		grobdd/nniTypes.native \
		grobdd/bsev.native \
		grobdd/bsevTest.native \
		grobdd/nniGops.native \
		grobdd/nni.native \
		grobdd/cpxTypes.native \
		grobdd/cpxUtils.native \
		grobdd/cpxDumpLoad.native \
		grobdd/cpxGops.native \
		grobdd/cpx.native

extra:
	$(OB) \
		src/taggedSubdagPropa.native \
		src/binUbdag.native \
		test/test_test_cpx.d.byte \
		test/test_noreg_cpx_cons.native \
		test/test_noreg_cpx2_cons.native \
		test/test_noreg_cpx2_cons.d.byte \
		test/test_bin_of_int.native \
		test/test_downgrade_pure_cpx_to_bryant.native \
		tools/binStream.native \
		tools/oStream.native \
		grobdd/cpxUtils2Test.native \
		grobdd/cpxDumpLoad2Test.native \
		grobdd/cpxGops2Test.native \

extraephe:
		$(OB) \
		ephe/udag.native \
		ephe/ubdag.native \
		ephe/subdag.native


clean:
	ocamlbuild -clean
	rm -rf _build
	rm -f *.native *.d.byte
