## Ejecución punto 2
```
# Generación del código fuente del lexer
flex 2.l
# Compilación del lexer
cc lex.yy.c -o lexer -lfl
# Ejecución
./lexer <archivo_de_texto>
```
