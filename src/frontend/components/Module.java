package frontend.components;

/**
 * Created with IntelliJ IDEA.
 * User: frankbro
 * Date: 16/11/13
 * Time: 5:56 PM
 * To change this template use File | Settings | File Templates.
 */

import java.util.*;

public class Module {
    private Map<String, Symbol> exportedSymbols = new HashMap<String, Symbol>();
    private String name;

    public Module(String name) {
        this.name = name;
    }

    public void addExportedSymbol(String name) {
        if(exportedSymbols.containsKey(name)) {
            System.out.println("Duplicated symbol in export list : " + name);
            return;
        }
        exportedSymbols.put(name, null);
    }
}
