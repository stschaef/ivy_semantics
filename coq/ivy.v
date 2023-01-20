(* Add LoadPath "/home/stschaef/ivy_semantics/coq". *)
Add LoadPath "/Users/stevenschaefer/ivy_semantics/coq" as coq.
(* From coq Require Import Maps. *)
Require Import List.
Require Import String.
Open Scope string_scope.
From coq Require Import Maps.

Inductive Ivytype : Type :=
  | Ivytype_Bool : Ivytype 
  | Ivytype_User_Defined : string -> Ivytype
  | Ivytype_Fun : list Ivytype -> Ivytype -> Ivytype.

Inductive Expr : Type :=
  | Expr_VarLiteral : string -> Expr
  | Expr_VarFun : string -> list Expr -> Expr
  | Expr_ActionApplication : string -> list Expr -> Expr
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
  | Expr_Cond : Expr -> Expr -> Expr -> Expr.

Inductive Com : Type :=
  | Com_Assign : string -> Expr -> Com
  | Com_AssignFun : string -> list string -> Expr -> Com
  | Com_Seq : Com -> Com -> Com
  | Com_If : Expr -> Com -> Com
  | Com_IfElse : Expr -> Com -> Com -> Com
  | Com_For : string -> Ivytype -> Com -> Com
  | Com_While : Expr -> Com -> Com
  | Com_Call : string -> list Expr -> Com
  | Com_LocalVarDecl : string -> Ivytype -> Com
  | Com_GlobalVarDecl : string -> Ivytype -> Com
  | Com_GlobalFuncVarDecl : string -> list (string -> Ivytype) -> Ivytype -> Com
  | Com_TypeDecl : string -> nat -> Com 
  | Com_EnumTypeDecl : string -> list string -> Com
  | Com_ActionDecl : string -> list (string -> Ivytype) -> Ivytype -> Com -> Com
  | Com_Skip.

Inductive Value_Expr : Expr -> Prop := 
  | Value_Expr_VarLiteral : forall x, Value_Expr (Expr_VarLiteral x)
  | Value_Expr_True : Value_Expr Expr_True
  | Value_Expr_False : Value_Expr Expr_False
  | Value_Expr_Var_Fun : forall x es, (forall e, In e es -> Value_Expr e) -> Value_Expr (Expr_VarFun x es).

Definition Context_Var := partial_map (Ivytype * Expr).
Definition Context_Var_Fun := partial_map (Ivytype * (list Expr -> Expr)).
Definition Context_Action := partial_map (Ivytype * (list Expr -> Com)).
Definition Context_Type := partial_map nat.

Fixpoint subst (e : Expr) (v : Expr) (x : string) : Expr :=
  match e with 
  | Expr_VarLiteral y => if eqb x y then v else e
  | Expr_VarFun y es => Expr_VarFun y (map (fun e => subst e v x) es)
  | Expr_ActionApplication y es => Expr_ActionApplication y (map (fun e => subst e v x) es)
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
  end.

Definition unpack_id_under_expr (e : Expr) : option string :=
  match e with
  | Expr_VarLiteral x => Some x
  | Expr_VarFun x es => Some x
  | Expr_ActionApplication x es => Some x
  | _ => None (* Shouldn't be able to extract id from anything else *)
  end.

Print option.

Definition fromMaybe {A : Type} (x : A) (y : option A) : A :=
  match y with
  | Some z => z
  | None => x
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
  | Com_Call f es => (Com_Call f (map (fun e => subst e v x) es))
  | Com_Skip => Com_Skip
  | _ => p (* declarations *)
  end.

Fixpoint type_expr 
(e : Expr) (var_ctx : Context_Var) (fun_var_ctx : Context_Var_Fun) 
(act_ctx : Context_Action) (type_ctx : Context_Type) : option Ivytype :=
  match e with
  | Expr_VarLiteral x => match var_ctx (x) with
                         | Some (t, e') => Some t
                         | None => None
                         end
  | Expr_VarFun f es => match fun_var_ctx (f) with
                        | Some (t, e') => (
                            let arg_types := map (fun e => type_expr e var_ctx fun_var_ctx act_ctx type_ctx) es in
                            match t with
                            | Ivytype_Fun arg_types' ret_type => 
                              if (andb (eqb (length arg_types) (length arg_types')) (andb (forallb (fun x => match x with | Some _ => true | None => false end) arg_types) (forallb (fun x => match x with | Some _ => true | None => false end) arg_types'))) then
                                Some ret_type
                              else
                                None
                            | _ => None
                            end
                        )
                        | None => None
                        end
  | _ => None
  end.

