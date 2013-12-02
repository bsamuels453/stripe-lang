package frontend.visitors;

import frontend.components.Annotation;
import frontend.components.annotations.Pre;
import frontend.grammar.stripeBaseVisitor;
import frontend.grammar.stripeParser;
import sun.reflect.generics.reflectiveObjects.NotImplementedException;

public class AnnotationVisitor extends stripeBaseVisitor<Annotation> {
    public Annotation visitPreAnnotation(stripeParser.PreAnnotationContext ctx) {
        throw new NotImplementedException();
    }

    public Annotation visitPostAnnotation(stripeParser.PostAnnotationContext ctx) {
        throw new NotImplementedException();
    }

    public Annotation visitInvAnnotation(stripeParser.InvAnnotationContext ctx) {
        throw new NotImplementedException();
    }

    public Annotation visitParamDocAnnotation(stripeParser.ParamDocAnnotationContext ctx) {
        throw new NotImplementedException();
    }

    public Annotation visitDocAnnotation(stripeParser.DocAnnotationContext ctx) {
        throw new NotImplementedException();
    }
}
