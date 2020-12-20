grammar Grammar;


source:
    expr
    EOF;

expr : concat ('|' concat)*;

concat: clause*;

clause:
    primitive '*'?;

primitive: CHAR | '(' expr ')';
CHAR: ~[*|\r\n] | '\\*' | '\\|' | '\\\\';