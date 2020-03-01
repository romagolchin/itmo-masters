import org.antlr.v4.runtime.ANTLRInputStream;
import org.antlr.v4.runtime.BufferedTokenStream;
import org.antlr.v4.runtime.CommonTokenStream;
import org.antlr.v4.runtime.UnbufferedCharStream;
import org.antlr.v4.runtime.misc.TestRig;
import org.antlr.v4.runtime.tree.ParseTree;

import java.io.FileInputStream;

public class Main {
    public static void main(String[] args) throws Exception {

        ANTLRInputStream is = new ANTLRInputStream(new FileInputStream("test.source"));
//        JsonLexer lexer = new JsonLexer(is);
//        // create a buffer of tokens pulled from the lexer
//        CommonTokenStream tokens = new CommonTokenStream(lexer);
//         create a parser that feeds off the tokens buffer
//        JsonParser parser = new JsonParser(tokens);
//        ParseTree tree = parser.json(); // begin parsing at init rule
//        System.out.println(tree.toStringTree(parser)); // print LISP-style tree
        GrammarLexer lexer = new GrammarLexer(is);
        // create a buffer of tokens pulled from the lexer
        CommonTokenStream tokens = new CommonTokenStream(lexer);
        // create a parser that feeds off the tokens buffer
        GrammarParser parser = new GrammarParser(tokens);
//        ParseTree tree = parser.source(); // begin parsing at init rule
//        System.out.println(tree.toStringTree(parser)); // print LISP-style tree
        TestRig.main(new String[]{"Grammar", "source", "-gui"});
    }
}
