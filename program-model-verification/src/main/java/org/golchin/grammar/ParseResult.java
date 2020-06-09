package org.golchin.grammar;

import org.antlr.v4.runtime.ANTLRInputStream;
import org.antlr.v4.runtime.CommonTokenStream;
import org.antlr.v4.runtime.tree.ParseTree;

import java.io.FileInputStream;
import java.io.IOException;

public class ParseResult {
    private final ANTLRInputStream is;
    private final GrammarParser parser;
    private final ParseTree tree;

    public ParseResult(ANTLRInputStream is, GrammarParser parser, ParseTree tree) {
        this.is = is;
        this.parser = parser;
        this.tree = tree;
    }

    public ANTLRInputStream getIs() {
        return is;
    }

    public GrammarParser getParser() {
        return parser;
    }

    public ParseTree getTree() {
        return tree;
    }

    public static ParseResult parse(String filePath) throws IOException {
        ANTLRInputStream is = new ANTLRInputStream(new FileInputStream(filePath));
        GrammarLexer lexer = new GrammarLexer(is);
        // create a buffer of tokens pulled from the lexer
        CommonTokenStream tokens = new CommonTokenStream(lexer);
        // create a parser that feeds off the tokens buffer
        GrammarParser parser = new GrammarParser(tokens);
        ParseTree tree = parser.source();
        return new ParseResult(is, parser, tree);
    }
}
