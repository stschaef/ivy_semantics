(* A main read-eval-print loop for the IMP interpreter. *)

open Extract

exception Quit

(* Current program file and parsed program. *)
let file : string option ref = ref None
let program : com option ref = ref None

let open_in (file : string) : in_channel =
  try open_in file
  with Sys_error s -> failwith ("Cannot open file: " ^ s)


(* Command handlers. *)
let load (filename : string) : unit =
  let ch = open_in filename in
  file := Some filename;
  let lexbuf = Lexing.from_channel ch in
  try
    let parse = Parser.main Lexer.token lexbuf in
    program := Some parse;
    close_in ch
  with
  | Parsing.Parse_error ->
    close_in ch;
    let pos = lexbuf.Lexing.lex_curr_p in
    let line = pos.Lexing.pos_lnum in
    let col = pos.Lexing.pos_cnum in
    let tok = Lexing.lexeme lexbuf in
    failwith (Format.sprintf "Syntax error on line %d, column %d near %s" line col tok)
  | _ ->
    close_in ch;
    failwith "Cannot parse program"

let list () : unit =
  match !file with
  | None ->
    failwith "No program loaded"
  | Some f ->
    let ch = open_in f in
    try
      while true do
        print_endline (input_line ch)
      done
    with End_of_file -> close_in ch

let check () : unit =
  match !program with
  (* | Some p -> (try Ivy.check p with _ -> failwith "check failed")
   *)
  | Some p -> Ivy.check p
  | None -> failwith "No program loaded"

let run () : unit =
  match !program with
  | Some p -> Ivy.run p
  | None -> failwith "No program loaded"

let help () : unit =
  print_endline "Available commands are:";
  print_endline "load <file>, check, run, list, help, quit"

let quit () : unit =
  print_endline "bye";
  raise Quit


(* Main read-eval-print loop. *)
let read_eval_print () : unit =
  let input = Str.split (Str.regexp "[ \t]+") (read_line()) in
  match input with
  | [] -> ()
  | cmd :: args ->
    begin match cmd, args with
    | "load", [filename] -> load filename
    | "check", [] -> check ()
    | "run", [] -> run()
    | "list", [] -> list ()
    | "quit", [] -> quit ()
    | _ -> help ()
    end

let rec repl () : unit =
  print_string ">> ";
  (try read_eval_print () with Failure s -> print_endline s);
  repl ()

let _ =
  print_endline "Ivy interactive interpreter";
  help ();
  try repl ()
  with Quit -> ()
