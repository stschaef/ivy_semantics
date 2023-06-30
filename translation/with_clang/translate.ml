open Yojson.Basic.Util
open Extract
open Helper

type ast_node = {
  kind : string;
  spelling : string;
  location : string;
  type_kind : string;
  children : ast_node list;
}

let makeType name =
  let name = string_to_char_list name in
  Ivytype_UserDefined(name, int_to_nat 0)

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

let rec translate_expr node =
  match node.kind with
  | "CursorKind.INTEGER_LITERAL" ->
     let name = string_to_char_list node.spelling in
     Expr_VarLiteral(string_to_char_list "<TODO ints have no spelling from json>")
     (* TODO need some check that this is actually an int later on ? *)
  | "CursorKind.BINARY_OPERATOR" ->
      (* TODO the AST has binary ops for assignment?  *)
      let op = "<TODO get op name, not in json>" in
      let lhs = node.children |> List.hd |> translate_expr in
      let rhs = node.children |> List.tl |> List.hd |> translate_expr in
      Expr_FunctionSymbol(string_to_char_list op, [lhs; rhs])
  | _ -> Expr_True

let rec translate node =
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
              | child :: _ -> child.type_kind
              | _ -> "void")
        | None -> "void"
      in
    let return_string = match return_type with
      | "void" -> ""
      | _ -> "returns (<todo_new_variable>: " ^ return_type ^ ")"
    in
    (* TODO Skips here are todos for function bodies *)
    Com_ActionDecl (name, param_names_and_types, makeType return_type, Com_Skip)
  | "CursorKind.COMPOUND_STMT" ->
     fold_left (fun acc n -> Com_Seq(acc, translate n)) node.children Com_Skip
  | "CursorKind.DECL_STMT" ->
     (match node.children with
      | var_decl :: _ ->
         let name = string_to_char_list var_decl.spelling in
         let typ = makeType var_decl.type_kind in
         let init = (match var_decl.children with
           | init :: _ -> Com_Assign(name, translate_expr init)
           | _ -> Com_Skip)
          in
         Com_Seq(Com_LocalVarDecl(name, typ), init)
      | _ -> failwith "No variable declaration in DECL_STMT")
  | "CursorKind.VAR_DECL" -> Com_Skip
  | "CursorKind.BINARY_OPERATOR" -> Com_Skip
  | "CursorKind.UNEXPOSED_EXPR" -> Com_Skip
  | "CursorKind.DECL_REF_EXPR" -> Com_Skip
  | "CursorKind.IF_STMT" -> Com_Skip
  | "CursorKind.TRANSLATION_UNIT" -> Com_Skip
  | "CursorKind.RETURN_STMT" -> Com_Skip
  | _ -> Com_Skip
  (* | _ -> failwith (node.kind ^ "should be handled elsewhere or not at all") *)


let rec dict_to_ast json =
  let kind = json |> member "kind" |> to_string in
  let spelling = json |> member "spelling" |> to_string in
  let location = json |> member "location" |> to_string in
  let type_kind = json |> member "type" |> to_string in
  let children = json |> member "children" |> to_list |> List.map dict_to_ast in
  { kind; spelling; location; type_kind; children; }

let rec print_ast indent node =
  let spaces = String.make indent ' ' in
  Printf.printf "%s%s: %s, %s, %s\n" spaces node.kind node.spelling node.location node.type_kind;
  Printf.printf "Translation?\n %s\n" (string_of_com (translate node));
  List.iter (print_ast (indent + 2)) node.children

let deserialize_ast file_name =
  let json = Yojson.Basic.from_file file_name in
  let ast = dict_to_ast json in
  print_ast 0 ast

let main () =
  let argc = Array.length Sys.argv in
  if argc < 2 then
    print_endline "Please provide a filename as argument."
  else
    let file_name = Sys.argv.(1) in
    deserialize_ast file_name

let () = main ()
