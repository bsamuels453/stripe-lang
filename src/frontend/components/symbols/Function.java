package frontend.components.symbols;

import frontend.components.Expr;
import frontend.components.Symbol;

/**
 * Created with IntelliJ IDEA.
 * User: frankbro
 * Date: 20/11/13
 * Time: 11:24 PM
 * To change this template use File | Settings | File Templates.
 */
public class Function extends Symbol {

    Expr expr;

    public Function(String name) {
        super(name);
    }

    public void assign(Expr expr) {
        this.expr = expr;
    }
}
