
(** val negb : bool -> bool **)

let negb = function
| true -> false
| false -> true

type nat =
| O
| S of nat

(** val fst : ('a1 * 'a2) -> 'a1 **)

let fst = function
| (x, _) -> x

(** val snd : ('a1 * 'a2) -> 'a2 **)

let snd = function
| (_, y) -> y



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

  (** val leb : nat -> nat -> bool **)

  let rec leb n m =
    match n with
    | O -> true
    | S n' -> (match m with
               | O -> false
               | S m' -> leb n' m')

  (** val ltb : nat -> nat -> bool **)

  let ltb n m =
    leb (S n) m
 end

(** val map : ('a1 -> 'a2) -> 'a1 list -> 'a2 list **)

let rec map f = function
| [] -> []
| a :: t -> (f a) :: (map f t)

(** val fold_left : ('a1 -> 'a2 -> 'a1) -> 'a2 list -> 'a1 -> 'a1 **)

let rec fold_left f l a0 =
  match l with
  | [] -> a0
  | b :: t -> fold_left f t (f a0 b)

(** val seq : nat -> nat -> nat list **)

let rec seq start = function
| O -> []
| S len0 -> start :: (seq (S start) len0)

(** val eqb0 : char list -> char list -> bool **)

let rec eqb0 s1 s2 =
  match s1 with
  | [] -> (match s2 with
           | [] -> true
           | _::_ -> false)
  | c1::s1' -> (match s2 with
                | [] -> false
                | c2::s2' -> if (=) c1 c2 then eqb0 s1' s2' else false)

(** val list_beq : ('a1 -> 'a1 -> bool) -> 'a1 list -> 'a1 list -> bool **)

let rec list_beq eq_A x y =
  match x with
  | [] -> (match y with
           | [] -> true
           | _ :: _ -> false)
  | x0 :: x1 -> (match y with
                 | [] -> false
                 | x2 :: x3 -> (&&) (eq_A x0 x2) (list_beq eq_A x1 x3))

type ivytype =
| Ivytype_Bool
| Ivytype_UserDefined of char list * nat
| Ivytype_Function of ivytype list * ivytype
| Ivytype_Void

(** val eqb_Ivytype : ivytype -> ivytype -> bool **)

let rec eqb_Ivytype t1 t2 =
  match t1 with
  | Ivytype_Bool -> (match t2 with
                     | Ivytype_Bool -> true
                     | _ -> false)
  | Ivytype_UserDefined (s1, n1) ->
    (match t2 with
     | Ivytype_UserDefined (s2, n2) -> (&&) (eqb0 s1 s2) (Nat.eqb n1 n2)
     | _ -> false)
  | Ivytype_Function (ts1, t3) ->
    (match t2 with
     | Ivytype_Function (ts2, t4) -> (&&) (list_beq eqb_Ivytype ts1 ts2) (eqb_Ivytype t3 t4)
     | _ -> false)
  | Ivytype_Void -> (match t2 with
                     | Ivytype_Void -> true
                     | _ -> false)

(** val eqb_OptionIvytype : ivytype option -> ivytype option -> bool **)

let rec eqb_OptionIvytype t1 t2 =
  match t1 with
  | Some t3 -> (match t2 with
                | Some t4 -> eqb_Ivytype t3 t4
                | None -> false)
  | None -> (match t2 with
             | Some _ -> false
             | None -> true)

type expr =
| Expr_VarLiteral of char list
| Expr_EnumVarLiteral of ivytype * nat
| Expr_FunctionSymbol of char list * expr list
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
| Expr_Cond of expr * expr * expr
| Expr_Error

(** val eqb_value : expr -> expr -> bool **)

let eqb_value e1 e2 =
  match e1 with
  | Expr_EnumVarLiteral (t1, n1) ->
    (match e2 with
     | Expr_EnumVarLiteral (t2, n2) -> (&&) (eqb_Ivytype t1 t2) (Nat.eqb n1 n2)
     | _ -> false)
  | Expr_True -> (match e2 with
                  | Expr_True -> true
                  | _ -> false)
  | Expr_False -> (match e2 with
                   | Expr_False -> true
                   | _ -> false)
  | _ -> false

(** val eqb_Expr : expr -> expr -> bool **)

let rec eqb_Expr e1 e2 =
  match e1 with
  | Expr_VarLiteral x1 -> (match e2 with
                           | Expr_VarLiteral x2 -> eqb0 x1 x2
                           | _ -> false)
  | Expr_EnumVarLiteral (t1, n1) ->
    (match e2 with
     | Expr_EnumVarLiteral (t2, n2) -> (&&) (eqb_Ivytype t1 t2) (Nat.eqb n1 n2)
     | _ -> false)
  | Expr_True -> (match e2 with
                  | Expr_True -> true
                  | _ -> false)
  | Expr_False -> (match e2 with
                   | Expr_False -> true
                   | _ -> false)
  | Expr_Not e3 -> (match e2 with
                    | Expr_Not e4 -> eqb_Expr e3 e4
                    | _ -> false)
  | Expr_And (e11, e12) ->
    (match e2 with
     | Expr_And (e21, e22) -> (&&) (eqb_Expr e11 e21) (eqb_Expr e12 e22)
     | _ -> false)
  | Expr_Or (e11, e12) ->
    (match e2 with
     | Expr_Or (e21, e22) -> (&&) (eqb_Expr e11 e21) (eqb_Expr e12 e22)
     | _ -> false)
  | Expr_Eq (e11, e12) ->
    (match e2 with
     | Expr_Eq (e21, e22) -> (&&) (eqb_Expr e11 e21) (eqb_Expr e12 e22)
     | _ -> false)
  | Expr_Implies (e11, e12) ->
    (match e2 with
     | Expr_Implies (e21, e22) -> (&&) (eqb_Expr e11 e21) (eqb_Expr e12 e22)
     | _ -> false)
  | Expr_Iff (e11, e12) ->
    (match e2 with
     | Expr_Iff (e21, e22) -> (&&) (eqb_Expr e11 e21) (eqb_Expr e12 e22)
     | _ -> false)
  | Expr_Cond (e11, e12, e13) ->
    (match e2 with
     | Expr_Cond (e21, e22, e23) -> (&&) (eqb_Expr e11 e21) ((&&) (eqb_Expr e12 e22) (eqb_Expr e13 e23))
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
| Com_GlobalFuncVarDecl of char list * (char list * ivytype) list * ivytype
| Com_TypeDecl of char list * nat
| Com_ActionDecl of char list * (char list * ivytype) list * ivytype * com
| Com_Skip

(** val is_value : expr -> bool **)

let rec is_value = function
| Expr_EnumVarLiteral (_, _) -> true
| Expr_True -> true
| Expr_False -> true
| _ -> false

type variable_context = (char list -> ivytype option) * char list list

type type_context = (char list -> nat option) * char list list

type action_context =
  (char list -> (((char list * ivytype) list * ivytype) * com) option) * char list list

type context = variable_context * (type_context * action_context)

(** val build_context :
    variable_context -> type_context -> action_context ->
    variable_context * (type_context * action_context) **)

let build_context vc tc ac =
  (vc, (tc, ac))

(** val get_variable_context : context -> variable_context **)

let get_variable_context =
  fst

(** val get_type_context : context -> type_context **)

let get_type_context c =
  fst (snd c)

(** val get_action_context : context -> action_context **)

let get_action_context c =
  snd (snd c)

(** val lookup_variable : context -> char list -> ivytype option **)

let lookup_variable c x =
  fst (get_variable_context c) x

(** val lookup_type : context -> char list -> nat option **)

let lookup_type c x =
  fst (get_type_context c) x

(** val lookup_action :
    context -> char list -> (((char list * ivytype) list * ivytype) * com) option **)

let lookup_action c x =
  fst (get_action_context c) x

(** val get_variable_names : context -> char list list **)

let get_variable_names c =
  snd (get_variable_context c)

(** val get_type_names : context -> char list list **)

let get_type_names c =
  snd (get_type_context c)

(** val get_action_names : context -> char list list **)

let get_action_names c =
  snd (get_action_context c)

(** val update_variable_context : context -> char list -> ivytype -> context **)

let update_variable_context c x t =
  let vc = get_variable_context c in
  let tc = get_type_context c in
  let ac = get_action_context c in
  build_context ((fun y -> if eqb0 x y then Some t else fst vc y), (x :: (snd vc))) tc ac

(** val update_type_context : context -> char list -> nat -> context **)

let update_type_context c x n =
  let vc = get_variable_context c in
  let tc = get_type_context c in
  let ac = get_action_context c in
  build_context vc ((fun y -> if eqb0 x y then Some n else fst tc y), (x :: (snd tc))) ac

(** val update_action_context :
    context -> char list -> (char list * ivytype) list -> ivytype -> com -> context **)

let update_action_context c x params ret_type body =
  let vc = get_variable_context c in
  let tc = get_type_context c in
  let ac = get_action_context c in
  build_context vc tc ((fun y -> if eqb0 x y then Some ((params, ret_type), body) else fst ac y),
    (x :: (snd ac)))

(** val empty_context : context **)

let empty_context =
  build_context ((fun _ -> None), []) ((fun _ -> None), []) ((fun _ -> None), [])

type state = expr -> expr option

(** val empty_state : state **)

let empty_state _ =
  None

(** val update_state : state -> expr -> expr -> state **)

let update_state s e1 e2 e =
  if eqb_Expr e e1 then Some e2 else s e

(** val subst : expr -> expr -> char list -> expr **)

let rec subst e v x =
  match e with
  | Expr_VarLiteral y -> if eqb0 x y then v else e
  | Expr_FunctionSymbol (x0, es) -> Expr_FunctionSymbol (x0, (map (fun e0 -> subst e0 v x0) es))
  | Expr_Not e0 -> Expr_Not (subst e0 v x)
  | Expr_And (e1, e2) -> Expr_And ((subst e1 v x), (subst e2 v x))
  | Expr_Or (e1, e2) -> Expr_Or ((subst e1 v x), (subst e2 v x))
  | Expr_Eq (e1, e2) -> Expr_Eq ((subst e1 v x), (subst e2 v x))
  | Expr_Implies (e1, e2) -> Expr_Implies ((subst e1 v x), (subst e2 v x))
  | Expr_Iff (e1, e2) -> Expr_Iff ((subst e1 v x), (subst e2 v x))
  | Expr_Forall (y, t, e0) -> Expr_Forall (y, t, (subst e0 v x))
  | Expr_Exists (y, t, e0) -> Expr_Exists (y, t, (subst e0 v x))
  | Expr_Cond (e1, e2, e3) -> Expr_Cond ((subst e1 v x), (subst e2 v x), (subst e3 v x))
  | x0 -> x0

(** val subst_com : com -> expr -> char list -> com **)

let rec subst_com p v x =
  match p with
  | Com_Assign (y, e) -> Com_Assign (y, (subst e v x))
  | Com_Seq (p1, p2) -> Com_Seq ((subst_com p1 v x), (subst_com p2 v x))
  | Com_If (e, p0) -> Com_If ((subst e v x), (subst_com p0 v x))
  | Com_IfElse (e, p1, p2) -> Com_IfElse ((subst e v x), (subst_com p1 v x), (subst_com p2 v x))
  | Com_While (e, p0) -> Com_While ((subst e v x), (subst_com p0 v x))
  | Com_Skip -> Com_Skip
  | _ -> p

(** val type_expr : expr -> context -> ivytype option **)

let rec type_expr e gamma =
  match e with
  | Expr_VarLiteral x -> lookup_variable gamma x
  | Expr_EnumVarLiteral (t, n) ->
    (match t with
     | Ivytype_UserDefined (x, l) ->
       (match lookup_type gamma x with
        | Some m -> if (&&) (Nat.ltb m n) (Nat.eqb l m) then Some t else None
        | None -> None)
     | _ -> None)
  | Expr_FunctionSymbol (x, es) ->
    (match lookup_variable gamma x with
     | Some i ->
       (match i with
        | Ivytype_Function (ts, ret_t) ->
          let calculated_type_options = map (fun e0 -> type_expr e0 gamma) es in
          if list_beq eqb_OptionIvytype (map (fun x0 -> Some x0) ts) calculated_type_options
          then Some ret_t
          else None
        | _ -> None)
     | None -> None)
  | Expr_Not e' ->
    (match type_expr e' gamma with
     | Some i -> (match i with
                  | Ivytype_Bool -> Some Ivytype_Bool
                  | _ -> None)
     | None -> None)
  | Expr_And (e1, e2) ->
    (match type_expr e1 gamma with
     | Some i ->
       (match i with
        | Ivytype_Bool ->
          (match type_expr e2 gamma with
           | Some i0 -> (match i0 with
                         | Ivytype_Bool -> Some Ivytype_Bool
                         | _ -> None)
           | None -> None)
        | _ -> None)
     | None -> None)
  | Expr_Or (e1, e2) ->
    (match type_expr e1 gamma with
     | Some i ->
       (match i with
        | Ivytype_Bool ->
          (match type_expr e2 gamma with
           | Some i0 -> (match i0 with
                         | Ivytype_Bool -> Some Ivytype_Bool
                         | _ -> None)
           | None -> None)
        | _ -> None)
     | None -> None)
  | Expr_Eq (e1, e2) ->
    (match type_expr e1 gamma with
     | Some t1 ->
       (match type_expr e2 gamma with
        | Some t2 -> if eqb_Ivytype t1 t2 then Some Ivytype_Bool else None
        | None -> None)
     | None -> None)
  | Expr_Implies (e1, e2) ->
    (match type_expr e1 gamma with
     | Some i ->
       (match i with
        | Ivytype_Bool ->
          (match type_expr e2 gamma with
           | Some i0 -> (match i0 with
                         | Ivytype_Bool -> Some Ivytype_Bool
                         | _ -> None)
           | None -> None)
        | _ -> None)
     | None -> None)
  | Expr_Iff (e1, e2) ->
    (match type_expr e1 gamma with
     | Some i ->
       (match i with
        | Ivytype_Bool ->
          (match type_expr e2 gamma with
           | Some i0 -> (match i0 with
                         | Ivytype_Bool -> Some Ivytype_Bool
                         | _ -> None)
           | None -> None)
        | _ -> None)
     | None -> None)
  | Expr_Forall (_, t, e') ->
    (match t with
     | Ivytype_Bool ->
       (match type_expr e' gamma with
        | Some i -> (match i with
                     | Ivytype_Bool -> Some Ivytype_Bool
                     | _ -> None)
        | None -> None)
     | Ivytype_UserDefined (x, _) ->
       (match lookup_type gamma x with
        | Some _ ->
          (match type_expr e' gamma with
           | Some i -> (match i with
                        | Ivytype_Bool -> Some Ivytype_Bool
                        | _ -> None)
           | None -> None)
        | None -> None)
     | _ -> None)
  | Expr_Exists (_, t, e') ->
    (match t with
     | Ivytype_Bool ->
       (match type_expr e' gamma with
        | Some i -> (match i with
                     | Ivytype_Bool -> Some Ivytype_Bool
                     | _ -> None)
        | None -> None)
     | Ivytype_UserDefined (x, _) ->
       (match lookup_type gamma x with
        | Some _ ->
          (match type_expr e' gamma with
           | Some i -> (match i with
                        | Ivytype_Bool -> Some Ivytype_Bool
                        | _ -> None)
           | None -> None)
        | None -> None)
     | _ -> None)
  | Expr_Cond (e1, e2, e3) ->
    (match type_expr e2 gamma with
     | Some i ->
       (match i with
        | Ivytype_Bool ->
          (match type_expr e1 gamma with
           | Some t2 ->
             (match type_expr e3 gamma with
              | Some t3 -> if eqb_Ivytype t2 t3 then Some t2 else None
              | None -> None)
           | None -> None)
        | _ -> None)
     | None -> None)
  | Expr_Error -> None
  | _ -> Some Ivytype_Bool

(** val check_command_helper : com -> context -> context option **)

let rec check_command_helper p gamma =
  match p with
  | Com_Assign (x, e) ->
    let e_type = type_expr e gamma in
    let t = lookup_variable gamma x in if eqb_OptionIvytype e_type t then Some gamma else None
  | Com_AssignFun (f, arg_ids, e) ->
    let e_type = type_expr e gamma in
    (match lookup_variable gamma f with
     | Some i ->
       (match i with
        | Ivytype_Function (arg_ts, ret_t) ->
          let option_arg_ts = map (fun x -> Some x) arg_ts in
          let arg_ts' = map (fun x -> lookup_variable gamma x) arg_ids in
          if list_beq eqb_OptionIvytype option_arg_ts arg_ts'
          then if eqb_OptionIvytype e_type (Some ret_t) then Some gamma else None
          else None
        | _ -> None)
     | None -> None)
  | Com_Seq (p1, p2) ->
    (match check_command_helper p1 gamma with
     | Some gamma' -> check_command_helper p2 gamma'
     | None -> None)
  | Com_If (e, p') ->
    (match type_expr e gamma with
     | Some i -> (match i with
                  | Ivytype_Bool -> check_command_helper p' gamma
                  | _ -> None)
     | None -> None)
  | Com_IfElse (e, p1, p2) ->
    (match type_expr e gamma with
     | Some i ->
       (match i with
        | Ivytype_Bool ->
          (match check_command_helper p1 gamma with
           | Some gamma' -> check_command_helper p2 gamma'
           | None -> None)
        | _ -> None)
     | None -> None)
  | Com_For (x, t, p') ->
    (match t with
     | Ivytype_Bool -> check_command_helper p' (update_variable_context gamma x Ivytype_Bool)
     | Ivytype_UserDefined (x0, _) ->
       (match lookup_type gamma x0 with
        | Some _ -> check_command_helper p' (update_variable_context gamma x0 t)
        | None -> None)
     | _ -> None)
  | Com_While (e, p') ->
    (match type_expr e gamma with
     | Some i -> (match i with
                  | Ivytype_Bool -> check_command_helper p' gamma
                  | _ -> None)
     | None -> None)
  | Com_LocalVarDecl (var_id, t) ->
    if eqb_OptionIvytype (lookup_variable gamma var_id) None
    then (match t with
          | Ivytype_Bool -> Some (update_variable_context gamma var_id t)
          | Ivytype_UserDefined (x, _) ->
            (match lookup_type gamma x with
             | Some _ -> Some (update_variable_context gamma var_id t)
             | None -> None)
          | _ -> None)
    else None
  | Com_GlobalVarDecl (var_id, t) ->
    if eqb_OptionIvytype (lookup_variable gamma var_id) None
    then (match t with
          | Ivytype_Bool -> Some (update_variable_context gamma var_id t)
          | Ivytype_UserDefined (x, _) ->
            (match lookup_type gamma x with
             | Some _ -> Some (update_variable_context gamma var_id t)
             | None -> None)
          | _ -> None)
    else None
  | Com_GlobalFuncVarDecl (var_id, arg_names_and_ts, ret_type) ->
    if eqb_OptionIvytype (lookup_variable gamma var_id) None
    then let arg_ts = map snd arg_names_and_ts in
         (match ret_type with
          | Ivytype_Bool ->
            let arg_ts_declared =
              fold_left (fun acc t ->
                match t with
                | Ivytype_Bool -> acc
                | Ivytype_UserDefined (x, _) ->
                  (match lookup_type gamma x with
                   | Some _ -> acc
                   | None -> false)
                | _ -> false) arg_ts true
            in
            if arg_ts_declared
            then Some (update_variable_context gamma var_id (Ivytype_Function (arg_ts, ret_type)))
            else None
          | Ivytype_UserDefined (x, _) ->
            (match lookup_type gamma x with
             | Some _ ->
               let arg_ts_declared =
                 fold_left (fun acc t ->
                   match t with
                   | Ivytype_Bool -> acc
                   | Ivytype_UserDefined (x0, _) ->
                     (match lookup_type gamma x0 with
                      | Some _ -> acc
                      | None -> false)
                   | _ -> false) arg_ts true
               in
               if arg_ts_declared
               then Some (update_variable_context gamma var_id (Ivytype_Function (arg_ts, ret_type)))
               else None
             | None -> None)
          | _ -> None)
    else None
  | Com_TypeDecl (t_id, n) ->
    (match lookup_type gamma t_id with
     | Some _ -> None
     | None -> Some (update_type_context gamma t_id n))
  | Com_ActionDecl (act_id, arg_ids_and_types, ret_type, p') ->
    (match lookup_action gamma act_id with
     | Some _ -> None
     | None ->
       (match ret_type with
        | Ivytype_Bool ->
          let arg_ts = map snd arg_ids_and_types in
          let arg_ts_declared =
            fold_left (fun acc t ->
              match t with
              | Ivytype_Bool -> acc
              | Ivytype_UserDefined (x, _) ->
                (match lookup_type gamma x with
                 | Some _ -> acc
                 | None -> false)
              | _ -> false) arg_ts true
          in
          if arg_ts_declared
          then check_command_helper p'
                 (update_action_context gamma act_id arg_ids_and_types ret_type p')
          else None
        | Ivytype_UserDefined (x, _) ->
          (match lookup_type gamma x with
           | Some _ ->
             let arg_ts = map snd arg_ids_and_types in
             let arg_ts_declared =
               fold_left (fun acc t ->
                 match t with
                 | Ivytype_Bool -> acc
                 | Ivytype_UserDefined (x0, _) ->
                   (match lookup_type gamma x0 with
                    | Some _ -> acc
                    | None -> false)
                 | _ -> false) arg_ts true
             in
             if arg_ts_declared
             then check_command_helper p'
                    (update_action_context gamma act_id arg_ids_and_types ret_type p')
             else None
           | None -> None)
        | _ -> None))
  | Com_Skip -> Some gamma

(** val check : com -> context option **)

let check p =
  check_command_helper p empty_context

(** val small_step_Expr : expr -> context -> state -> expr option **)

let rec small_step_Expr e gamma s =
  match e with
  | Expr_VarLiteral _ -> s e
  | Expr_FunctionSymbol (x, es) ->
    let args_are_values = fold_left (fun acc e' -> (&&) acc (is_value e')) es true in
    if args_are_values
    then s e
    else let es' = map (fun e' -> match small_step_Expr e' gamma s with
                                  | Some e'' -> e''
                                  | None -> e') es
         in
         Some (Expr_FunctionSymbol (x, es'))
  | Expr_Not e' ->
    if is_value e'
    then (match e' with
          | Expr_True -> Some Expr_False
          | Expr_False -> Some Expr_True
          | _ -> None)
    else (match small_step_Expr e' gamma s with
          | Some e'' -> Some (Expr_Not e'')
          | None -> None)
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
         else (match small_step_Expr e2 gamma s with
               | Some e'' -> Some (Expr_And (e1, e''))
               | None -> None)
    else (match small_step_Expr e1 gamma s with
          | Some e'' -> Some (Expr_And (e'', e2))
          | None -> None)
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
         else (match small_step_Expr e2 gamma s with
               | Some e'' -> Some (Expr_Or (e1, e''))
               | None -> None)
    else (match small_step_Expr e1 gamma s with
          | Some e'' -> Some (Expr_Or (e'', e2))
          | None -> None)
  | Expr_Eq (e1, e2) ->
    if is_value e1
    then if is_value e2
         then if eqb_value e1 e2 then Some Expr_True else Some Expr_False
         else (match small_step_Expr e2 gamma s with
               | Some e'' -> Some (Expr_Eq (e1, e''))
               | None -> None)
    else (match small_step_Expr e1 gamma s with
          | Some e'' -> Some (Expr_Eq (e'', e2))
          | None -> None)
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
         else (match small_step_Expr e2 gamma s with
               | Some e'' -> Some (Expr_Implies (e1, e''))
               | None -> None)
    else (match small_step_Expr e1 gamma s with
          | Some e'' -> Some (Expr_Implies (e'', e2))
          | None -> None)
  | Expr_Iff (e1, e2) ->
    if is_value e1
    then if is_value e2
         then if eqb_value e1 e2 then Some Expr_True else Some Expr_False
         else (match small_step_Expr e2 gamma s with
               | Some e'' -> Some (Expr_Iff (e1, e''))
               | None -> None)
    else (match small_step_Expr e1 gamma s with
          | Some e'' -> Some (Expr_Iff (e'', e2))
          | None -> None)
  | Expr_Forall (x, t, e') ->
    (match t with
     | Ivytype_Bool ->
       Some
         (fold_left (fun acc y -> Expr_And (acc, (subst e' y x))) (Expr_True :: (Expr_False :: []))
           Expr_True)
     | Ivytype_UserDefined (x0, n) ->
       let nums = seq O n in
       let out =
         fold_left (fun acc y -> Expr_And (acc, (subst e' (Expr_EnumVarLiteral (t, y)) x0))) nums
           Expr_True
       in
       Some out
     | _ -> None)
  | Expr_Exists (x, t, e') ->
    (match t with
     | Ivytype_Bool ->
       Some
         (fold_left (fun acc y -> Expr_Or (acc, (subst e' y x))) (Expr_True :: (Expr_False :: []))
           Expr_False)
     | Ivytype_UserDefined (x0, n) ->
       let nums = seq O n in
       let out =
         fold_left (fun acc y -> Expr_Or (acc, (subst e' (Expr_EnumVarLiteral (t, y)) x0))) nums
           Expr_False
       in
       Some out
     | _ -> None)
  | Expr_Cond (e1, e2, e3) ->
    if negb (is_value e2)
    then (match small_step_Expr e2 gamma s with
          | Some e'' -> Some (Expr_Cond (e1, e'', e3))
          | None -> None)
    else if negb (is_value e3)
         then (match small_step_Expr e3 gamma s with
               | Some e'' -> Some (Expr_Cond (e1, e2, e''))
               | None -> None)
         else if is_value e1
              then (match e1 with
                    | Expr_True -> Some e2
                    | Expr_False -> Some e3
                    | _ -> None)
              else (match small_step_Expr e1 gamma s with
                    | Some e'' -> Some (Expr_Cond (e'', e2, e3))
                    | None -> None)
  | _ -> None

(** val small_step_Com : com -> context -> state -> (com * state) option **)

let rec small_step_Com p gamma s =
  match p with
  | Com_Assign (x, e) ->
    if is_value e
    then Some (Com_Skip, (update_state s (Expr_VarLiteral x) e))
    else (match small_step_Expr e gamma s with
          | Some e' -> Some ((Com_Assign (x, e')), s)
          | None -> None)
  | Com_Seq (p1, p2) ->
    (match small_step_Com p1 gamma s with
     | Some p0 ->
       let (p1', s') = p0 in
       (match p1' with
        | Com_Skip -> Some (p2, s')
        | _ -> Some ((Com_Seq (p1', p2)), s'))
     | None -> None)
  | Com_If (e, c) ->
    if is_value e
    then (match e with
          | Expr_True -> Some (c, s)
          | Expr_False -> Some (Com_Skip, s)
          | _ -> None)
    else (match small_step_Expr e gamma s with
          | Some e' -> Some ((Com_If (e', c)), s)
          | None -> None)
  | Com_IfElse (e, c, c') ->
    if is_value e
    then (match e with
          | Expr_True -> Some (c, s)
          | Expr_False -> Some (c', s)
          | _ -> None)
    else (match small_step_Expr e gamma s with
          | Some e' -> Some ((Com_IfElse (e', c, c')), s)
          | None -> None)
  | Com_For (x, t, c) ->
    (match t with
     | Ivytype_Bool ->
       Some
         ((fold_left (fun acc y -> Com_Seq (acc, (subst_com c y x))) (Expr_True :: (Expr_False :: []))
            Com_Skip), s)
     | Ivytype_UserDefined (x0, n) ->
       let nums = seq O n in
       let out =
         fold_left (fun acc y -> Com_Seq (acc, (subst_com c (Expr_EnumVarLiteral (t, y)) x0))) nums
           Com_Skip
       in
       Some (out, s)
     | _ -> None)
  | Com_While (e, c) -> Some ((Com_IfElse (e, (Com_Seq (c, (Com_While (e, c)))), Com_Skip)), s)
  | _ -> Some (Com_Skip, s)
