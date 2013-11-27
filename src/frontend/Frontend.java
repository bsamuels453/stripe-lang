package frontend;

/**
 * Created with IntelliJ IDEA.
 * User: frankbro
 * Date: 15/11/13
 * Time: 9:27 PM
 * To change this template use File | Settings | File Templates.
 *
 *
 * Lex -> Parse -> AST -> Simplify AST / Desugar ->
 * Import additional symbols -> Resolve references ->
 * Generate IR -> Optimize IR -> Generate Machine Code ->
 * Optimize Machine code.
 *
 *
 */

import frontend.components.CompilationUnit;
import frontend.visitors.CompilationUnitVisitor;
import frontend.visitors.ImportVisitor;
import frontend.visitors.ModuleVisitor;
import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.tree.*;
import frontend.grammar.*;

public class Frontend {
    public void translate(String file) throws Exception {
        ANTLRFileStream input = new ANTLRFileStream(file);

        stripeLexer lexer = new stripeLexer(input);
        CommonTokenStream tokens = new CommonTokenStream(lexer);
        stripeParser parser = new stripeParser(tokens);

        // Zeroth pass will be done by Antlr
        ParseTree tree = parser.compilationUnit();
        // At this point, the syntax is valid

        CompilationUnitVisitor cuv = new CompilationUnitVisitor();
        CompilationUnit cu = cuv.visit(tree);

        tree = firstPass(tree);
        tree = secondPass(tree);
        tree = thirdPass(tree);
        tree = forthPass(tree);
        tree = fifthPass(tree);
    }

    // The first pass will only check that every identifiers are ok.
    // They are either :
    //      1- Defined locally within the file
    //      2- Imported from another file
    private ParseTree firstPass(ParseTree tree) {

        return tree;
    }

    // The second pass will check for types
    // This involves :
    //      1- Comparing the types using in functions with the types expected
    //      2- Generate what a declaration should return
    private ParseTree secondPass(ParseTree tree) {

        return tree;
    }

    // The third pass will check for contracts
    // In the future, the compiler should try to optimize out the contacts
    // Meaning, based on usage, the compiler should know if a contract can be broken
    // if it can't, then it should be remove.
    // For now, I will integrate them into the ast, like simple if's and such
    // and call a function that will break the vm if its ever called.
    private ParseTree thirdPass(ParseTree tree) {

        return tree;
    }

    // The forth pass will actually import from other files
    // For the first version, only single file compilation will be supported
    private ParseTree forthPass(ParseTree tree) {

        return tree;
    }

    // The fifth pass will involve a last optimization on the ast
    // after that, its code generation
    private ParseTree fifthPass(ParseTree tree) {

        return tree;
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
