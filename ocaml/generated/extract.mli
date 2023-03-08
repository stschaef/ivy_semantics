
type nat =
| O
| S of nat

type comparison =
| Eq
| Lt
| Gt

val compOpp : comparison -> comparison

val add : nat -> nat -> nat

module Nat :
 sig
  val eqb : nat -> nat -> bool
 end

val map : ('a1 -> 'a2) -> 'a1 list -> 'a2 list

val fold_left : ('a1 -> 'a2 -> 'a1) -> 'a2 list -> 'a1 -> 'a1

val seq : nat -> nat -> nat list

type positive =
| XI of positive
| XO of positive
| XH

type z =
| Z0
| Zpos of positive
| Zneg of positive

module Pos :
 sig
  val succ : positive -> positive

  val add : positive -> positive -> positive

  val add_carry : positive -> positive -> positive

  val pred_double : positive -> positive

  val mul : positive -> positive -> positive

  val compare_cont :
    comparison -> positive -> positive -> comparison

  val compare : positive -> positive -> comparison

  val eqb : positive -> positive -> bool

  val iter_op : ('a1 -> 'a1 -> 'a1) -> positive -> 'a1 -> 'a1

  val to_nat : positive -> nat

  val of_succ_nat : nat -> positive
 end

module Z :
 sig
  val double : z -> z

  val succ_double : z -> z

  val pred_double : z -> z

  val pos_sub : positive -> positive -> z

  val add : z -> z -> z

  val opp : z -> z

  val sub : z -> z -> z

  val mul : z -> z -> z

  val compare : z -> z -> comparison

  val leb : z -> z -> bool

  val ltb : z -> z -> bool

  val eqb : z -> z -> bool

  val to_nat : z -> nat

  val of_nat : nat -> z

  val pos_div_eucl : positive -> z -> z * z

  val div_eucl : z -> z -> z * z

  val modulo : z -> z -> z
 end

val eqb0 : char list -> char list -> bool

type 'a stream = 'a __stream Lazy.t
and 'a __stream =
| Cons of 'a * 'a stream

val hd : 'a1 stream -> 'a1

type 'a total_map = char list -> 'a

type 'a partial_map = 'a option total_map

val list_beq : ('a1 -> 'a1 -> bool) -> 'a1 list -> 'a1 list -> bool

type ivytype =
| Ivytype_Bool
| Ivytype_User_Defined of char list
| Ivytype_Fun of ivytype list * ivytype
| Ivytype_Void

val eqb_Ivytype : ivytype -> ivytype -> bool

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

val eqb_Expr : expr -> expr -> bool

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

val is_value : expr -> bool

val subst : expr -> expr -> char list -> expr

type context = ivytype partial_map

type enumTypeSizes = ivytype -> nat

type action_context =
  (((char list * ivytype) list * ivytype) * com) partial_map

val fromMaybe : 'a1 -> 'a1 option -> 'a1

val rand : z -> z -> z -> z stream

val nondet_helper : ivytype -> enumTypeSizes -> expr option

val small_step_Expr :
  expr -> context -> context -> action_context -> (ivytype ->
  bool) -> enumTypeSizes -> expr option
