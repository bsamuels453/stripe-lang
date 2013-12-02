package frontend.components;

import java.util.ArrayList;
import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: frankbro
 * Date: 16/11/13
 * Time: 6:52 PM
 * To change this template use File | Settings | File Templates.
 */
public class Symbol {

    boolean isExported = false;
    String name;
    List<Annotation> annotations = new ArrayList<Annotation>();

    public Symbol(String name) {
        this.name = name;
    }

    public void addAnnotation(Annotation annotation) {
        annotations.add(annotation);
    }

}
