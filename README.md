# Formal Semantics of Ivy

This repository contains some small-step structural operational semantics of the Ivy programming language. The semantics are given as formal inference rules and are implemented in Coq.

## So Far
- Syntax of most of the expressions and commands
- Substitution functions
- Typing of expressions and well-formedness of commands


## TODOs
- An `eval` function in Coq, and parsing so that I can test the Coq implementation. I might be able to leverage my use of `ocamlyacc` in the OCaml implementation to pass the same grammar to Coq.
- Convert small steps for expressions and commands from OCaml to Coq
- Prove type preservation/progress for expressions and commands
- Prove that commands are well-formed if the underlying expressions are well-typed, and vice versa
- The non-determinism operator might be weird in Coq because I used a random number generator in OCaml
- Look over the data structures used again. I currently have a mess of different flavors of maps (some from `Maps.v` and some written by me). It would be very nice to swap some things out for things that act like sets. 
- Incorporate assertions (axioms and pre-/post-conditions) into the interpreter
- Quadruple check that what is down now works. A lot of the translation from OCaml to Coq was straightforward, but I got lazy and offloaded some to Copilot. The code looks fine, but I should double check that it works as intended.
- action application
- probably separate the use of a function as a location and as an actual function   
- decide is_value as a boolean, not a proposition. This should be doable
