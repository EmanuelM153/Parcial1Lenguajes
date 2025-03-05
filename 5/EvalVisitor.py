from GrammarParser import GrammarParser
from GrammarVisitor import GrammarVisitor

class EvalVisitor(GrammarVisitor):
    def visitPrintExpr(self, ctx):
         return str(self.visit(ctx.expr())).replace("j", "i").replace("(", "").replace(")", "")

    def visitMulDiv(self, ctx):
        izq = self.visit(ctx.expr(0))
        der = self.visit(ctx.expr(1))
        if ctx.op.type == GrammarParser.MUL:
            return izq * der
        else:
            return izq / der

    def visitAddSub(self, ctx):
        izq = self.visit(ctx.expr(0))
        der = self.visit(ctx.expr(1))
        if ctx.op.type == GrammarParser.ADD:
            return izq + der
        else:
            return izq - der

    def visitNumero(self, ctx):
        return float(ctx.NUMERO().getText())

    def visitImaginario(self, ctx):
        imaginario = ctx.IMAGINARIO().getText().replace("i", "j")
        return complex(imaginario)

    def visitParentesis(self, ctx):
        return self.visit(ctx.expr())
