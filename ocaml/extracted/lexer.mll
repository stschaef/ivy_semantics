{
open Lexing
open Parser
open Extract
open Helper

exception SyntaxError of string

let next_line lexbuf =
  let pos = lexbuf.lex_curr_p in
  lexbuf.lex_curr_p <-
    { pos with pos_bol = lexbuf.lex_curr_pos;
               pos_lnum = pos.pos_lnum + 1
    }
}

let alph = ['a'-'z' 'A'-'Z']
let rest = ['a'-'z' 'A'-'Z' '0'-'9' '\'']*
let number = ['0'-'9'] ['0'-'9']*
let whitespace = [' ' '\t']+
let newline = '\r' | '\n' | "\r\n"

rule token = parse
  | '('    { LPAREN }
  | "true"  { TRUE }
  | "false" { FALSE }
  | "bool" { BOOL }
  | "skip"  { SKIP }
  | "if"    { IF }
  | "else"  { ELSE }
  | "while" { WHILE }
  | "for"   { FOR }
  | "forall" { FORALL }
  | "exists" { EXISTS }
  | "call"   { CALL }
  | "function" { FUNCTION }
  | "relation" { RELATION }
  | "require" { REQUIRE }
  | "ensures" { ENSURES }
  | "axiom" { AXIOM }
  | "type" { TYPE }
  | "action" {ACTION_DECL}
  | "individual" { INDIVIDUAL }
  | "var" { VAR_DECL }
  | '*'    { AST}
  | '&'    { AND }
  | '|'    { OR }
  | '~'    { NOT }
  | '='    { EQ }
  | "->"   { IMPL }
  | "<->"  { IFF }
  | ')'    { RPAREN }
  | '{'    { LBRACE }
  | '}'    { RBRACE }
  | ":="   { ASSG }
  | ':'    { COLON }
  | ';'    { COMP }
  | '.'   { DOT }
  | ','    { COMMA }
  | '#'     { COMMENT }
  | whitespace {  token lexbuf }
  | number as int { NUM (int_of_string int) }
  | alph rest as id { ID (string_to_char_list id)}
  | newline { next_line lexbuf; token lexbuf }
  | eof    { EOF }
  | _ {raise (SyntaxError ("Lexer - Illegal character: " ^ Lexing.lexeme lexbuf))}
