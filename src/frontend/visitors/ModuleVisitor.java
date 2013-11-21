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
import org.antlr.v4.runtime.tree.TerminalNode;

public class ModuleVisitor extends stripeBaseVisitor<Module> {

    public Module visitModuleDecl(stripeParser.ModuleDeclContext ctx) {

        List<TerminalNode> identifiers = ctx.qualifiedName().Identifier();
        String name = "Unknown";
        List<String> packages = new ArrayList<String>();
        for(int i = 0; i < identifiers.size(); i++) {
            if(i == identifiers.size() - 1) {
                name = identifiers.get(i).toString();
            }
            else {
                String moduleName = identifiers.get(i).toString();
                packages.add(moduleName);
            }
        }
        Module module = new Module(name);
        for(String p: packages) {
            module.addPackage(p);
        }
        return module;
    }
}
