(* Abstract syntax trees for typed Ivy. *)
type id = string

type ivytype = Bool | UserDefined of id | FunctionType of ivytype list * ivytype | Void

let rec string_of_ivytype = function
  | Void -> "void"
  | Bool -> "bool"
  | UserDefined id -> id
  | FunctionType (args, ret) -> 
      "(" ^ String.concat "," (List.map string_of_ivytype args) ^ ")" ^ " -> " ^ string_of_ivytype ret

type expr =
  | VarLiteral of id
  | VarFun of id * expr list
  | ActionApplication of id * expr list
  | True
  | False
  | Not of expr
  | And of expr * expr
  | Or of expr * expr
  | Eq of expr * expr
  | Implies of expr * expr
  | Iff of expr * expr
  | Forall of id * ivytype * expr
  | Exists of id * ivytype * expr
  | Nondet of ivytype
  | Cond of expr * expr * expr
  
type com =
  | Assign of id * expr
  | AssignFun of id * id list * expr
  | Seq of com * com
  | If of expr * com
  | IfElse of expr * com * com
  | For of id * ivytype * com
  | While of expr * com
  | Call of id * expr list
  | LocalVarDecl of id * ivytype
  | GlobalVarDecl of id * ivytype
  | GlobalFuncVarDecl of id * (id * ivytype) list * ivytype
  | TypeDecl of id * int 
  | EnumTypeDecl of id * id list
  | ActionDecl of id * (id * ivytype) list * ivytype * com
  | Skip
          
let rec string_of_expr (e : expr) : string =
  match e with
  | VarLiteral id -> id
  | VarFun (id, args) -> id ^ "(" ^ String.concat "," (List.map string_of_expr args) ^ ")"
  | ActionApplication (id, args) -> id ^ "(" ^ String.concat "," (List.map string_of_expr args) ^ ")"
  | True -> "true"
  | False -> "false"
  | Not e -> "!" ^ string_of_expr e
  | And (e1, e2) -> string_of_expr e1 ^ " && " ^ string_of_expr e2
  | Or (e1, e2) -> string_of_expr e1 ^ " || " ^ string_of_expr e2
  | Eq (e1, e2) -> string_of_expr e1 ^ " == " ^ string_of_expr e2
  | Implies (e1, e2) -> string_of_expr e1 ^ " -> " ^ string_of_expr e2
  | Iff (e1, e2) -> string_of_expr e1 ^ " <-> " ^ string_of_expr e2
  | Forall (id, t, e) -> "forall " ^ id ^ " : " ^ string_of_ivytype t ^ " . " ^ string_of_expr e
  | Exists (id, t, e) -> "exists " ^ id ^ " : " ^ string_of_ivytype t ^ " . " ^ string_of_expr e
  | Nondet t -> "nondet " ^ string_of_ivytype t

let rec string_of_com (c : com) : string =
  match c with
  | Assign (id, e) -> id ^ " := " ^ string_of_expr e
  | AssignFun (id, args, e) -> id ^ "(" ^ String.concat "," args ^ ") := " ^ string_of_expr e
  | Seq (c1, c2) -> string_of_com c1 ^  "; " ^ string_of_com c2
  | If (e, c) -> "if " ^ string_of_expr e ^ " then " ^ string_of_com c
  | IfElse (e, c1, c2) -> "if " ^ string_of_expr e ^ " then " ^ string_of_com c1 ^ " else " ^ string_of_com c2
  | For (id, t, c) -> "for " ^ id ^ " : " ^ string_of_ivytype t ^ " do " ^ string_of_com c
  | While (e, c) -> "while " ^ string_of_expr e ^ " do " ^ string_of_com c
  | Call (id, args) -> "call " ^ id ^ "(" ^ String.concat "," (List.map string_of_expr args) ^ ")"
  | LocalVarDecl (id, t) -> "var " ^ id ^ " : " ^ string_of_ivytype t
  | GlobalVarDecl (id, t) -> "global var " ^ id ^ " : " ^ string_of_ivytype t
  | GlobalFuncVarDecl (id, args, t) -> "global var " ^ id ^ "(" ^ String.concat "," (List.map (fun (id, t) -> id ^ " : " ^ string_of_ivytype t) args) ^ ") : " ^ string_of_ivytype t
  | TypeDecl (id, n) -> "type " ^ id ^ " size = " ^ string_of_int n
  | EnumTypeDecl (id, ids) -> "type " ^ id ^ " = " ^ String.concat " | " ids
  | ActionDecl (id, args, ret, c) -> "action " ^ id ^ "(" ^ String.concat "," (List.map (fun (id, t) -> id ^ " : " ^ string_of_ivytype t) args) ^ ") : " ^ string_of_ivytype ret ^ " = " ^ string_of_com c
  | Skip -> "skip"