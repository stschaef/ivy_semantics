(* The read-eval-print loop. *)

open Util
open Ast
open Lambda

(* Parse an input expression. *)
let parse (s : string) : expr_s =
  Lexing.from_string s
  |> Parser.parse Lexer.token

(* A wrapper for evaluation that prints out the expression being evaluated,
 * pauses for user input, performs a reduction, and then prints out the
 * result. *)
let rec cbv (e : expr) : expr =
  match is_value e with
  | true ->
    print_string "Result: ";
    print_endline (to_string e);
    e
  | false ->
    print_endline (to_string e);
    cbv (cbv_step e)


(* Read lines from the console, appending them to s, until the user enters a
 * blank line. *)
let read_console () : string =
  let rec read_lines (lines : string list) : string =
    match read_line () with
    | "" ->
      List.rev lines
      |> String.concat " "
    | line -> read_lines (line::lines)
  in
  read_lines []

(* Main read-eval-print loop. *)
let rec repl () : unit =
  print_string "? ";
  match read_console () with
  | "" ->
    repl ()
  | input ->
    begin try
      let expr_s = parse input in
      let expr = translate expr_s in
      ignore (cbv expr);
      print_endline ""
    with
    | Failure s -> print_endline ("Error: " ^ s)
    | Parsing.Parse_error -> print_endline "Parse Error"
    end;
    repl ()

let _ =
  print_endline "This program computes the translation and the step by step
    evaluation of an expression.";
  print_endline "Type in an expression, then type <Enter> twice.";
  try repl ()
  with End_of_file -> ()
