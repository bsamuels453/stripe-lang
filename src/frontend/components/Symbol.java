package frontend.components;

/**
 * Created with IntelliJ IDEA.
 * User: frankbro
 * Date: 16/11/13
 * Time: 6:52 PM
 * To change this template use File | Settings | File Templates.
 */
public class Symbol {

    boolean isExported = false;
    boolean isImported = false;
    String name;

    public Symbol(String name) {
        this.name = name;
    }

}
