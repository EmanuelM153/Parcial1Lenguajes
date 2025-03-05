grammar Grammar;
import Lexer;

prog: stat+ ;

stat: expr NEWLINE        # printExpr
    | NEWLINE             # blank
    ;

expr: expr op=('*'|'/') expr # MulDiv
    | expr op=('+'|'-') expr # AddSub
    | NUMERO            # numero
    | IMAGINARIO        # imaginario
    | '(' expr ')'      # parentesis
    ;

MUL : '*' ;
DIV : '/' ;
SUB : '-' ;
ADD : '+' ;
