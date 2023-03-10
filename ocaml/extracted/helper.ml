open Extract

(* OCaml's int converted to extracted version of Coq's nat *)
let rec int_to_nat (n : int) : nat =
  if n <= 0 then O
  else S (int_to_nat (n - 1))

(* OCaml string to char list conversion *)
let explode s = List.init (String.length s) (String.get s)

(* Ocaml char list to string *)
let string_of_chars chars = 
  let buf = Buffer.create 16 in
  List.iter (Buffer.add_char buf) chars;
  Buffer.contents buf

let rec string_of_ivytype = function
  | Ivytype_Void -> "void"
  | Ivytype_Bool -> "bool"
  | Ivytype_User_Defined id -> string_of_chars id
  | Ivytype_Fun (args, ret) -> 
      "(" ^ String.concat "," (List.map string_of_ivytype args) ^ ")" ^ " -> " ^ string_of_ivytype ret

let rec string_of_expr (e : expr) : string =
  match e with
  | Expr_VarLiteral id -> (string_of_chars id)
  | Expr_VarFun (id, args) -> (string_of_chars id) ^ "(" ^ String.concat "," (List.map string_of_expr args) ^ ")"
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

let run (p : com) : unit =
  let results = check_command_helper p empty empty empty (fun _ -> false) (fun _ -> O) in
  let (((var_ctx, fun_var_ctx), action_ctx), type_decls), type_sizes = Option.get results in
  (* Perform a full evaluation of the program by repeatedly calling small_step_com *)
  let rec eval (p : com) 
  (var_store : Extract.expr Extract.partial_map)
  (fun_var_store : (Extract.expr list -> Extract.expr) Extract.partial_map) 
  : Extract.expr Extract.partial_map * (Extract.expr list -> Extract.expr) Extract.partial_map =
    (* print_endline ("______________________________________");
    print_endline ("Running " ^ string_of_com p);
    print_endline ("______________________________________");
    print_endline "Cur variable store:";
    List.iter (fun (x, e) -> print_endline (x ^ " = " ^ (string_of_expr e))) var_store;
    print_endline "Cur function variable store:";
    List.iter (fun (f, (arg_ids, e)) -> print_endline (f ^ "(" ^ (List.fold_left (fun acc x -> acc ^ "," ^ x) (List.hd arg_ids) (List.tl arg_ids) ) ^ ") = " ^ (string_of_expr e))) fun_var_store; *)
    match p with
    | Com_Skip -> (var_store, fun_var_store)
    | _ -> let (p', var_store'), fun_var_store' = Option.get (small_step_Com p var_store fun_var_store var_ctx fun_var_ctx action_ctx type_decls type_sizes) in
         eval p' var_store' fun_var_store'
  in
  (* print_endline "type declarations:";
  List.iter (fun (t, ids) -> print_endline (string_of_ivytype t ^ " = " ^ (List.fold_left (fun acc x -> acc ^ "," ^ x) (List.hd ids) (List.tl ids)))) type_decls;
  print_endline "\nvariable declarations:";
  List.iter (fun (x, t) -> print_endline (x ^ " : " ^ (string_of_ivytype t))) var_decls;
  print_endline "\nfunction variable declarations:";
  List.iter (fun (f, (arg_ids, t)) -> print_endline (f ^ "(" ^ (List.fold_left (fun acc x -> acc ^ "," ^ x) (List.hd arg_ids) (List.tl arg_ids) ) ^ ") : " ^ (string_of_ivytype t))) fun_var_decls; *)

  print_endline "-------------------------------";
  print_endline "      Starting evaluation      ";
  print_endline "-------------------------------";
  let var_store, fun_var_store = eval p empty empty in
  (* Print the result of the evaluation *)
  print_endline "";
  print_endline "Final variable store:";
  List.iter (fun (x, e) -> print_endline (x ^ " = " ^ (string_of_expr e))) var_store;
  print_endline "Final function variable store:";
  List.iter (fun (f, (arg_ids, e)) -> print_endline (f ^ "(" ^ (List.fold_left (fun acc x -> acc ^ "," ^ x) (List.hd arg_ids) (List.tl arg_ids) ) ^ ") = " ^ (string_of_expr e))) fun_var_store
