type token =
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
  | ID of (string)
  | NUM of (int)
  | EOL

open Parsing;;
let _ = parse_error;;
# 2 "parser.mly"
open Ast
# 47 "parser.ml"
let yytransl_const = [|
  257 (* TYPE *);
  258 (* ACTION_DECL *);
  259 (* TRUE *);
  260 (* FALSE *);
  261 (* AND *);
  262 (* OR *);
  263 (* NOT *);
  264 (* AST *);
  265 (* EQ *);
  266 (* IMPL *);
  267 (* IFF *);
  268 (* LPAREN *);
  269 (* RPAREN *);
  270 (* LBRACE *);
  271 (* RBRACE *);
  272 (* ASSG *);
  273 (* COMP *);
  274 (* SKIP *);
  275 (* IF *);
  276 (* ELSE *);
  277 (* WHILE *);
  278 (* FOR *);
  279 (* BOOL *);
  280 (* FUNCTION *);
  281 (* RELATION *);
  282 (* INDIVIDUAL *);
  283 (* VAR_DECL *);
  284 (* REQUIRE *);
  285 (* ENSURES *);
  286 (* AXIOM *);
  287 (* FORALL *);
  288 (* EXISTS *);
  289 (* DOT *);
  290 (* CALL *);
  291 (* COMMA *);
  292 (* COLON *);
  295 (* EOL *);
    0|]

let yytransl_block = [|
  293 (* ID *);
  294 (* NUM *);
    0|]

let yylhs = "\255\255\
\001\000\002\000\002\000\002\000\002\000\002\000\002\000\002\000\
\002\000\004\000\004\000\004\000\004\000\004\000\004\000\004\000\
\004\000\004\000\004\000\004\000\004\000\005\000\005\000\005\000\
\005\000\005\000\005\000\005\000\010\000\010\000\010\000\011\000\
\011\000\011\000\011\000\011\000\011\000\011\000\011\000\011\000\
\011\000\003\000\003\000\009\000\009\000\008\000\006\000\006\000\
\013\000\013\000\012\000\012\000\007\000\007\000\007\000\007\000\
\007\000\007\000\007\000\007\000\007\000\007\000\007\000\007\000\
\007\000\007\000\007\000\007\000\007\000\007\000\000\000"

let yylen = "\002\000\
\002\000\002\000\003\000\002\000\001\000\002\000\003\000\002\000\
\001\000\007\000\007\000\006\000\006\000\003\000\005\000\009\000\
\005\000\002\000\005\000\001\000\001\000\003\000\003\000\005\000\
\005\000\003\000\007\000\005\000\002\000\002\000\002\000\009\000\
\004\000\004\000\004\000\004\000\007\000\007\000\005\000\003\000\
\006\000\002\000\001\000\003\000\001\000\001\000\003\000\001\000\
\003\000\003\000\003\000\001\000\004\000\001\000\003\000\003\000\
\003\000\003\000\003\000\003\000\002\000\001\000\001\000\006\000\
\006\000\006\000\006\000\005\000\003\000\003\000\002\000"

let yydefred = "\000\000\
\000\000\000\000\000\000\000\000\000\000\020\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\071\000\000\000\000\000\000\000\000\000\021\000\
\000\000\000\000\000\000\000\000\062\000\063\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\001\000\002\000\000\000\000\000\006\000\042\000\
\000\000\040\000\000\000\022\000\061\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\026\000\000\000\023\000\000\000\
\000\000\000\000\000\000\000\000\000\000\046\000\000\000\000\000\
\000\000\003\000\007\000\000\000\000\000\000\000\000\000\070\000\
\069\000\060\000\000\000\000\000\000\000\000\000\000\000\058\000\
\059\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\034\000\
\033\000\036\000\035\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\053\000\000\000\000\000\000\000\000\000\028\000\
\000\000\000\000\024\000\000\000\025\000\000\000\039\000\019\000\
\000\000\000\000\047\000\041\000\050\000\049\000\000\000\051\000\
\000\000\000\000\000\000\000\000\068\000\044\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\027\000\000\000\000\000\
\038\000\037\000\000\000\000\000\032\000\016\000"

let yydgoto = "\002\000\
\019\000\028\000\021\000\022\000\023\000\087\000\102\000\129\000\
\103\000\024\000\025\000\094\000\095\000"

let yysindex = "\017\000\
\224\255\000\000\238\254\039\255\224\255\000\000\018\000\018\000\
\049\255\056\255\071\255\087\255\090\255\018\000\018\000\018\000\
\114\255\151\255\000\000\115\255\224\255\152\255\013\255\000\000\
\155\000\024\255\159\255\157\255\000\000\000\000\018\000\163\255\
\018\000\169\255\170\255\173\255\188\255\153\000\199\000\178\255\
\205\255\220\255\199\255\203\255\224\000\224\000\224\000\228\255\
\210\255\018\000\000\000\000\000\224\255\224\255\000\000\000\000\
\241\255\000\000\225\255\000\000\000\000\034\255\206\000\221\255\
\236\255\006\000\018\000\018\000\018\000\018\000\018\000\018\000\
\224\255\018\000\018\000\242\255\000\000\224\255\000\000\139\255\
\225\255\225\255\147\255\150\255\018\000\000\000\015\000\016\255\
\224\000\000\000\000\000\210\255\249\255\019\000\252\255\000\000\
\000\000\000\000\204\255\207\255\018\000\050\255\030\000\000\000\
\000\000\155\255\155\255\155\255\033\000\094\255\217\000\235\000\
\009\000\002\255\036\000\183\255\215\255\040\000\041\000\000\000\
\000\000\000\000\000\000\043\000\050\000\052\000\210\255\056\000\
\044\000\233\255\066\000\225\255\053\000\055\000\057\000\061\000\
\068\000\018\000\000\000\069\000\080\000\224\255\243\255\000\000\
\000\000\224\255\000\000\224\255\000\000\073\000\000\000\000\000\
\018\000\018\000\000\000\000\000\000\000\000\000\091\000\000\000\
\018\000\018\000\018\000\018\000\000\000\000\000\099\000\002\255\
\002\255\002\255\100\000\105\000\004\000\224\000\224\000\224\255\
\155\255\155\255\155\255\155\255\224\255\000\000\000\000\000\000\
\000\000\000\000\107\000\108\000\000\000\000\000"

let yyrindex = "\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\253\254\010\255\000\000\
\169\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\254\255\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\029\255\065\255\100\255\125\255\
\000\000\000\000\000\000\000\000\074\255\081\255\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\129\255\000\000\000\000\000\000\000\000\000\000\111\000\000\000\
\000\000\000\000\000\000\000\000\000\000\115\000\000\000\000\000\
\000\000\025\000\048\000\063\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\101\255\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\073\255\000\000\000\000\000\000\000\000\
\104\255\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\135\255\138\255\000\000\
\082\000\097\000\116\000\131\000\000\000\000\000\164\255\194\255\
\000\000\000\000\000\000\000\000\000\000\000\000"

let yygindex = "\000\000\
\000\000\255\255\109\001\187\255\223\255\177\255\251\255\090\001\
\172\255\000\000\000\000\182\255\000\000"

let yytablesize = 513
let yytable = "\020\000\
\124\000\038\000\039\000\110\000\077\000\079\000\118\000\119\000\
\045\000\046\000\047\000\005\000\128\000\003\000\004\000\005\000\
\137\000\001\000\026\000\052\000\074\000\055\000\075\000\076\000\
\009\000\061\000\005\000\063\000\126\000\054\000\006\000\007\000\
\057\000\008\000\009\000\005\000\010\000\011\000\012\000\013\000\
\014\000\015\000\016\000\029\000\089\000\029\000\017\000\155\000\
\009\000\018\000\127\000\090\000\091\000\166\000\068\000\069\000\
\096\000\160\000\070\000\071\000\072\000\058\000\104\000\105\000\
\106\000\107\000\108\000\029\000\111\000\112\000\097\000\109\000\
\110\000\022\000\022\000\027\000\115\000\077\000\079\000\030\000\
\144\000\030\000\147\000\149\000\138\000\040\000\022\000\015\000\
\004\000\015\000\022\000\022\000\041\000\022\000\022\000\008\000\
\022\000\022\000\022\000\022\000\022\000\022\000\022\000\030\000\
\022\000\022\000\022\000\042\000\141\000\022\000\053\000\015\000\
\004\000\048\000\031\000\048\000\031\000\022\000\017\000\008\000\
\017\000\022\000\022\000\043\000\022\000\022\000\044\000\022\000\
\022\000\022\000\022\000\022\000\022\000\022\000\182\000\147\000\
\149\000\022\000\031\000\018\000\022\000\018\000\017\000\014\000\
\171\000\014\000\172\000\174\000\175\000\012\000\048\000\012\000\
\013\000\051\000\013\000\177\000\178\000\179\000\180\000\068\000\
\069\000\116\000\049\000\018\000\022\000\022\000\050\000\014\000\
\053\000\120\000\059\000\060\000\122\000\012\000\187\000\117\000\
\013\000\022\000\011\000\188\000\011\000\022\000\022\000\121\000\
\022\000\022\000\123\000\022\000\022\000\022\000\022\000\022\000\
\022\000\022\000\022\000\022\000\146\000\022\000\062\000\067\000\
\022\000\074\000\011\000\075\000\076\000\064\000\065\000\022\000\
\010\000\066\000\010\000\022\000\022\000\080\000\022\000\022\000\
\081\000\022\000\022\000\022\000\022\000\022\000\022\000\022\000\
\003\000\004\000\133\000\022\000\148\000\135\000\022\000\082\000\
\010\000\074\000\083\000\075\000\076\000\005\000\084\000\085\000\
\134\000\006\000\007\000\136\000\008\000\009\000\086\000\010\000\
\011\000\012\000\013\000\014\000\015\000\016\000\092\000\157\000\
\099\000\017\000\054\000\054\000\018\000\093\000\054\000\054\000\
\054\000\169\000\054\000\054\000\054\000\158\000\054\000\100\000\
\054\000\101\000\054\000\054\000\029\000\030\000\113\000\170\000\
\031\000\032\000\185\000\125\000\130\000\033\000\132\000\131\000\
\054\000\055\000\055\000\055\000\054\000\055\000\055\000\055\000\
\186\000\055\000\139\000\055\000\143\000\055\000\055\000\140\000\
\034\000\035\000\145\000\036\000\150\000\151\000\037\000\152\000\
\056\000\056\000\056\000\055\000\056\000\056\000\056\000\055\000\
\056\000\153\000\056\000\154\000\056\000\056\000\156\000\057\000\
\057\000\057\000\159\000\057\000\057\000\057\000\127\000\057\000\
\165\000\057\000\056\000\057\000\057\000\161\000\056\000\162\000\
\167\000\163\000\065\000\065\000\065\000\164\000\065\000\065\000\
\065\000\057\000\065\000\168\000\065\000\057\000\065\000\065\000\
\176\000\064\000\064\000\064\000\173\000\064\000\064\000\064\000\
\181\000\064\000\183\000\064\000\065\000\064\000\064\000\184\000\
\065\000\189\000\190\000\052\000\067\000\067\000\067\000\045\000\
\067\000\067\000\067\000\064\000\067\000\056\000\067\000\064\000\
\067\000\067\000\088\000\066\000\066\000\066\000\000\000\066\000\
\066\000\066\000\000\000\066\000\000\000\066\000\067\000\066\000\
\066\000\000\000\067\000\003\000\004\000\068\000\069\000\000\000\
\000\000\070\000\071\000\072\000\000\000\066\000\073\000\000\000\
\000\000\066\000\000\000\074\000\000\000\075\000\076\000\000\000\
\000\000\000\000\010\000\011\000\012\000\013\000\043\000\000\000\
\000\000\000\000\043\000\043\000\000\000\043\000\043\000\000\000\
\000\000\000\000\000\000\000\000\043\000\043\000\043\000\000\000\
\000\000\000\000\043\000\068\000\069\000\043\000\000\000\070\000\
\071\000\072\000\068\000\069\000\078\000\000\000\070\000\071\000\
\072\000\074\000\098\000\075\000\076\000\068\000\069\000\000\000\
\000\000\070\000\071\000\072\000\068\000\069\000\142\000\000\000\
\070\000\071\000\072\000\074\000\000\000\075\000\076\000\068\000\
\069\000\000\000\000\000\070\000\071\000\072\000\000\000\000\000\
\005\000\000\000\000\000\000\000\000\000\074\000\000\000\075\000\
\076\000"

let yycheck = "\001\000\
\085\000\007\000\008\000\073\000\038\000\039\000\081\000\082\000\
\014\000\015\000\016\000\015\001\092\000\001\001\002\001\014\001\
\101\000\001\000\037\001\021\000\019\001\023\000\021\001\022\001\
\015\001\031\000\014\001\033\000\013\001\017\001\018\001\019\001\
\009\001\021\001\022\001\039\001\024\001\025\001\026\001\027\001\
\028\001\029\001\030\001\015\001\050\000\017\001\034\001\127\000\
\039\001\037\001\035\001\053\000\054\000\138\000\005\001\006\001\
\023\001\132\000\009\001\010\001\011\001\038\001\068\000\069\000\
\070\000\071\000\072\000\039\001\074\000\075\000\037\001\073\000\
\142\000\001\001\002\001\037\001\078\000\111\000\112\000\015\001\
\114\000\017\001\116\000\117\000\035\001\037\001\014\001\015\001\
\015\001\017\001\018\001\019\001\037\001\021\001\022\001\015\001\
\024\001\025\001\026\001\027\001\028\001\029\001\030\001\039\001\
\001\001\002\001\034\001\037\001\015\001\037\001\017\001\039\001\
\039\001\013\001\015\001\015\001\017\001\014\001\015\001\039\001\
\017\001\018\001\019\001\037\001\021\001\022\001\037\001\024\001\
\025\001\026\001\027\001\028\001\029\001\030\001\168\000\169\000\
\170\000\034\001\039\001\015\001\037\001\017\001\039\001\015\001\
\146\000\017\001\148\000\153\000\154\000\015\001\037\001\017\001\
\015\001\039\001\017\001\161\000\162\000\163\000\164\000\005\001\
\006\001\023\001\012\001\039\001\001\001\002\001\016\001\039\001\
\017\001\023\001\012\001\015\001\023\001\039\001\176\000\037\001\
\039\001\014\001\015\001\181\000\017\001\018\001\019\001\037\001\
\021\001\022\001\037\001\024\001\025\001\026\001\027\001\028\001\
\029\001\030\001\001\001\002\001\014\001\034\001\036\001\012\001\
\037\001\019\001\039\001\021\001\022\001\037\001\037\001\014\001\
\015\001\037\001\017\001\018\001\019\001\036\001\021\001\022\001\
\012\001\024\001\025\001\026\001\027\001\028\001\029\001\030\001\
\001\001\002\001\023\001\034\001\014\001\023\001\037\001\012\001\
\039\001\019\001\036\001\021\001\022\001\014\001\036\001\012\001\
\037\001\018\001\019\001\037\001\021\001\022\001\037\001\024\001\
\025\001\026\001\027\001\028\001\029\001\030\001\014\001\023\001\
\036\001\034\001\005\001\006\001\037\001\037\001\009\001\010\001\
\011\001\023\001\013\001\014\001\015\001\037\001\017\001\036\001\
\019\001\012\001\021\001\022\001\003\001\004\001\037\001\037\001\
\007\001\008\001\023\001\013\001\036\001\012\001\035\001\013\001\
\035\001\009\001\010\001\011\001\039\001\013\001\014\001\015\001\
\037\001\017\001\013\001\019\001\036\001\021\001\022\001\015\001\
\031\001\032\001\015\001\034\001\013\001\013\001\037\001\013\001\
\009\001\010\001\011\001\035\001\013\001\014\001\015\001\039\001\
\017\001\016\001\019\001\016\001\021\001\022\001\015\001\009\001\
\010\001\011\001\009\001\013\001\014\001\015\001\035\001\017\001\
\013\001\019\001\035\001\021\001\022\001\033\001\039\001\033\001\
\020\001\033\001\009\001\010\001\011\001\033\001\013\001\014\001\
\015\001\035\001\017\001\020\001\019\001\039\001\021\001\022\001\
\014\001\009\001\010\001\011\001\036\001\013\001\014\001\015\001\
\014\001\017\001\015\001\019\001\035\001\021\001\022\001\015\001\
\039\001\015\001\015\001\013\001\009\001\010\001\011\001\013\001\
\013\001\014\001\015\001\035\001\017\001\025\000\019\001\039\001\
\021\001\022\001\049\000\009\001\010\001\011\001\255\255\013\001\
\014\001\015\001\255\255\017\001\255\255\019\001\035\001\021\001\
\022\001\255\255\039\001\001\001\002\001\005\001\006\001\255\255\
\255\255\009\001\010\001\011\001\255\255\035\001\014\001\255\255\
\255\255\039\001\255\255\019\001\255\255\021\001\022\001\255\255\
\255\255\255\255\024\001\025\001\026\001\027\001\014\001\255\255\
\255\255\255\255\018\001\019\001\255\255\021\001\022\001\255\255\
\255\255\255\255\255\255\255\255\028\001\029\001\030\001\255\255\
\255\255\255\255\034\001\005\001\006\001\037\001\255\255\009\001\
\010\001\011\001\005\001\006\001\014\001\255\255\009\001\010\001\
\011\001\019\001\013\001\021\001\022\001\005\001\006\001\255\255\
\255\255\009\001\010\001\011\001\005\001\006\001\014\001\255\255\
\009\001\010\001\011\001\019\001\255\255\021\001\022\001\005\001\
\006\001\255\255\255\255\009\001\010\001\011\001\255\255\255\255\
\014\001\255\255\255\255\255\255\255\255\019\001\255\255\021\001\
\022\001"

let yynames_const = "\
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
  SKIP\000\
  IF\000\
  ELSE\000\
  WHILE\000\
  FOR\000\
  BOOL\000\
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
  EOL\000\
  "

let yynames_block = "\
  ID\000\
  NUM\000\
  "

let yyact = [|
  (fun _ -> failwith "parser")
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'comlist) in
    Obj.repr(
# 48 "parser.mly"
                ( _1 )
# 388 "parser.ml"
               : Ast.com))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'decllist) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'comlist) in
    Obj.repr(
# 52 "parser.mly"
                     ( Seq (_1, _2) )
# 396 "parser.ml"
               : 'comlist))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'com) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'comlist) in
    Obj.repr(
# 53 "parser.mly"
                     ( Seq (_1, _3) )
# 404 "parser.ml"
               : 'comlist))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'com) in
    Obj.repr(
# 54 "parser.mly"
             ( Seq(_1, Skip) )
# 411 "parser.ml"
               : 'comlist))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'com) in
    Obj.repr(
# 55 "parser.mly"
        ( _1 )
# 418 "parser.ml"
               : 'comlist))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'combr) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'comlist) in
    Obj.repr(
# 56 "parser.mly"
                  ( Seq (_1, _2) )
# 426 "parser.ml"
               : 'comlist))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'combr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'comlist) in
    Obj.repr(
# 57 "parser.mly"
                       ( Seq (_1, _3) )
# 434 "parser.ml"
               : 'comlist))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'combr) in
    Obj.repr(
# 58 "parser.mly"
               (  Seq(_1, Skip) )
# 441 "parser.ml"
               : 'comlist))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'combr) in
    Obj.repr(
# 59 "parser.mly"
          ( _1 )
# 448 "parser.ml"
               : 'comlist))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 5 : string) in
    let _4 = (Parsing.peek_val __caml_parser_env 3 : string) in
    let _6 = (Parsing.peek_val __caml_parser_env 1 : 'comlist) in
    Obj.repr(
# 63 "parser.mly"
                                          ( let a = For (_2, UserDefined(_4), _6) in a)
# 457 "parser.ml"
               : 'com))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 5 : string) in
    let _6 = (Parsing.peek_val __caml_parser_env 1 : 'comlist) in
    Obj.repr(
# 64 "parser.mly"
                                            ( let a = For (_2, Bool, _6) in a)
# 465 "parser.ml"
               : 'com))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 5 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 3 : 'varlist) in
    let _6 = (Parsing.peek_val __caml_parser_env 0 : 'exp) in
    Obj.repr(
# 65 "parser.mly"
                                      ( let a = AssignFun (_1, _3, _6) in a)
# 474 "parser.ml"
               : 'com))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 5 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 3 : 'var) in
    let _6 = (Parsing.peek_val __caml_parser_env 0 : 'exp) in
    Obj.repr(
# 66 "parser.mly"
                                  ( let a = AssignFun (_1, [_3], _6) in a)
# 483 "parser.ml"
               : 'com))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'exp) in
    Obj.repr(
# 67 "parser.mly"
                ( let a = Assign (_1, _3) in a)
# 491 "parser.ml"
               : 'com))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 3 : 'exp) in
    let _4 = (Parsing.peek_val __caml_parser_env 1 : 'comlist) in
    Obj.repr(
# 68 "parser.mly"
                                 ( let a = If(_2, _4) in a)
# 499 "parser.ml"
               : 'com))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 7 : 'exp) in
    let _4 = (Parsing.peek_val __caml_parser_env 5 : 'comlist) in
    let _8 = (Parsing.peek_val __caml_parser_env 1 : 'comlist) in
    Obj.repr(
# 69 "parser.mly"
                                                            ( let a = IfElse (_2, _4, _8) in a)
# 508 "parser.ml"
               : 'com))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 3 : 'exp) in
    let _4 = (Parsing.peek_val __caml_parser_env 1 : 'comlist) in
    Obj.repr(
# 70 "parser.mly"
                                    ( let a = While (_2, _4) in a)
# 516 "parser.ml"
               : 'com))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 71 "parser.mly"
            ( let a = Call (_2, []) in a)
# 523 "parser.ml"
               : 'com))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 3 : string) in
    let _4 = (Parsing.peek_val __caml_parser_env 1 : 'explist) in
    Obj.repr(
# 72 "parser.mly"
                                  ( let a = Call (_2, _4) in a)
# 531 "parser.ml"
               : 'com))
; (fun __caml_parser_env ->
    Obj.repr(
# 73 "parser.mly"
         ( let a = Skip in a)
# 537 "parser.ml"
               : 'com))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'assertion) in
    Obj.repr(
# 74 "parser.mly"
              ( let a = _1 in a)
# 544 "parser.ml"
               : 'com))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'comlist) in
    Obj.repr(
# 78 "parser.mly"
                          ( let a = _2 in a)
# 551 "parser.ml"
               : 'combr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'exp) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'combr) in
    Obj.repr(
# 79 "parser.mly"
                    ( let a = While (_2, _3) in a)
# 559 "parser.ml"
               : 'combr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 3 : string) in
    let _5 = (Parsing.peek_val __caml_parser_env 0 : 'combr) in
    Obj.repr(
# 80 "parser.mly"
                            ( let a = For (_2, Bool, _5) in a)
# 567 "parser.ml"
               : 'combr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 3 : string) in
    let _4 = (Parsing.peek_val __caml_parser_env 1 : string) in
    let _5 = (Parsing.peek_val __caml_parser_env 0 : 'combr) in
    Obj.repr(
# 81 "parser.mly"
                          ( let a = For (_2, UserDefined(_4), _5) in a)
# 576 "parser.ml"
               : 'combr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'exp) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'combr) in
    Obj.repr(
# 82 "parser.mly"
                 ( let a = If (_2, _3) in a)
# 584 "parser.ml"
               : 'combr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 5 : 'exp) in
    let _4 = (Parsing.peek_val __caml_parser_env 3 : 'com) in
    let _7 = (Parsing.peek_val __caml_parser_env 0 : 'combr) in
    Obj.repr(
# 83 "parser.mly"
                                        ( let a = IfElse (_2, _4, _7) in a)
# 593 "parser.ml"
               : 'combr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 3 : 'exp) in
    let _3 = (Parsing.peek_val __caml_parser_env 2 : 'combr) in
    let _5 = (Parsing.peek_val __caml_parser_env 0 : 'combr) in
    Obj.repr(
# 84 "parser.mly"
                            ( let a = IfElse (_2, _3, _5) in a)
# 602 "parser.ml"
               : 'combr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'exp) in
    Obj.repr(
# 88 "parser.mly"
                ( Skip )
# 609 "parser.ml"
               : 'assertion))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'exp) in
    Obj.repr(
# 89 "parser.mly"
                ( Skip )
# 616 "parser.ml"
               : 'assertion))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'exp) in
    Obj.repr(
# 90 "parser.mly"
                ( Skip )
# 623 "parser.ml"
               : 'assertion))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 7 : string) in
    let _4 = (Parsing.peek_val __caml_parser_env 5 : 'typed_varlist) in
    let _8 = (Parsing.peek_val __caml_parser_env 1 : 'comlist) in
    Obj.repr(
# 95 "parser.mly"
                                                                        ( ActionDecl(_2, _4, Void, _8) )
# 632 "parser.ml"
               : 'decl))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _4 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 96 "parser.mly"
                           ( GlobalVarDecl (_2, UserDefined(_4)) )
# 640 "parser.ml"
               : 'decl))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 2 : string) in
    Obj.repr(
# 97 "parser.mly"
                             ( GlobalVarDecl (_2, Bool) )
# 647 "parser.ml"
               : 'decl))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _4 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 98 "parser.mly"
                         ( LocalVarDecl (_2, UserDefined(_4)) )
# 655 "parser.ml"
               : 'decl))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 2 : string) in
    Obj.repr(
# 99 "parser.mly"
                           ( LocalVarDecl (_2, Bool) )
# 662 "parser.ml"
               : 'decl))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 5 : string) in
    let _4 = (Parsing.peek_val __caml_parser_env 3 : 'typed_varlist) in
    let _7 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 100 "parser.mly"
                                                     ( GlobalFuncVarDecl (_2, _4, UserDefined(_7)) )
# 671 "parser.ml"
               : 'decl))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 5 : string) in
    let _4 = (Parsing.peek_val __caml_parser_env 3 : 'typed_varlist) in
    Obj.repr(
# 101 "parser.mly"
                                                       (GlobalFuncVarDecl (_2, _4, Bool) )
# 679 "parser.ml"
               : 'decl))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 3 : string) in
    let _4 = (Parsing.peek_val __caml_parser_env 1 : 'typed_varlist) in
    Obj.repr(
# 102 "parser.mly"
                                            ( GlobalFuncVarDecl (_2, _4, Bool) )
# 687 "parser.ml"
               : 'decl))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : int) in
    Obj.repr(
# 103 "parser.mly"
                ( TypeDecl (_2, _3) )
# 695 "parser.ml"
               : 'decl))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 4 : string) in
    let _5 = (Parsing.peek_val __caml_parser_env 1 : 'varlist) in
    Obj.repr(
# 104 "parser.mly"
                                     ( EnumTypeDecl(_2, _5) )
# 703 "parser.ml"
               : 'decl))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'decl) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'decllist) in
    Obj.repr(
# 108 "parser.mly"
                  ( Seq (_1, _2) )
# 711 "parser.ml"
               : 'decllist))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'decl) in
    Obj.repr(
# 109 "parser.mly"
         ( _1 )
# 718 "parser.ml"
               : 'decllist))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'exp) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'explist) in
    Obj.repr(
# 113 "parser.mly"
                      ( _1 :: _3 )
# 726 "parser.ml"
               : 'explist))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'exp) in
    Obj.repr(
# 114 "parser.mly"
        ( [_1] )
# 733 "parser.ml"
               : 'explist))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 117 "parser.mly"
       ( _1 )
# 740 "parser.ml"
               : 'var))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'var) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'varlist) in
    Obj.repr(
# 120 "parser.mly"
                      ( _1 :: _3 )
# 748 "parser.ml"
               : 'varlist))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'var) in
    Obj.repr(
# 121 "parser.mly"
        ( [_1] )
# 755 "parser.ml"
               : 'varlist))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 124 "parser.mly"
                ( (_1, UserDefined(_3)) )
# 763 "parser.ml"
               : 'typed_var))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : string) in
    Obj.repr(
# 125 "parser.mly"
                  ( (_1, Bool) )
# 770 "parser.ml"
               : 'typed_var))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'typed_var) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'typed_varlist) in
    Obj.repr(
# 128 "parser.mly"
                                  ( let a = _1 :: _3 in a )
# 778 "parser.ml"
               : 'typed_varlist))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'typed_var) in
    Obj.repr(
# 129 "parser.mly"
              ([_1] )
# 785 "parser.ml"
               : 'typed_varlist))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 3 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 1 : 'explist) in
    Obj.repr(
# 132 "parser.mly"
                             ( let a = VarFun (_1, _3) in a)
# 793 "parser.ml"
               : 'exp))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 133 "parser.mly"
       ( let a = VarLiteral _1 in a)
# 800 "parser.ml"
               : 'exp))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'exp) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'exp) in
    Obj.repr(
# 134 "parser.mly"
               ( let a = Eq (_1, _3) in a)
# 808 "parser.ml"
               : 'exp))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'exp) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'exp) in
    Obj.repr(
# 135 "parser.mly"
                 ( let a = Implies (_1, _3) in a)
# 816 "parser.ml"
               : 'exp))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'exp) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'exp) in
    Obj.repr(
# 136 "parser.mly"
                ( let a = Iff (_1, _3) in a)
# 824 "parser.ml"
               : 'exp))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'exp) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'exp) in
    Obj.repr(
# 137 "parser.mly"
                ( let a = And (_1, _3) in a)
# 832 "parser.ml"
               : 'exp))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'exp) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'exp) in
    Obj.repr(
# 138 "parser.mly"
               ( let a = Or (_3, _1) in a)
# 840 "parser.ml"
               : 'exp))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'exp) in
    Obj.repr(
# 139 "parser.mly"
                      ( let a = _2 in a)
# 847 "parser.ml"
               : 'exp))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'exp) in
    Obj.repr(
# 140 "parser.mly"
            ( let a = Not _2 in a)
# 854 "parser.ml"
               : 'exp))
; (fun __caml_parser_env ->
    Obj.repr(
# 141 "parser.mly"
         ( let a = True in a)
# 860 "parser.ml"
               : 'exp))
; (fun __caml_parser_env ->
    Obj.repr(
# 142 "parser.mly"
          ( let a = False in a)
# 866 "parser.ml"
               : 'exp))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 4 : string) in
    let _4 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _6 = (Parsing.peek_val __caml_parser_env 0 : 'exp) in
    Obj.repr(
# 143 "parser.mly"
                               ( let a = Forall (_2, UserDefined(_4), _6) in a)
# 875 "parser.ml"
               : 'exp))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 4 : string) in
    let _6 = (Parsing.peek_val __caml_parser_env 0 : 'exp) in
    Obj.repr(
# 144 "parser.mly"
                                 ( let a = Forall (_2, Bool, _6) in a)
# 883 "parser.ml"
               : 'exp))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 4 : string) in
    let _4 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _6 = (Parsing.peek_val __caml_parser_env 0 : 'exp) in
    Obj.repr(
# 145 "parser.mly"
                               ( let a = Exists (_2, UserDefined(_4), _6) in a)
# 892 "parser.ml"
               : 'exp))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 4 : string) in
    let _6 = (Parsing.peek_val __caml_parser_env 0 : 'exp) in
    Obj.repr(
# 146 "parser.mly"
                                 ( let a = Exists (_2, Bool, _6) in a)
# 900 "parser.ml"
               : 'exp))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 3 : string) in
    let _4 = (Parsing.peek_val __caml_parser_env 1 : 'explist) in
    Obj.repr(
# 147 "parser.mly"
                                  ( let a = ActionApplication (_2, _4) in a)
# 908 "parser.ml"
               : 'exp))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 148 "parser.mly"
                 ( let a = Nondet(UserDefined(_3)) in a)
# 915 "parser.ml"
               : 'exp))
; (fun __caml_parser_env ->
    Obj.repr(
# 149 "parser.mly"
                   ( let a = Nondet(Bool) in a)
# 921 "parser.ml"
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
   (Parsing.yyparse yytables 1 lexfun lexbuf : Ast.com)
;;
