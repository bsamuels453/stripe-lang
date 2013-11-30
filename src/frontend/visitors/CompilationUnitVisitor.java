package frontend.visitors;

import frontend.components.CompilationUnit;
import frontend.components.Import;
import frontend.components.Module;
import frontend.components.Symbol;
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

        List<Symbol> symbols = new ArrayList<Symbol>();
        List<stripeParser.BodyDeclContext> bodyCtxs = ctx.bodyDecl();
        BodyVisitor bodyVisitor = new BodyVisitor();
        for(stripeParser.BodyDeclContext b: bodyCtxs) {
            symbols.add(bodyVisitor.visit(b));
        }

        CompilationUnit cu = new CompilationUnit();
        return cu;
    }
}
