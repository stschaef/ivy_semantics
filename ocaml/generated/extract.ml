
type nat =
| O
| S of nat

type comparison =
| Eq
| Lt
| Gt

(** val compOpp : comparison -> comparison **)

let compOpp = function
| Eq -> Eq
| Lt -> Gt
| Gt -> Lt

module Coq__1 = struct
 (** val add : nat -> nat -> nat **)
 let rec add n m =
   match n with
   | O -> m
   | S p -> S (add p m)
end
include Coq__1

module Nat =
 struct
  (** val eqb : nat -> nat -> bool **)

  let rec eqb n m =
    match n with
    | O -> (match m with
            | O -> true
            | S _ -> false)
    | S n' -> (match m with
               | O -> false
               | S m' -> eqb n' m')
 end

(** val map : ('a1 -> 'a2) -> 'a1 list -> 'a2 list **)

let rec map f = function
| [] -> []
| a :: t -> (f a) :: (map f t)

(** val fold_left :
    ('a1 -> 'a2 -> 'a1) -> 'a2 list -> 'a1 -> 'a1 **)

let rec fold_left f l a0 =
  match l with
  | [] -> a0
  | b :: t -> fold_left f t (f a0 b)

(** val seq : nat -> nat -> nat list **)

let rec seq start = function
| O -> []
| S len0 -> start :: (seq (S start) len0)

type positive =
| XI of positive
| XO of positive
| XH

type z =
| Z0
| Zpos of positive
| Zneg of positive

module Pos =
 struct
  (** val succ : positive -> positive **)

  let rec succ = function
  | XI p -> XO (succ p)
  | XO p -> XI p
  | XH -> XO XH

  (** val add : positive -> positive -> positive **)

  let rec add x y =
    match x with
    | XI p ->
      (match y with
       | XI q -> XO (add_carry p q)
       | XO q -> XI (add p q)
       | XH -> XO (succ p))
    | XO p ->
      (match y with
       | XI q -> XI (add p q)
       | XO q -> XO (add p q)
       | XH -> XI p)
    | XH ->
      (match y with
       | XI q -> XO (succ q)
       | XO q -> XI q
       | XH -> XO XH)

  (** val add_carry : positive -> positive -> positive **)

  and add_carry x y =
    match x with
    | XI p ->
      (match y with
       | XI q -> XI (add_carry p q)
       | XO q -> XO (add_carry p q)
       | XH -> XI (succ p))
    | XO p ->
      (match y with
       | XI q -> XO (add_carry p q)
       | XO q -> XI (add p q)
       | XH -> XO (succ p))
    | XH ->
      (match y with
       | XI q -> XI (succ q)
       | XO q -> XO (succ q)
       | XH -> XI XH)

  (** val pred_double : positive -> positive **)

  let rec pred_double = function
  | XI p -> XI (XO p)
  | XO p -> XI (pred_double p)
  | XH -> XH

  (** val mul : positive -> positive -> positive **)

  let rec mul x y =
    match x with
    | XI p -> add y (XO (mul p y))
    | XO p -> XO (mul p y)
    | XH -> y

  (** val compare_cont :
      comparison -> positive -> positive -> comparison **)

  let rec compare_cont r x y =
    match x with
    | XI p ->
      (match y with
       | XI q -> compare_cont r p q
       | XO q -> compare_cont Gt p q
       | XH -> Gt)
    | XO p ->
      (match y with
       | XI q -> compare_cont Lt p q
       | XO q -> compare_cont r p q
       | XH -> Gt)
    | XH -> (match y with
             | XH -> r
             | _ -> Lt)

  (** val compare : positive -> positive -> comparison **)

  let compare =
    compare_cont Eq

  (** val eqb : positive -> positive -> bool **)

  let rec eqb p q =
    match p with
    | XI p0 -> (match q with
                | XI q0 -> eqb p0 q0
                | _ -> false)
    | XO p0 -> (match q with
                | XO q0 -> eqb p0 q0
                | _ -> false)
    | XH -> (match q with
             | XH -> true
             | _ -> false)

  (** val iter_op :
      ('a1 -> 'a1 -> 'a1) -> positive -> 'a1 -> 'a1 **)

  let rec iter_op op p a =
    match p with
    | XI p0 -> op a (iter_op op p0 (op a a))
    | XO p0 -> iter_op op p0 (op a a)
    | XH -> a

  (** val to_nat : positive -> nat **)

  let to_nat x =
    iter_op Coq__1.add x (S O)

  (** val of_succ_nat : nat -> positive **)

  let rec of_succ_nat = function
  | O -> XH
  | S x -> succ (of_succ_nat x)
 end

module Z =
 struct
  (** val double : z -> z **)

  let double = function
  | Z0 -> Z0
  | Zpos p -> Zpos (XO p)
  | Zneg p -> Zneg (XO p)

  (** val succ_double : z -> z **)

  let succ_double = function
  | Z0 -> Zpos XH
  | Zpos p -> Zpos (XI p)
  | Zneg p -> Zneg (Pos.pred_double p)

  (** val pred_double : z -> z **)

  let pred_double = function
  | Z0 -> Zneg XH
  | Zpos p -> Zpos (Pos.pred_double p)
  | Zneg p -> Zneg (XI p)

  (** val pos_sub : positive -> positive -> z **)

  let rec pos_sub x y =
    match x with
    | XI p ->
      (match y with
       | XI q -> double (pos_sub p q)
       | XO q -> succ_double (pos_sub p q)
       | XH -> Zpos (XO p))
    | XO p ->
      (match y with
       | XI q -> pred_double (pos_sub p q)
       | XO q -> double (pos_sub p q)
       | XH -> Zpos (Pos.pred_double p))
    | XH ->
      (match y with
       | XI q -> Zneg (XO q)
       | XO q -> Zneg (Pos.pred_double q)
       | XH -> Z0)

  (** val add : z -> z -> z **)

  let add x y =
    match x with
    | Z0 -> y
    | Zpos x' ->
      (match y with
       | Z0 -> x
       | Zpos y' -> Zpos (Pos.add x' y')
       | Zneg y' -> pos_sub x' y')
    | Zneg x' ->
      (match y with
       | Z0 -> x
       | Zpos y' -> pos_sub y' x'
       | Zneg y' -> Zneg (Pos.add x' y'))

  (** val opp : z -> z **)

  let opp = function
  | Z0 -> Z0
  | Zpos x0 -> Zneg x0
  | Zneg x0 -> Zpos x0

  (** val sub : z -> z -> z **)

  let sub m n =
    add m (opp n)

  (** val mul : z -> z -> z **)

  let mul x y =
    match x with
    | Z0 -> Z0
    | Zpos x' ->
      (match y with
       | Z0 -> Z0
       | Zpos y' -> Zpos (Pos.mul x' y')
       | Zneg y' -> Zneg (Pos.mul x' y'))
    | Zneg x' ->
      (match y with
       | Z0 -> Z0
       | Zpos y' -> Zneg (Pos.mul x' y')
       | Zneg y' -> Zpos (Pos.mul x' y'))

  (** val compare : z -> z -> comparison **)

  let compare x y =
    match x with
    | Z0 -> (match y with
             | Z0 -> Eq
             | Zpos _ -> Lt
             | Zneg _ -> Gt)
    | Zpos x' ->
      (match y with
       | Zpos y' -> Pos.compare x' y'
       | _ -> Gt)
    | Zneg x' ->
      (match y with
       | Zneg y' -> compOpp (Pos.compare x' y')
       | _ -> Lt)

  (** val leb : z -> z -> bool **)

  let leb x y =
    match compare x y with
    | Gt -> false
    | _ -> true

  (** val ltb : z -> z -> bool **)

  let ltb x y =
    match compare x y with
    | Lt -> true
    | _ -> false

  (** val eqb : z -> z -> bool **)

  let rec eqb x y =
    match x with
    | Z0 -> (match y with
             | Z0 -> true
             | _ -> false)
    | Zpos p -> (match y with
                 | Zpos q -> Pos.eqb p q
                 | _ -> false)
    | Zneg p -> (match y with
                 | Zneg q -> Pos.eqb p q
                 | _ -> false)

  (** val to_nat : z -> nat **)

  let to_nat = function
  | Zpos p -> Pos.to_nat p
  | _ -> O

  (** val of_nat : nat -> z **)

  let of_nat = function
  | O -> Z0
  | S n0 -> Zpos (Pos.of_succ_nat n0)

  (** val pos_div_eucl : positive -> z -> z * z **)

  let rec pos_div_eucl a b =
    match a with
    | XI a' ->
      let (q, r) = pos_div_eucl a' b in
      let r' = add (mul (Zpos (XO XH)) r) (Zpos XH) in
      if ltb r' b
      then ((mul (Zpos (XO XH)) q), r')
      else ((add (mul (Zpos (XO XH)) q) (Zpos XH)), (sub r' b))
    | XO a' ->
      let (q, r) = pos_div_eucl a' b in
      let r' = mul (Zpos (XO XH)) r in
      if ltb r' b
      then ((mul (Zpos (XO XH)) q), r')
      else ((add (mul (Zpos (XO XH)) q) (Zpos XH)), (sub r' b))
    | XH ->
      if leb (Zpos (XO XH)) b
      then (Z0, (Zpos XH))
      else ((Zpos XH), Z0)

  (** val div_eucl : z -> z -> z * z **)

  let div_eucl a b =
    match a with
    | Z0 -> (Z0, Z0)
    | Zpos a' ->
      (match b with
       | Z0 -> (Z0, Z0)
       | Zpos _ -> pos_div_eucl a' b
       | Zneg b' ->
         let (q, r) = pos_div_eucl a' (Zpos b') in
         (match r with
          | Z0 -> ((opp q), Z0)
          | _ -> ((opp (add q (Zpos XH))), (add b r))))
    | Zneg a' ->
      (match b with
       | Z0 -> (Z0, Z0)
       | Zpos _ ->
         let (q, r) = pos_div_eucl a' b in
         (match r with
          | Z0 -> ((opp q), Z0)
          | _ -> ((opp (add q (Zpos XH))), (sub b r)))
       | Zneg b' ->
         let (q, r) = pos_div_eucl a' (Zpos b') in (q, (opp r)))

  (** val modulo : z -> z -> z **)

  let modulo a b =
    let (_, r) = div_eucl a b in r
 end

(** val eqb0 : char list -> char list -> bool **)

let rec eqb0 s1 s2 =
  match s1 with
  | [] -> (match s2 with
           | [] -> true
           | _::_ -> false)
  | c1::s1' ->
    (match s2 with
     | [] -> false
     | c2::s2' -> if (=) c1 c2 then eqb0 s1' s2' else false)

type 'a stream = 'a __stream Lazy.t
and 'a __stream =
| Cons of 'a * 'a stream

(** val hd : 'a1 stream -> 'a1 **)

let hd x =
  let Cons (a, _) = Lazy.force x in a

type 'a total_map = char list -> 'a

type 'a partial_map = 'a option total_map

(** val list_beq :
    ('a1 -> 'a1 -> bool) -> 'a1 list -> 'a1 list -> bool **)

let rec list_beq eq_A x y =
  match x with
  | [] -> (match y with
           | [] -> true
           | _ :: _ -> false)
  | x0 :: x1 ->
    (match y with
     | [] -> false
     | x2 :: x3 -> (&&) (eq_A x0 x2) (list_beq eq_A x1 x3))

type ivytype =
| Ivytype_Bool
| Ivytype_User_Defined of char list
| Ivytype_Fun of ivytype list * ivytype
| Ivytype_Void

(** val eqb_Ivytype : ivytype -> ivytype -> bool **)

let rec eqb_Ivytype t1 t2 =
  match t1 with
  | Ivytype_Bool ->
    (match t2 with
     | Ivytype_Bool -> true
     | _ -> false)
  | Ivytype_User_Defined s1 ->
    (match t2 with
     | Ivytype_User_Defined s2 -> eqb0 s1 s2
     | _ -> false)
  | Ivytype_Fun (ts1, t3) ->
    (match t2 with
     | Ivytype_Fun (ts2, t4) ->
       (&&) (list_beq eqb_Ivytype ts1 ts2) (eqb_Ivytype t3 t4)
     | _ -> false)
  | Ivytype_Void ->
    (match t2 with
     | Ivytype_Void -> true
     | _ -> false)

type expr =
| Expr_VarLiteral of char list
| Expr_EnumVarLiteral of ivytype * nat
| Expr_VarFun of char list * expr list
| Expr_True
| Expr_False
| Expr_Not of expr
| Expr_And of expr * expr
| Expr_Or of expr * expr
| Expr_Eq of expr * expr
| Expr_Implies of expr * expr
| Expr_Iff of expr * expr
| Expr_Forall of char list * ivytype * expr
| Expr_Exists of char list * ivytype * expr
| Expr_Nondet of ivytype
| Expr_Cond of expr * expr * expr
| Expr_Error

(** val eqb_Expr : expr -> expr -> bool **)

let rec eqb_Expr e1 e2 =
  match e1 with
  | Expr_VarLiteral x1 ->
    (match e2 with
     | Expr_VarLiteral x2 -> eqb0 x1 x2
     | _ -> false)
  | Expr_EnumVarLiteral (t1, n1) ->
    (match e2 with
     | Expr_EnumVarLiteral (t2, n2) ->
       (&&) (eqb_Ivytype t1 t2) (Nat.eqb n1 n2)
     | _ -> false)
  | Expr_VarFun (x1, es1) ->
    (match e2 with
     | Expr_VarFun (x2, es2) ->
       (&&) (eqb0 x1 x2) (list_beq eqb_Expr es1 es2)
     | _ -> false)
  | Expr_True -> (match e2 with
                  | Expr_True -> true
                  | _ -> false)
  | Expr_False -> (match e2 with
                   | Expr_False -> true
                   | _ -> false)
  | Expr_Not e3 ->
    (match e2 with
     | Expr_Not e4 -> eqb_Expr e3 e4
     | _ -> false)
  | Expr_And (e11, e12) ->
    (match e2 with
     | Expr_And (e21, e22) ->
       (&&) (eqb_Expr e11 e21) (eqb_Expr e12 e22)
     | _ -> false)
  | Expr_Or (e11, e12) ->
    (match e2 with
     | Expr_Or (e21, e22) ->
       (&&) (eqb_Expr e11 e21) (eqb_Expr e12 e22)
     | _ -> false)
  | Expr_Eq (e11, e12) ->
    (match e2 with
     | Expr_Eq (e21, e22) ->
       (&&) (eqb_Expr e11 e21) (eqb_Expr e12 e22)
     | _ -> false)
  | Expr_Implies (e11, e12) ->
    (match e2 with
     | Expr_Implies (e21, e22) ->
       (&&) (eqb_Expr e11 e21) (eqb_Expr e12 e22)
     | _ -> false)
  | Expr_Iff (e11, e12) ->
    (match e2 with
     | Expr_Iff (e21, e22) ->
       (&&) (eqb_Expr e11 e21) (eqb_Expr e12 e22)
     | _ -> false)
  | Expr_Nondet t1 ->
    (match e2 with
     | Expr_Nondet t2 -> eqb_Ivytype t1 t2
     | _ -> false)
  | Expr_Cond (e11, e12, e13) ->
    (match e2 with
     | Expr_Cond (e21, e22, e23) ->
       (&&) (eqb_Expr e11 e21)
         ((&&) (eqb_Expr e12 e22) (eqb_Expr e13 e23))
     | _ -> false)
  | _ -> false

type com =
| Com_Assign of char list * expr
| Com_AssignFun of char list * char list list * expr
| Com_Seq of com * com
| Com_If of expr * com
| Com_IfElse of expr * com * com
| Com_For of char list * ivytype * com
| Com_While of expr * com
| Com_LocalVarDecl of char list * ivytype
| Com_GlobalVarDecl of char list * ivytype
| Com_GlobalFuncVarDecl of char list * ivytype list * ivytype
| Com_TypeDecl of char list * nat
| Com_ActionDecl of char list * (char list * ivytype) list
   * ivytype * com
| Com_Skip

(** val is_value : expr -> bool **)

let rec is_value = function
| Expr_VarLiteral _ -> true
| Expr_VarFun (_, es) ->
  fold_left (fun b e0 -> (&&) b (is_value e0)) es true
| Expr_True -> true
| Expr_False -> true
| _ -> false

(** val subst : expr -> expr -> char list -> expr **)

let rec subst e v x =
  match e with
  | Expr_VarLiteral y -> if eqb0 x y then v else e
  | Expr_VarFun (y, es) ->
    Expr_VarFun (y, (map (fun e0 -> subst e0 v x) es))
  | Expr_Not e0 -> Expr_Not (subst e0 v x)
  | Expr_And (e1, e2) -> Expr_And ((subst e1 v x), (subst e2 v x))
  | Expr_Or (e1, e2) -> Expr_Or ((subst e1 v x), (subst e2 v x))
  | Expr_Eq (e1, e2) -> Expr_Eq ((subst e1 v x), (subst e2 v x))
  | Expr_Implies (e1, e2) ->
    Expr_Implies ((subst e1 v x), (subst e2 v x))
  | Expr_Iff (e1, e2) -> Expr_Iff ((subst e1 v x), (subst e2 v x))
  | Expr_Forall (y, t, e0) -> Expr_Forall (y, t, (subst e0 v x))
  | Expr_Exists (y, t, e0) -> Expr_Exists (y, t, (subst e0 v x))
  | Expr_Cond (e1, e2, e3) ->
    Expr_Cond ((subst e1 v x), (subst e2 v x), (subst e3 v x))
  | x0 -> x0

type context = ivytype partial_map

type enumTypeSizes = ivytype -> nat

type action_context =
  (((char list * ivytype) list * ivytype) * com) partial_map

(** val fromMaybe : 'a1 -> 'a1 option -> 'a1 **)

let fromMaybe x = function
| Some z0 -> z0
| None -> x

(** val rand : z -> z -> z -> z stream **)

let rec rand seed n1 n2 =
  let seed' = Z.modulo seed n2 in
  lazy (Cons (seed', (rand (Z.mul seed' n1) n1 n2)))

(** val nondet_helper : ivytype -> enumTypeSizes -> expr option **)

let nondet_helper t type_sizes =
  match t with
  | Ivytype_Bool ->
    if Z.eqb (hd (rand Z0 (Zpos (XO XH)) (Zpos (XI XH)))) Z0
    then Some Expr_True
    else Some Expr_False
  | Ivytype_User_Defined _ ->
    Some (Expr_EnumVarLiteral (t,
      (Z.to_nat
        (hd
          (rand Z0 (Zpos (XO XH))
            (Z.add (Z.of_nat (type_sizes t)) (Zpos XH)))))))
  | _ -> None

(** val small_step_Expr :
    expr -> context -> context -> action_context -> (ivytype ->
    bool) -> enumTypeSizes -> expr option **)

let rec small_step_Expr e var_ctx fun_var_ctx act_ctx declared_types type_sizes =
  match e with
  | Expr_VarFun (x, es) ->
    (match fun_var_ctx x with
     | Some i ->
       (match i with
        | Ivytype_Fun (_, _) ->
          (match es with
           | [] -> None
           | e0 :: es' ->
             (match small_step_Expr e0 var_ctx fun_var_ctx act_ctx
                      declared_types type_sizes with
              | Some e' -> Some (Expr_VarFun (x, (e' :: es')))
              | None ->
                (match es' with
                 | [] -> None
                 | e' :: es'' ->
                   (match small_step_Expr e' var_ctx fun_var_ctx
                            act_ctx declared_types type_sizes with
                    | Some e'' ->
                      Some (Expr_VarFun (x, (e0 :: (e'' :: es''))))
                    | None -> None))))
        | _ -> None)
     | None -> None)
  | Expr_Not e' ->
    if is_value e'
    then (match e' with
          | Expr_True -> Some Expr_False
          | Expr_False -> Some Expr_True
          | _ -> None)
    else let e'' =
           small_step_Expr e' var_ctx fun_var_ctx act_ctx
             declared_types type_sizes
         in
         Some (Expr_Not (fromMaybe Expr_Error e''))
  | Expr_And (e1, e2) ->
    if is_value e1
    then if is_value e2
         then (match e1 with
               | Expr_True ->
                 (match e2 with
                  | Expr_True -> Some Expr_True
                  | Expr_False -> Some Expr_False
                  | _ -> None)
               | Expr_False ->
                 (match e2 with
                  | Expr_True -> Some Expr_False
                  | Expr_False -> Some Expr_False
                  | _ -> None)
               | _ -> None)
         else Some (Expr_And (e1,
                (fromMaybe Expr_Error
                  (small_step_Expr e2 var_ctx fun_var_ctx act_ctx
                    declared_types type_sizes))))
    else Some (Expr_And
           ((fromMaybe Expr_Error
              (small_step_Expr e1 var_ctx fun_var_ctx act_ctx
                declared_types type_sizes)), e2))
  | Expr_Or (e1, e2) ->
    if is_value e1
    then if is_value e2
         then (match e1 with
               | Expr_True ->
                 (match e2 with
                  | Expr_True -> Some Expr_True
                  | Expr_False -> Some Expr_True
                  | _ -> None)
               | Expr_False ->
                 (match e2 with
                  | Expr_True -> Some Expr_True
                  | Expr_False -> Some Expr_False
                  | _ -> None)
               | _ -> None)
         else Some (Expr_Or (e1,
                (fromMaybe Expr_Error
                  (small_step_Expr e2 var_ctx fun_var_ctx act_ctx
                    declared_types type_sizes))))
    else Some (Expr_Or
           ((fromMaybe Expr_Error
              (small_step_Expr e1 var_ctx fun_var_ctx act_ctx
                declared_types type_sizes)), e2))
  | Expr_Eq (e1, e2) ->
    if is_value e1
    then if is_value e2
         then if eqb_Expr e1 e2
              then Some Expr_True
              else Some Expr_False
         else Some (Expr_Eq (e1,
                (fromMaybe Expr_Error
                  (small_step_Expr e2 var_ctx fun_var_ctx act_ctx
                    declared_types type_sizes))))
    else Some (Expr_Eq
           ((fromMaybe Expr_Error
              (small_step_Expr e1 var_ctx fun_var_ctx act_ctx
                declared_types type_sizes)), e2))
  | Expr_Implies (e1, e2) ->
    if is_value e1
    then if is_value e2
         then (match e1 with
               | Expr_True ->
                 (match e2 with
                  | Expr_True -> Some Expr_True
                  | Expr_False -> Some Expr_False
                  | _ -> None)
               | Expr_False ->
                 (match e2 with
                  | Expr_True -> Some Expr_True
                  | Expr_False -> Some Expr_True
                  | _ -> None)
               | _ -> None)
         else Some (Expr_Implies (e1,
                (fromMaybe Expr_Error
                  (small_step_Expr e2 var_ctx fun_var_ctx act_ctx
                    declared_types type_sizes))))
    else Some (Expr_Implies
           ((fromMaybe Expr_Error
              (small_step_Expr e1 var_ctx fun_var_ctx act_ctx
                declared_types type_sizes)), e2))
  | Expr_Iff (e1, e2) ->
    if is_value e1
    then if is_value e2
         then if eqb_Expr e1 e2
              then Some Expr_True
              else Some Expr_False
         else Some (Expr_Iff (e1,
                (fromMaybe Expr_Error
                  (small_step_Expr e2 var_ctx fun_var_ctx act_ctx
                    declared_types type_sizes))))
    else Some (Expr_Iff
           ((fromMaybe Expr_Error
              (small_step_Expr e1 var_ctx fun_var_ctx act_ctx
                declared_types type_sizes)), e2))
  | Expr_Forall (x, t, e') ->
    let nums = seq O (type_sizes t) in
    let out =
      fold_left (fun acc y -> Expr_And (acc,
        (subst e' (Expr_EnumVarLiteral (t, y)) x))) nums Expr_True
    in
    Some out
  | Expr_Exists (x, t, e') ->
    let out =
      fold_left (fun acc y -> Expr_Or (acc,
        (subst e' (Expr_EnumVarLiteral (t, y)) x)))
        (seq O (type_sizes t)) Expr_False
    in
    Some out
  | Expr_Nondet t -> nondet_helper t type_sizes
  | Expr_Cond (e1, e2, e3) ->
    if is_value e1
    then (match e1 with
          | Expr_True -> Some e2
          | Expr_False -> Some e3
          | _ -> None)
    else Some (Expr_Cond
           ((fromMaybe Expr_Error
              (small_step_Expr e1 var_ctx fun_var_ctx act_ctx
                declared_types type_sizes)), e2, e3))
  | _ -> None
