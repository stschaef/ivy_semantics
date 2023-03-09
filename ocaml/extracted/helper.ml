open Extract

(* OCaml's int converted to extracted version of Coq's nat *)
let rec int_to_nat (n : int) : nat =
  if n <= 0 then O
  else S (int_to_nat (n - 1))

(* OCaml string to char list conversion *)
let explode s = List.init (String.length s) (String.get s)

(* let run (p : com) : unit =
  let pokay, var_decls, fun_var_decls, action_decls, type_decls = check_command_helper p [] [] [] [(Bool, ["true";"false"]);(Void, ["void"])] in
  pokay;
  (* Perform a full evaluation of the program by repeatedly calling small_step_com *)
  let rec eval (p : com) (var_store : (id * expr) list) (fun_var_store : (id * (id list * expr)) list) : (id * expr) list * (id * (id list * expr)) list =
    (* print_endline ("______________________________________");
    print_endline ("Running " ^ string_of_com p);
    print_endline ("______________________________________");
    print_endline "Cur variable store:";
    List.iter (fun (x, e) -> print_endline (x ^ " = " ^ (string_of_expr e))) var_store;
    print_endline "Cur function variable store:";
    List.iter (fun (f, (arg_ids, e)) -> print_endline (f ^ "(" ^ (List.fold_left (fun acc x -> acc ^ "," ^ x) (List.hd arg_ids) (List.tl arg_ids) ) ^ ") = " ^ (string_of_expr e))) fun_var_store; *)
    if is_value_com p then (var_store, fun_var_store)
    else let p', var_store', fun_var_store' = small_step_com p var_store fun_var_store var_decls fun_var_decls action_decls type_decls in
         eval p' var_store' fun_var_store'
  in
  print_endline "type declarations:";
  List.iter (fun (t, ids) -> print_endline (string_of_ivytype t ^ " = " ^ (List.fold_left (fun acc x -> acc ^ "," ^ x) (List.hd ids) (List.tl ids)))) type_decls;
  print_endline "\nvariable declarations:";
  List.iter (fun (x, t) -> print_endline (x ^ " : " ^ (string_of_ivytype t))) var_decls;
  print_endline "\nfunction variable declarations:";
  List.iter (fun (f, (arg_ids, t)) -> print_endline (f ^ "(" ^ (List.fold_left (fun acc x -> acc ^ "," ^ x) (List.hd arg_ids) (List.tl arg_ids) ) ^ ") : " ^ (string_of_ivytype t))) fun_var_decls;

  print_endline "-------------------------------";
  print_endline "      Starting evaluation      ";
  print_endline "-------------------------------";
  let var_store, fun_var_store = eval p [] [] in
  (* Print the result of the evaluation *)
  print_endline "";
  print_endline "Final variable store:";
  List.iter (fun (x, e) -> print_endline (x ^ " = " ^ (string_of_expr e))) var_store;
  print_endline "Final function variable store:";
  List.iter (fun (f, (arg_ids, e)) -> print_endline (f ^ "(" ^ (List.fold_left (fun acc x -> acc ^ "," ^ x) (List.hd arg_ids) (List.tl arg_ids) ) ^ ") = " ^ (string_of_expr e))) fun_var_store *)
