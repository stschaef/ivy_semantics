(* Definitions of the Ivy language and some useful helper functions *)

(* Desktop *)
(* Add LoadPath "/home/stschaef/ivy_semantics/coq" as coq. *)
(* Add LoadPath "/Users/stevenschaefer/ivy_semantics/coq" as coq. *)
Require Import Coq.Lists.List Coq.Bool.Bool.
Import Coq.Lists.List.ListNotations.
Require Import String.
Declare Scope string_scope.
Delimit Scope string_scope with string.
Bind Scope string_scope with string.
Local Open Scope string_scope.
Load Maps.
Scheme Equality for list.

(* Types *)

Inductive Ivytype : Type :=
  | Ivytype_Bool : Ivytype 
  | Ivytype_User_Defined : string -> Ivytype
  | Ivytype_Fun : list Ivytype -> Ivytype -> Ivytype
  | Ivytype_Void.

Fixpoint eqb_Ivytype (t1 t2 : Ivytype) : bool :=
  match t1, t2 with
  | Ivytype_Bool, Ivytype_Bool => true
  | Ivytype_User_Defined s1, Ivytype_User_Defined s2 => eqb s1 s2
  | Ivytype_Fun ts1 t1, Ivytype_Fun ts2 t2 => andb (list_beq Ivytype eqb_Ivytype ts1 ts2) (eqb_Ivytype t1 t2)
  | Ivytype_Void, Ivytype_Void => true
  | _, _ => false
  end.

(* Expressions *)

Inductive Expr : Type :=
  | Expr_VarLiteral : string -> Expr
  | Expr_EnumVarLiteral : Ivytype -> nat -> Expr
  | Expr_VarFun : string -> list Expr -> Expr
  (* | Expr_ActionApplication : string -> list Expr -> Expr *)
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
  | Expr_Nondet : Ivytype -> Expr
  | Expr_Cond : Expr -> Expr -> Expr -> Expr
  | Expr_Error.

Fixpoint eqb_Expr (e1 e2 : Expr) : bool :=
  match e1, e2 with
  | Expr_VarLiteral x1, Expr_VarLiteral x2 => eqb x1 x2
  | Expr_EnumVarLiteral t1 n1, Expr_EnumVarLiteral t2 n2 => andb (eqb_Ivytype t1 t2) (Nat.eqb n1 n2)
  | Expr_VarFun x1 es1, Expr_VarFun x2 es2 => andb (eqb x1 x2) (list_beq Expr eqb_Expr es1 es2)
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
  | Expr_Nondet t1, Expr_Nondet t2 => eqb_Ivytype t1 t2
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
  | Com_GlobalFuncVarDecl : string -> list Ivytype -> Ivytype -> Com
  | Com_TypeDecl : string -> nat -> Com 
  (* | Com_EnumTypeDecl : string -> list string -> Com *)
  | Com_ActionDecl : string -> list (string * Ivytype) -> Ivytype -> Com -> Com
  | Com_Skip.

(* Values *)

Inductive Value_Expr : Expr -> Prop := 
  | Value_Expr_VarLiteral : forall x, Value_Expr (Expr_VarLiteral x)
  | Value_Expr_EnumVarLiteral : forall n t, Value_Expr (Expr_EnumVarLiteral t n)
  | Value_Expr_True : Value_Expr Expr_True
  | Value_Expr_False : Value_Expr Expr_False
  | Value_Expr_Var_Fun : forall x es, (forall e, In e es -> Value_Expr e) -> Value_Expr (Expr_VarFun x es).

Definition value (e : Expr) : Prop := Value_Expr e.

Fixpoint is_value (e : Expr) : bool :=
  match e with
  | Expr_VarLiteral x => true
  | Expr_VarFun x es => fold_left (fun b e => b && is_value e) es true
  | Expr_True => true
  | Expr_False => true
  | _ => false
  end.

(* Stores/Contexts *)

(* TODO: This is maybe a lil redundant *)
Definition context := partial_map Ivytype. (* string -> option Ivytype *)
Definition update_context (c : context) (x : string) (t : Ivytype) : context := t_update c x (Some t).
Definition store (A : Type) := partial_map A.
Definition store_lookup {A} (s : store A) (x : string) : option A := s x.
Definition store_update {A} (s : store A) (x : string) (v : A) : store A := t_update s x (Some v).
Definition EnumTypeSizes := Ivytype -> nat.
Definition action_context := partial_map (list (string * Ivytype) * Ivytype * Com).

(* TODO: Can I get away with not using maybes? *)
Definition unpack_id_under_expr (e : Expr) : option string :=
  match e with
  | Expr_VarLiteral x => Some x
  | Expr_VarFun x es => Some x
  (* | Expr_ActionApplication x es => Some x *)
  | _ => None (* Shouldn't be able to extract id from anything else *)
  end.
  
Definition fromMaybe {A : Type} (x : A) (y : option A) : A :=
  match y with
  | Some z => z
  | None => x
  end.

(* Substitutions *)

Fixpoint subst (e : Expr) (v : Expr) (x : string) : Expr :=
  match e with 
  | Expr_VarLiteral y => if eqb x y then v else e
  | Expr_EnumVarLiteral y n => Expr_EnumVarLiteral y n
  | Expr_VarFun y es => Expr_VarFun y (map (fun e => subst e v x) es)
  (* | Expr_ActionApplication y es => Expr_ActionApplication y (map (fun e => subst e v x) es) *)
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
  | Expr_Nondet t => Expr_Nondet t
  | Expr_Cond e1 e2 e3 => Expr_Cond (subst e1 v x) (subst e2 v x) (subst e3 v x)
  | Expr_Error => Expr_Error
  end.

Fixpoint subst_com (p : Com) (v : Expr) (x : string) : Com :=
  match p with 
  | Com_Assign y e => (Com_Assign y (subst e v x))
  | Com_AssignFun f args e => (Com_AssignFun f (map (fun g => if eqb x g then fromMaybe "ERROR" (unpack_id_under_expr v) else g) args) (subst e v x))
  | Com_Seq p1 p2 => (Com_Seq (subst_com p1 v x) (subst_com p2 v x))
  | Com_If e p => (Com_If (subst e v x) (subst_com p v x))
  | Com_IfElse e p1 p2 => (Com_IfElse (subst e v x) (subst_com p1 v x) (subst_com p2 v x))
  | Com_For y t p => (Com_For y t (subst_com p v x))
  | Com_While e p => (Com_While (subst e v x) (subst_com p v x))
  (* | Com_Call f es => (Com_Call f (map (fun e => subst e v x) es)) *)
  | Com_Skip => Com_Skip
  | _ => p (* declarations *)
  end.

(* String Utilities *)
(* TODO: Some of these don't typecheck. 
Either fix or move into OCaml. Shouldn't have to do string processing in coq
*)

Fixpoint string_of_list {A} (f : A -> string) (l : list A) : string :=
  match l with
  | [] => ""
  | [x] => f x
  | x :: xs => (f x) ++ ", " ++ (string_of_list f xs)
  end.

Fixpoint string_of_nat (n : nat) : string :=
  match n with
  | 0 => "0"
  | S n' => (string_of_nat n') ++ "1"
  end.

(* Fixpoint string_of_Expr (e : Expr) : string :=
  match e with
  | Expr_VarLiteral x => x
  | Expr_EnumVarLiteral t n => "TODO"
  | Expr_VarFun x es => x ++ "(" ++ (fold_left (fun s e => s ++ ", " ++ (string_of_Expr e)) es "") ++ ")"
  (* | Expr_ActionApplication x es => x ++ "(" ++ (fold_left (fun s e => s ++ ", " ++ (string_of_Expr e)) es "") ++ ")" *)
  | Expr_True => "true"
  | Expr_False => "false"
  | Expr_Not e => "!" ++ (string_of_Expr e)
  | Expr_And e1 e2 => "(" ++ (string_of_Expr e1) ++ " && " ++ (string_of_Expr e2) ++ ")"
  | Expr_Or e1 e2 => "(" ++ (string_of_Expr e1) ++ " || " ++ (string_of_Expr e2) ++ ")"
  | Expr_Eq e1 e2 => "(" ++ (string_of_Expr e1) ++ " == " ++ (string_of_Expr e2) ++ ")"
  | Expr_Implies e1 e2 => "(" ++ (string_of_Expr e1) ++ " ==> " ++ (string_of_Expr e2) ++ ")"
  | Expr_Iff e1 e2 => "(" ++ (string_of_Expr e1) ++ " <==> " ++ (string_of_Expr e2) ++ ")"
  | Expr_Forall x t e => "(forall " ++ x ++ " : " ++ (string_of_Ivytype t) ++ ". " ++ (string_of_Expr e) ++ ")"
  | Expr_Exists x t e => "(exists " ++ x ++ " : " ++ (string_of_Ivytype t) ++ ". " ++ (string_of_Expr e) ++ ")"
  | Expr_Nondet t => "nondet(" ++ (string_of_Ivytype t) ++ ")"
  | Expr_Cond e1 e2 e3 => "(" ++ (string_of_Expr e1) ++ " ? " ++ (string_of_Expr e2) ++ " : " ++ (string_of_Expr e3) ++ ")"
  | Expr_Error => "error"
  end. *)

  
(* Fixpoint string_of_Com (c : Com) : string :=
  match c with 
  | Com_Assign x e => x ++ " := " ++ (string_of_Expr e)
  | Com_AssignFun x xs e => x ++ "(" ++ (string_of_list (fun a => a) xs) ++ ") := " ++ (string_of_Expr e)
  | Com_Seq c1 c2 => (string_of_Com c1) ++ " ; " ++ (string_of_Com c2)
  | Com_If e c => "if " ++ (string_of_Expr e) ++ " then " ++ (string_of_Com c)
  | Com_IfElse e c1 c2 => "if " ++ (string_of_Expr e) ++ " then " ++ (string_of_Com c1) ++ " else " ++ (string_of_Com c2)
  | Com_For x t c => "for " ++ x ++ " : " ++ (string_of_Ivytype t) ++ " do " ++ (string_of_Com c)
  | Com_While e c => "while " ++ (string_of_Expr e) ++ " do " ++ (string_of_Com c)
  (* | Com_Call x es => x ++ "(" ++ (string_of_list string_of_Expr es) ++ ")" *)
  | Com_LocalVarDecl x t => "var " ++ x ++ " : " ++ (string_of_Ivytype t)
  | Com_GlobalVarDecl x t => "global var " ++ x ++ " : " ++ (string_of_Ivytype t)
  | Com_GlobalFuncVarDecl x xs t => "global var " ++ x ++ "(" ++ (string_of_list string_of_Ivytype xs) ++ ") : " ++ (string_of_Ivytype t)
  | Com_TypeDecl x n => "type " ++ x ++ " = " ++ (string_of_nat n)
  (* | Com_EnumTypeDecl x xs => "type " ++ x ++ " = " ++ (string_of_list (fun x => x) xs) *)
  | Com_ActionDecl x xs t c => "action " ++ x ++ "(" ++ (string_of_list string_of_Ivytype (map snd xs)) ++ ") : " ++ (string_of_Ivytype t) ++ " = " ++ (string_of_Com c)
  | Com_Skip => "skip"
  end. *)

(* Fixpoint string_of_Ivytype (t : Ivytype) : string :=
  match t with
  | Ivytype_Bool => "bool"
  | Ivytype_User_Defined s => s
  | Ivytype_Fun ts t' => "(" ++ (fold_right (fun s t'' => s ++ "," ++ (string_of_Ivytype t'')) ts "") ++ ") -> " ++ (string_of_Ivytype t')
  | Ivytype_Void => "void"
  end. *)
  