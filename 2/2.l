variable [a-zA-Z_][a-zA-Z0-9_]*
espacio [ \t]*
multiples_variables {variable}({espacio},{espacio}{variable})*
%%
^{variable}{espacio}={espacio}"lambda"{espacio}{multiples_variables}:.*$ { printf("ACEPTA"); }
^.*$ printf("NO ACEPTA");
%%
int main(int argc, char **argv) {
    if (argc < 2) {
        printf("Uso: %s <archivo>\n", argv[0]);
        return 1;
    }

    FILE *archivo = fopen(argv[1], "r");

    yyin = archivo;
    yylex();

    fclose(archivo);
    return 0;
}

// para solucionar undefined reference to yywrap
int yywrap(){ return(1); }
