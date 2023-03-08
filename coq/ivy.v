(* Ivy Interpreter and Typechecker *)
Require Import Coq.Lists.List Coq.Bool.Bool.
Import Coq.Lists.List.ListNotations.
Require Import String.
Open Scope string_scope.
Load defs.

(* Get the type of an expression *)
Fixpoint type_expr 
(e : Expr) (var_ctx fun_var_ctx : context) 
(act_ctx : action_context) 
(declared_types : Ivytype -> bool) (type_sizes : EnumTypeSizes) {struct e} : option Ivytype := 
  match e with
  | Expr_VarLiteral x => var_ctx x
  | Expr_EnumVarLiteral t n => Some t
  | Expr_VarFun x es => 
    match fun_var_ctx x with
    | Some (Ivytype_Fun decl_arg_ts ret_t) =>
      let arg_ts := map (fun e => fromMaybe Ivytype_Void (type_expr e var_ctx fun_var_ctx act_ctx declared_types type_sizes)) es in
      if (list_beq Ivytype eqb_Ivytype arg_ts decl_arg_ts) then Some ret_t else None
    | _ => None
    end
  (* | Expr_ActionApplication x es =>
    match act_ctx x with
      | Some (_, Ivytype_Fun t1 t2, _) => 
        let arg_ts := map (fun e => fromMaybe Ivytype_Void (type_expr e var_ctx fun_var_ctx act_ctx declared_types type_sizes)) es in
        if (list_beq Ivytype eqb_Ivytype arg_ts t1) then Some t2 else None
      | _ => None
      end *)
  | Expr_True => Some Ivytype_Bool
  | Expr_False => Some Ivytype_Bool
  | Expr_Not e => 
    match type_expr e var_ctx fun_var_ctx act_ctx declared_types type_sizes with
    | Some Ivytype_Bool => Some Ivytype_Bool
    | _ => None
    end
  | Expr_And e1 e2 =>
    match type_expr e1 var_ctx fun_var_ctx act_ctx declared_types type_sizes with
    | Some Ivytype_Bool => 
    match type_expr e2 var_ctx fun_var_ctx act_ctx declared_types type_sizes with
    | Some Ivytype_Bool => Some Ivytype_Bool
    | _ => None
    end
    | _ => None
    end
  | Expr_Or e1 e2 =>
    match type_expr e1 var_ctx fun_var_ctx act_ctx declared_types type_sizes with
    | Some Ivytype_Bool => 
    match type_expr e2 var_ctx fun_var_ctx act_ctx declared_types type_sizes with
    | Some Ivytype_Bool => Some Ivytype_Bool
    | _ => None
    end
    | _ => None
    end
  | Expr_Eq e1 e2 =>
    match type_expr e1 var_ctx fun_var_ctx act_ctx declared_types type_sizes with
    | Some t1 => 
    match type_expr e2 var_ctx fun_var_ctx act_ctx declared_types type_sizes with
    | Some t2 => 
    if (eqb_Ivytype t1 t2) then Some Ivytype_Bool else None
    | _ => None
    end
    | _ => None
    end
  | Expr_Implies e1 e2 =>
    match type_expr e1 var_ctx fun_var_ctx act_ctx declared_types type_sizes with
    | Some Ivytype_Bool => 
    match type_expr e2 var_ctx fun_var_ctx act_ctx declared_types type_sizes with
    | Some Ivytype_Bool => Some Ivytype_Bool
    | _ => None
    end
    | _ => None
    end
  | Expr_Iff e1 e2 =>
    match type_expr e1 var_ctx fun_var_ctx act_ctx declared_types type_sizes with
    | Some Ivytype_Bool => 
    match type_expr e2 var_ctx fun_var_ctx act_ctx declared_types type_sizes with
    | Some Ivytype_Bool => Some Ivytype_Bool
    | _ => None
    end
    | _ => None
    end
  | Expr_Forall x t e =>
    match declared_types t with
    | true => type_expr e var_ctx fun_var_ctx act_ctx declared_types type_sizes
    | false => None
    end
  | Expr_Exists x t e =>
    match declared_types t with
    | true => type_expr e var_ctx fun_var_ctx act_ctx declared_types type_sizes
    | false => None
    end
  | Expr_Nondet t => 
    match declared_types t with
    | true => Some t
    | false => None
    end
  | Expr_Cond e1 e2 e3 =>
    match type_expr e1 var_ctx fun_var_ctx act_ctx declared_types type_sizes with
    | Some Ivytype_Bool => 
      match type_expr e2 var_ctx fun_var_ctx act_ctx declared_types type_sizes with
      | Some t2 => 
        match type_expr e3 var_ctx fun_var_ctx act_ctx declared_types type_sizes with
        | Some t3 => 
          if (eqb_Ivytype t2 t3) then Some t2 else None
        | _ => None
        end
      | _ => None
      end
    | _ => None
    end
  | Expr_Error => None
  end.

(* Recursively check that a command is well-formed *)
Fixpoint check_command_helper (p : Com) 
(var_ctx fun_var_ctx : context) 
(act_ctx : action_context) 
(declared_types: Ivytype -> bool) 
(type_sizes : EnumTypeSizes) {struct p} : 
option (context * context * action_context * (Ivytype -> bool) * EnumTypeSizes) :=
  match p with
  | Com_Assign x e => 
    let e_type := type_expr e var_ctx fun_var_ctx act_ctx declared_types type_sizes in
    let t := var_ctx x in
      if (eqb_Ivytype (fromMaybe Ivytype_Void e_type) (fromMaybe Ivytype_Void t)) 
      then Some (var_ctx, fun_var_ctx, act_ctx, declared_types, type_sizes) 
      else None
  | Com_AssignFun f arg_ids e =>
    let e_type := type_expr e var_ctx fun_var_ctx act_ctx declared_types type_sizes in
    let t := fun_var_ctx f in
      match t with
      | Some (Ivytype_Fun arg_ts ret_t) =>
        let arg_ts' := map (fun x => fromMaybe Ivytype_Void (var_ctx x)) arg_ids in
        if (list_beq Ivytype eqb_Ivytype arg_ts arg_ts') 
        then if (eqb_Ivytype (fromMaybe Ivytype_Void e_type) (fromMaybe Ivytype_Void (Some ret_t))) 
            then Some (var_ctx, fun_var_ctx, act_ctx, declared_types, type_sizes) 
            else None
        else None
      | _ => None
      end
  | Com_Seq p1 p2 =>
    match check_command_helper p1 var_ctx fun_var_ctx act_ctx declared_types type_sizes with
    | Some (var_ctx', fun_var_ctx', act_ctx', declared_types', type_sizes') => 
      check_command_helper p2 var_ctx' fun_var_ctx' act_ctx' declared_types' type_sizes'
    | None => None
    end
  | Com_If e p' =>
    match type_expr e var_ctx fun_var_ctx act_ctx declared_types type_sizes with
    | Some Ivytype_Bool => 
      check_command_helper p' var_ctx fun_var_ctx act_ctx declared_types type_sizes
    | _ => None
    end
  | Com_IfElse e p1 p2 => 
    match type_expr e var_ctx fun_var_ctx act_ctx declared_types type_sizes with
    | Some Ivytype_Bool => 
      match check_command_helper p1 var_ctx fun_var_ctx act_ctx declared_types type_sizes with
      | Some (var_ctx', fun_var_ctx', act_ctx', declared_types', type_sizes') => 
        check_command_helper p2 var_ctx' fun_var_ctx' act_ctx' declared_types' type_sizes'
      | None => None
      end
    | _ => None
    end
  | Com_For x t p' =>
  (* TODO this is bad, I really just want a set of types rather than this partial map of strings to types *)
    match declared_types t with
    | true => 
      check_command_helper p' var_ctx fun_var_ctx act_ctx declared_types type_sizes
    | false => None
    end
  | Com_While e p' =>
    match type_expr e var_ctx fun_var_ctx act_ctx declared_types type_sizes with
    | Some Ivytype_Bool => 
      check_command_helper p' var_ctx fun_var_ctx act_ctx declared_types type_sizes
    | _ => None
    end
  (* | Com_Call f arg_ids =>
    let t := fun_var_ctx f in
      match t with
      | Some (Ivytype_Fun arg_ts ret_t) =>
        let arg_ts' := map (fun x => fromMaybe Ivytype_Void (var_ctx x)) arg_ids in
        if (list_beq Ivytype eqb_Ivytype arg_ts arg_ts') 
        then Some (var_ctx, fun_var_ctx, act_ctx, declared_types, type_sizes) 
        else None
      | _ => None
      end *)
  | Com_LocalVarDecl var_id t =>
    match declared_types t with
    | true => 
      let var_ctx' := update_context var_ctx var_id t in
      Some (var_ctx', fun_var_ctx, act_ctx, declared_types, type_sizes)
    | false => None
    end
  | Com_GlobalVarDecl var_id t =>
    match declared_types t with
    | true => 
      let var_ctx' := update_context var_ctx var_id t in
      Some (var_ctx', fun_var_ctx, act_ctx, declared_types, type_sizes)
    | false => None
    end
  | Com_GlobalFuncVarDecl var_id arg_ts ret_type =>
    match declared_types ret_type with
    | true =>
      (* check that each of arg_ts is declared *)
      let arg_ts_declared := 
        fold_left (fun acc t => 
          match declared_types t with
          | true => acc
          | false => false
          end) arg_ts true in
      if arg_ts_declared then 
        let fun_var_ctx' := update_context fun_var_ctx var_id (Ivytype_Fun arg_ts ret_type) in
        Some (var_ctx, fun_var_ctx', act_ctx, declared_types, type_sizes)
      else None
    | false => None
    end
  | Com_TypeDecl t_id n =>
    let t := Ivytype_User_Defined t_id in
    match declared_types t with
    | true => None
    | false => 
      let declared_types' := (fun t' => if eqb_Ivytype t t' then true else declared_types t') in
      let type_sizes' := (fun t' => if eqb_Ivytype t t' then n else type_sizes t') in
      Some (var_ctx, fun_var_ctx, act_ctx, declared_types', type_sizes')
    end
  | Com_ActionDecl act_id arg_ids_and_types ret_type p' =>
    match act_ctx act_id with
    | Some _ => None
    | None =>
      match declared_types ret_type with
      | true =>
        let arg_ts := map snd arg_ids_and_types in
        let arg_ts_declared := 
          fold_left (fun acc t => 
            match declared_types t with
            | true => acc
            | false => false
            end) arg_ts true in
        if arg_ts_declared then 
          let act_ctx' := t_update act_ctx act_id (Some (arg_ids_and_types, ret_type, p')) in
          match check_command_helper p' var_ctx fun_var_ctx act_ctx' declared_types type_sizes with
          | Some (var_ctx', fun_var_ctx', act_ctx'', declared_types', type_sizes') => 
            Some (var_ctx', fun_var_ctx', act_ctx', declared_types', type_sizes')
          | None => None
          end
        else None
      | false => None
      end
    end
  | Com_Skip => Some (var_ctx, fun_var_ctx, act_ctx, declared_types, type_sizes)
end.


(* Check that a command is well-formed. 

Note, the parameters to check_command_helper are defaults values for contexts, etc
In addition to well-formedness, we also gather declaration information and populate 
these contexts by treating declarations as commands.
*)
Definition check (p : Com) : bool :=
  match check_command_helper p empty empty empty (fun _ => false) (fun _ => 0) with
  | Some _ => true
  | None => false
  end.

(* (* Want to show that a command is well-formed (i.e. check = true) implies
 that all of the expression that show up in the command are well-typed (type to 
 Some Ivytype) *)
Theorem check_command_helper_correct : forall p var_ctx fun_var_ctx act_ctx declared_types type_sizes, 
check p = true -> 
check_command_helper p var_ctx fun_var_ctx act_ctx declared_types type_sizes = 
  Some (var_ctx, fun_var_ctx, act_ctx, declared_types, type_sizes).
Proof.
Admitted. *)
  (* intros.
  induction p; simpl in *; try (inversion H; subst; reflexivity). *)

(* TODO : small steps and type preservation/progress *)


Require Import Coq.ZArith.ZArith.
Require Import Coq.Lists.Streams.
CoFixpoint rand (seed n1 n2 : Z) : Stream Z :=
let seed' := Zmod seed n2 in Cons seed' (rand (seed' * n1) n1 n2).

(* TODO: fix this. Need to actually read from further up the stream;
however, for now this makes everyting typecheck 

May also need nondet for function types

It would be ideal if this could be treated like an unintepreted function. I think
this can be achieved by taking a map f : 1 \to <The Ivytype Type>
*)
Definition Nondet_helper (t : Ivytype) (type_sizes : EnumTypeSizes) : option Expr
:= match t with
  | Ivytype_Bool => if Z.eqb (hd (rand 0 2 3)) 0 then Some (Expr_True) else Some (Expr_False)
  | Ivytype_User_Defined t_id => Some (Expr_EnumVarLiteral t (Z.to_nat (hd (rand 0 2 (Z.of_nat (type_sizes t) + 1)))))
  | Ivytype_Fun _ _ => None
  | Ivytype_Void => None
  end.


Fixpoint small_step_Expr 
(e : Expr)
(var_ctx fun_var_ctx : context)
(act_ctx : action_context)
(declared_types : Ivytype -> bool)
(type_sizes : EnumTypeSizes)
: option Expr :=
  match e with
  | Expr_VarLiteral _ => None
  | Expr_EnumVarLiteral _ _ => None
  | Expr_VarFun x es => 
    match fun_var_ctx x with
    | Some (Ivytype_Fun arg_ts ret_type) =>
      match es with
      | [] => None
      | e :: es' => 
        match small_step_Expr e var_ctx fun_var_ctx act_ctx declared_types type_sizes with
        | Some e' => Some (Expr_VarFun x (e' :: es'))
        | None => 
          match es' with
          | [] => None
          | e' :: es'' => 
            match small_step_Expr e' var_ctx fun_var_ctx act_ctx declared_types type_sizes with
            | Some e'' => Some (Expr_VarFun x (e :: e'' :: es''))
            | None => None
            end
          end
        end
      end
    | _ => None
    end
  (* | Expr_ActionApplication *)
  | Expr_True => None
  | Expr_False => None
  | Expr_Not e' => if is_value e' then
                    match e' with
                    | Expr_True => Some Expr_False
                    | Expr_False => Some Expr_True
                    | _ => None
                    end
                  else 
                  let e'' := small_step_Expr e' var_ctx fun_var_ctx act_ctx declared_types type_sizes in
                  Some (Expr_Not (fromMaybe Expr_Error e''))
  | Expr_And e1 e2 => if is_value e1 then 
                        if is_value e2 then 
                          match e1, e2 with
                          | Expr_True, Expr_True => Some Expr_True
                          | Expr_True, Expr_False => Some Expr_False
                          | Expr_False, Expr_True => Some Expr_False
                          | Expr_False, Expr_False => Some Expr_False
                          | _, _ => None
                          end
                        else Some (Expr_And e1 (fromMaybe Expr_Error (small_step_Expr e2 var_ctx fun_var_ctx act_ctx declared_types type_sizes)))
                      else Some (Expr_And (fromMaybe Expr_Error (small_step_Expr e1 var_ctx fun_var_ctx act_ctx declared_types type_sizes)) e2)
  | Expr_Or e1 e2 => if is_value e1 then 
                        if is_value e2 then 
                          match e1, e2 with
                          | Expr_True, Expr_True => Some Expr_True
                          | Expr_True, Expr_False => Some Expr_True
                          | Expr_False, Expr_True => Some Expr_True
                          | Expr_False, Expr_False => Some Expr_False
                          | _, _ => None
                          end
                        else Some (Expr_Or e1 (fromMaybe Expr_Error (small_step_Expr e2 var_ctx fun_var_ctx act_ctx declared_types type_sizes)))
                      else Some (Expr_Or (fromMaybe Expr_Error (small_step_Expr e1 var_ctx fun_var_ctx act_ctx declared_types type_sizes)) e2)
  | Expr_Eq e1 e2 => if is_value e1 then
                      if is_value e2 then 
                        if eqb_Expr e1 e2 then Some Expr_True else Some Expr_False
                      else Some (Expr_Eq e1 (fromMaybe Expr_Error (small_step_Expr e2 var_ctx fun_var_ctx act_ctx declared_types type_sizes)))
                    else Some (Expr_Eq (fromMaybe Expr_Error (small_step_Expr e1 var_ctx fun_var_ctx act_ctx declared_types type_sizes)) e2)
  | Expr_Implies e1 e2 => if is_value e1 then
                            if is_value e2 then 
                              match e1, e2 with
                              | Expr_True, Expr_True => Some Expr_True
                              | Expr_True, Expr_False => Some Expr_False
                              | Expr_False, Expr_True => Some Expr_True
                              | Expr_False, Expr_False => Some Expr_True
                              | _, _ => None
                              end
                            else Some (Expr_Implies e1 (fromMaybe Expr_Error (small_step_Expr e2 var_ctx fun_var_ctx act_ctx declared_types type_sizes)))
                          else Some (Expr_Implies (fromMaybe Expr_Error (small_step_Expr e1 var_ctx fun_var_ctx act_ctx declared_types type_sizes)) e2)
  | Expr_Iff e1 e2 => if is_value e1 then
                        if is_value e2 then 
                          if eqb_Expr e1 e2 then Some Expr_True else Some Expr_False
                        else Some (Expr_Iff e1 (fromMaybe Expr_Error (small_step_Expr e2 var_ctx fun_var_ctx act_ctx declared_types type_sizes)))
                      else Some (Expr_Iff (fromMaybe Expr_Error (small_step_Expr e1 var_ctx fun_var_ctx act_ctx declared_types type_sizes)) e2)
  (* TODO refacotr the string encoding of the enumerated types *)
  | Expr_Forall x t e' =>
      let nums := seq 0 (type_sizes t) in
      let out := fold_left (fun acc y => Expr_And acc (subst e' (Expr_EnumVarLiteral t y) x) ) nums Expr_True in
      Some out
  | Expr_Exists x t e' =>
    let out := fold_left (fun acc y => Expr_Or acc (subst e' (Expr_EnumVarLiteral t y) x)) (seq 0 (type_sizes t)) (Expr_False) in
    Some out
  | Expr_Nondet t => Nondet_helper t type_sizes
  (* TODO the conditional should call all actions --- and thus perform side effects --- regardless of the 
  truth value of e1 *)
  | Expr_Cond e1 e2 e3 =>
    if is_value e1 then
      match e1 with
      | Expr_True => Some e2
      | Expr_False => Some e3
      | _ => None
      end
    else Some (Expr_Cond (fromMaybe Expr_Error (small_step_Expr e1 var_ctx fun_var_ctx act_ctx declared_types type_sizes)) e2 e3)
  | Expr_Error => None
end.

Require Import ExtrOcamlBasic.
Require Import ExtrOcamlString.
(* Extraction "../ocaml/generated/extract.ml" small_step_Expr. *)

(* Theorem preservation_Expr :
  forall e e' t var_ctx fun_var_ctx act_ctx declared_types type_sizes,
    type_expr e var_ctx fun_var_ctx act_ctx declared_types type_sizes = Some t ->
    small_step_Expr e var_ctx fun_var_ctx act_ctx declared_types type_sizes = Some e' ->
    type_expr e' var_ctx fun_var_ctx act_ctx declared_types type_sizes = Some t.
Proof.
  Admitted. *)
  (* induction e; intros.
  -   (* Expr_VarLiteral *) simpl in H0. inversion H0.
  -   (* Expr_VarFun *)  
  (* Expr_ActionApplication *)
  (* - *)
  (* Expr_True *)
  - simpl in Hss. inversion Hss.
  (* Expr_False *)
  - simpl in Hss. inversion Hss.
  (* Expr_Not *)
  - destruct e.
    + simpl in Hss. inversion Hss.
    + simpl in Hss. inversion Hss.
  (* Expr_And *)
  -
  (* Expr_Or *)
  -
  (* Expr_Eq *)
  -
  (* Expr_Implies *)
  -
  (* Expr_Iff *)
  -
  (* Expr_Forall *)
  -
  (* Expr_Exists *)
  -
  (* Expr_Nondet *)
  -
  (* Expr_Cond *)
  -
  (* Expr_Error *)
  -

  
  TODO : refactor enumerated constants to be parametrized by nats or sum types *)