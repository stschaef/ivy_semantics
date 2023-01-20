Require Import List.
Require Import Coq.Strings.Byte.
Inductive Ivytype : Type :=
  | Ivytype_Bool : Ivytype 
  | Ivytype_User_Defined : string -> Ivytype.