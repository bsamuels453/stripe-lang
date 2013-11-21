/**
 * Created with IntelliJ IDEA.
 * User: frankbro
 * Date: 15/11/13
 * Time: 3:22 PM
 * To change this template use File | Settings | File Templates.
 */
import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.tree.*;
import frontend.Frontend;

public class Stripe {
    public static void main(String[] args) throws Exception {
        //Frontend.testAntlr();
        Frontend f = new Frontend();
        f.translate("/home/frankbro/stripe-lang/examples/guessnumber.strp");
    }
}
