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

member: modifier? (funcDef | IDENTIFIER ':' typeRef);

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
    | block # blockAlt
    | 'while' expr 'do' statement # while
    | 'repeat' statement whileSpec expr ';' # do
    | 'break' ';' # break
    ;

whileSpec: ('while'|'until');

expr:
    arithmetical
    | logical
    | operand
    ;

arithmetical: product | arithmetical op=('+' | '-') product;
product: arithmeticalTerm | product op=('*' | '/' | '%') arithmeticalTerm;
arithmeticalTerm: operand | '-' arithmeticalTerm;

logical: logical '||' conjunction | conjunction;
conjunction: conjunction '&&' conjunct | conjunct;
conjunct: logicalTerm | (arithmetical COMPARISON arithmetical);
logicalTerm: operand | '!' logicalTerm;

operand: instance | operand '.' (IDENTIFIER | call);
instance:
        indexer # indexerAlt
        | literal # literalAlt
        | braces # bracesAlt
        | IDENTIFIER # localAlt
        | THIS # thisAlt
        | ctorCall # ctorAlt
        | call # callAlt
        ;
braces: '(' expr ')';
ctorCall: NEW IDENTIFIER '(' ')';
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
THIS: 'this';
NEW: 'new';
BUILTIN: 'bool'|'byte'|'int'|'uint'|'long'|'ulong'|'char'|'string';
IDENTIFIER: [a-zA-Z][a-zA-Z0-9_]*;
HEX: '0' [xX][0-9a-zA-Z]+;
BITS: '0' [bB][01]+;
DEC: [1-9]?[0-9]+;
//BINARY_OP: '+' | '-' | '*' | '/' | '%';
//UNARY_MINUS: '-';
COMPARISON: '<' | '=' | '>';