lexer grammar Lexer;
NUMERO : [-|+]?[0-9]+(.[0-9]+)? ;
IMAGINARIO : NUMERO'i' ;
NEWLINE : '\r'? '\n' ;
ID : [a-zA-Z_][a-zA-Z0-9_]* ;
WS : [ \t]+ -> skip ;
