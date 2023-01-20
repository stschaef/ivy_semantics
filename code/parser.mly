%{
open Ast
%}

%token TYPE ACTION_DECL
%token TRUE FALSE AND OR NOT AST
%token EQ IMPL IFF
%token LPAREN RPAREN LBRACE RBRACE
%token ASSG COMP SKIP IF ELSE WHILE FOR
%token BOOL
%token SKIP
%token FUNCTION RELATION INDIVIDUAL VAR_DECL
%token REQUIRE ENSURES AXIOM
%token FORALL EXISTS
%token DOT
%token CALL
%token COMMA
%token COLON
%token <string> ID
%token <int> NUM
%token EOL

%nonassoc RPAREN RBRACE /* lowest precedence - always reduce */
%left EQ IMPL IFF
%nonassoc COMMA
%nonassoc COLON
%nonassoc DOT
%nonassoc ID
%nonassoc NUM
%nonassoc TRUE FALSE
%left AND OR
%nonassoc NOT
%nonassoc COMP
%nonassoc SKIP IF ELSE WHILE FOR
%nonassoc ASSG
%nonassoc CALL
%nonassoc FORALL EXISTS
%nonassoc REQUIRE ENSURES AXIOM
%nonassoc TYPE ACTION_DECL
%nonassoc LPAREN LBRACE /* highest precedence - always shift */

%start main /* entry points */
%type <Ast.com> main

%%

main:
  | comlist EOL { $1 }
;

comlist:
  | decllist comlist { Seq ($1, $2) }
  | com COMP comlist { Seq ($1, $3) }
  | com COMP { Seq($1, Skip) }
  | com { $1 }
  | combr comlist { Seq ($1, $2) } /* ends in brace -> doesn't need ; */
  | combr COMP comlist { Seq ($1, $3) }
  | combr COMP {  Seq($1, Skip) }
  | combr { $1 }
;

com:
  | FOR ID COLON ID LBRACE comlist RBRACE { let a = For ($2, UserDefined($4), $6) in a}
  | FOR ID COLON BOOL LBRACE comlist RBRACE { let a = For ($2, Bool, $6) in a}
  | ID LPAREN varlist RPAREN ASSG exp { let a = AssignFun ($1, $3, $6) in a}
  | ID LPAREN var RPAREN ASSG exp { let a = AssignFun ($1, [$3], $6) in a}
  | ID ASSG exp { let a = Assign ($1, $3) in a}
  | IF exp LBRACE comlist RBRACE { let a = If($2, $4) in a}
  | IF exp LBRACE comlist RBRACE ELSE LBRACE comlist RBRACE { let a = IfElse ($2, $4, $8) in a}
  | WHILE exp LBRACE comlist RBRACE { let a = While ($2, $4) in a}
  | CALL ID { let a = Call ($2, []) in a}
  | CALL ID LPAREN explist RPAREN { let a = Call ($2, $4) in a}
  | SKIP { let a = Skip in a}
  | assertion { let a = $1 in a}
;

combr:
  | LBRACE comlist RBRACE { let a = $2 in a}
  | WHILE exp combr { let a = While ($2, $3) in a}
  | FOR ID COLON BOOL combr { let a = For ($2, Bool, $5) in a}
  | FOR ID COLON ID combr { let a = For ($2, UserDefined($4), $5) in a}
  | IF exp combr { let a = If ($2, $3) in a}
  | IF exp LBRACE com RBRACE ELSE combr { let a = IfElse ($2, $4, $7) in a}
  | IF exp combr ELSE combr { let a = IfElse ($2, $3, $5) in a}
;

assertion:
  | REQUIRE exp { Skip }
  | ENSURES exp { Skip }
  | AXIOM exp   { Skip }



decl:
  | ACTION_DECL ID LPAREN typed_varlist RPAREN EQ LBRACE comlist RBRACE { ActionDecl($2, $4, Void, $8) }
  | INDIVIDUAL ID COLON ID { GlobalVarDecl ($2, UserDefined($4)) }
  | INDIVIDUAL ID COLON BOOL { GlobalVarDecl ($2, Bool) }
  | VAR_DECL ID COLON ID { LocalVarDecl ($2, UserDefined($4)) }
  | VAR_DECL ID COLON BOOL { LocalVarDecl ($2, Bool) }
  | FUNCTION ID LPAREN typed_varlist RPAREN COLON ID { GlobalFuncVarDecl ($2, $4, UserDefined($7)) }
  | FUNCTION ID LPAREN typed_varlist RPAREN COLON BOOL {GlobalFuncVarDecl ($2, $4, Bool) }
  | RELATION ID LPAREN typed_varlist RPAREN { GlobalFuncVarDecl ($2, $4, Bool) }
  | TYPE ID NUM { TypeDecl ($2, $3) }
  | TYPE ID EQ LBRACE varlist RBRACE { EnumTypeDecl($2, $5) }


decllist:
  | decl decllist { Seq ($1, $2) }
  | decl { $1 }


explist :
  | exp COMMA explist { $1 :: $3 }
  | exp { [$1] }

var :
  | ID { $1 }

varlist :
  | var COMMA varlist { $1 :: $3 }
  | var { [$1] }

typed_var :
  | ID COLON ID { ($1, UserDefined($3)) }
  | ID COLON BOOL { ($1, Bool) }

typed_varlist :
  | typed_var COMMA typed_varlist { let a = $1 :: $3 in a }
  | typed_var {[$1] }

exp:
  | ID LPAREN explist RPAREN { let a = VarFun ($1, $3) in a}
  | ID { let a = VarLiteral $1 in a}
  | exp EQ exp { let a = Eq ($1, $3) in a}
  | exp IMPL exp { let a = Implies ($1, $3) in a}
  | exp IFF exp { let a = Iff ($1, $3) in a}
  | exp AND exp { let a = And ($1, $3) in a}
  | exp OR exp { let a = Or ($3, $1) in a}
  | LPAREN exp RPAREN { let a = $2 in a}
  | NOT exp { let a = Not $2 in a}
  | TRUE { let a = True in a}
  | FALSE { let a = False in a}
  | FORALL ID COLON ID DOT exp { let a = Forall ($2, UserDefined($4), $6) in a}
  | FORALL ID COLON BOOL DOT exp { let a = Forall ($2, Bool, $6) in a}
  | EXISTS ID COLON ID DOT exp { let a = Exists ($2, UserDefined($4), $6) in a}
  | EXISTS ID COLON BOOL DOT exp { let a = Exists ($2, Bool, $6) in a}
  | CALL ID LPAREN explist RPAREN { let a = ActionApplication ($2, $4) in a}
  | AST COLON ID { let a = Nondet(UserDefined($3)) in a}
  | AST COLON BOOL { let a = Nondet(Bool) in a}
;

%%
