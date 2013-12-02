package frontend.visitors;

/**
 * Created with IntelliJ IDEA.
 * User: frankbro
 * Date: 16/11/13
 * Time: 5:59 PM
 * To change this template use File | Settings | File Templates.
 */

import frontend.grammar.stripeBaseVisitor;
import frontend.components.Value;
import frontend.grammar.stripeParser;
import sun.reflect.generics.reflectiveObjects.NotImplementedException;

public class ValueVisitor extends stripeBaseVisitor<Value> {
    public Value visitParenValue(stripeParser.ParenValueContext ctx) {
        throw new NotImplementedException();
    }

    public Value visitThisValue(stripeParser.ThisValueContext ctx) {
        throw new NotImplementedException();
    }

    public Value visitIgnoreValue(stripeParser.IgnoreValueContext ctx) {
        throw new NotImplementedException();
    }

    public Value visitLiteralValue(stripeParser.LiteralValueContext ctx) {
        throw new NotImplementedException();
    }

    public Value visitContextValue(stripeParser.ContextValueContext ctx) {
        throw new NotImplementedException();
    }

    public Value visitNameValue(stripeParser.NameValueContext ctx) {
        throw new NotImplementedException();
    }

    public Value visitContextAndValue(stripeParser.ContextAndValueContext ctx) {
        throw new NotImplementedException();
    }
}
