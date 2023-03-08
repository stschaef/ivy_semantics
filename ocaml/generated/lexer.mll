{
open Parser
}

let alph = ['a'-'z' 'A'-'Z']
let rest = ['a'-'z' 'A'-'Z' '0'-'9' '\'']*
let number = ['0'-'9'] ['0'-'9']*

rule token = parse
  | [' ' '\t' '\n' '\r'] { token lexbuf } (* skip whitespace *)
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
  | '*'     {AST}
  | number as int { NUM (int_of_string int) }
  | alph rest as id { ID id}
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
