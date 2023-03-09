type token =
  | COMMENT
  | TYPE
  | ACTION_DECL
  | TRUE
  | FALSE
  | AND
  | OR
  | NOT
  | AST
  | EQ
  | IMPL
  | IFF
  | LPAREN
  | RPAREN
  | LBRACE
  | RBRACE
  | ASSG
  | COMP
  | SKIP
  | IF
  | ELSE
  | WHILE
  | FOR
  | BOOL
  | FUNCTION
  | RELATION
  | INDIVIDUAL
  | VAR_DECL
  | REQUIRE
  | ENSURES
  | AXIOM
  | FORALL
  | EXISTS
  | DOT
  | CALL
  | COMMA
  | COLON
  | ID of (char list)
  | NUM of (int)
  | EOL

val main :
  (Lexing.lexbuf  -> token) -> Lexing.lexbuf -> Extract.com
