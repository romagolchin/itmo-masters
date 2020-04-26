grammar Grammar;


source:
    sourceItem* EOF
    ;

importSpec: 'from' (method 'in')? className ';';
className: STR;
method: STR;
modifier: 'public'|'private';

sourceItem:
    funcDef # funcDefAlt
    | 'class' IDENTIFIER varsSpec 'begin' member* 'end' # classDef
    ;

funcDef: 'method' funcSignature (body|';'|importSpec);

member: modifier? funcDef;

funcSignature: IDENTIFIER '(' argDefList ')'
    (':' typeRef)?
;

typeRef: BUILTIN # builtin
         | IDENTIFIER # custom
         | typeRef  arrayDepthSpec 'of' typeRef # array
;

arrayDepthSpec: '[' (',')* ']';

argDefList: (argDef (',' argDef)*)?;

argDef: IDENTIFIER (':' typeRef)?;

identifierList: (IDENTIFIER (',' IDENTIFIER)*)?;
body:
    varsSpec?
    block;

varsSpec: ('var' (identifierList (':' typeRef)? ';')*);

block: 'begin' statement* 'end' ';';

statement:
    expr ';' # expression
    | IDENTIFIER ':=' expr ';' # assign
    | 'if' expr 'then' statement ('else' statement)? # if
    | block # block1
    | 'while' expr 'do' statement # while
    | 'repeat' statement whileSpec expr ';' # do
    | 'break' ';' # break
    ;

whileSpec: ('while'|'until');


expr:
    operand
    | binary
    ;


binary: operand ('+' | '-' | '*' | '/' | '%' | '=' | '<' | '>' | '&&' | '||') expr;
operand:
        unary
        | memberAccessChain
        | indexer
        | literal
        | braces
        | IDENTIFIER;
unary: ('-' | '!') expr;
braces: '(' expr ')';
memberAccessChain: memberAccess ('.' memberAccess)*;
memberAccess: IDENTIFIER | call;
call: IDENTIFIER ('(' exprList ')');
exprList:
|
| expr (',' expr)*;
indexer: IDENTIFIER '[' exprList ']';
literal: BOOL|STR|CHAR|HEX|BITS|DEC;


WS
    :   [ \t\r\n]+ -> skip
    ;
fragment NotEscapedQuote : '\\\\' | ~('\\'|'"');
fragment EscapedQuote : '\\' '"';
fragment Quote : '"';
BOOL: 'true' | 'false';
STR:
    Quote NotEscapedQuote*  Quote
    | Quote (NotEscapedQuote*? EscapedQuote)* (~'"')*? Quote
    ;
CHAR:
    '\'' ~('\'') '\''
    | '\'' '\\' '\'' '\'';

BUILTIN: 'bool'|'byte'|'int'|'uint'|'long'|'ulong'|'char'|'string';
IDENTIFIER: [a-zA-Z][a-zA-Z0-9_]*;
HEX: '0' [xX][0-9a-zA-Z]+;
BITS: '0' [bB][01]+;
DEC: [1-9]?[0-9]+;
