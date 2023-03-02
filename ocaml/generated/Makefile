# Makefile
#
# targets are:
# all: rebuild the project (default)
# clean: remove all objects and executables

SOURCES = parser.mli parser.ml lexer.ml extract.ml extract.mli main.ml
CLEAN = parser.ml parser.mli lexer.ml *.cmo *.cmx *.cmi *.o

.PHONY: all clean

all: ivy

clean:
	rm -f ivy $(CLEAN)

ivy: $(SOURCES)
	ocamlc -o ivy str.cma $(SOURCES)

parser.ml: parser.mly
	ocamlyacc parser.mly

parser.mli: parser.mly
	ocamlyacc parser.mly

lexer.ml: parser.ml parser.mli lexer.mll
	ocamllex lexer.mll
