open Extract

(* OCaml's int converted to extracted version of Coq's nat *)
let rec int_to_nat (n : int) : nat =
  if n <= 0 then O
  else S (int_to_nat (n - 1))

(* The extracted version of Coq's nat into OCaml's int *)
let rec nat_to_int (n : nat) : int =
  match n with
  | O -> 0
  | S n' -> 1 + nat_to_int n'

(* OCaml string to char list conversion *)
let string_to_char_list s = List.init (String.length s) (String.get s)

(* Ocaml char list to string *)
let string_of_chars chars = 
  let buf = Buffer.create 16 in
  List.iter (Buffer.add_char buf) chars;
  Buffer.contents buf

let rec string_of_ivytype = function
  | Ivytype_Void -> "void"
  | Ivytype_Bool -> "bool"
  | Ivytype_UserDefined (id, n) -> string_of_chars id
  | Ivytype_Function (args, ret) -> 
      "(" ^ String.concat "," (List.map string_of_ivytype args) ^ ")" ^ " -> " ^ string_of_ivytype ret

      
      let rec string_of_expr (e : expr) : string =
        match e with
        | Expr_VarLiteral id -> (string_of_chars id)
        | Expr_EnumVarLiteral (t, n) -> string_of_ivytype t ^ ";element " ^ string_of_int (nat_to_int n)
        (* | Expr_VarFun (id, args) -> (string_of_chars id) ^ "(" ^ String.concat "," (List.map string_of_expr args) ^ ")" *)
        (* | Expr_ActionApplication (id, args) -> id ^ "(" ^ String.concat "," (List.map string_of_expr args) ^ ")" *)
        | Expr_True -> "true"
        | Expr_False -> "false"
        | Expr_Not e -> "!" ^ string_of_expr e
        | Expr_And (e1, e2) -> string_of_expr e1 ^ " && " ^ string_of_expr e2
        | Expr_Or (e1, e2) -> string_of_expr e1 ^ " || " ^ string_of_expr e2
        | Expr_Eq (e1, e2) -> string_of_expr e1 ^ " == " ^ string_of_expr e2
        | Expr_Implies (e1, e2) -> string_of_expr e1 ^ " -> " ^ string_of_expr e2
        | Expr_Iff (e1, e2) -> string_of_expr e1 ^ " <-> " ^ string_of_expr e2
        | Expr_Forall (id, t, e) -> "forall " ^ (string_of_chars id) ^ " : " ^ string_of_ivytype t ^ " . " ^ string_of_expr e
        | Expr_Exists (id, t, e) -> "exists " ^ (string_of_chars id) ^ " : " ^ string_of_ivytype t ^ " . " ^ string_of_expr e
        (* | Expr_Nondet t -> "nondet " ^ string_of_ivytype t *)
        | Expr_Cond (e1, e2, e3) -> "if " ^ string_of_expr e1 ^ " then " ^ string_of_expr e2 ^ " else " ^ string_of_expr e3
        | Expr_Error -> "error"
        
let rec string_of_com (p : com) : string =
  match p with
  | Com_Assign (id, e) -> (string_of_chars id) ^ " := " ^ string_of_expr e
  | Com_Seq (p1, p2) -> string_of_com p1 ^ ";\n" ^ string_of_com p2
  | Com_If (e, p1) -> "if " ^ string_of_expr e ^ " then " ^ string_of_com p1
  | Com_IfElse (e, p1, p2) -> "if " ^ string_of_expr e ^ " then " ^ string_of_com p1 ^ " else " ^ string_of_com p2
  | Com_For (x, t, p') -> "for " ^ (string_of_chars x) ^ " : " ^ string_of_ivytype t ^ " do " ^ string_of_com p' 
  | Com_While (e, p) -> "while " ^ string_of_expr e ^ " do " ^ string_of_com p
  | Com_LocalVarDecl (id, t) -> "var " ^ (string_of_chars id) ^ " : " ^ string_of_ivytype t
  | Com_GlobalVarDecl (id, t) -> "global " ^ (string_of_chars id) ^ " : " ^ string_of_ivytype t
  | Com_TypeDecl (id, n) -> "type " ^ (string_of_chars id) ^ " of size " ^ string_of_int (nat_to_int n)
  | Com_ActionDecl (id, arg_ids_and_ts, ret, p') -> "action " ^ (string_of_chars id) ^ " : " ^ string_of_ivytype (Ivytype_Function (map (snd) arg_ids_and_ts, ret))
  | Com_Skip -> "skip"

let safely_get (e : expr option) : expr =
  match e with
  | Some e' -> e'
  | None -> Expr_VarLiteral (string_to_char_list "UNDEFINED")

let print_state (gamma : context) (s : state) : unit =
  print_endline "State:";
  List.iter (fun x -> print_endline ((string_of_chars x) ^ " = " ^ (string_of_expr (safely_get (s (Expr_VarLiteral x)))))) (get_variable_names gamma)

let print_context (gamma : context) : unit =
  print_endline "Context:";
  List.iter (fun x -> print_endline (string_of_chars x ^ " : " ^ string_of_ivytype (Option.get (lookup_variable gamma x)))) (get_variable_names gamma)

let print_types (gamma : context) : unit =
  print_endline "Types:";
  List.iter (fun x -> print_endline ((string_of_ivytype (Ivytype_UserDefined(x, Option.get (lookup_type gamma x)))) ^ " of size " ^ string_of_int (nat_to_int (Option.get (lookup_type gamma x))) )) (get_type_names gamma)

(* let print_actions (gamma : context) : unit =
  print_endline "Actions:";
  List.iter (fun x -> print_endline (string_of_chars x ^ " : " ^ string_of_ivytype (Option.get (snd(fst(lookup_action gamma x)))))) (get_action_names gamma) *)

let run (p : com) : unit =
  let results = check p in
  let gamma = Option.get results in
  print_endline "-------------------------------";
  print_endline "         Type Context          ";
  print_endline "-------------------------------";
  print_types gamma;
  print_endline "-------------------------------";
  print_endline "       Variable Context        ";
  print_endline "-------------------------------";
  print_context gamma;
  print_endline "-------------------------------";
  print_endline "      Starting evaluation      ";
  print_endline "-------------------------------";
  (* Perform a full evaluation of the program by repeatedly calling small_step_com *)
  let rec eval (p : com) (delta : context) (s : state)
  : state =
    print_endline ("______________________________________");
    print_endline ("Running " ^ string_of_com p);
    print_endline ("______________________________________");
    print_endline "Current State:";
    print_state gamma s;
    match p with
    | Com_Skip -> s
    | _ -> let (p', s') = Option.get (small_step_Com p gamma s) in
      eval p' delta s'
  in
  (* print_endline "type declarations:";
  List.iter (fun (t, ids) -> print_endline (string_of_ivytype t ^ " = " ^ (List.fold_left (fun acc x -> acc ^ "," ^ x) (List.hd ids) (List.tl ids)))) type_decls;
  print_endline "\nvariable declarations:";
  List.iter (fun (x, t) -> print_endline (x ^ " : " ^ (string_of_ivytype t))) var_decls;
  print_endline "\nfunction variable declarations:";
  List.iter (fun (f, (arg_ids, t)) -> print_endline (f ^ "(" ^ (List.fold_left (fun acc x -> acc ^ "," ^ x) (List.hd arg_ids) (List.tl arg_ids) ) ^ ") : " ^ (string_of_ivytype t))) fun_var_decls; *)
  let s' = eval p empty_context empty_state in
  (* Print the result of the evaluation *)
  print_endline "";
  print_endline "Final state:";
  print_state gamma s'
