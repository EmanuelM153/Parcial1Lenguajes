import sys
from antlr4 import *
from GrammarLexer import GrammarLexer
from GrammarParser import GrammarParser
from EvalVisitor import EvalVisitor

def main():
    if (len(sys.argv) == 2):
        archivo = sys.argv[1]
    else:
        archivo = None

    if archivo:
        with open(archivo, 'r') as fp:
            lineas = fp.readlines()
    else:
        lineas = sys.stdin.readlines()

    visitor = EvalVisitor()
    for linea in lineas:
        entrada = InputStream(linea)
        lexer = GrammarLexer(entrada)
        stream = CommonTokenStream(lexer)
        parser = GrammarParser(stream)
        arbol = parser.expr()

        result = visitor.visit(arbol)
        print(result)

if __name__ == '__main__':
    main()
