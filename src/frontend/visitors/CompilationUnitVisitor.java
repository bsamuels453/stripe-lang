package frontend.visitors;

/**
 * Created with IntelliJ IDEA.
 * User: frankbro
 * Date: 26/11/13
 * Time: 9:33 PM
 * To change this template use File | Settings | File Templates.
 */

import frontend.components.CompilationUnit;
import frontend.components.Import;
import frontend.components.Module;
import frontend.grammar.stripeBaseVisitor;
import frontend.grammar.stripeParser;

import java.util.ArrayList;
import java.util.List;

public class CompilationUnitVisitor extends stripeBaseVisitor<CompilationUnit> {

    public CompilationUnit visitCompilationUnit(stripeParser.CompilationUnitContext ctx) {
        Module module = new ModuleVisitor().visit(ctx.moduleDecl());

        List<Import> imports = new ArrayList<Import>();
        List<stripeParser.ImportDeclContext> importCtxs = ctx.importDecl();
        ImportVisitor importVisitor = new ImportVisitor();
        for(stripeParser.ImportDeclContext i: importCtxs) {
            imports.add(importVisitor.visit(i));
        }

        CompilationUnit cu = new CompilationUnit();
        return cu;
    }
}
