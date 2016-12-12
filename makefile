#NUMS=/usr/lib/ocaml/nums
#LIBS=-lib /usr/lib64/ocaml/nums
#LIBS=-lib /usr/lib/ocaml/nums
SRCS=-Is tools,src,bitv
NPROC=$(shell nproc)
OB=ocamlbuild -j $(NPROC) -r $(LIBS) $(SRCS)

all: extra tests

tests:
	$(OB) \
		test/test_udag.native \
		test/test_urdag.native \
		test/test_ubdag.native \
		test/test_subdag.native \
		test/test_grobdd_cp.native \
		test/test_tacx_cp.native

extra:
	$(OB) \
		bitv/bitv.native


clean:
	ocamlbuild -clean
	rm -rf _build
	rm -f *.native *.d.byte
