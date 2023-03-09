open Extract

let rec int_to_nat (n : int) : nat =
  if n <= 0 then O
  else S (int_to_nat (n - 1))

let explode s = List.init (String.length s) (String.get s)