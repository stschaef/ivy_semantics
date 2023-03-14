(* Definitions of the Ivy language and some useful helper functions *)

Require Import Coq.Lists.List Coq.Bool.Bool.
Import Coq.Lists.List.ListNotations.
Require Import String.

Require Import Nat.
Load Maps.
Scheme Equality for list.
Scheme Equality for nat.

(* Types *)

Inductive Ivytype : Type :=
  | Ivytype_Bool : Ivytype 
  | Ivytype_UserDefined : string -> nat -> Ivytype
  | Ivytype_Function : list Ivytype -> Ivytype -> Ivytype
  | Ivytype_Void.

Fixpoint eqb_Ivytype (t1 t2 : Ivytype) : bool :=
  match t1, t2 with
  | Ivytype_Bool, Ivytype_Bool => true
  | Ivytype_UserDefined s1 n1, Ivytype_UserDefined s2 n2 => andb (eqb s1 s2) (beq_nat n1 n2)
  | Ivytype_Function ts1 t1, Ivytype_Function ts2 t2 => andb (list_beq Ivytype eqb_Ivytype ts1 ts2) (eqb_Ivytype t1 t2)
  | Ivytype_Void, Ivytype_Void => true
  | _, _ => false
  end.

Fixpoint eqb_OptionIvytype (t1 t2 : option Ivytype) : bool :=
  match t1, t2 with
  | Some t1, Some t2 => eqb_Ivytype t1 t2
  | None, None => true
  | _, _ => false
  end.

(* Expressions *)

Inductive Expr : Type :=
  | Expr_VarLiteral : string -> Expr
  | Expr_EnumVarLiteral : Ivytype -> nat -> Expr
  | Expr_FunctionSymbol : string -> list Expr -> Expr 
  | Expr_True
  | Expr_False
  | Expr_Not : Expr -> Expr
  | Expr_And : Expr -> Expr -> Expr
  | Expr_Or : Expr -> Expr -> Expr
  | Expr_Eq : Expr -> Expr -> Expr
  | Expr_Implies : Expr -> Expr -> Expr
  | Expr_Iff : Expr -> Expr -> Expr
  | Expr_Forall : string -> Ivytype -> Expr -> Expr
  | Expr_Exists : string -> Ivytype -> Expr -> Expr
  (* | Expr_Nondet : Ivytype -> Expr *) (* These should be refactored to be polymorphic maps out of unit?*)
  | Expr_Cond : Expr -> Expr -> Expr -> Expr
  | Expr_Error.

Definition eqb_value (e1 e2 : Expr) : bool :=
  match e1, e2 with
  | Expr_True, Expr_True => true
  | Expr_False, Expr_False => true
  | Expr_EnumVarLiteral t1 n1, Expr_EnumVarLiteral t2 n2 => andb (eqb_Ivytype t1 t2) (Nat.eqb n1 n2)
  | _, _ => false
  end.

Fixpoint eqb_Expr (e1 e2 : Expr) : bool :=
  match e1, e2 with
  | Expr_VarLiteral x1, Expr_VarLiteral x2 => eqb x1 x2
  | Expr_EnumVarLiteral t1 n1, Expr_EnumVarLiteral t2 n2 => andb (eqb_Ivytype t1 t2) (Nat.eqb n1 n2)
  (* | Expr_ActionApplication x1 es1, Expr_ActionApplication x2 es2 => andb (eqb x1 x2) (list_beq Expr eqb_Expr es1 es2) *)
  | Expr_True, Expr_True => true
  | Expr_False, Expr_False => true
  | Expr_Not e1, Expr_Not e2 => eqb_Expr e1 e2
  | Expr_And e11 e12, Expr_And e21 e22 => andb (eqb_Expr e11 e21) (eqb_Expr e12 e22)
  | Expr_Or e11 e12, Expr_Or e21 e22 => andb (eqb_Expr e11 e21) (eqb_Expr e12 e22)
  | Expr_Eq e11 e12, Expr_Eq e21 e22 => andb (eqb_Expr e11 e21) (eqb_Expr e12 e22)
  | Expr_Implies e11 e12, Expr_Implies e21 e22 => andb (eqb_Expr e11 e21) (eqb_Expr e12 e22)
  | Expr_Iff e11 e12, Expr_Iff e21 e22 => andb (eqb_Expr e11 e21) (eqb_Expr e12 e22)
  (* | Expr_Forall x1 t1 e1, Expr_Forall x2 t2 e2 => andb (eqb x1 x2) (andb (eqb_Ivytype t1 t2) (eqb_Expr e1 e2))
  | Expr_Exists x1 t1 e1, Expr_Exists x2 t2 e2 => andb (eqb x1 x2) (andb (eqb_Ivytype t1 t2) (eqb_Expr e1 e2)) *)
  (* | Expr_Nondet t1, Expr_Nondet t2 => eqb_Ivytype t1 t2 *)
  | Expr_Cond e11 e12 e13, Expr_Cond e21 e22 e23 => andb (eqb_Expr e11 e21) (andb (eqb_Expr e12 e22) (eqb_Expr e13 e23))
  | _, _ => false
  end.

(* Commands *)

Inductive Com : Type :=
  | Com_Assign : string -> Expr -> Com
  | Com_AssignFun : string -> list string -> Expr -> Com
  | Com_Seq : Com -> Com -> Com
  | Com_If : Expr -> Com -> Com
  | Com_IfElse : Expr -> Com -> Com -> Com
  | Com_For : string -> Ivytype -> Com -> Com
  | Com_While : Expr -> Com -> Com
  (* | Com_Call : string -> list Expr -> Com *)
  | Com_LocalVarDecl : string -> Ivytype -> Com
  | Com_GlobalVarDecl : string -> Ivytype -> Com
  | Com_GlobalFuncVarDecl : string -> list (string * Ivytype) -> Ivytype -> Com
  | Com_TypeDecl : string -> nat -> Com 
  (* | Com_EnumTypeDecl : string -> list string -> Com *)
  | Com_ActionDecl : string -> list (string * Ivytype) -> Ivytype -> Com -> Com
  | Com_Skip.

(* Values *)

Inductive value : Expr -> Prop :=
  | value_VarLiteral : forall x, value (Expr_VarLiteral x)
  | value_EnumVarLiteral : forall t n, value (Expr_EnumVarLiteral t n)
  | value_True : value Expr_True
  | value_False : value Expr_False.

Fixpoint is_value (e : Expr) : bool :=
  match e with
  | Expr_EnumVarLiteral t n => true
  | Expr_True => true
  | Expr_False => true
  | _ => false
  end.

(* Stores/Contexts *)

Definition variable_context := prod (string -> option Ivytype) (list string).
Definition type_context := prod (string -> option nat) (list string).
Definition action_context := prod (string -> option (list (string * Ivytype) * Ivytype * Com)) (list string).

(* The attached lists may be a little redundant, but it's a quick and easy way
to get ahold of the names of things that have been declared. 

Else we would have to get the preimage of the non-None elements in each
context, which I don't think is possible. *)

Definition context := prod (variable_context) (prod (type_context) (action_context)).
Definition build_context 
(vc : variable_context) 
(tc : type_context) 
(ac : action_context) := (vc, (tc, ac)).

Definition get_variable_context (c : context) := fst c.
Definition get_type_context (c : context) := fst (snd c).
Definition get_action_context (c : context) := snd (snd c).

Definition lookup_variable (c : context) (x : string) : option Ivytype := fst (get_variable_context c) x.
Definition lookup_type (c : context) (x : string) : option nat := fst (get_type_context c) x.
Definition lookup_action (c : context) (x : string) : option (list (string * Ivytype) * Ivytype * Com) := fst (get_action_context c) x.

Definition get_variable_names (c : context) := snd (get_variable_context c).
Definition get_type_names (c : context) := snd (get_type_context c).
Definition get_action_names (c : context) := snd (get_action_context c).

Definition update_variable_context (c : context) (x : string) (t : Ivytype) : context :=
  let vc := get_variable_context c in
  let tc := get_type_context c in
  let ac := get_action_context c in
  build_context (fun y => if eqb x y then Some t else fst vc y, x :: snd vc) tc ac.

Definition update_type_context (c : context) (x : string) (n : nat) : context :=
  let vc := get_variable_context c in
  let tc := get_type_context c in
  let ac := get_action_context c in
  build_context vc (fun y => if eqb x y then Some n else fst tc y, x :: snd tc) ac.

Definition update_action_context (c : context) (x : string) (params : list (string * Ivytype)) (ret_type : Ivytype) (body : Com) : context :=
  let vc := get_variable_context c in
  let tc := get_type_context c in
  let ac := get_action_context c in
  build_context vc tc (fun y => if eqb x y then Some (params, ret_type, body) else fst ac y, x :: snd ac).

Definition empty_context : context := 
  build_context (fun x => None, nil) (fun x => None, nil) (fun x => None, nil).

(* Definition state := forall (e : Expr), exists (e' : Expr), (value e -> option (value e')). *)

Definition state := Expr -> option Expr.
Definition empty_state : state := fun e => None.
Definition update_state (s : state) (e1 e2 : Expr) : state :=
  fun e => if eqb_Expr e e1 then Some e2 else s e.


(* Substitutions *)

Fixpoint subst (e : Expr) (v : Expr) (x : string) : Expr :=
  match e with 
  | Expr_VarLiteral y => if eqb x y then v else e
  | Expr_EnumVarLiteral y n => Expr_EnumVarLiteral y n
  | Expr_FunctionSymbol x es => Expr_FunctionSymbol x (map (fun e => subst e v x) es)
  | Expr_True => Expr_True
  | Expr_False => Expr_False
  | Expr_Not e => Expr_Not (subst e v x)
  | Expr_And e1 e2 => Expr_And (subst e1 v x) (subst e2 v x)
  | Expr_Or e1 e2 => Expr_Or (subst e1 v x) (subst e2 v x)
  | Expr_Eq e1 e2 => Expr_Eq (subst e1 v x) (subst e2 v x)
  | Expr_Implies e1 e2 => Expr_Implies (subst e1 v x) (subst e2 v x)
  | Expr_Iff e1 e2 => Expr_Iff (subst e1 v x) (subst e2 v x)
  | Expr_Forall y t e => Expr_Forall y t (subst e v x)
  | Expr_Exists y t e => Expr_Exists y t (subst e v x)
  (* | Expr_Nondet t => Expr_Nondet t *)
  | Expr_Cond e1 e2 e3 => Expr_Cond (subst e1 v x) (subst e2 v x) (subst e3 v x)
  | Expr_Error => Expr_Error
  end.

Fixpoint subst_com (p : Com) (v : Expr) (x : string) : Com :=
  match p with 
  | Com_Assign y e => (Com_Assign y (subst e v x))
  (* | Com_AssignFun f args e => (Com_AssignFun f (map (fun g => if eqb x g then fromMaybe "ERROR" (unpack_id_under_expr v) else g) args) (subst e v x)) *)
  | Com_Seq p1 p2 => (Com_Seq (subst_com p1 v x) (subst_com p2 v x))
  | Com_If e p => (Com_If (subst e v x) (subst_com p v x))
  | Com_IfElse e p1 p2 => (Com_IfElse (subst e v x) (subst_com p1 v x) (subst_com p2 v x))
  (* | Com_For y t p => (Com_For y t (subst_com p v x)) *)
  | Com_While e p => (Com_While (subst e v x) (subst_com p v x))
  (* | Com_Call f es => (Com_Call f (map (fun e => subst e v x) es)) *)
  | Com_Skip => Com_Skip
  | _ => p (* declarations *)
  end.
