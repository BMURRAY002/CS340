import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/**
 * This class represents a node of the parse tree.  All nodes need a way
 * to print it out (i.e., a toString()), and many will have children.
 * Note that this is just an abstract superclass; there should be a subclass
 * for each type of non-terminal in the parse tree.
 *
 * @author Peter Ohmann + <your name here>
 */
public abstract class ParseTreeNode {
    // subclasses should put their child nodes here
    protected List<ParseTreeNode> children;

    public ParseTreeNode() {
        this.children = new ArrayList<ParseTreeNode>();
    }

    public Iterable<ParseTreeNode> childrenIter() {
        return Collections.unmodifiableList(this.children);
    }

    // force sub-classes to override toString
    // it's a bit hack-y and weird, but it should get the point across :)
    @Override
    public abstract String toString();
}
