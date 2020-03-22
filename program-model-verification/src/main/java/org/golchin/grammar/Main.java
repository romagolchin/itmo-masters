package org.golchin.grammar;

import org.antlr.v4.runtime.ParserRuleContext;
import org.antlr.v4.runtime.RuleContext;
import org.antlr.v4.runtime.Token;
import org.antlr.v4.runtime.misc.Interval;
import org.antlr.v4.runtime.misc.TestRig;
import org.antlr.v4.runtime.tree.*;

import java.io.BufferedWriter;
import java.nio.file.Files;
import java.nio.file.Paths;

public class Main {
    static String uncapitalize(String s) {
        if (s == null || s.isEmpty()) {
            return s;
        }
        return Character.toLowerCase(s.charAt(0)) + s.substring(1);
    }

    public static void main(String[] args) throws Exception {
        ParseResult parseResult = ParseResult.parse("test.source");
        GrammarParser parser = parseResult.getParser();
        ParseTree tree = parseResult.getTree();
        try(BufferedWriter bufferedWriter = Files.newBufferedWriter(Paths.get(args[0]))) {
            IndentedWriter indentedWriter = new IndentedWriter(bufferedWriter);
            System.out.println(tree.toStringTree(parser)); // print LISP-style tree
            String[] ruleNames = parser.getRuleNames();
            String[] tokenNames = parser.getTokenNames();
            ParseTreeVisitor<Object> parseTreeVisitor = new AbstractParseTreeVisitor<>() {
                private String positionToString(Token token) {
                    return "L" + token.getLine() + ",C" + token.getCharPositionInLine();
                }

                @Override
                public Object visitTerminal(TerminalNode node) {
                    String position = positionToString(node.getSymbol());
                    int tokenIndex = node.getSymbol().getType();
                    String tokenName = tokenIndex >= 0 && tokenIndex < tokenNames.length ? tokenNames[tokenIndex] : "";
                    indentedWriter.writeLine(position + " " + tokenName.toLowerCase() + ": " + node.getSymbol().getText());
                    return null;
                }

                @Override
                public Object visitChildren(RuleNode node) {
                    ParserRuleContext sourceContext = (ParserRuleContext) node;
                    String position = positionToString(sourceContext.start);
                    Interval interval = Interval.of(sourceContext.start.getStartIndex(), sourceContext.stop.getStopIndex());
                    String text = parseResult.getIs().getText(interval)
                            .replace("\n", "\\n");
                    RuleContext ruleContext = node.getRuleContext();
                    String alternativeName =
                            uncapitalize(ruleContext.getClass().getSimpleName().replaceFirst("Context", ""));
                    String ruleName = ruleNames[ruleContext.getRuleIndex()];
                    String fullName = ruleName.equalsIgnoreCase(alternativeName) ? ruleName
                            : ruleName + "." + alternativeName;
                    fullName = fullName.replace("block1", "block")
                            .replace("operand", "expr");
                    indentedWriter.writeLine(position + " " + fullName + " " + text);
                    indentedWriter.indent();
                    super.visitChildren(node);
                    indentedWriter.dedent();
                    return null;
                }

            };
            parseTreeVisitor.visit(tree);
        }
//        TestRig.main(new String[]{"Grammar", "source", "-tokens"});
        TestRig.main(new String[]{"org.golchin.grammar.Grammar", "source", "-gui"});
    }
}
