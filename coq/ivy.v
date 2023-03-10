(* Ivy Interpreter and Typechecker *)
Require Import Coq.Lists.List Coq.Bool.Bool.
Import Coq.Lists.List.ListNotations.
Require Import String.
Require Import Coq.Arith.PeanoNat.
Open Scope string_scope.
Load defs.

(* Get the type of an expression *)
Fixpoint type_expr (e : Expr) (Gamma : context) {struct e} : option Ivytype := 
  match e with
  | Expr_VarLiteral x => lookup_variable Gamma x
  | Expr_EnumVarLiteral t n => 
    match t with 
    | Ivytype_UserDefined x l =>  
      match lookup_type Gamma x with 
      | Some m => if andb (Nat.ltb m n) (beq_nat l m) then Some t else None
      | None => None
      end
    | _ => None
    end
  (* | Expr_FunctionSymbol x es => 
    match lookup_variable Gamma x with
    | Some (Ivytype_Function ts ret_t) => 
      let calculated_type_options := map (fun e => type_expr e Gamma) es in
      if (list_beq (option Ivytype) (eqb_OptionIvytype) (map Some ts) calculated_type_options) 
      then Some ret_t
      else None
    | _ => None
    end *)
  | Expr_True => Some Ivytype_Bool
  | Expr_False => Some Ivytype_Bool
  | Expr_Not e' => 
    match type_expr e' Gamma with
    | Some Ivytype_Bool => Some Ivytype_Bool
    | _ => None
    end
  | Expr_And e1 e2 =>
    match type_expr e1 Gamma with
    | Some Ivytype_Bool => 
      match type_expr e2 Gamma with
        | Some Ivytype_Bool => Some Ivytype_Bool
        | _ => None
      end
    | _ => None
    end
  | Expr_Or e1 e2 =>
    match type_expr e1 Gamma with
    | Some Ivytype_Bool => 
      match type_expr e2 Gamma with
        | Some Ivytype_Bool => Some Ivytype_Bool
        | _ => None
      end
    | _ => None
    end
  | Expr_Eq e1 e2 =>
    match type_expr e1 Gamma with
    | Some t1 => 
      match type_expr e2 Gamma with
        | Some t2 => if (eqb_Ivytype t1 t2) then Some Ivytype_Bool else None
        | _ => None
      end
    | _ => None
    end
  | Expr_Implies e1 e2 =>
    match type_expr e1 Gamma with
    | Some Ivytype_Bool => 
      match type_expr e2 Gamma with
      | Some Ivytype_Bool => Some Ivytype_Bool
      | _ => None
      end
      | _ => None
    end
  | Expr_Iff e1 e2 =>
    match type_expr e1 Gamma with
    | Some Ivytype_Bool => 
      match type_expr e2 Gamma with
      | Some Ivytype_Bool => Some Ivytype_Bool
      | _ => None
      end
      | _ => None
    end
  | Expr_Forall x t e' =>
    match t with
    | Ivytype_UserDefined x n =>
      match lookup_type Gamma x  with
      | Some _ => 
        match type_expr e' Gamma with
        | Some Ivytype_Bool => Some Ivytype_Bool
        | _ => None
        end
      | _ => None
      end
    | Ivytype_Bool => 
      match type_expr e' Gamma with
      | Some Ivytype_Bool => Some Ivytype_Bool
      | _ => None
      end
    | _ => None
    end
  | Expr_Exists x t e' =>
    match t with
    | Ivytype_UserDefined x n =>
      match lookup_type Gamma x  with
      | Some _ => 
        match type_expr e' Gamma with
        | Some Ivytype_Bool => Some Ivytype_Bool
        | _ => None
        end
      | _ => None
      end
    | Ivytype_Bool => 
      match type_expr e' Gamma with
      | Some Ivytype_Bool => Some Ivytype_Bool
      | _ => None
      end
    | _ => None
    end
  (* | Expr_Nondet t => 
    match declared_types t with
    | true => Some t
    | false => None
    end *)
  | Expr_Cond e1 e2 e3 =>
    match type_expr e2 Gamma with
    | Some Ivytype_Bool => 
      match type_expr e1 Gamma with
      | Some t2 => 
        match type_expr e3 Gamma with
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
Fixpoint check_command_helper (p : Com) (Gamma : context) {struct p} : 
option context :=
  match p with
  | Com_Assign x e => 
    let e_type := type_expr e Gamma in
    let t := lookup_variable Gamma x in
      if (eqb_OptionIvytype (e_type) (t)) 
      then Some Gamma 
      else None
  (* | Com_AssignFun f arg_ids e =>
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
      end *)
  | Com_Seq p1 p2 =>
    match check_command_helper p1 Gamma with
    | Some Gamma' => check_command_helper p2 Gamma'
    | None => None
    end
  | Com_If e p' =>
    match type_expr e Gamma with
    | Some Ivytype_Bool => check_command_helper p' Gamma
    | _ => None
    end
  | Com_IfElse e p1 p2 => 
    match type_expr e Gamma with
    | Some Ivytype_Bool => 
      match check_command_helper p1 Gamma with
      | Some Gamma' => check_command_helper p2 Gamma'
      | None => None
      end
    | _ => None
    end
  | Com_For x t p' =>
    match t with
    | Ivytype_Bool => 
      match check_command_helper p' (update_variable_context Gamma x Ivytype_Bool) with
      | Some Gamma' => Some Gamma'
      | None => None
      end
    | Ivytype_UserDefined x n =>
      match lookup_type Gamma x  with
      | Some _ =>
        match check_command_helper p' (update_variable_context Gamma x t) with
        | Some Gamma' => Some Gamma'
        | None => None
        end
      | _ => None
      end
    | _ => None
    end
  | Com_While e p' =>
    match type_expr e Gamma with
    | Some Ivytype_Bool => check_command_helper p' Gamma
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
    if (eqb_OptionIvytype (lookup_variable Gamma var_id) None) then
    match t with
    (* Check that type is declared *)
    | Ivytype_UserDefined x n =>
      match lookup_type Gamma x  with
      | Some _ => Some (update_variable_context Gamma var_id t)
      | _ => None
      end
    | Ivytype_Bool => Some (update_variable_context Gamma var_id t)
    | _ => None
    end
    else None
  | Com_GlobalVarDecl var_id t => 
    if (eqb_OptionIvytype (lookup_variable Gamma var_id) None) then
      match t with
      (* Check that type is declared *)
      | Ivytype_UserDefined x n =>
        match lookup_type Gamma x  with
        | Some _ => Some (update_variable_context Gamma var_id t)
        | _ => None
        end
      | Ivytype_Bool => Some (update_variable_context Gamma var_id t)
      | _ => None
      end
      else None
  (* | Com_GlobalFuncVarDecl var_id arg_names_and_ts ret_type =>
    let arg_ts := map snd arg_names_and_ts in
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
    end *)
  | Com_TypeDecl t_id n =>
    match lookup_type Gamma t_id with
    | Some _ => None
    | None => Some (update_type_context Gamma t_id n)
    end
  | Com_ActionDecl act_id arg_ids_and_types ret_type p' =>
    match lookup_action Gamma act_id with
    | Some _ => None
    | None =>
      (* Check that return type exists *)
      match ret_type with
      | Ivytype_Bool => 
        let arg_ts := map snd arg_ids_and_types in
        (* Check that the type of each argument exists *)
        let arg_ts_declared := 
          fold_left (fun acc t => 
            match t with 
            | Ivytype_Bool => acc
            | Ivytype_UserDefined x n =>
              match lookup_type Gamma x with
              | Some _ => acc
              | None => false
              end
            | _ => false
            end) arg_ts true in
        if arg_ts_declared then 
          (* TODO: updating the action context here allows us to do action recursion, which seems bad *)
          match check_command_helper p' (update_action_context Gamma act_id arg_ids_and_types ret_type p') with
          | Some Gamma' => Some Gamma'
          | None => None
          end
        else None
      | Ivytype_UserDefined x n =>
        match lookup_type Gamma x  with
        | Some _ =>
          let arg_ts := map snd arg_ids_and_types in
          (* Check that the type of each argument exists *)
          let arg_ts_declared := 
            fold_left (fun acc t => 
              match t with 
              | Ivytype_Bool => acc
              | Ivytype_UserDefined x n =>
                match lookup_type Gamma x with
                | Some _ => acc
                | None => false
                end
              | _ => false
              end) arg_ts true in
            if arg_ts_declared then 
              match check_command_helper p' (update_action_context Gamma act_id arg_ids_and_types ret_type p') with
              | Some Gamma' => Some Gamma'
              | None => None
              end
            else None
        | _ => None
        end
      | _ => None
      end
    end
  | Com_Skip => Some Gamma
end.

(* Check that a command is well-formed. 

Note, the parameters to check_command_helper are defaults values for contexts, etc
In addition to well-formedness, we also gather declaration information and populate 
these contexts by treating declarations as commands.
*)
Definition check (p : Com) : option context := check_command_helper p empty_context.

Fixpoint small_step_Expr 
(e : Expr) (Gamma : context) (s : state) : option Expr :=
  match e with
  | Expr_VarLiteral _ => s e
  | Expr_EnumVarLiteral _ _ => None
  (* | Expr_FunctionSymbol x es => 
    let args_are_values := fold_left (fun acc e' => acc && is_value e') es true in
    if args_are_values then (s (lookup_variable x )) *)
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
                  match small_step_Expr e' Gamma s with
                  | Some e'' => Some (Expr_Not e'')
                  | None => None
                  end
  | Expr_And e1 e2 => if is_value e1 then 
                        if is_value e2 then 
                          match e1, e2 with
                          | Expr_True, Expr_True => Some Expr_True
                          | Expr_True, Expr_False => Some Expr_False
                          | Expr_False, Expr_True => Some Expr_False
                          | Expr_False, Expr_False => Some Expr_False
                          | _, _ => None
                          end
                        else
                          match small_step_Expr e2 Gamma s with
                          | Some e'' => Some (Expr_And e1 e'')
                          | None => None
                          end
                      else
                        match small_step_Expr e1 Gamma s with
                        | Some e'' => Some (Expr_And e'' e2)
                        | None => None
                        end
  | Expr_Or e1 e2 => if is_value e1 then 
                        if is_value e2 then 
                          match e1, e2 with
                          | Expr_True, Expr_True => Some Expr_True
                          | Expr_True, Expr_False => Some Expr_True
                          | Expr_False, Expr_True => Some Expr_True
                          | Expr_False, Expr_False => Some Expr_False
                          | _, _ => None
                          end
                        else
                          match small_step_Expr e2 Gamma s with
                          | Some e'' => Some (Expr_Or e1 e'')
                          | None => None
                          end
                      else
                        match small_step_Expr e1 Gamma s with
                        | Some e'' => Some (Expr_Or e'' e2)
                        | None => None
                        end
  | Expr_Eq e1 e2 => if is_value e1 then
                      if is_value e2 then 
                        if eqb_value e1 e2 then Some Expr_True else Some Expr_False
                        else
                        match small_step_Expr e2 Gamma s with
                        | Some e'' => Some (Expr_Eq e1 e'')
                        | None => None
                        end
                    else
                      match small_step_Expr e1 Gamma s with
                      | Some e'' => Some (Expr_Eq e'' e2)
                      | None => None
                      end
  | Expr_Implies e1 e2 => if is_value e1 then
                            if is_value e2 then 
                              match e1, e2 with
                              | Expr_True, Expr_True => Some Expr_True
                              | Expr_True, Expr_False => Some Expr_False
                              | Expr_False, Expr_True => Some Expr_True
                              | Expr_False, Expr_False => Some Expr_True
                              | _, _ => None
                              end
                              else
                              match small_step_Expr e2 Gamma s with
                              | Some e'' => Some (Expr_Implies e1 e'')
                              | None => None
                              end
                          else
                            match small_step_Expr e1 Gamma s with
                            | Some e'' => Some (Expr_Implies e'' e2)
                            | None => None
                            end
  | Expr_Iff e1 e2 => if is_value e1 then
                        if is_value e2 then 
                          if eqb_value e1 e2 then Some Expr_True else Some Expr_False
                          else
                          match small_step_Expr e2 Gamma s with
                          | Some e'' => Some (Expr_Iff e1 e'')
                          | None => None
                          end
                      else
                        match small_step_Expr e1 Gamma s with
                        | Some e'' => Some (Expr_Iff e'' e2)
                        | None => None
                        end
  | Expr_Forall x t e' =>
      match t with
      | Ivytype_Bool => Some (fold_left (fun acc y => Expr_And acc (subst e' y x)) [Expr_True;Expr_False] Expr_True)
      | Ivytype_UserDefined x n => 
        let nums := seq 0 (n) in
        let out := fold_left (fun acc y => Expr_And acc (subst e' (Expr_EnumVarLiteral t y) x) ) nums Expr_True in
        Some out
      | _ => None
      end
  | Expr_Exists x t e' =>
    match t with
    | Ivytype_Bool => Some (fold_left (fun acc y => Expr_Or acc (subst e' y x)) [Expr_True;Expr_False] Expr_False)
    | Ivytype_UserDefined x n => 
      let nums := seq 0 (n) in
      let out := fold_left (fun acc y => Expr_Or acc (subst e' (Expr_EnumVarLiteral t y) x) ) nums Expr_False in
      Some out
    | _ => None
    end
  (* | Expr_Nondet t => Nondet_helper t type_sizes *)
  | Expr_Cond e1 e2 e3 =>
    if negb(is_value e2) then
      match small_step_Expr e2 Gamma s with
      | Some e'' => Some (Expr_Cond e1 e'' e3)
      | None => None
      end
    else if negb(is_value e3) then
      match small_step_Expr e3 Gamma s with
      | Some e'' => Some (Expr_Cond e1 e2 e'')
      | None => None
      end
    else
    if is_value e1 then
      match e1 with
      | Expr_True => Some e2
      | Expr_False => Some e3
      | _ => None
      end
    else
      match small_step_Expr e1 Gamma s with
      | Some e'' => Some (Expr_Cond e'' e2 e3)
      | None => None
      end
  | Expr_Error => None
end.

Fixpoint small_step_Com
  (p : Com) (Gamma : context) (s : state) : option (Com * state) :=
  match p with
  | Com_Assign x e => 
    if is_value e then Some (Com_Skip, update_state s (Expr_VarLiteral x) e) else
      match small_step_Expr e Gamma s with
      | Some e' => Some (Com_Assign x e', s)
      | None => None
      end
  (* | Com_AssignFun x args e => if is_value e then Some (Com_Skip, var_store, update fun_var_store x args e) else
                                match small_step_Expr e var_store fun_var_store act_ctx declared_types type_sizes with
                                | Some e' => Some (Com_AssignFun x args e', var_store, fun_var_store)
                                | None => None
                                end *)
  | Com_Seq p1 p2 => match small_step_Com p1 Gamma s with
                    | Some (p1', s') =>
                      match p1' with
                      | Com_Skip => Some (p2, s')
                      | _ => Some (Com_Seq p1' p2, s')
                      end
                    | None => None
                    end
  | Com_If e c => if is_value e then
                    match e with
                    | Expr_True => Some (c, s)
                    | Expr_False => Some (Com_Skip, s)
                    | _ => None
                    end
                  else match small_step_Expr e Gamma s with
                      | Some e' => Some (Com_If e' c, s)
                      | None => None
                      end
  | Com_IfElse e c c' => if is_value e then
                      match e with
                      | Expr_True => Some (c, s)
                      | Expr_False => Some (c', s)
                      | _ => None
                      end
                    else match small_step_Expr e Gamma s with
                        | Some e' => Some (Com_IfElse e' c c', s)
                        | None => None
                        end
  | Com_For x t c => 
    match t with
    | Ivytype_Bool => Some (fold_left (fun acc y => Com_Seq (acc) (subst_com c y x)) [Expr_True;Expr_False] Com_Skip, s)
    | Ivytype_UserDefined x n => 
      let nums := seq 0 (n) in
      let out := fold_left (fun acc y => Com_Seq (acc) (subst_com c (Expr_EnumVarLiteral t y) x)) nums Com_Skip in
      Some (out, s)
    | _ => None
    end
  | Com_While e c => Some (Com_IfElse e (Com_Seq c (Com_While e c)) Com_Skip, s)
  (* | Com_Call *)
  (* Note that declarations are handled during typechecking, so we elide them here *)
  | _ => Some(Com_Skip, s)
  end.

Require Import ExtrOcamlBasic.
Require Import ExtrOcamlString.
Extraction "../ocaml/extracted/extract.ml" small_step_Com check empty_state get_variable_names get_type_names get_action_names.

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