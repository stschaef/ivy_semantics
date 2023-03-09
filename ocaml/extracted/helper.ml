open Extract

(* OCaml's int converted to extracted version of Coq's nat *)
let rec int_to_nat (n : int) : nat =
  if n <= 0 then O
  else S (int_to_nat (n - 1))

(* OCaml string to char list conversion *)
let explode s = List.init (String.length s) (String.get s)