package frontend.visitors;

import frontend.components.Annotation;
import frontend.components.annotations.Pre;
import frontend.grammar.stripeBaseVisitor;
import frontend.grammar.stripeParser;

public class AnnotationVisitor extends stripeBaseVisitor<Annotation> {
    public Annotation visitPreAnnotation(stripeParser.PreAnnotationContext ctx) {
        Pre a = new Pre(ctx.StringLiteral().toString());
    }

    public Annotation visitPostAnnotation(stripeParser.PostAnnotationContext ctx) {

    }

    public Annotation visitInvAnnotation(stripeParser.InvAnnotationContext ctx) {

    }

    public Annotation visitParamDocAnnotation(stripeParser.ParamDocAnnotationContext ctx) {

    }

    public Annotation visitDocAnnotation(stripeParser.DocAnnotationContext ctx) {

    }
}
