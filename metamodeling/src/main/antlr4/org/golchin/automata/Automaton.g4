grammar Automaton;

automaton:
    'automaton' IDENTIFIER '{' states finals transitions function+ '}' EOF;

identifierList: | IDENTIFIER (SEPARATOR IDENTIFIER)*;

// structure

states: STATES ':' identifierList;
finals: FINAL ':' identifierList;

transitions: | TRANSITIONS ':' transitionsFromState (SEPARATOR transitionsFromState)*;

transitionsFromState: IDENTIFIER '{' transitionMap '}';

transitionMap: | transition (SEPARATOR transition)*;

transition: CHAR '->' IDENTIFIER;

// behavior

function: signature '{' statement* '}';
signature: IDENTIFIER '(' identifierList ')';
statement: call | whileStat | ifStat | ACCEPT | REJECT;

ifStat: IF '(' call ')' '{' statement* '}' 'else' '{' statement* '}';
whileStat: WHILE '(' call ')' '{' statement* '}';

call: IDENTIFIER '(' expressionList ')';
expression: IDENTIFIER | call;
expressionList: | expression (SEPARATOR expression)*;


WS
    :   [ \t]+ -> skip
    ;
NEWLINE:'\r'? '\n' -> skip;
COMMENT : '#' ~[\r\n]* -> skip;
SEPARATOR: ',';
ACCEPT: 'accept';
REJECT: 'reject';
IF: 'if';
WHILE: 'while';
STATES: 'states';
FINAL: 'final';
TRANSITIONS: 'transitions';
IDENTIFIER: [a-zA-Z][a-zA-Z0-9_]*;
CHAR: '\'' [a-zA-Z] '\'';
