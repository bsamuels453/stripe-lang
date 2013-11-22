package frontend.components;

import java.util.ArrayList;
import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: frankbro
 * Date: 21/11/13
 * Time: 11:38 PM
 * To change this template use File | Settings | File Templates.
 */
public class Import {
    List<String> packages = new ArrayList<String>();
    String name;
    String qualifiedName = null;

    public Import(String name) {
        this.name = name;
    }

    public void setQualifiedName(String qualifiedName) {
        this.qualifiedName = qualifiedName;
    }

    public void addPackage(String name) {
        packages.add(name);
    }

    public String toString() {
        String output = "Import : ";
        for(String p: packages) {
            output += p + ".";
        }
        output += name;
        if(qualifiedName != null) {
            output += " as " + qualifiedName;
        }
        return output;
    }
}
