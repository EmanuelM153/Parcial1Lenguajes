## Ejecución punto 5
```
# Generación con antlr
antlr -no-listener -visitor -Dlanguage=Python3 Grammar.g4
# Ejecución con archivo
python Calc.py <archivo>
# Ejecución con stdin
python Calc.py
```
