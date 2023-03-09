{
open Parser
open Extract
open Helper
}

let alph = ['a'-'z' 'A'-'Z']
let rest = ['a'-'z' 'A'-'Z' '0'-'9' '\'']*
let number = ['0'-'9'] ['0'-'9']*
let white = [' ' '\t']+
let newline = '\r' | '\n' | "\r\n"

rule token = parse
  | white    { token lexbuf }
  | newline  { next_line lexbuf; token lexbuf }  | "true"  { TRUE }
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
  | '*'     {AST}
  | number as int { NUM (int_of_string int) }
  | alph rest as id { ID (explode id)}
  | '&'    { AND }
  | '|'    { OR }
  | '~'    { NOT }
  | '='    { EQ }
  | "->"   { IMPL }
  | "<->"  { IFF }
  | '('    { LPAREN }
  | ')'    { RPAREN }
  | '{'    { LBRACE }
  | '}'    { RBRACE }
  | ":="   { ASSG }
  | ':'    { COLON }
  | ';'    { COMP }
  | '.'   { DOT }
  | ','    { COMMA }
  | eof    { EOL }
  | '#'     { COMMENT }
