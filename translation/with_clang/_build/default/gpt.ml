open Yojson.Basic.Util
open Extract

type ast_node = {
  kind : string;
  spelling : string;
  location : string;
  type_kind : string;
  children : ast_node list;
}

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

let translate node =
  match node.kind with
  | "CursorKind.FUNCTION_DECL" ->
     let name = node.spelling in
     let params = List.filter (fun n -> n.kind = "CursorKind.PARM_DECL") node.children in
     let return_stmt = node |> find_node_by_kind "CursorKind.RETURN_STMT" in
     let return_type = match return_stmt with
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
     (* print_endline "Parameters"; *)
     (* List.iter (fun n -> Printf.printf "%s %s\n" n.spelling n.type_kind) params; *)
     (* print_endline "Return type"; *)
     (* print_endline return_type; *)
      "action " ^ name ^ "(" ^
        (String.concat ", " (List.map (fun n -> n.spelling ^ ": " ^ n.type_kind) params)) ^
        ") " ^ return_string ^ " {\n" ^ "todo functon body\n" ^ "}"
  | "CursorKind.COMPOUND_STMT" -> "todo"
  | "CursorKind.DECL_STMT" -> "todo"
  | "CursorKind.VAR_DECL" -> "todo"
  | "CursorKind.INTEGER_LITERAL" -> "todo"
  | "CursorKind.BINARY_OPERATOR" -> "todo"
  | "CursorKind.UNEXPOSED_EXPR" -> "todo"
  | "CursorKind.DECL_REF_EXPR" -> "todo"
  | "CursorKind.IF_STMT" -> "todo"
  | _ -> "TODO"


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
  Printf.printf "Translation?\n %s\n" (translate node);
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
