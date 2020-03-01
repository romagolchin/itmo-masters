grammar Grammar;


source:
    (stat ';')* EOF
    ;

stat:
    | expr
    | IDENTIFIER ':=' expr
    ;

expr:
|binary
|unary
|braces
|call
|indexer
|IDENTIFIER
|literal
    ;


binary: unary BIN_OP expr;
// changed
unary: unOp expr;
braces: '(' expr ')';
// changed
call: IDENTIFIER ('(' args ')')+;
args: | expr ',' (',' expr)*;
// changed
indexer: IDENTIFIER '[' expr ']';
literal: bool|STR|CHAR|HEX|BITS|DEC;


// fixme

bool: 'true' | 'false';
WS
    :   [ \t\r\n]+ -> skip
    ;
//STR: '"([^"](\\")?)*[^"]?"';
STR: '"' ~('"') '"';
CHAR: '\'' ~('\'') '\'' | '\'' '\\' '\'' '\'';

BUILTIN: 'bool'|'byte'|'int'|'uint'|'long'|'ulong'|'char'|'string';
IDENTIFIER: [a-zA-Z][a-zA-Z0-9_]*;
HEX: '0x' [0-9a-zA-Z]+;
BITS: '0b' [01]+;
DEC: [1-9][0-9]+;
BIN_OP: '+' | '-' | '*' | '/';
unOp: '-';
