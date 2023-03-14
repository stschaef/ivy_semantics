# Formal Semantics of Ivy

This repository contains some small-step structural operational semantics of the Ivy programming language. The semantics are given as formal inference rules and are implemented in Coq.

## Setup
To make imports work using `coqtop` inside VSCode I had to adjust my `coq.coqProjectRoot` and `coqtop.binPath` settings.

For instance on my laptop, I have the following settings:
```json
settings.json
...
"coqtop.binPath": "/opt/homebrew/bin",
    "coq.coqProjectRoot": "/Users/stevenschaefer/ivy_semantics/coq",
```

## So Far
A slimmed down typechecker and small step interpreter has been implemented so far in Coq. To execute this, I extract OCaml from the Coq code and then connect this to a parser made via `ocamlyacc`.

This is still very much a work in progress and does not fully work. However, the typechecker currently works. Additionally, a slimmed down interpreter with only variables and type declarations currently works.

## TODOs
- Get rid of `Maps.v` import. It is only useful for ensuring `eqb` works as expected. This should be easily fixable with the proper imports.
- Get rid of double import warning.
- Implement function symbols properly.
- Prove type preservation/progress for expressions and commands
- Prove that commands are well-formed if the underlying expressions are well-typed, and vice versa
- Need to refactor nondeterminism. Probably as maps out of the unit type?
- Incorporate assertions (axioms and pre-/post-conditions) into the interpreter
- Properly scope variables
- Actions need to be implemented. For now we are only handling void actions; however, at some point it might be worth working in (multiple) return types. There is a decent argument to be made that these multiple return types are just syntactic sugar anyway, and they don't seem to show up in the code we care about (say Aman's [ivybench](https://github.com/aman-goel/ivybench))
- Probably separate the use of a function as a location and as an actual function   

