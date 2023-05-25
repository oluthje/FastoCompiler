// Signature file for parser generated by fsyacc
module Parser
type token = 
  | LPAR of (Position)
  | RPAR of (Position)
  | LBRACKET of (Position)
  | RBRACKET of (Position)
  | LCURLY of (Position)
  | RCURLY of (Position)
  | SEMICOLON of (Position)
  | FUN of (Position)
  | FN of (Position)
  | COMMA of (Position)
  | READ of (Position)
  | WRITE of (Position)
  | DEQ of (Position)
  | LTH of (Position)
  | EQ of (Position)
  | MAP of (Position)
  | REDUCE of (Position)
  | IOTA of (Position)
  | ARROW of (Position)
  | REPLICATE of (Position)
  | PLUS of (Position)
  | MINUS of (Position)
  | TIMES of (Position)
  | DIVIDE of (Position)
  | AND of (Position)
  | OR of (Position)
  | NOT of (Position)
  | NEGATE of (Position)
  | LESS of (Position)
  | TRUE of (Position)
  | FALSE of (Position)
  | INT of (Position)
  | CHAR of (Position)
  | BOOL of (Position)
  | IF of (Position)
  | THEN of (Position)
  | ELSE of (Position)
  | LET of (Position)
  | IN of (Position)
  | EOF of (Position)
  | ID of (string * Position)
  | STRINGLIT of (string * Position)
  | CHARLIT of (char * Position)
  | NUM of (int * Position)
type tokenId = 
    | TOKEN_LPAR
    | TOKEN_RPAR
    | TOKEN_LBRACKET
    | TOKEN_RBRACKET
    | TOKEN_LCURLY
    | TOKEN_RCURLY
    | TOKEN_SEMICOLON
    | TOKEN_FUN
    | TOKEN_FN
    | TOKEN_COMMA
    | TOKEN_READ
    | TOKEN_WRITE
    | TOKEN_DEQ
    | TOKEN_LTH
    | TOKEN_EQ
    | TOKEN_MAP
    | TOKEN_REDUCE
    | TOKEN_IOTA
    | TOKEN_ARROW
    | TOKEN_REPLICATE
    | TOKEN_PLUS
    | TOKEN_MINUS
    | TOKEN_TIMES
    | TOKEN_DIVIDE
    | TOKEN_AND
    | TOKEN_OR
    | TOKEN_NOT
    | TOKEN_NEGATE
    | TOKEN_LESS
    | TOKEN_TRUE
    | TOKEN_FALSE
    | TOKEN_INT
    | TOKEN_CHAR
    | TOKEN_BOOL
    | TOKEN_IF
    | TOKEN_THEN
    | TOKEN_ELSE
    | TOKEN_LET
    | TOKEN_IN
    | TOKEN_EOF
    | TOKEN_ID
    | TOKEN_STRINGLIT
    | TOKEN_CHARLIT
    | TOKEN_NUM
    | TOKEN_end_of_input
    | TOKEN_error
type nonTerminalId = 
    | NONTERM__startProg
    | NONTERM_Prog
    | NONTERM_Dec
    | NONTERM_FunDecs
    | NONTERM_Fun
    | NONTERM_Type
    | NONTERM_Params
    | NONTERM_Exp
    | NONTERM_Decs
    | NONTERM_Exps
    | NONTERM_FunArg
/// This function maps tokens to integer indexes
val tagOfToken: token -> int

/// This function maps integer indexes to symbolic token ids
val tokenTagToTokenId: int -> tokenId

/// This function maps production indexes returned in syntax errors to strings representing the non terminal that would be produced by that production
val prodIdxToNonTerminal: int -> nonTerminalId

/// This function gets the name of a token as a string
val token_to_string: token -> string
val Prog : (FSharp.Text.Lexing.LexBuffer<'cty> -> token) -> FSharp.Text.Lexing.LexBuffer<'cty> -> (AbSyn.UntypedProg) 
