Add LoadPath "/home/stschaef/ivy_semantics/coq".
Require Import List.
Require Import Coq.Strings.String.
Require Import Maps.

Inductive Ivytype : Type :=
  | Ivytype_Bool : Ivytype 
  | Ivytype_User_Defined : string -> Ivytype.

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

Definition Var_Context := partial_map Ivytype -> partial_map (Expr).

