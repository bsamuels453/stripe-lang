package frontend.visitors;

import frontend.components.Expr;
import frontend.grammar.stripeBaseVisitor;
import frontend.grammar.stripeParser;
import sun.reflect.generics.reflectiveObjects.NotImplementedException;

public class ExprVisitor extends stripeBaseVisitor<Expr> {
    public Expr visitValueExpr(stripeParser.ValueExprContext ctx) {
        throw new NotImplementedException();
    }

    public Expr visitElementExpr(stripeParser.ElementExprContext ctx) {
        throw new NotImplementedException();
    }

    public Expr visitFunCallExpr(stripeParser.FunCallExprContext ctx) {
        throw new NotImplementedException();
    }

    public Expr visitMulExpr(stripeParser.MulExprContext ctx) {
        throw new NotImplementedException();
    }

    public Expr visitAddExpr(stripeParser.AddExprContext ctx) {
        throw new NotImplementedException();
    }

    public Expr visitAppendExpr(stripeParser.AppendExprContext ctx) {
        throw new NotImplementedException();
    }

    public Expr visitBitShiftExpr(stripeParser.BitshiftExprContext ctx) {
        throw new NotImplementedException();
    }

    public Expr visitBoolCompareExpr(stripeParser.BoolCompareExprContext ctx) {
        throw new NotImplementedException();
    }

    public Expr visitBoolEqExpr(stripeParser.BoolEqExprContext ctx) {
        throw new NotImplementedException();
    }

    public Expr visitBinAndExpr(stripeParser.BinAndExprContext ctx) {
        throw new NotImplementedException();
    }

    public Expr visitBinXorExpr(stripeParser.BinXorExprContext ctx) {
        throw new NotImplementedException();
    }

    public Expr visitBinOrExpr(stripeParser.BinOrExprContext ctx) {
        throw new NotImplementedException();
    }

    public Expr visitBoolAndExpr(stripeParser.BoolAndExprContext ctx) {
        throw new NotImplementedException();
    }

    public Expr visitBoolOrExpr(stripeParser.BoolOrExprContext ctx) {
        throw new NotImplementedException();
    }

    public Expr visitTernaryExpr(stripeParser.TernaryExprContext ctx) {
        throw new NotImplementedException();
    }

    public Expr visitIfExpr(stripeParser.IfExprContext ctx) {
        throw new NotImplementedException();
    }

    public Expr visitMatchExpr(stripeParser.MatchExprContext ctx) {
        throw new NotImplementedException();
    }

    public Expr visitGuardExpr(stripeParser.GuardExprContext ctx) {
        throw new NotImplementedException();
    }

    public Expr visitLetExpr(stripeParser.LetExprContext ctx) {
        throw new NotImplementedException();
    }

    public Expr visitMakeObjExpr(stripeParser.MakeObjExprContext ctx) {
        throw new NotImplementedException();
    }
}
