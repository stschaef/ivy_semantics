
type nat =
| O
| S of nat

val snd : ('a1 * 'a2) -> 'a2



module Nat :
 sig
  val eqb : nat -> nat -> bool
 end

val map :
  ('a1 -> 'a2) -> 'a1 list -> 'a2 list

val fold_left :
  ('a1 -> 'a2 -> 'a1) -> 'a2 list -> 'a1
  -> 'a1

val seq : nat -> nat -> nat list

val eqb0 : char list -> char list -> bool

type 'a total_map = char list -> 'a

val t_empty : 'a1 -> 'a1 total_map

val t_update :
  'a1 total_map -> char list -> 'a1 ->
  char list -> 'a1

type 'a partial_map = 'a option total_map

val empty : 'a1 partial_map

val list_beq :
  ('a1 -> 'a1 -> bool) -> 'a1 list ->
  'a1 list -> bool

type ivytype =
| Ivytype_Bool
| Ivytype_User_Defined of char list
| Ivytype_Fun of ivytype list * ivytype
| Ivytype_Void

val eqb_Ivytype :
  ivytype -> ivytype -> bool

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
| Expr_Forall of char list * ivytype
   * expr
| Expr_Exists of char list * ivytype
   * expr
| Expr_Cond of expr * expr * expr
| Expr_Error

val eqb_Expr : expr -> expr -> bool

type com =
| Com_Assign of char list * expr
| Com_AssignFun of char list
   * char list list * expr
| Com_Seq of com * com
| Com_If of expr * com
| Com_IfElse of expr * com * com
| Com_For of char list * ivytype * com
| Com_While of expr * com
| Com_LocalVarDecl of char list * ivytype
| Com_GlobalVarDecl of char list
   * ivytype
| Com_GlobalFuncVarDecl of char list
   * (char list * ivytype) list * 
   ivytype
| Com_TypeDecl of char list * nat
| Com_ActionDecl of char list
   * (char list * ivytype) list
   * ivytype * com
| Com_Skip

val is_value : expr -> bool

type context = ivytype partial_map

val update_context :
  context -> char list -> ivytype ->
  context

type enumTypeSizes = ivytype -> nat

type action_context =
  (((char list * ivytype)
  list * ivytype) * com) partial_map

val fromMaybe : 'a1 -> 'a1 option -> 'a1

val subst :
  expr -> expr -> char list -> expr

val type_expr :
  expr -> context -> context ->
  action_context -> (ivytype -> bool) ->
  enumTypeSizes -> ivytype option

val check_command_helper :
  com -> context -> context ->
  action_context -> (ivytype -> bool) ->
  enumTypeSizes ->
  ((((context * context) * action_context) * (ivytype
  -> bool)) * enumTypeSizes) option

val check : com -> bool

val small_step_Expr :
  expr -> context -> context ->
  action_context -> (ivytype -> bool) ->
  enumTypeSizes -> expr option
