import java.io.FileReader;
import java_cup.runtime.Symbol;

/**
 * This class is a test of the generated Parser.  It uses the scanner (Yylex)
 * to get tokens for the Parser, which should provide a parse tree.  This
 * tester program simply prints out that parse tree.
 *
 * @author Peter Ohmann + <your name here>
 */
public class ParserTest {
    /**
     * Recursively print out the parse tree node provided.  External callers
     * should use the single-parameter version, unless they need an initial
     * indent other than "".
     *
     * @param node the parse tree node to (recursively) print out
     * @param indent the current indent to use (increases as we recurse down
     *               the tree)
     */
    private static void printParseTree(ParseTreeNode node, String indent) {
        System.out.println(indent + node);
        for (ParseTreeNode child : node.childrenIter()) {
            printParseTree(child, indent + "    ");
        }
    }

    /**
     * Recursively print out the parse tree node provided.  Assumes no indent
     * for the root of the tree.  External callers should pass the root of the
     * parse tree as node.
     *
     * @param node the parse tree node to (recursively) print out
     */
    private static void printParseTree(ParseTreeNode node) {
        printParseTree(node, "");
    }

    public static void main(String argv[]) {    
        try {
            Yylex scanner = new Yylex(new FileReader(argv[0]));
            Parser parser = new Parser(scanner);

            try {
                // the parser returns a Symbol whose value instance variable
                // is the root nonterminal of the parse tree
                Symbol root = parser.parse();
                System.out.println("Program parsed correctly!");
                if (root.value instanceof ParseTreeNode)
                    printParseTree((ParseTreeNode)root.value);
                else
                    System.out.println("Ignoring invalid parse tree for printing...");
            }
            catch (Exception e) {
                System.err.println("Parsing threw an exception!");
                e.printStackTrace();
                System.exit(1);
            }
        }
        catch (Exception e) {
            e.printStackTrace();
        }
    }
}
