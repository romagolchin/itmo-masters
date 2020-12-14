grammar Grammar;


source:
    vars?
    imageExpr
    EOF
    ;

vars:
    'var'
    declaration+;

declaration: IDENTIFIER '=' (imageExpr | transform) ';';

imageExpr: layer (BEHIND layer)*;

layer: row (ABOVE layer)?;

row: clause (BESIDES row)?;

clause:
    '(' imageExpr ')'
    | primitive
    | IDENTIFIER
    | transform '(' imageExpr ')'
;

transform:
    primitiveTransform ('then' transform)?
;

primitiveTransform: ('translate' | 'rotate' | 'scale' | 'shear') '(' NUMBER (',' NUMBER)* ')';

primitive: 'filled'? color? shape;

color: 'white' | 'black' | 'red' | 'orange' | 'yellow' | 'green' | 'blue' | 'purple' | HEX_COLOR;

shape: 'triangle' NUMBER | 'square' NUMBER | 'rectangle' NUMBER ',' NUMBER | 'circle' NUMBER;

WS
    :   [ \t]+ -> skip
    ;
NEWLINE:'\r'? '\n' -> skip;
COMMENT : '#' ~[\r\n]* -> skip;

IDENTIFIER: [a-zA-Z][a-zA-Z0-9_]*;
HEX_COLOR: '#' [0-9a-zA-Z][0-9a-zA-Z][0-9a-zA-Z][0-9a-zA-Z][0-9a-zA-Z][0-9a-zA-Z];
NUMBER: [1-9]?[0-9]+ ('.' [0-9]+)?;


BEHIND : '<' | 'behind';
BESIDES : '|' | 'besides';
ABOVE: '^' | 'above';
