package frontend.visitors;

import frontend.components.Annotation;
import frontend.components.Symbol;
import frontend.grammar.stripeBaseVisitor;
import frontend.grammar.stripeParser;
import sun.reflect.generics.reflectiveObjects.NotImplementedException;

import java.util.ArrayList;
import java.util.List;

public class BodyVisitor extends stripeBaseVisitor<Symbol> {
    public Symbol visitBodyDecl(stripeParser.BodyDeclContext ctx) {
        stripeParser.AnnotationListContext annList = ctx.annotationList();
        List<stripeParser.AnnotationContext> annCtxs = annList.annotation();
        List<Annotation> annotations = new ArrayList<Annotation>();
        AnnotationVisitor annotationVisitor = new AnnotationVisitor();
        for(stripeParser.AnnotationContext annCtx : annCtxs) {
            annotations.add(annotationVisitor.visit(annCtx));
        }

        stripeParser.AnnotableDeclContext bodyCtx = ctx.annotableDecl();
        Symbol symbol = this.visit(bodyCtx);

        // Attach annotations
        for(Annotation annotation: annotations) {
            symbol.addAnnotation(annotation);
        }

        return symbol;
    }

    public Symbol visitFunctionDecl(stripeParser.FunctionDeclContext ctx) {
        throw new NotImplementedException();
    }

    public Symbol visitDataDecl(stripeParser.DataDeclContext ctx) {
        throw new NotImplementedException();
    }

    public Symbol visitEnumDecl(stripeParser.EnumDeclContext ctx) {
        throw new NotImplementedException();
    }

    public Symbol visitStructDecl(stripeParser.StructDeclContext ctx) {
        throw new NotImplementedException();
    }

    public Symbol visitClassDecl(stripeParser.ClassDeclContext ctx) {
        throw new NotImplementedException();
    }

    public Symbol visitFieldDecl(stripeParser.FieldDeclContext ctx) {
        throw new NotImplementedException();
    }
}
