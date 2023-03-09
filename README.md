# Formal Semantics of Ivy

This repository contains some small-step structural operational semantics of the Ivy programming language. The semantics are given as formal inference rules and are implemented in Coq.

## Setup
To make imports work using `coqtop` inside VSCode I had to adjust my `coq.coqProjectRoot` and `coqtop.binPath` settings.

For instance on my laptop, I have the following settings:
```json
// settings.json
...
"coqtop.binPath": "/opt/homebrew/bin",
    "coq.coqProjectRoot": "/Users/stevenschaefer/ivy_semantics/coq",
```

## So Far
A slimmed down typechecker and small step interpreter has been implemented so far in Coq. To execute this, I extract OCaml from the Coq code and then connect this to a parser made via `ocamlyacc`.

This is still very much a work in progress and does not fully work. However, typechecking with this should work.

## TODOs
- **Get rid of parser errors**
- Prove type preservation/progress for expressions and commands
- Prove that commands are well-formed if the underlying expressions are well-typed, and vice versa
- Need to refactor nondeterminism. Probably as maps out of the unit type?
- For clarity of code, I don't want to carry around 5+ types of contexts. Either package these into one large context or do something with a monad (or both).
- Look over the data structures used again. I currently have a mess of different flavors of maps (some from `Maps.v` and some written by me). These can likely be optimized.
- Incorporate assertions (axioms and pre-/post-conditions) into the interpreter
- Actions need to be implemented
- probably separate the use of a function as a location and as an actual function   
- decide is_value as a boolean, not a proposition. This should be doable
