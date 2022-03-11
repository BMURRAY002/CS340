import java.io.FileReader;
import java_cup.runtime.Symbol;

/**
 * This class is a test of the generated Scanner in Yylex.  It simply
 * repeatedly asks for another token, and prints it out.
 *
 * @author Peter Ohmann + <your name here>
 */
public class ScannerTest {
    /**
     * Given a symbol type (as an int), convert it to its string representation,
     * based on the symbols defined in sym.java.
     *
     * @param symType the symbol type read by the scanner
     * @return the String version
     */
    private static String symTypeToString(int symType) throws IllegalArgumentException {
        switch(symType) {
        case sym.EOF: return "EOF";
        case sym.PLUS: return "PLUS";
        case sym.NUM: return "NUM";
	case sym.LET: return "LET";
	case sym.EQUAL: return "EQUAL";
	case sym.MIN: return "MIN";
	case sym.PRINT: return "PRINT";
        default: throw new IllegalArgumentException("Invalid token type in symbol!");
        }
    }

    public static void main(String argv[]) {    
        try {
            Yylex scanner = new Yylex(new FileReader(argv[0]));
            Symbol token = scanner.next_token();
            while (token.sym != sym.EOF) {
                System.out.println("Token: " + symTypeToString(token.sym) +
                                   "\tValue: " + token.value);
                token = scanner.next_token();
            }
        }
        catch (Exception e) {
            e.printStackTrace();
        }
    }
}
