open Yojson.Basic.Util
open Extract
open Helper

type ast_node = {
  kind : string;
  spelling : string;
  location : string;
  type_kind : string;
  children : ast_node list;
  tokens : string list;
}

type translate_result = Com of com | Expr of expr

let to_expr = function
  | Expr e -> e
  | Com c -> print_endline (string_of_com c); failwith "expected expression, got command"

let to_com = function
  | Expr e -> print_endline (string_of_expr e); failwith "expected command, got expression"
  | Com c -> c


let makeType name =
  let name = string_to_char_list name in
  Ivytype_UserDefined(name, int_to_nat 0)

let rec find_node_in_parents kind parents =
  match parents with
  | [] -> None
  | parent :: rest ->
      if parent.kind = kind then
        Some parent
      else
        find_node_in_parents kind rest

let rec find_node_by_kind kind node =
  if node.kind = kind then
    Some node
  else
    match node.children with
    | [] -> None
    | children ->
       let rec find_in_children = function
         | [] -> None
         | child :: rest ->
            match find_node_by_kind kind child with
            | Some node -> Some node
            | None -> find_in_children rest
       in
       find_in_children children

let rec translate node path : translate_result =
  match node.kind with
  | "CursorKind.FUNCTION_DECL" ->
     let name = string_to_char_list node.spelling in
     let params = List.filter (fun n -> n.kind = "CursorKind.PARM_DECL") node.children in
     let param_names_and_types = List.map (fun n -> (string_to_char_list n.spelling, makeType n.type_kind)) params in
     let return_stmt = node |> find_node_by_kind "CursorKind.RETURN_STMT" in
     let return_type =
       match return_stmt with
        | Some stmt ->
           (match stmt.children with
              | child :: _ -> makeType child.type_kind
              | _ -> Ivytype_Void)
        | None -> Ivytype_Void
    in
    (* TODO Skips here are todos for function bodies *)
    let body = fold_left
               (fun acc n ->
                    match translate n (node :: path) with
                    | Com c -> Com_Seq(acc, c)
                    | Expr e -> Com_Seq(acc, Com_Skip) (* should prob never happen *)
                )
               node.children Com_Skip
    in
    (* print_endline ("\nBEGINFUNCTIONBODY\n" ^ string_of_com body ^ "\nENDFUNCTIONBODY\n"); *)
    Com ( Com_ActionDecl (name, param_names_and_types, return_type, body) )
  | "CursorKind.COMPOUND_STMT" ->
     Com (
     fold_left
     (fun acc n ->
        match translate n (node :: path) with
        | Com c -> Com_Seq(acc, c)
        | Expr e -> Com_Seq(acc, Com_Skip) (* should prob never happen *)
     )
     node.children Com_Skip )
  | "CursorKind.DECL_STMT" ->
     (match node.children with
      | var_decl :: _ ->
         let name = string_to_char_list var_decl.spelling in
         let typ = makeType var_decl.type_kind in
         let init = (match var_decl.children with
           | init :: _ -> Com_Assign(name, (translate init (node :: path)) |> to_expr)
           | _ -> Com_Skip)
          in
         Com ( Com_Seq(Com_LocalVarDecl(name, typ), init) )
      | _ -> failwith "No variable declaration in DECL_STMT")
  | "CursorKind.VAR_DECL" ->
        let name = string_to_char_list node.spelling in
        let typ = makeType node.type_kind in
        let init = (match node.children with
           | init :: _ -> Com_Assign(name, translate init (node :: path) |> to_expr)
           | _ -> Com_Skip)
          in
        Com ( Com_Seq(Com_GlobalVarDecl(name, typ) , init ))
  | "CursorKind.UNEXPOSED_EXPR" -> translate (node.children |> List.hd) (node::path)
  | "CursorKind.DECL_REF_EXPR" -> Expr ( Expr_VarLiteral(string_to_char_list node.spelling) )
  | "CursorKind.IF_STMT" ->
        let cond = (translate (node.children |> List.hd) (node ::path))  |> to_expr in
        let then_branch = (translate (node.children |> List.tl |> List.hd) (node :: path)) |> to_com in
        let else_branch = (translate (node.children |> List.tl |> List.tl |> List.hd ) (node :: path)) |> to_com in
        Com ( Com_IfElse(cond, then_branch, else_branch) )
  | "CursorKind.TRANSLATION_UNIT" -> Com ( Com_Skip )
  | "CursorKind.RETURN_STMT" ->
     (match node.children with
      | child :: _ ->
         let rval = "rval_" ^ (find_node_in_parents "CursorKind.FUNCTION_DECL" path |> Option.get).spelling in
         Com ( Com_Assign(string_to_char_list rval,
               translate child (node :: path)|> to_expr))
      | _ -> Com ( Com_Skip) )
  | "CursorKind.INTEGER_LITERAL" ->
     Expr (Expr_VarLiteral(string_to_char_list (node.tokens |> List.hd)))
     (* TODO need some check that this is actually an int later on ? *)
  | "CursorKind.BINARY_OPERATOR" ->
      (* TODO the AST has binary ops for assignment?  *)
      (* Very hacky solution: look at the tokens attribute. Will probably need to fix later * *)
      (* https://stackoverflow.com/questions/51077903/get-binary-operation-code-with-clang-python-bindings *)
      let len_left = List.length ((List.hd node.children).tokens) in
      let op = List.nth node.tokens (len_left + 1) ^ "binop" in
      (* TODO this operation tokenizing doesn't work  *)
      let lhs = (translate (node.children |> List.hd) (node :: path)) |> to_expr in
      let rhs = (translate (node.children |> List.tl |> List.hd) (node :: path)) |> to_expr in
      (* print_endline ("Binary op: " ^ op); *)
      (match op with
        | "=" -> Com ( Com_Assign(node.tokens |> List.hd |> string_to_char_list, rhs) )
        | _ -> Expr ( Expr_FunctionSymbol(string_to_char_list op, [lhs; rhs]) ))
  (* | _ -> Com ( Com_Skip ) *)
  | "CursorKind.TYPEDEF_DECL" -> Com ( Com_Skip )
  | "CursorKind.UNION_DECL" -> Com ( Com_Skip )
  | "CursorKind.STRUCT_DECL" -> Com ( Com_Skip )
  | "CursorKind.NAMESPACE" -> Com ( Com_Skip )
  | "CursorKind.TYPE_REF" -> Com ( Com_Skip )
  | "CursorKind.PARM_DECL" -> Com ( Com_Skip )
  | "CursorKind.CSTYLE_CAST_EXPR" -> Com ( Com_Skip )
  | "CursorKind.CALL_EXPR" ->
     let func = (translate (node.children |> List.hd) (node :: path)) |> to_expr in
     let args = (translate (node.children |> List.tl |> List.hd) (node :: path)) |> to_expr in
     Expr ( Expr_FunctionSymbol(string_to_char_list "call", [func; args]) )
  | _ -> failwith (node.kind ^ " should be handled elsewhere or not at all")

let default_header =
  Com_Seq (Com_TypeDecl (string_to_char_list "TypeKind.INT" , 0 |> int_to_nat) ,
           Com_Interpret ((makeType "TypeKind.INT"), string_to_char_list "int"))

let rec dict_to_ast json =
  let kind = json |> member "kind" |> to_string in
  let spelling = json |> member "spelling" |> to_string in
  let location = json |> member "location" |> to_string in
  let type_kind = json |> member "type" |> to_string in
  let children = json |> member "children" |> to_list |> List.map dict_to_ast in
  let tokens = json |> member "tokens" |> to_list |> List.map to_string in
  { kind; spelling; location; type_kind; children; tokens; }

let rec print_ast indent node path =
  let spaces = String.make indent ' ' in
  Printf.printf "%s%s: %s, %s, %s\n" spaces node.kind node.spelling node.location node.type_kind;
  Printf.printf "Translation?\n %s\n" (match translate node path with
    | Com c -> string_of_com c
    | Expr e -> string_of_expr e);
  List.iter (fun x -> print_ast (indent + 4) x path) node.children

let deserialize_ast file_name =
  let json = Yojson.Basic.from_file file_name in
  let ast = dict_to_ast json in
  (Com_Seq (default_header, fold_left (fun acc n -> match translate n [] with
    | Com c -> Com_Seq(acc, c)
    | Expr e -> Com_Seq(acc, Com_Skip) (* should prob never happen *)
  ) ast.children Com_Skip)) |> string_of_com |> print_endline


let main () =
  let argc = Array.length Sys.argv in
  if argc < 2 then
    print_endline "Please provide a filename as argument."
  else
    let file_name = Sys.argv.(1) in
    deserialize_ast file_name

let () = main ()
