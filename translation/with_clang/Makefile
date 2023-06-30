# TODO
# Dune yells at me about cyclic dependencies but this command works
# ocamlfind ocamlc -o a -package yojson -linkpkg -I ../../ocaml/extracted ../../ocaml/extracted/extract.ml ../../ocaml/extracted/helper.ml gpt.ml

SOURCES = \
  ../../ocaml/extracted/extract.ml \
  ../../ocaml/extracted/helper.ml \
  translate.ml

.PHONY: all clean

all : translate

clean :
	rm -f translate
	rm -f *.cmi *.cmo *.cmx *.o

translate : $(SOURCES)
	ocamlfind ocamlc -o translate -package yojson -linkpkg -I ../../ocaml/extracted $(SOURCES)
