package frontend;

/**
 * Created with IntelliJ IDEA.
 * User: frankbro
 * Date: 15/11/13
 * Time: 9:27 PM
 * To change this template use File | Settings | File Templates.
 */

import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.tree.*;
import frontend.grammar.*;

public class Frontend {
    public void translate() throws Exception {
        ANTLRInputStream input = new ANTLRInputStream(System.in);

        stripeLexer lexer = new stripeLexer(input);
        CommonTokenStream tokens = new CommonTokenStream(lexer);
        stripeParser parser = new stripeParser(tokens);
        ParseTree tree = parser.compilationUnit();

        ParseTreeWalker walker = new ParseTreeWalker();

        System.out.println(tree.toStringTree(parser));
    }

    // -------------------- TEST ---------------------------------------------

    public static void testAntlr() throws Exception {

        ANTLRInputStream input = new ANTLRInputStream(System.in);

        stripeLexer lexer = new stripeLexer(input);

        CommonTokenStream tokens = new CommonTokenStream(lexer);

        stripeParser parser = new stripeParser(tokens);
        ParseTree tree = parser.compilationUnit();

        System.out.println(tree.toStringTree(parser));
    }
}
