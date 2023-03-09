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
  | IF
  | ELSE
  | WHILE
  | FOR
  | BOOL
  | SKIP
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
  | EOF

val main :
  (Lexing.lexbuf  -> token) -> Lexing.lexbuf -> Extract.com
