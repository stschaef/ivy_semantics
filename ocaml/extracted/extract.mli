
val negb : bool -> bool

type nat =
| O
| S of nat

val fst :
  ('a1 * 'a2) -> 'a1

val snd :
  ('a1 * 'a2) -> 'a2

val length :
  'a1 list -> nat

module Nat :
 sig
  val eqb :
    nat -> nat -> bool

  val leb :
    nat -> nat -> bool

  val ltb :
    nat -> nat -> bool
 end

val map :
  ('a1 -> 'a2) -> 'a1
  list -> 'a2 list

val fold_left :
  ('a1 -> 'a2 -> 'a1)
  -> 'a2 list -> 'a1 ->
  'a1

val forallb :
  ('a1 -> bool) -> 'a1
  list -> bool

val combine :
  'a1 list -> 'a2 list
  -> ('a1 * 'a2) list

val seq :
  nat -> nat -> nat list

val eqb0 :
  char list ->
  char list -> bool

val list_beq :
  ('a1 -> 'a1 -> bool)
  -> 'a1 list -> 'a1
  list -> bool

type ivytype =
| Ivytype_Bool
| Ivytype_UserDefined of 
   char list * 
   nat
| Ivytype_Function of 
   ivytype list
   * ivytype
| Ivytype_Void

val eqb_Ivytype :
  ivytype -> ivytype ->
  bool

val eqb_OptionIvytype :
  ivytype option ->
  ivytype option -> bool

type expr =
| Expr_VarLiteral of 
   char list
| Expr_EnumVarLiteral of 
   ivytype * nat
| Expr_FunctionSymbol of 
   char list * 
   expr list
| Expr_True
| Expr_False
| Expr_Not of expr
| Expr_And of expr
   * expr
| Expr_Or of expr * expr
| Expr_Eq of expr * expr
| Expr_Implies of 
   expr * expr
| Expr_Iff of expr
   * expr
| Expr_Forall of 
   char list * 
   ivytype * expr
| Expr_Exists of 
   char list * 
   ivytype * expr
| Expr_Cond of 
   expr * expr * 
   expr
| Expr_Error

val eqb_value :
  expr -> expr -> bool

val eqb_Expr :
  expr -> expr -> bool

type com =
| Com_Assign of 
   char list * 
   expr
| Com_AssignFun of 
   char list
   * expr list * 
   expr
| Com_Seq of com * com
| Com_If of expr * com
| Com_IfElse of 
   expr * com * 
   com
| Com_For of char list
   * ivytype * 
   com
| Com_While of 
   expr * com
| Com_Call of char list
   * expr list
| Com_LocalVarDecl of 
   char list * 
   ivytype
| Com_GlobalVarDecl of 
   char list * 
   ivytype
| Com_GlobalFuncVarDecl of 
   char list
   * (char list * ivytype)
     list * ivytype
| Com_TypeDecl of 
   char list * 
   nat
| Com_ActionDecl of 
   char list
   * (char list * ivytype)
     list * ivytype
   * com
| Com_Skip

val is_value :
  expr -> bool

type variable_context =
  (char list -> ivytype
  option) * char list
  list

type type_context =
  (char list -> nat
  option) * char list
  list

type action_context =
  (char list ->
  (((char list * ivytype)
  list * ivytype) * com)
  option) * char list
  list

type function_variable_context =
  expr list

type context =
  (variable_context * (type_context * action_context)) * function_variable_context

val build_context :
  variable_context ->
  type_context ->
  action_context ->
  function_variable_context
  ->
  (variable_context * (type_context * action_context)) * function_variable_context

val get_variable_context :
  context ->
  variable_context

val get_type_context :
  context ->
  type_context

val get_action_context :
  context ->
  action_context

val lookup_variable :
  context -> char list
  -> ivytype option

val lookup_type :
  context -> char list
  -> nat option

val lookup_action :
  context -> char list
  ->
  (((char list * ivytype)
  list * ivytype) * com)
  option

val get_variable_names :
  context -> char list
  list

val get_type_names :
  context -> char list
  list

val get_action_names :
  context -> char list
  list

val get_function_variable_context :
  context ->
  function_variable_context

val update_variable_context :
  context -> char list
  -> ivytype -> context

val update_type_context :
  context -> char list
  -> nat -> context

val update_action_context :
  context -> char list
  ->
  (char list * ivytype)
  list -> ivytype ->
  com -> context

val empty_context :
  context

type state =
  expr -> expr option

val empty_state : state

val update_state :
  state -> expr -> expr
  -> state

val subst :
  expr -> expr ->
  char list -> expr

val subst_com :
  com -> expr ->
  char list -> com

val type_expr :
  expr -> context ->
  ivytype option

val check_command_helper :
  com -> context ->
  context option

val check :
  com -> context option

val small_step_Expr :
  expr -> context ->
  state -> expr option

val small_step_Expr_list :
  expr list -> context
  -> state -> expr list
  option

val get_from_maybe_helper :
  expr list option ->
  expr list

val small_step_Com :
  com -> context ->
  state ->
  (com * state) option
