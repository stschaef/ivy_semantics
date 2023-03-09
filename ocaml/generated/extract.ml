
type nat =
| O
| S of nat

(** val snd : ('a1 * 'a2) -> 'a2 **)

let snd = function
| (_, y) -> y



module Nat =
 struct
  (** val eqb : nat -> nat -> bool **)

  let rec eqb n m =
    match n with
    | O ->
      (match m with
       | O -> true
       | S _ -> false)
    | S n' ->
      (match m with
       | O -> false
       | S m' -> eqb n' m')
 end

(** val map :
    ('a1 -> 'a2) -> 'a1 list -> 'a2 list **)

let rec map f = function
| [] -> []
| a :: t -> (f a) :: (map f t)

(** val fold_left :
    ('a1 -> 'a2 -> 'a1) -> 'a2 list ->
    'a1 -> 'a1 **)

let rec fold_left f l a0 =
  match l with
  | [] -> a0
  | b :: t -> fold_left f t (f a0 b)

(** val seq : nat -> nat -> nat list **)

let rec seq start = function
| O -> []
| S len0 -> start :: (seq (S start) len0)

(** val eqb0 :
    char list -> char list -> bool **)

let rec eqb0 s1 s2 =
  match s1 with
  | [] ->
    (match s2 with
     | [] -> true
     | _::_ -> false)
  | c1::s1' ->
    (match s2 with
     | [] -> false
     | c2::s2' ->
       if (=) c1 c2
       then eqb0 s1' s2'
       else false)

type 'a total_map = char list -> 'a

(** val t_empty :
    'a1 -> 'a1 total_map **)

let t_empty v _ =
  v

(** val t_update :
    'a1 total_map -> char list -> 'a1 ->
    char list -> 'a1 **)

let t_update m x v x' =
  if eqb0 x x' then v else m x'

type 'a partial_map = 'a option total_map

(** val empty : 'a1 partial_map **)

let empty x =
  t_empty None x

(** val list_beq :
    ('a1 -> 'a1 -> bool) -> 'a1 list ->
    'a1 list -> bool **)

let rec list_beq eq_A x y =
  match x with
  | [] ->
    (match y with
     | [] -> true
     | _ :: _ -> false)
  | x0 :: x1 ->
    (match y with
     | [] -> false
     | x2 :: x3 ->
       (&&) (eq_A x0 x2)
         (list_beq eq_A x1 x3))

type ivytype =
| Ivytype_Bool
| Ivytype_User_Defined of char list
| Ivytype_Fun of ivytype list * ivytype
| Ivytype_Void

(** val eqb_Ivytype :
    ivytype -> ivytype -> bool **)

let rec eqb_Ivytype t1 t2 =
  match t1 with
  | Ivytype_Bool ->
    (match t2 with
     | Ivytype_Bool -> true
     | _ -> false)
  | Ivytype_User_Defined s1 ->
    (match t2 with
     | Ivytype_User_Defined s2 ->
       eqb0 s1 s2
     | _ -> false)
  | Ivytype_Fun (ts1, t3) ->
    (match t2 with
     | Ivytype_Fun (ts2, t4) ->
       (&&)
         (list_beq eqb_Ivytype ts1 ts2)
         (eqb_Ivytype t3 t4)
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
| Expr_Forall of char list * ivytype
   * expr
| Expr_Exists of char list * ivytype
   * expr
| Expr_Cond of expr * expr * expr
| Expr_Error

(** val eqb_Expr :
    expr -> expr -> bool **)

let rec eqb_Expr e1 e2 =
  match e1 with
  | Expr_VarLiteral x1 ->
    (match e2 with
     | Expr_VarLiteral x2 -> eqb0 x1 x2
     | _ -> false)
  | Expr_EnumVarLiteral (t1, n1) ->
    (match e2 with
     | Expr_EnumVarLiteral (t2, n2) ->
       (&&) (eqb_Ivytype t1 t2)
         (Nat.eqb n1 n2)
     | _ -> false)
  | Expr_VarFun (x1, es1) ->
    (match e2 with
     | Expr_VarFun (x2, es2) ->
       (&&) (eqb0 x1 x2)
         (list_beq eqb_Expr es1 es2)
     | _ -> false)
  | Expr_True ->
    (match e2 with
     | Expr_True -> true
     | _ -> false)
  | Expr_False ->
    (match e2 with
     | Expr_False -> true
     | _ -> false)
  | Expr_Not e3 ->
    (match e2 with
     | Expr_Not e4 -> eqb_Expr e3 e4
     | _ -> false)
  | Expr_And (e11, e12) ->
    (match e2 with
     | Expr_And (e21, e22) ->
       (&&) (eqb_Expr e11 e21)
         (eqb_Expr e12 e22)
     | _ -> false)
  | Expr_Or (e11, e12) ->
    (match e2 with
     | Expr_Or (e21, e22) ->
       (&&) (eqb_Expr e11 e21)
         (eqb_Expr e12 e22)
     | _ -> false)
  | Expr_Eq (e11, e12) ->
    (match e2 with
     | Expr_Eq (e21, e22) ->
       (&&) (eqb_Expr e11 e21)
         (eqb_Expr e12 e22)
     | _ -> false)
  | Expr_Implies (e11, e12) ->
    (match e2 with
     | Expr_Implies (e21, e22) ->
       (&&) (eqb_Expr e11 e21)
         (eqb_Expr e12 e22)
     | _ -> false)
  | Expr_Iff (e11, e12) ->
    (match e2 with
     | Expr_Iff (e21, e22) ->
       (&&) (eqb_Expr e11 e21)
         (eqb_Expr e12 e22)
     | _ -> false)
  | Expr_Cond (e11, e12, e13) ->
    (match e2 with
     | Expr_Cond (e21, e22, e23) ->
       (&&) (eqb_Expr e11 e21)
         ((&&) (eqb_Expr e12 e22)
           (eqb_Expr e13 e23))
     | _ -> false)
  | _ -> false

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

(** val is_value : expr -> bool **)

let rec is_value = function
| Expr_VarLiteral _ -> true
| Expr_VarFun (_, es) ->
  fold_left (fun b e0 ->
    (&&) b (is_value e0)) es true
| Expr_True -> true
| Expr_False -> true
| _ -> false

type context = ivytype partial_map

(** val update_context :
    context -> char list -> ivytype ->
    context **)

let update_context c x t =
  t_update c x (Some t)

type enumTypeSizes = ivytype -> nat

type action_context =
  (((char list * ivytype)
  list * ivytype) * com) partial_map

(** val fromMaybe :
    'a1 -> 'a1 option -> 'a1 **)

let fromMaybe x = function
| Some z -> z
| None -> x

(** val subst :
    expr -> expr -> char list -> expr **)

let rec subst e v x =
  match e with
  | Expr_VarLiteral y ->
    if eqb0 x y then v else e
  | Expr_VarFun (y, es) ->
    Expr_VarFun (y,
      (map (fun e0 -> subst e0 v x) es))
  | Expr_Not e0 ->
    Expr_Not (subst e0 v x)
  | Expr_And (e1, e2) ->
    Expr_And ((subst e1 v x),
      (subst e2 v x))
  | Expr_Or (e1, e2) ->
    Expr_Or ((subst e1 v x),
      (subst e2 v x))
  | Expr_Eq (e1, e2) ->
    Expr_Eq ((subst e1 v x),
      (subst e2 v x))
  | Expr_Implies (e1, e2) ->
    Expr_Implies ((subst e1 v x),
      (subst e2 v x))
  | Expr_Iff (e1, e2) ->
    Expr_Iff ((subst e1 v x),
      (subst e2 v x))
  | Expr_Forall (y, t, e0) ->
    Expr_Forall (y, t, (subst e0 v x))
  | Expr_Exists (y, t, e0) ->
    Expr_Exists (y, t, (subst e0 v x))
  | Expr_Cond (e1, e2, e3) ->
    Expr_Cond ((subst e1 v x),
      (subst e2 v x), (subst e3 v x))
  | x0 -> x0

(** val type_expr :
    expr -> context -> context ->
    action_context -> (ivytype -> bool)
    -> enumTypeSizes -> ivytype option **)

let rec type_expr e var_ctx fun_var_ctx act_ctx declared_types type_sizes =
  match e with
  | Expr_VarLiteral x -> var_ctx x
  | Expr_EnumVarLiteral (t, _) -> Some t
  | Expr_VarFun (x, es) ->
    (match fun_var_ctx x with
     | Some i ->
       (match i with
        | Ivytype_Fun (decl_arg_ts, ret_t) ->
          let arg_ts =
            map (fun e0 ->
              fromMaybe Ivytype_Void
                (type_expr e0 var_ctx
                  fun_var_ctx act_ctx
                  declared_types
                  type_sizes)) es
          in
          if list_beq eqb_Ivytype arg_ts
               decl_arg_ts
          then Some ret_t
          else None
        | _ -> None)
     | None -> None)
  | Expr_Not e0 ->
    (match type_expr e0 var_ctx
             fun_var_ctx act_ctx
             declared_types type_sizes with
     | Some i ->
       (match i with
        | Ivytype_Bool ->
          Some Ivytype_Bool
        | _ -> None)
     | None -> None)
  | Expr_And (e1, e2) ->
    (match type_expr e1 var_ctx
             fun_var_ctx act_ctx
             declared_types type_sizes with
     | Some i ->
       (match i with
        | Ivytype_Bool ->
          (match type_expr e2 var_ctx
                   fun_var_ctx act_ctx
                   declared_types
                   type_sizes with
           | Some i0 ->
             (match i0 with
              | Ivytype_Bool ->
                Some Ivytype_Bool
              | _ -> None)
           | None -> None)
        | _ -> None)
     | None -> None)
  | Expr_Or (e1, e2) ->
    (match type_expr e1 var_ctx
             fun_var_ctx act_ctx
             declared_types type_sizes with
     | Some i ->
       (match i with
        | Ivytype_Bool ->
          (match type_expr e2 var_ctx
                   fun_var_ctx act_ctx
                   declared_types
                   type_sizes with
           | Some i0 ->
             (match i0 with
              | Ivytype_Bool ->
                Some Ivytype_Bool
              | _ -> None)
           | None -> None)
        | _ -> None)
     | None -> None)
  | Expr_Eq (e1, e2) ->
    (match type_expr e1 var_ctx
             fun_var_ctx act_ctx
             declared_types type_sizes with
     | Some t1 ->
       (match type_expr e2 var_ctx
                fun_var_ctx act_ctx
                declared_types type_sizes with
        | Some t2 ->
          if eqb_Ivytype t1 t2
          then Some Ivytype_Bool
          else None
        | None -> None)
     | None -> None)
  | Expr_Implies (e1, e2) ->
    (match type_expr e1 var_ctx
             fun_var_ctx act_ctx
             declared_types type_sizes with
     | Some i ->
       (match i with
        | Ivytype_Bool ->
          (match type_expr e2 var_ctx
                   fun_var_ctx act_ctx
                   declared_types
                   type_sizes with
           | Some i0 ->
             (match i0 with
              | Ivytype_Bool ->
                Some Ivytype_Bool
              | _ -> None)
           | None -> None)
        | _ -> None)
     | None -> None)
  | Expr_Iff (e1, e2) ->
    (match type_expr e1 var_ctx
             fun_var_ctx act_ctx
             declared_types type_sizes with
     | Some i ->
       (match i with
        | Ivytype_Bool ->
          (match type_expr e2 var_ctx
                   fun_var_ctx act_ctx
                   declared_types
                   type_sizes with
           | Some i0 ->
             (match i0 with
              | Ivytype_Bool ->
                Some Ivytype_Bool
              | _ -> None)
           | None -> None)
        | _ -> None)
     | None -> None)
  | Expr_Forall (_, t, e0) ->
    if declared_types t
    then type_expr e0 var_ctx
           fun_var_ctx act_ctx
           declared_types type_sizes
    else None
  | Expr_Exists (_, t, e0) ->
    if declared_types t
    then type_expr e0 var_ctx
           fun_var_ctx act_ctx
           declared_types type_sizes
    else None
  | Expr_Cond (e1, e2, e3) ->
    (match type_expr e1 var_ctx
             fun_var_ctx act_ctx
             declared_types type_sizes with
     | Some i ->
       (match i with
        | Ivytype_Bool ->
          (match type_expr e2 var_ctx
                   fun_var_ctx act_ctx
                   declared_types
                   type_sizes with
           | Some t2 ->
             (match type_expr e3 var_ctx
                      fun_var_ctx
                      act_ctx
                      declared_types
                      type_sizes with
              | Some t3 ->
                if eqb_Ivytype t2 t3
                then Some t2
                else None
              | None -> None)
           | None -> None)
        | _ -> None)
     | None -> None)
  | Expr_Error -> None
  | _ -> Some Ivytype_Bool

(** val check_command_helper :
    com -> context -> context ->
    action_context -> (ivytype -> bool)
    -> enumTypeSizes ->
    ((((context * context) * action_context) * (ivytype
    -> bool)) * enumTypeSizes) option **)

let rec check_command_helper p var_ctx fun_var_ctx act_ctx declared_types type_sizes =
  match p with
  | Com_Assign (x, e) ->
    let e_type =
      type_expr e var_ctx fun_var_ctx
        act_ctx declared_types type_sizes
    in
    let t = var_ctx x in
    if eqb_Ivytype
         (fromMaybe Ivytype_Void e_type)
         (fromMaybe Ivytype_Void t)
    then Some ((((var_ctx, fun_var_ctx),
           act_ctx), declared_types),
           type_sizes)
    else None
  | Com_AssignFun (f, arg_ids, e) ->
    let e_type =
      type_expr e var_ctx fun_var_ctx
        act_ctx declared_types type_sizes
    in
    let t = fun_var_ctx f in
    (match t with
     | Some i ->
       (match i with
        | Ivytype_Fun (arg_ts, ret_t) ->
          let arg_ts' =
            map (fun x ->
              fromMaybe Ivytype_Void
                (var_ctx x)) arg_ids
          in
          if list_beq eqb_Ivytype arg_ts
               arg_ts'
          then if eqb_Ivytype
                    (fromMaybe
                      Ivytype_Void
                      e_type)
                    (fromMaybe
                      Ivytype_Void (Some
                      ret_t))
               then Some ((((var_ctx,
                      fun_var_ctx),
                      act_ctx),
                      declared_types),
                      type_sizes)
               else None
          else None
        | _ -> None)
     | None -> None)
  | Com_Seq (p1, p2) ->
    (match check_command_helper p1
             var_ctx fun_var_ctx act_ctx
             declared_types type_sizes with
     | Some p0 ->
       let (p3, type_sizes') = p0 in
       let (p4, declared_types') = p3 in
       let (p5, act_ctx') = p4 in
       let (var_ctx', fun_var_ctx') = p5
       in
       check_command_helper p2 var_ctx'
         fun_var_ctx' act_ctx'
         declared_types' type_sizes'
     | None -> None)
  | Com_If (e, p') ->
    (match type_expr e var_ctx
             fun_var_ctx act_ctx
             declared_types type_sizes with
     | Some i ->
       (match i with
        | Ivytype_Bool ->
          check_command_helper p'
            var_ctx fun_var_ctx act_ctx
            declared_types type_sizes
        | _ -> None)
     | None -> None)
  | Com_IfElse (e, p1, p2) ->
    (match type_expr e var_ctx
             fun_var_ctx act_ctx
             declared_types type_sizes with
     | Some i ->
       (match i with
        | Ivytype_Bool ->
          (match check_command_helper p1
                   var_ctx fun_var_ctx
                   act_ctx
                   declared_types
                   type_sizes with
           | Some p0 ->
             let (p3, type_sizes') = p0
             in
             let (p4, declared_types') =
               p3
             in
             let (p5, act_ctx') = p4 in
             let (var_ctx', fun_var_ctx') =
               p5
             in
             check_command_helper p2
               var_ctx' fun_var_ctx'
               act_ctx' declared_types'
               type_sizes'
           | None -> None)
        | _ -> None)
     | None -> None)
  | Com_For (_, t, p') ->
    if declared_types t
    then check_command_helper p' var_ctx
           fun_var_ctx act_ctx
           declared_types type_sizes
    else None
  | Com_While (e, p') ->
    (match type_expr e var_ctx
             fun_var_ctx act_ctx
             declared_types type_sizes with
     | Some i ->
       (match i with
        | Ivytype_Bool ->
          check_command_helper p'
            var_ctx fun_var_ctx act_ctx
            declared_types type_sizes
        | _ -> None)
     | None -> None)
  | Com_LocalVarDecl (var_id, t) ->
    if declared_types t
    then let var_ctx' =
           update_context var_ctx var_id
             t
         in
         Some ((((var_ctx',
         fun_var_ctx), act_ctx),
         declared_types), type_sizes)
    else None
  | Com_GlobalVarDecl (var_id, t) ->
    if declared_types t
    then let var_ctx' =
           update_context var_ctx var_id
             t
         in
         Some ((((var_ctx',
         fun_var_ctx), act_ctx),
         declared_types), type_sizes)
    else None
  | Com_GlobalFuncVarDecl (var_id,
                           arg_names_and_ts,
                           ret_type) ->
    let arg_ts = map snd arg_names_and_ts
    in
    if declared_types ret_type
    then let arg_ts_declared =
           fold_left (fun acc t ->
             if declared_types t
             then acc
             else false) arg_ts true
         in
         if arg_ts_declared
         then let fun_var_ctx' =
                update_context
                  fun_var_ctx var_id
                  (Ivytype_Fun (arg_ts,
                  ret_type))
              in
              Some ((((var_ctx,
              fun_var_ctx'), act_ctx),
              declared_types),
              type_sizes)
         else None
    else None
  | Com_TypeDecl (t_id, n) ->
    let t = Ivytype_User_Defined t_id in
    if declared_types t
    then None
    else let declared_types' = fun t' ->
           if eqb_Ivytype t t'
           then true
           else declared_types t'
         in
         let type_sizes' = fun t' ->
           if eqb_Ivytype t t'
           then n
           else type_sizes t'
         in
         Some ((((var_ctx, fun_var_ctx),
         act_ctx), declared_types'),
         type_sizes')
  | Com_ActionDecl (act_id,
                    arg_ids_and_types,
                    ret_type, p') ->
    (match act_ctx act_id with
     | Some _ -> None
     | None ->
       if declared_types ret_type
       then let arg_ts =
              map snd arg_ids_and_types
            in
            let arg_ts_declared =
              fold_left (fun acc t ->
                if declared_types t
                then acc
                else false) arg_ts true
            in
            if arg_ts_declared
            then let act_ctx' =
                   t_update act_ctx
                     act_id (Some
                     ((arg_ids_and_types,
                     ret_type), p'))
                 in
                 (match check_command_helper
                          p' var_ctx
                          fun_var_ctx
                          act_ctx'
                          declared_types
                          type_sizes with
                  | Some p0 ->
                    let (p1, type_sizes') =
                      p0
                    in
                    let (p2,
                         declared_types') =
                      p1
                    in
                    let (p3, _) = p2 in
                    Some (((p3,
                    act_ctx'),
                    declared_types'),
                    type_sizes')
                  | None -> None)
            else None
       else None)
  | Com_Skip ->
    Some ((((var_ctx, fun_var_ctx),
      act_ctx), declared_types),
      type_sizes)

(** val check : com -> bool **)

let check p =
  match check_command_helper p empty
          empty empty (fun _ -> false)
          (fun _ -> O) with
  | Some _ -> true
  | None -> false

(** val small_step_Expr :
    expr -> context -> context ->
    action_context -> (ivytype -> bool)
    -> enumTypeSizes -> expr option **)

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
             (match small_step_Expr e0
                      var_ctx
                      fun_var_ctx
                      act_ctx
                      declared_types
                      type_sizes with
              | Some e' ->
                Some (Expr_VarFun (x,
                  (e' :: es')))
              | None ->
                (match es' with
                 | [] -> None
                 | e' :: es'' ->
                   (match small_step_Expr
                            e' var_ctx
                            fun_var_ctx
                            act_ctx
                            declared_types
                            type_sizes with
                    | Some e'' ->
                      Some (Expr_VarFun
                        (x,
                        (e0 :: (e'' :: es''))))
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
           small_step_Expr e' var_ctx
             fun_var_ctx act_ctx
             declared_types type_sizes
         in
         Some (Expr_Not
         (fromMaybe Expr_Error e''))
  | Expr_And (e1, e2) ->
    if is_value e1
    then if is_value e2
         then (match e1 with
               | Expr_True ->
                 (match e2 with
                  | Expr_True ->
                    Some Expr_True
                  | Expr_False ->
                    Some Expr_False
                  | _ -> None)
               | Expr_False ->
                 (match e2 with
                  | Expr_True ->
                    Some Expr_False
                  | Expr_False ->
                    Some Expr_False
                  | _ -> None)
               | _ -> None)
         else Some (Expr_And (e1,
                (fromMaybe Expr_Error
                  (small_step_Expr e2
                    var_ctx fun_var_ctx
                    act_ctx
                    declared_types
                    type_sizes))))
    else Some (Expr_And
           ((fromMaybe Expr_Error
              (small_step_Expr e1
                var_ctx fun_var_ctx
                act_ctx declared_types
                type_sizes)), e2))
  | Expr_Or (e1, e2) ->
    if is_value e1
    then if is_value e2
         then (match e1 with
               | Expr_True ->
                 (match e2 with
                  | Expr_True ->
                    Some Expr_True
                  | Expr_False ->
                    Some Expr_True
                  | _ -> None)
               | Expr_False ->
                 (match e2 with
                  | Expr_True ->
                    Some Expr_True
                  | Expr_False ->
                    Some Expr_False
                  | _ -> None)
               | _ -> None)
         else Some (Expr_Or (e1,
                (fromMaybe Expr_Error
                  (small_step_Expr e2
                    var_ctx fun_var_ctx
                    act_ctx
                    declared_types
                    type_sizes))))
    else Some (Expr_Or
           ((fromMaybe Expr_Error
              (small_step_Expr e1
                var_ctx fun_var_ctx
                act_ctx declared_types
                type_sizes)), e2))
  | Expr_Eq (e1, e2) ->
    if is_value e1
    then if is_value e2
         then if eqb_Expr e1 e2
              then Some Expr_True
              else Some Expr_False
         else Some (Expr_Eq (e1,
                (fromMaybe Expr_Error
                  (small_step_Expr e2
                    var_ctx fun_var_ctx
                    act_ctx
                    declared_types
                    type_sizes))))
    else Some (Expr_Eq
           ((fromMaybe Expr_Error
              (small_step_Expr e1
                var_ctx fun_var_ctx
                act_ctx declared_types
                type_sizes)), e2))
  | Expr_Implies (e1, e2) ->
    if is_value e1
    then if is_value e2
         then (match e1 with
               | Expr_True ->
                 (match e2 with
                  | Expr_True ->
                    Some Expr_True
                  | Expr_False ->
                    Some Expr_False
                  | _ -> None)
               | Expr_False ->
                 (match e2 with
                  | Expr_True ->
                    Some Expr_True
                  | Expr_False ->
                    Some Expr_True
                  | _ -> None)
               | _ -> None)
         else Some (Expr_Implies (e1,
                (fromMaybe Expr_Error
                  (small_step_Expr e2
                    var_ctx fun_var_ctx
                    act_ctx
                    declared_types
                    type_sizes))))
    else Some (Expr_Implies
           ((fromMaybe Expr_Error
              (small_step_Expr e1
                var_ctx fun_var_ctx
                act_ctx declared_types
                type_sizes)), e2))
  | Expr_Iff (e1, e2) ->
    if is_value e1
    then if is_value e2
         then if eqb_Expr e1 e2
              then Some Expr_True
              else Some Expr_False
         else Some (Expr_Iff (e1,
                (fromMaybe Expr_Error
                  (small_step_Expr e2
                    var_ctx fun_var_ctx
                    act_ctx
                    declared_types
                    type_sizes))))
    else Some (Expr_Iff
           ((fromMaybe Expr_Error
              (small_step_Expr e1
                var_ctx fun_var_ctx
                act_ctx declared_types
                type_sizes)), e2))
  | Expr_Forall (x, t, e') ->
    let nums = seq O (type_sizes t) in
    let out =
      fold_left (fun acc y -> Expr_And
        (acc,
        (subst e' (Expr_EnumVarLiteral
          (t, y)) x))) nums Expr_True
    in
    Some out
  | Expr_Exists (x, t, e') ->
    let out =
      fold_left (fun acc y -> Expr_Or
        (acc,
        (subst e' (Expr_EnumVarLiteral
          (t, y)) x)))
        (seq O (type_sizes t)) Expr_False
    in
    Some out
  | Expr_Cond (e1, e2, e3) ->
    if is_value e1
    then (match e1 with
          | Expr_True -> Some e2
          | Expr_False -> Some e3
          | _ -> None)
    else Some (Expr_Cond
           ((fromMaybe Expr_Error
              (small_step_Expr e1
                var_ctx fun_var_ctx
                act_ctx declared_types
                type_sizes)), e2, e3))
  | _ -> None
