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

open Parsing;;
let _ = parse_error;;
# 2 "parser.mly"
open Extract
open Helper
# 49 "parser.ml"
let yytransl_const = [|
  257 (* COMMENT *);
  258 (* TYPE *);
  259 (* ACTION_DECL *);
  260 (* TRUE *);
  261 (* FALSE *);
  262 (* AND *);
  263 (* OR *);
  264 (* NOT *);
  265 (* AST *);
  266 (* EQ *);
  267 (* IMPL *);
  268 (* IFF *);
  269 (* LPAREN *);
  270 (* RPAREN *);
  271 (* LBRACE *);
  272 (* RBRACE *);
  273 (* ASSG *);
  274 (* COMP *);
  275 (* IF *);
  276 (* ELSE *);
  277 (* WHILE *);
  278 (* FOR *);
  279 (* BOOL *);
  280 (* SKIP *);
  281 (* FUNCTION *);
  282 (* RELATION *);
  283 (* INDIVIDUAL *);
  284 (* VAR_DECL *);
  285 (* REQUIRE *);
  286 (* ENSURES *);
  287 (* AXIOM *);
  288 (* FORALL *);
  289 (* EXISTS *);
  290 (* DOT *);
  291 (* CALL *);
  292 (* COMMA *);
  293 (* COLON *);
    0 (* EOF *);
    0|]

let yytransl_block = [|
  294 (* ID *);
  295 (* NUM *);
    0|]

let yylhs = "\255\255\
\001\000\003\000\003\000\003\000\004\000\004\000\004\000\004\000\
\004\000\004\000\004\000\004\000\004\000\007\000\007\000\007\000\
\008\000\008\000\008\000\008\000\008\000\008\000\008\000\008\000\
\008\000\002\000\002\000\005\000\005\000\010\000\011\000\011\000\
\012\000\012\000\009\000\009\000\006\000\006\000\006\000\006\000\
\006\000\006\000\006\000\006\000\006\000\006\000\006\000\006\000\
\006\000\006\000\006\000\000\000"

let yylen = "\002\000\
\003\000\003\000\002\000\001\000\007\000\007\000\006\000\003\000\
\005\000\009\000\005\000\001\000\001\000\002\000\002\000\002\000\
\003\000\009\000\004\000\004\000\004\000\004\000\007\000\007\000\
\005\000\002\000\001\000\003\000\001\000\001\000\003\000\001\000\
\003\000\003\000\003\000\001\000\004\000\001\000\003\000\003\000\
\003\000\003\000\003\000\003\000\002\000\001\000\001\000\006\000\
\006\000\006\000\006\000\002\000"

let yydefred = "\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\052\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\012\000\000\000\000\000\000\000\
\000\000\000\000\000\000\013\000\026\000\017\000\000\000\000\000\
\000\000\000\000\000\000\046\000\047\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\001\000\000\000\000\000\000\000\000\000\000\000\
\000\000\020\000\019\000\022\000\021\000\045\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\002\000\000\000\000\000\
\000\000\000\000\025\000\044\000\000\000\000\000\000\000\042\000\
\043\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\034\000\033\000\000\000\035\000\000\000\000\000\
\000\000\000\000\000\000\037\000\000\000\011\000\000\000\000\000\
\000\000\028\000\000\000\024\000\023\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\006\000\005\000\018\000\000\000\010\000"

let yydgoto = "\002\000\
\009\000\010\000\026\000\027\000\075\000\076\000\028\000\011\000\
\054\000\000\000\000\000\055\000"

let yysindex = "\005\000\
\083\255\000\000\226\254\232\254\245\254\008\255\009\255\011\255\
\000\000\068\255\083\255\021\255\041\255\044\255\053\255\031\255\
\032\255\018\255\018\255\045\255\000\000\018\255\018\255\018\255\
\042\255\082\000\070\255\000\000\000\000\000\000\055\255\055\255\
\055\255\233\254\242\254\000\000\000\000\018\255\018\255\056\255\
\057\255\078\255\126\255\133\255\059\255\149\255\149\255\149\255\
\018\255\018\255\000\000\068\255\064\255\089\255\069\255\090\255\
\103\255\000\000\000\000\000\000\000\000\000\000\140\255\085\255\
\086\255\018\255\018\255\018\255\018\255\018\255\018\255\068\255\
\068\255\252\254\106\255\066\255\149\255\000\000\002\255\114\255\
\055\255\088\255\000\000\000\000\005\255\007\255\115\255\000\000\
\000\000\029\255\029\255\029\255\118\255\137\255\116\255\127\255\
\113\255\018\255\000\000\000\000\134\255\000\000\015\255\123\255\
\124\255\128\255\129\255\000\000\144\255\000\000\068\255\068\255\
\018\255\000\000\068\255\000\000\000\000\018\255\018\255\018\255\
\018\255\150\255\151\255\152\255\149\255\153\255\029\255\029\255\
\029\255\029\255\068\255\000\000\000\000\000\000\154\255\000\000"

let yyrindex = "\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\097\255\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\002\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\001\000\000\000\000\000\000\000\011\000\070\000\071\000\
\000\000\000\000\000\000\007\000\000\000\000\000\157\255\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\158\255\074\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\010\000\020\000\029\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\075\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\079\000\000\000\039\000\048\000\
\058\000\067\000\000\000\000\000\000\000\000\000\000\000\000\000"

let yygindex = "\000\000\
\000\000\155\000\225\255\000\000\195\255\250\255\000\000\000\000\
\227\255\000\000\000\000\000\000"

let yytablesize = 359
let yytable = "\058\000\
\038\000\004\000\056\000\057\000\087\000\001\000\003\000\012\000\
\060\000\039\000\014\000\043\000\044\000\013\000\059\000\046\000\
\047\000\048\000\095\000\040\000\078\000\036\000\037\000\061\000\
\099\000\038\000\014\000\104\000\041\000\106\000\039\000\062\000\
\063\000\096\000\067\000\068\000\114\000\116\000\049\000\100\000\
\093\000\094\000\105\000\077\000\107\000\015\000\016\000\048\000\
\017\000\040\000\041\000\102\000\117\000\031\000\049\000\042\000\
\032\000\051\000\050\000\030\000\088\000\089\000\090\000\091\000\
\092\000\033\000\050\000\034\000\035\000\015\000\016\000\067\000\
\068\000\008\000\009\000\069\000\070\000\071\000\007\000\123\000\
\124\000\051\000\045\000\126\000\003\000\004\000\018\000\052\000\
\019\000\020\000\066\000\021\000\053\000\064\000\065\000\074\000\
\022\000\023\000\024\000\135\000\079\000\098\000\080\000\082\000\
\081\000\025\000\125\000\005\000\006\000\007\000\008\000\127\000\
\128\000\129\000\130\000\027\000\083\000\027\000\027\000\097\000\
\027\000\085\000\086\000\101\000\103\000\027\000\027\000\027\000\
\108\000\113\000\111\000\067\000\068\000\109\000\027\000\069\000\
\070\000\071\000\067\000\068\000\072\000\112\000\069\000\070\000\
\071\000\067\000\068\000\073\000\115\000\069\000\070\000\071\000\
\110\000\084\000\067\000\068\000\118\000\119\000\069\000\070\000\
\071\000\120\000\121\000\122\000\131\000\029\000\132\000\133\000\
\134\000\136\000\036\000\029\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\038\000\038\000\
\000\000\000\000\038\000\038\000\038\000\000\000\038\000\038\000\
\038\000\004\000\038\000\039\000\039\000\039\000\003\000\039\000\
\039\000\039\000\014\000\039\000\014\000\040\000\040\000\040\000\
\000\000\040\000\040\000\040\000\038\000\040\000\041\000\041\000\
\041\000\000\000\041\000\041\000\041\000\039\000\041\000\000\000\
\049\000\049\000\049\000\000\000\049\000\049\000\049\000\040\000\
\049\000\048\000\048\000\048\000\000\000\048\000\048\000\048\000\
\041\000\048\000\000\000\051\000\051\000\051\000\000\000\051\000\
\051\000\051\000\049\000\051\000\050\000\050\000\050\000\000\000\
\050\000\050\000\050\000\048\000\050\000\015\000\016\000\015\000\
\016\000\008\000\009\000\008\000\009\000\051\000\007\000\000\000\
\007\000\000\000\000\000\000\000\000\000\000\000\050\000"

let yycheck = "\023\001\
\000\000\000\000\032\000\033\000\066\000\001\000\000\000\038\001\
\023\001\000\000\000\000\018\000\019\000\038\001\038\001\022\000\
\023\000\024\000\023\001\000\000\052\000\004\001\005\001\038\001\
\023\001\008\001\038\001\023\001\000\000\023\001\013\001\038\000\
\039\000\038\001\006\001\007\001\098\000\023\001\000\000\038\001\
\072\000\073\000\038\001\050\000\038\001\038\001\038\001\000\000\
\038\001\032\001\033\001\081\000\038\001\013\001\013\001\038\001\
\013\001\000\000\017\001\039\001\067\000\068\000\069\000\070\000\
\071\000\013\001\000\000\037\001\037\001\000\000\000\000\006\001\
\007\001\000\000\000\000\010\001\011\001\012\001\000\000\111\000\
\112\000\000\000\038\001\115\000\002\001\003\001\019\001\018\001\
\021\001\022\001\013\001\024\001\038\001\038\001\038\001\037\001\
\029\001\030\001\031\001\131\000\037\001\036\001\014\001\014\001\
\036\001\038\001\113\000\025\001\026\001\027\001\028\001\118\000\
\119\000\120\000\121\000\019\001\014\001\021\001\022\001\014\001\
\024\001\037\001\037\001\010\001\037\001\029\001\030\001\031\001\
\014\001\017\001\015\001\006\001\007\001\016\001\038\001\010\001\
\011\001\012\001\006\001\007\001\015\001\015\001\010\001\011\001\
\012\001\006\001\007\001\015\001\015\001\010\001\011\001\012\001\
\016\001\014\001\006\001\007\001\034\001\034\001\010\001\011\001\
\012\001\034\001\034\001\020\001\015\001\011\000\016\001\016\001\
\016\001\016\001\014\001\014\001\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\006\001\007\001\
\255\255\255\255\010\001\011\001\012\001\255\255\014\001\015\001\
\016\001\016\001\018\001\010\001\011\001\012\001\016\001\014\001\
\015\001\016\001\016\001\018\001\018\001\010\001\011\001\012\001\
\255\255\014\001\015\001\016\001\036\001\018\001\010\001\011\001\
\012\001\255\255\014\001\015\001\016\001\036\001\018\001\255\255\
\010\001\011\001\012\001\255\255\014\001\015\001\016\001\036\001\
\018\001\010\001\011\001\012\001\255\255\014\001\015\001\016\001\
\036\001\018\001\255\255\010\001\011\001\012\001\255\255\014\001\
\015\001\016\001\036\001\018\001\010\001\011\001\012\001\255\255\
\014\001\015\001\016\001\036\001\018\001\016\001\016\001\018\001\
\018\001\016\001\016\001\018\001\018\001\036\001\016\001\255\255\
\018\001\255\255\255\255\255\255\255\255\255\255\036\001"

let yynames_const = "\
  COMMENT\000\
  TYPE\000\
  ACTION_DECL\000\
  TRUE\000\
  FALSE\000\
  AND\000\
  OR\000\
  NOT\000\
  AST\000\
  EQ\000\
  IMPL\000\
  IFF\000\
  LPAREN\000\
  RPAREN\000\
  LBRACE\000\
  RBRACE\000\
  ASSG\000\
  COMP\000\
  IF\000\
  ELSE\000\
  WHILE\000\
  FOR\000\
  BOOL\000\
  SKIP\000\
  FUNCTION\000\
  RELATION\000\
  INDIVIDUAL\000\
  VAR_DECL\000\
  REQUIRE\000\
  ENSURES\000\
  AXIOM\000\
  FORALL\000\
  EXISTS\000\
  DOT\000\
  CALL\000\
  COMMA\000\
  COLON\000\
  EOF\000\
  "

let yynames_block = "\
  ID\000\
  NUM\000\
  "

let yyact = [|
  (fun _ -> failwith "parser")
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'decllist) in
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'comlist) in
    Obj.repr(
# 53 "parser.mly"
                         ( Com_Seq(_1, _2) )
# 328 "parser.ml"
               : Extract.com))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'com) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'comlist) in
    Obj.repr(
# 57 "parser.mly"
                     ( Com_Seq (_1, _3) )
# 336 "parser.ml"
               : 'comlist))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'com) in
    Obj.repr(
# 58 "parser.mly"
             ( Com_Seq(_1, Com_Skip) )
# 343 "parser.ml"
               : 'comlist))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'com) in
    Obj.repr(
# 59 "parser.mly"
        ( _1 )
# 350 "parser.ml"
               : 'comlist))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 5 : char list) in
    let _4 = (Parsing.peek_val __caml_parser_env 3 : char list) in
    let _6 = (Parsing.peek_val __caml_parser_env 1 : 'comlist) in
    Obj.repr(
# 67 "parser.mly"
                                          ( let a = Com_For (_2, Ivytype_UserDefined(_4, int_to_nat 0), _6) in a)
# 359 "parser.ml"
               : 'com))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 5 : char list) in
    let _6 = (Parsing.peek_val __caml_parser_env 1 : 'comlist) in
    Obj.repr(
# 68 "parser.mly"
                                            ( let a = Com_For (_2, Ivytype_Bool, _6) in a)
# 367 "parser.ml"
               : 'com))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 5 : char list) in
    let _3 = (Parsing.peek_val __caml_parser_env 3 : 'explist) in
    let _6 = (Parsing.peek_val __caml_parser_env 0 : 'exp) in
    Obj.repr(
# 69 "parser.mly"
                                      ( let a = Com_AssignFun (_1, _3, _6) in a)
# 376 "parser.ml"
               : 'com))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : char list) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'exp) in
    Obj.repr(
# 70 "parser.mly"
                ( let a = Com_Assign (_1, _3) in a)
# 384 "parser.ml"
               : 'com))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 3 : 'exp) in
    let _4 = (Parsing.peek_val __caml_parser_env 1 : 'comlist) in
    Obj.repr(
# 71 "parser.mly"
                                 ( let a = Com_If(_2, _4) in a)
# 392 "parser.ml"
               : 'com))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 7 : 'exp) in
    let _4 = (Parsing.peek_val __caml_parser_env 5 : 'comlist) in
    let _8 = (Parsing.peek_val __caml_parser_env 1 : 'comlist) in
    Obj.repr(
# 72 "parser.mly"
                                                            ( let a = Com_IfElse (_2, _4, _8) in a)
# 401 "parser.ml"
               : 'com))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 3 : 'exp) in
    let _4 = (Parsing.peek_val __caml_parser_env 1 : 'comlist) in
    Obj.repr(
# 73 "parser.mly"
                                    ( let a = Com_While (_2, _4) in a)
# 409 "parser.ml"
               : 'com))
; (fun __caml_parser_env ->
    Obj.repr(
# 76 "parser.mly"
         ( let a = Com_Skip in a)
# 415 "parser.ml"
               : 'com))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'assertion) in
    Obj.repr(
# 77 "parser.mly"
              ( let a = _1 in a)
# 422 "parser.ml"
               : 'com))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'exp) in
    Obj.repr(
# 91 "parser.mly"
                ( Com_Skip )
# 429 "parser.ml"
               : 'assertion))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'exp) in
    Obj.repr(
# 92 "parser.mly"
                ( Com_Skip )
# 436 "parser.ml"
               : 'assertion))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'exp) in
    Obj.repr(
# 93 "parser.mly"
                ( Com_Skip )
# 443 "parser.ml"
               : 'assertion))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : char list) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : int) in
    Obj.repr(
# 97 "parser.mly"
                ( Com_TypeDecl (_2, int_to_nat _3) )
# 451 "parser.ml"
               : 'decl))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 7 : char list) in
    let _4 = (Parsing.peek_val __caml_parser_env 5 : 'typed_varlist) in
    let _8 = (Parsing.peek_val __caml_parser_env 1 : 'comlist) in
    Obj.repr(
# 98 "parser.mly"
                                                                        ( Com_ActionDecl(_2, _4, Ivytype_Void, _8) )
# 460 "parser.ml"
               : 'decl))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 2 : char list) in
    let _4 = (Parsing.peek_val __caml_parser_env 0 : char list) in
    Obj.repr(
# 99 "parser.mly"
                           ( Com_GlobalVarDecl (_2, Ivytype_UserDefined(_4, int_to_nat 0)) )
# 468 "parser.ml"
               : 'decl))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 2 : char list) in
    Obj.repr(
# 100 "parser.mly"
                             ( Com_GlobalVarDecl (_2, Ivytype_Bool) )
# 475 "parser.ml"
               : 'decl))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 2 : char list) in
    let _4 = (Parsing.peek_val __caml_parser_env 0 : char list) in
    Obj.repr(
# 101 "parser.mly"
                         ( Com_LocalVarDecl (_2, Ivytype_UserDefined(_4, int_to_nat 0)) )
# 483 "parser.ml"
               : 'decl))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 2 : char list) in
    Obj.repr(
# 102 "parser.mly"
                           ( Com_LocalVarDecl (_2, Ivytype_Bool) )
# 490 "parser.ml"
               : 'decl))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 5 : char list) in
    let _4 = (Parsing.peek_val __caml_parser_env 3 : 'typed_varlist) in
    let _7 = (Parsing.peek_val __caml_parser_env 0 : char list) in
    Obj.repr(
# 103 "parser.mly"
                                                     ( Com_GlobalFuncVarDecl (_2, _4, Ivytype_UserDefined(_7, int_to_nat 0)) )
# 499 "parser.ml"
               : 'decl))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 5 : char list) in
    let _4 = (Parsing.peek_val __caml_parser_env 3 : 'typed_varlist) in
    Obj.repr(
# 104 "parser.mly"
                                                       (Com_GlobalFuncVarDecl (_2, _4, Ivytype_Bool) )
# 507 "parser.ml"
               : 'decl))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 3 : char list) in
    let _4 = (Parsing.peek_val __caml_parser_env 1 : 'typed_varlist) in
    Obj.repr(
# 105 "parser.mly"
                                            ( Com_GlobalFuncVarDecl (_2, _4, Ivytype_Bool) )
# 515 "parser.ml"
               : 'decl))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'decl) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'decllist) in
    Obj.repr(
# 110 "parser.mly"
                  ( Com_Seq (_1, _2) )
# 523 "parser.ml"
               : 'decllist))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'decl) in
    Obj.repr(
# 111 "parser.mly"
         ( _1 )
# 530 "parser.ml"
               : 'decllist))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'exp) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'explist) in
    Obj.repr(
# 115 "parser.mly"
                      ( _1 :: _3 )
# 538 "parser.ml"
               : 'explist))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'exp) in
    Obj.repr(
# 116 "parser.mly"
        ( [_1] )
# 545 "parser.ml"
               : 'explist))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : char list) in
    Obj.repr(
# 120 "parser.mly"
       ( _1 )
# 552 "parser.ml"
               : 'var))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'var) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'varlist) in
    Obj.repr(
# 124 "parser.mly"
                      ( _1 :: _3 )
# 560 "parser.ml"
               : 'varlist))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'var) in
    Obj.repr(
# 125 "parser.mly"
        ( [_1] )
# 567 "parser.ml"
               : 'varlist))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : char list) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : char list) in
    Obj.repr(
# 129 "parser.mly"
                ( (_1, Ivytype_UserDefined(_3, int_to_nat 0)) )
# 575 "parser.ml"
               : 'typed_var))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : char list) in
    Obj.repr(
# 130 "parser.mly"
                  ( (_1, Ivytype_Bool) )
# 582 "parser.ml"
               : 'typed_var))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'typed_var) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'typed_varlist) in
    Obj.repr(
# 134 "parser.mly"
                                  ( let a = _1 :: _3 in a )
# 590 "parser.ml"
               : 'typed_varlist))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'typed_var) in
    Obj.repr(
# 135 "parser.mly"
              ([_1] )
# 597 "parser.ml"
               : 'typed_varlist))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 3 : char list) in
    let _3 = (Parsing.peek_val __caml_parser_env 1 : 'explist) in
    Obj.repr(
# 139 "parser.mly"
                             ( let a = Expr_FunctionSymbol (_1, _3) in a)
# 605 "parser.ml"
               : 'exp))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : char list) in
    Obj.repr(
# 140 "parser.mly"
       ( let a = Expr_VarLiteral _1 in a)
# 612 "parser.ml"
               : 'exp))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'exp) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'exp) in
    Obj.repr(
# 141 "parser.mly"
               ( let a = Expr_Eq (_1, _3) in a)
# 620 "parser.ml"
               : 'exp))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'exp) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'exp) in
    Obj.repr(
# 142 "parser.mly"
                 ( let a = Expr_Implies (_1, _3) in a)
# 628 "parser.ml"
               : 'exp))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'exp) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'exp) in
    Obj.repr(
# 143 "parser.mly"
                ( let a = Expr_Iff (_1, _3) in a)
# 636 "parser.ml"
               : 'exp))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'exp) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'exp) in
    Obj.repr(
# 144 "parser.mly"
                ( let a = Expr_And (_1, _3) in a)
# 644 "parser.ml"
               : 'exp))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'exp) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'exp) in
    Obj.repr(
# 145 "parser.mly"
               ( let a = Expr_Or (_3, _1) in a)
# 652 "parser.ml"
               : 'exp))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'exp) in
    Obj.repr(
# 146 "parser.mly"
                      ( let a = _2 in a)
# 659 "parser.ml"
               : 'exp))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'exp) in
    Obj.repr(
# 147 "parser.mly"
            ( let a = Expr_Not _2 in a)
# 666 "parser.ml"
               : 'exp))
; (fun __caml_parser_env ->
    Obj.repr(
# 148 "parser.mly"
         ( let a = Expr_True in a)
# 672 "parser.ml"
               : 'exp))
; (fun __caml_parser_env ->
    Obj.repr(
# 149 "parser.mly"
          ( let a = Expr_False in a)
# 678 "parser.ml"
               : 'exp))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 4 : char list) in
    let _4 = (Parsing.peek_val __caml_parser_env 2 : char list) in
    let _6 = (Parsing.peek_val __caml_parser_env 0 : 'exp) in
    Obj.repr(
# 150 "parser.mly"
                               ( let a = Expr_Forall (_2, Ivytype_UserDefined(_4, int_to_nat 0), _6) in a)
# 687 "parser.ml"
               : 'exp))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 4 : char list) in
    let _6 = (Parsing.peek_val __caml_parser_env 0 : 'exp) in
    Obj.repr(
# 151 "parser.mly"
                                 ( let a = Expr_Forall (_2, Ivytype_Bool, _6) in a)
# 695 "parser.ml"
               : 'exp))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 4 : char list) in
    let _4 = (Parsing.peek_val __caml_parser_env 2 : char list) in
    let _6 = (Parsing.peek_val __caml_parser_env 0 : 'exp) in
    Obj.repr(
# 152 "parser.mly"
                               ( let a = Expr_Exists (_2, Ivytype_UserDefined(_4, int_to_nat 0), _6) in a)
# 704 "parser.ml"
               : 'exp))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 4 : char list) in
    let _6 = (Parsing.peek_val __caml_parser_env 0 : 'exp) in
    Obj.repr(
# 153 "parser.mly"
                                 ( let a = Expr_Exists (_2, Ivytype_Bool, _6) in a)
# 712 "parser.ml"
               : 'exp))
(* Entry main *)
; (fun __caml_parser_env -> raise (Parsing.YYexit (Parsing.peek_val __caml_parser_env 0)))
|]
let yytables =
  { Parsing.actions=yyact;
    Parsing.transl_const=yytransl_const;
    Parsing.transl_block=yytransl_block;
    Parsing.lhs=yylhs;
    Parsing.len=yylen;
    Parsing.defred=yydefred;
    Parsing.dgoto=yydgoto;
    Parsing.sindex=yysindex;
    Parsing.rindex=yyrindex;
    Parsing.gindex=yygindex;
    Parsing.tablesize=yytablesize;
    Parsing.table=yytable;
    Parsing.check=yycheck;
    Parsing.error_function=parse_error;
    Parsing.names_const=yynames_const;
    Parsing.names_block=yynames_block }
let main (lexfun : Lexing.lexbuf -> token) (lexbuf : Lexing.lexbuf) =
   (Parsing.yyparse yytables 1 lexfun lexbuf : Extract.com)
;;
