package frontend.visitors;

/**
 * Created with IntelliJ IDEA.
 * User: frankbro
 * Date: 16/11/13
 * Time: 5:48 PM
 * To change this template use File | Settings | File Templates.
 */

import java.util.*;
import frontend.grammar.stripeParser;
import frontend.grammar.stripeBaseVisitor;
import frontend.components.Module;
import frontend.components.Symbol;

public class ModuleVisitor extends stripeBaseVisitor<Module> {

    public Module visitModuleDecl(stripeParser.ModuleDeclContext ctx) {

        String name = ctx.qualifiedName().Identifier(ctx.qualifiedName().Identifier().size() - 1).toString();
        System.out.println("Module name is : " + name);
        Module module = new Module(name);
        return module;
    }
}
