package frontend.visitors;

import frontend.components.Import;
import frontend.grammar.stripeBaseVisitor;
import frontend.grammar.stripeParser;
import org.antlr.v4.runtime.tree.TerminalNode;

import java.util.ArrayList;
import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: frankbro
 * Date: 21/11/13
 * Time: 11:17 PM
 * To change this template use File | Settings | File Templates.
 */

public class ImportVisitor extends stripeBaseVisitor<Import> {
    public Import visitStandardImport(stripeParser.StandardImportContext ctx) {
        List<TerminalNode> identifiers = ctx.qualifiedNameAndStar().qualifiedName().Identifier();
        stripeParser.AndStarContext starCtx = ctx.qualifiedNameAndStar().andStar();
        String name = "Unknown";
        List<String> packages = new ArrayList<String>();
        for(int i = 0; i < identifiers.size(); i++) {
            if(i == identifiers.size() - 1 && starCtx == null) {
                name = identifiers.get(i).toString();
            }
            else {
                String moduleName = identifiers.get(i).toString();
                packages.add(moduleName);
            }
        }
        if(starCtx != null) {
            name = "*";
        }
        Import i = new Import(name);
        for(String p: packages) {
            i.addPackage(p);
        }
        System.out.println(i.toString());
        return i;
    }

    public Import visitQualifiedImport(stripeParser.QualifiedImportContext ctx) {
        List<TerminalNode> identifiers = ctx.qualifiedName().Identifier();
        String name = "Unknown";
        String qualifiedName = ctx.Identifier().toString();
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
        Import i = new Import(name);
        i.setQualifiedName(qualifiedName);
        for(String p: packages) {
            i.addPackage(p);
        }
        System.out.println(i.toString());
        return i;
    }
}
