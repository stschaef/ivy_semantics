(* A small-step interpreter and type checker for Ivy *)

open Ast

let string_of_list (f : 'a -> string) (l : 'a list) : string =
  let rec string_of_list' (f : 'a -> string) (l : 'a list) (acc : string) : string =
    match l with
    | [] -> acc
    | x :: xs -> string_of_list' f xs (acc ^ (f x)) ^ " "
  in string_of_list' f l " "

let rec unfold_right f init =
  match f init with
  | None -> []
  | Some (x, next) -> x :: unfold_right f next

let range n =
  let irange x = if x > n then None else Some (x, x + 1) in
  unfold_right irange 1

let rec is_value (e : expr) : bool = 
  match e with
  | VarLiteral _ -> true
  | VarFun(x, args) -> List.for_all is_value args
  | True -> true
  | False -> true
  | _ -> false

let is_value_com ( p : com) : bool =
  match p with
  | Skip -> true
  | _ -> false
 
let ensure_type_declared (type_decls : (ivytype * id list) list) (x : ivytype) : unit =
  if not (List.mem x (List.map (fun (x, y) -> x) type_decls)) then
    failwith ("undeclared type " ^ (string_of_ivytype x))

let lookup_var_type (decls : (id * ivytype) list) (x : id) : ivytype =
	try List.assoc x decls
	with Not_found -> failwith ("NOT FOUND undeclared variable " ^ x)

let ensure_var_declared (decls : (id * ivytype) list) (x : id) : unit =
  if not (List.mem_assoc x decls) then
    failwith ("undeclared variable " ^ x)

  
let rec type_expr (e : expr)
(decls : (id * ivytype) list)
(fun_var_decls : (id * (id list * ivytype)) list)
(action_decls: (id * ivytype) list)
(type_decls : (ivytype * (id list)) list): ivytype =
  let rec type_args (args : expr list)
  (decls : (id * ivytype) list)
  (fun_var_decls : (id * (id list * ivytype)) list)
  (action_decls: (id * ivytype) list)
  (type_decls : (ivytype * (id list)) list) : ivytype list =
  match args with
  | [] -> []
  | arg :: args -> (type_expr arg decls fun_var_decls action_decls type_decls) :: (type_args args decls fun_var_decls action_decls type_decls)
  in 
	match e with
  | VarLiteral(x) -> lookup_var_type decls x
  | VarFun(x, args) -> (
      let arg_types = type_args args decls fun_var_decls action_decls type_decls in
      let (arg_ids, fun_type) = List.assoc x fun_var_decls in
      match fun_type with
      | FunctionType(arg_types', ret_type) -> (
          if arg_types = arg_types' then ret_type
          else failwith ("type mismatch in function " ^ x)
        )
      | _ -> failwith ("type mismatch in function " ^ x)
    )
    
  (* TODO 

    1.  Multiple return types
    2.  Expressions shouldn't use void typed actions
    3.  Command actions should be void
    4.  Side effects must occur in actions, even when called inside
        of expressions
        In the context, action_ids should point to a list of commands
        These can be any commands except for global declarations:
          GlobalVarDecl, GlobalFuncVarDecl, TypeDecl, ActionDecl, EnumTypeDecl
    5.  Build assertion contexts in a distinct pass similar to type checking
          Either:
            I. Each command has a list of assertions (pre/post/axioms) that must hold
               at that command; or
            II.Gather a global list of axioms. Then pre/post conditions are handled locally
                That is, they only need to be checking surrounding the calling of an action
    5.  Also need to track the assertions. These are added as another context.
          Axioms must be checked after each command small step. 
            If fail, throw error.
            If respect, then step 
          For each action, also keep a list of pre and post conditions that must hold.
          When an action is called in the small step, check that each of these hold. 
            If a pre condition fails, then the action steps to a skip with unchanged state
            If a post condition fails, then the action steps to a skip with unchanged state
  *)
  | ActionApplication(action_id, args) -> ( 
      let arg_types = type_args args decls fun_var_decls action_decls type_decls in
      let action_type = lookup_var_type decls action_id in
      match action_type with
      | FunctionType(arg_types', ret_type) -> (
          if arg_types = arg_types' then ret_type
          else failwith ("type mismatch in action " ^ action_id)
        )
      | _ -> failwith ("type mismatch in action " ^ action_id)
    )
  | True -> Bool
  | False -> Bool
  | Not(e) -> (
      let e_type = type_expr e decls fun_var_decls action_decls type_decls in
      match e_type with
      | Bool -> Bool
      | _ -> failwith "type mismatch in not"
    )
  | And(e1, e2) -> (
      let e1_type = type_expr e1 decls fun_var_decls action_decls type_decls in
      let e2_type = type_expr e2 decls fun_var_decls action_decls type_decls in
      match e1_type, e2_type with
      | Bool, Bool -> Bool
      | _ -> failwith "type mismatch in and"
    )
  | Or(e1, e2) -> (
      let e1_type = type_expr e1 decls fun_var_decls action_decls type_decls in
      let e2_type = type_expr e2 decls fun_var_decls action_decls type_decls in
      match e1_type, e2_type with
      | Bool, Bool -> Bool
      | _ -> failwith "type mismatch in or"
    )
  | Eq(e1, e2) -> (
      let e1_type = type_expr e1 decls fun_var_decls action_decls type_decls in
      let e2_type = type_expr e2 decls fun_var_decls action_decls type_decls in
      match e1_type, e2_type with
      | Bool, Bool -> Bool
      | _ -> failwith "type mismatch in eq"
    )
  | Implies(e1, e2) -> (
      let e1_type = type_expr e1 decls fun_var_decls action_decls type_decls in
      let e2_type = type_expr e2 decls fun_var_decls action_decls type_decls in
      match e1_type, e2_type with
      | Bool, Bool -> Bool
      | _ -> failwith "type mismatch in implies"
    )
  | Iff(e1, e2) -> (
      let e1_type = type_expr e1 decls fun_var_decls action_decls type_decls in
      let e2_type = type_expr e2 decls fun_var_decls action_decls type_decls in
      match e1_type, e2_type with
      | Bool, Bool -> Bool
      | _ -> failwith "type mismatch in iff"
    )
  | Forall(x, t, e) -> (
      ensure_type_declared type_decls t;
      let e_type = type_expr e decls fun_var_decls action_decls type_decls in
      match e_type with
      | Bool -> Bool
      | _ -> failwith "type mismatch in forall"
    )
  | Exists(x, t, e) -> (
      ensure_type_declared type_decls t;
      let e_type = type_expr e decls fun_var_decls action_decls type_decls in
      match e_type with
      | Bool -> Bool
      | _ -> failwith "type mismatch in exists"
    )
  | Nondet(t) -> (
      ensure_type_declared type_decls t;
      t
    )

let rec subst (e: expr) (v : expr) (x : id) : expr =
  match e with
  | VarLiteral(y) -> if x = y then v else e
  | VarFun(y, args) -> VarFun(y, List.map (fun arg -> subst arg v x) args)
  | ActionApplication(action_id, args) -> ActionApplication(action_id, List.map (fun arg -> subst arg v x) args)
  | True -> True
  | False -> False
  | Not(e) -> Not(subst e v x)
  | And(e1, e2) -> And(subst e1 v x, subst e2 v x)
  | Or(e1, e2) -> Or(subst e1 v x, subst e2 v x)
  | Eq(e1, e2) -> Eq(subst e1 v x, subst e2 v x)
  | Implies(e1, e2) -> Implies(subst e1 v x, subst e2 v x)
  | Iff(e1, e2) -> Iff(subst e1 v x, subst e2 v x)
  | Forall(y, t, e) -> Forall(y, t, subst e v x)
  | Exists(y, t, e) -> Exists(y, t, subst e v x)
  | Nondet(t) -> Nondet(t)
  | Cond(e1, e2, e3) -> Cond(subst e1 v x, subst e2 v x, subst e3 v x)

let unpack_id_under_expr (e : expr) : id =
  match e with
  | VarLiteral(x) -> x
  | _ -> failwith "not a variable"

let rec subst_com (p : com) (v : expr) (x : id) : com =
  match p with
  | Assign(x', e) -> Assign(x, subst e v x')
  | AssignFun(x', arg_ids, e) -> AssignFun(x', (List.map (fun g -> if g = x then (unpack_id_under_expr v) else g) arg_ids), subst e v x)
  | Seq(c1, c2) -> Seq(subst_com c1 v x, subst_com c2 v x)
  | If(e, c1) -> If(subst e v x, subst_com c1 v x)
  | IfElse(e, c1, c2) -> IfElse(subst e v x, subst_com c1 v x, subst_com c2 v x)
  | For(x', t, c) -> For(x', t, subst_com c v x)
  | While(e, c) -> While(subst e v x, subst_com c v x)
  | Call(x', args) -> Call(x', List.map (fun arg -> subst arg v x) args)
  | Skip -> Skip
  | _ -> failwith "subst_com shouldn't have to be run with declarations"

let rec check_helper (p : com) 
(var_decls : (id * ivytype) list)
(fun_var_decls : (id * (id list * ivytype)) list)
(action_decls: (id * ivytype) list) 
(type_decls : (ivytype * (id list)) list) 
: unit * (id * ivytype) list * (id * (id list * ivytype)) list * (id * ivytype) list * (ivytype * (id list)) list  =
let rec type_args (args : expr list)
  (decls : (id * ivytype) list)
  (fun_var_decls : (id * (id list * ivytype)) list)
  (action_decls: (id * ivytype) list)
  (type_decls : (ivytype * (id list)) list) : ivytype list =
  match args with
  | [] -> []
  | arg :: args -> (type_expr arg decls fun_var_decls action_decls type_decls) :: (type_args args decls fun_var_decls action_decls type_decls)
in
  match p with
  | Assign(x, e) -> (
    let e_type = type_expr e var_decls fun_var_decls action_decls type_decls in
    let t = lookup_var_type var_decls x in
    ensure_var_declared var_decls x;
    if e_type = t then ((), var_decls, fun_var_decls, action_decls, type_decls) 
    else failwith ("type mismatch in assignment to " ^ x)
  )
  | AssignFun(x, arg_ids, e) -> (
    let e_type = type_expr e var_decls fun_var_decls action_decls type_decls in
    let (_, t) = List.assoc x fun_var_decls in
    match t with
    | FunctionType(arg_types', ret_type) -> (
        if e_type = ret_type then ((), var_decls, fun_var_decls, action_decls, type_decls) 
        else failwith ("type mismatch in " ^ string_of_com p)
    )
  )
  | Seq(p1, p2) -> (
      let p1okay, var_decls', fun_var_decls', action_decls', type_decls' = check_helper p1 var_decls fun_var_decls action_decls type_decls in
      p1okay;
      check_helper p2 var_decls' fun_var_decls' action_decls' type_decls'
    )
  | If(e, p') -> (
      let e_type = type_expr e var_decls fun_var_decls action_decls type_decls in
      match e_type with
      | Bool -> check_helper p' var_decls fun_var_decls action_decls type_decls
      | _ -> failwith "type mismatch in if"
    )
  | IfElse(e, p1, p2) -> (
      let e_type = type_expr e var_decls fun_var_decls action_decls type_decls in
      match e_type with
      | Bool -> (
          let p1okay, var_decls', fun_var_decls', action_decls', type_decls' = check_helper p1 var_decls fun_var_decls action_decls type_decls in
          p1okay;
          check_helper p2 var_decls' fun_var_decls' action_decls' type_decls'
        )
      | _ -> failwith "type mismatch in ifelse"
    )
  | For(id, t, p') -> (
      ensure_type_declared type_decls t;
      let var_decls' = (id, t) :: var_decls in
      check_helper p' var_decls' fun_var_decls action_decls type_decls
    )
  | While(e, p') -> (
      let e_type = type_expr e var_decls fun_var_decls action_decls type_decls in
      match e_type with
      | Bool -> check_helper p' var_decls fun_var_decls action_decls type_decls
      | _ -> failwith "type mismatch in while"
    )
  | Call(action_id, args) -> (
      let arg_types = type_args args var_decls fun_var_decls action_decls type_decls in
      let action_type = lookup_var_type action_decls action_id in
      match action_type with
      | FunctionType(arg_types', ret_type) -> (
          if ret_type = Void then (
            if arg_types = arg_types' then (), var_decls, fun_var_decls, action_decls, type_decls
            else failwith ("type mismatch in action " ^ action_id)
          )
          else failwith ("invoking a non-void function like it is an action " ^ action_id)
        )
      | _ -> failwith ("type mismatch in action " ^ action_id)
    )
  | LocalVarDecl(var_id, t) -> (
      ensure_type_declared type_decls t;
      let var_decls' = (var_id, t) :: var_decls in
      check_helper Skip var_decls' fun_var_decls action_decls type_decls
    )
  | GlobalVarDecl(var_id, t) -> (
      ensure_type_declared type_decls t;
      let var_decls' = (var_id, t) :: var_decls in
      check_helper Skip var_decls' fun_var_decls action_decls type_decls
    )
  | GlobalFuncVarDecl(var_id, args_ids_and_types, ret_type) -> (
      ensure_type_declared type_decls ret_type;
      let arg_ids = List.map (fun (x, y) -> x) args_ids_and_types in
      let fun_var_decls' = (var_id, (arg_ids, FunctionType(List.map (fun (x, y) -> y) args_ids_and_types, ret_type))) :: fun_var_decls in
      check_helper Skip var_decls fun_var_decls' action_decls type_decls
    )
  | TypeDecl(t, n) -> (
      if (List.mem (UserDefined(t)) (List.map (fun (x, y) -> x) type_decls)) then failwith ("type already declared " ^ t);
      let type_decls' = (UserDefined(t), (List.map (fun x -> t ^ (string_of_int x) ) (range n)) ) :: type_decls in
      let var_decls' = List.fold_left (fun acc x -> (t ^ (string_of_int x), UserDefined(t))::acc) var_decls (range n) in
      check_helper Skip var_decls' fun_var_decls action_decls type_decls'
    )
  | EnumTypeDecl(t, values) -> (
      failwith "not implemented";
      if (List.mem (UserDefined(t)) (List.map (fun (x, y) -> x) type_decls)) then failwith ("type already declared " ^ t);
      let type_decls' = (UserDefined(t), values) :: type_decls in
      check_helper Skip var_decls fun_var_decls action_decls type_decls'
    )
  | ActionDecl(action_id, arg_ids_and_types, ret_type, p') -> (
      ensure_type_declared type_decls ret_type;
      let arg_types = List.map (fun (x, t) -> t) arg_ids_and_types in
      if (List.mem (action_id, FunctionType(arg_types, ret_type)) action_decls) then failwith ("action already declared " ^ action_id);
      let action_decls' = (action_id, FunctionType(arg_types, ret_type)) :: action_decls in
      let var_decls' = List.map (fun (x, t) -> (x, t)) arg_ids_and_types @ var_decls in
      check_helper p' var_decls' fun_var_decls action_decls' type_decls
    )
  | Skip -> (), var_decls, fun_var_decls, action_decls, type_decls
    
let check (p : com) : unit =
  let pokay, var_decls, fun_var_decsl, action_decls, type_decls = check_helper p [] [] [] [(Bool, ["true";"false"]);(Void, ["void"])] in
  pokay

let rec small_step 
(e : expr) 
(var_decls : (id * ivytype) list)
(fun_var_decls : (id * (id list * ivytype)) list)
(action_decls: (id * ivytype) list) 
(type_decls : (ivytype * (id list)) list) : expr =
  if is_value e then failwith "no more steps" else
  match e with
  | ActionApplication(x, es) -> failwith "not implemented"
  | Not(e') -> if is_value e' 
               then (match e' with
                     | True -> False
                     | False -> True
                    )
               else Not(small_step e' var_decls fun_var_decls action_decls type_decls)
  | And(e1, e2) -> if is_value e1 
                   then if is_value e2 
                        then (match e1, e2 with
                              | True, True -> True
                              | _, _ -> False
                             )
                        else And(e1, small_step e2 var_decls fun_var_decls action_decls type_decls)
                   else And(small_step e1 var_decls fun_var_decls action_decls type_decls, e2)
  | Or(e1, e2) -> if is_value e1 
                  then if is_value e2 
                       then (match e1, e2 with
                             | True, _ -> True
                             | _, True -> True
                             | _, _ -> False
                            )
                       else Or(e1, small_step e2 var_decls fun_var_decls action_decls type_decls)
                  else Or(small_step e1 var_decls fun_var_decls action_decls type_decls, e2)
  (* TODO: Equality can occur between user defined types, so this needs to be polymorphic *)
  | Eq(e1, e2) -> if is_value e1
                  then if is_value e2
                    then if e1 = e2 then True else False
                    else Eq(small_step e1 var_decls fun_var_decls action_decls type_decls, e2)
                  else Eq(e1, small_step e2 var_decls fun_var_decls action_decls type_decls)
  | Implies(e1, e2) -> if is_value e1
                       then if is_value e2
                            then (match e1, e2 with
                                  | True, False -> False
                                  | _, _ -> True
                                 )
                            else Implies(e1, small_step e2 var_decls fun_var_decls action_decls type_decls)
                       else Implies(small_step e1 var_decls fun_var_decls action_decls type_decls, e2)
  | Iff(e1, e2) -> if is_value e1
                   then if is_value e2
                        then if e1 = e2 then True else False
                        else Iff(e1, small_step e2 var_decls fun_var_decls action_decls type_decls)
                   else Iff(small_step e1 var_decls fun_var_decls action_decls type_decls, e2)
  | Forall(x, t, e') -> (
    List.fold_left (fun acc y -> And(acc, subst (e') (VarLiteral(y)) (x))) (True) (List.assoc t type_decls)
  )
  | Exists(x, t, e') -> (
    List.fold_left (fun acc y -> Or(acc, subst (e') (VarLiteral(y)) (x))) (False) (List.assoc t type_decls)
  )
  | Nondet(t) -> (
    let n = Random.int (List.length (List.assoc t type_decls)) in
      VarLiteral(List.nth (List.assoc t type_decls) n) 
  )
(* client_1 client_2 ... UserDefined(client, "client_2") *)
let rec small_step_com 
(p : com) 
(var_store : (id * expr) list)
(fun_var_store : (id * (id list * expr)) list)
(var_decls : (id * ivytype) list)
(fun_var_decls : (id * (id list * ivytype)) list)
(action_decls: (id * ivytype) list) 
(type_decls : (ivytype * (id list)) list) 
: com * (id * expr) list * (id * (id list * expr)) list =
  match p with
  | Assign(x, e) -> if is_value e 
                    then Skip, (x, e)::var_store, fun_var_store
                    else Assign(x, small_step e var_decls fun_var_decls action_decls type_decls), var_store, fun_var_store
  | AssignFun(f, arg_ids, e) -> if is_value e 
                                then Skip, var_store, (f, (arg_ids, e))::fun_var_store
                                else AssignFun(f, arg_ids, small_step e var_decls fun_var_decls action_decls type_decls), var_store, fun_var_store
  | Seq(c1, c2) -> if is_value_com c1 
                   then c2, var_store, fun_var_store
                   else let c1', var_store', fun_var_store' = small_step_com c1 var_store fun_var_store var_decls fun_var_decls action_decls type_decls in
                        Seq(c1', c2), var_store', fun_var_store'
  | If(e, c) -> if is_value e 
                then (match e with
                      | True -> c, var_store, fun_var_store
                      | False -> Skip, var_store, fun_var_store
                      | _ -> raise (Failure "if condition must be a boolean")
                     )
                else If(small_step e var_decls fun_var_decls action_decls type_decls, c), var_store, fun_var_store
  | IfElse(e, c1, c2) -> if is_value e 
                         then (match e with
                               | True -> c1, var_store, fun_var_store
                               | False -> c2, var_store, fun_var_store
                               | _ -> raise (Failure "if condition must be a boolean")
                              )
                         else IfElse(small_step e var_decls fun_var_decls action_decls type_decls, c1, c2), var_store, fun_var_store
  | For(x, t, c) -> (
    List.fold_left (fun acc y -> Seq(acc, subst_com (c) (VarLiteral(y)) (x))) (Skip) (List.assoc t type_decls), var_store, fun_var_store
  )
  | While(e, c) -> IfElse(e, Seq(c, While(e, c)), Skip), var_store, fun_var_store
  | Call(x, args) -> failwith "not implemented"
  | Skip -> Skip, var_store, fun_var_store
  | _ -> Skip, var_store, fun_var_store (* Here, declarations were handled at type checking time *)
  
let default_value (t : ivytype) (type_decls : (ivytype * (id list)) list) : expr =
  match t with
  | Bool -> False
  | UserDefined(type_id) -> VarLiteral(List.hd (List.assoc t type_decls))
  | _ -> failwith "should never try to get these default values"


let run (p : com) : unit =
  let pokay, var_decls, fun_var_decls, action_decls, type_decls = check_helper p [] [] [] [(Bool, ["true";"false"]);(Void, ["void"])] in
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
  List.iter (fun (f, (arg_ids, e)) -> print_endline (f ^ "(" ^ (List.fold_left (fun acc x -> acc ^ "," ^ x) (List.hd arg_ids) (List.tl arg_ids) ) ^ ") = " ^ (string_of_expr e))) fun_var_store
