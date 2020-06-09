package org.golchin.grammar.nodes;

import com.android.dx.BinaryOp;
import com.android.dx.Comparison;
import com.android.dx.UnaryOp;
import lombok.AllArgsConstructor;
import org.antlr.v4.runtime.tree.TerminalNode;
import org.golchin.grammar.GrammarBaseVisitor;
import org.golchin.grammar.GrammarParser;
import org.golchin.grammar.bytecode.GlobalScope;
import org.golchin.grammar.bytecode.LocalScope;
import org.golchin.grammar.model.Method;
import org.golchin.grammar.nodes.literals.BoolNode;
import org.golchin.grammar.nodes.literals.CharNode;
import org.golchin.grammar.nodes.literals.LiteralNode;
import org.golchin.grammar.nodes.literals.StringNode;

import java.util.List;
import java.util.function.Function;

import static java.util.stream.Collectors.toList;

@AllArgsConstructor
public class ExpressionNodeVisitor extends GrammarBaseVisitor<ExpressionNode> {
    private final GlobalScope globalScope;
    private final LocalScope localScope;

    @Override
    public ExpressionNode visitOperand(GrammarParser.OperandContext ctx) {
        GrammarParser.InstanceContext instance = ctx.instance();
        ExpressionNode curNode;
        if (ctx.instance() == null) {
            ExpressionNode operand = ctx.operand().accept(this);
            curNode = createCall(operand, ctx.call(), globalScope::getStaticMethod);
        } else {
            curNode = instance.accept(this);
        }
        return curNode;
    }

    @Override
    public ExpressionNode visitBracesAlt(GrammarParser.BracesAltContext ctx) {
        return ctx.braces().expr().accept(this);
    }

    @Override
    public ExpressionNode visitCtorCall(GrammarParser.CtorCallContext ctx) {
        String typeName = ctx.IDENTIFIER().getText();
        return new ConstructorCall(globalScope.getCustomType(typeName));
    }

    @Override
    public ExpressionNode visitLocalAlt(GrammarParser.LocalAltContext ctx) {
        TerminalNode identifier = ctx.IDENTIFIER();
        return new LocalVariableNode(localScope.getLocalVariable(identifier.getText()));
    }

    @Override
    public ExpressionNode visitThisAlt(GrammarParser.ThisAltContext ctx) {
        return new This(localScope.getDeclaringType());
    }

    private ExpressionNode createCall(ExpressionNode curNode,
                                      GrammarParser.CallContext callContext,
                                      Function<String, Method> methodFinder) {
        GrammarParser.ExprListContext exprListContext = callContext.exprList();
        List<GrammarParser.ExprContext> exprContexts = exprListContext.expr() == null ? List.of() : exprListContext.expr();
        List<ExpressionNode> args = exprContexts.stream()
                .map(exprContext -> exprContext.accept(this))
                .collect(toList());
        String identifier = callContext.IDENTIFIER().getText();
        Method method = methodFinder.apply(identifier);
        return new Call(curNode, method, args);
    }

    @Override
    public ExpressionNode visitArithmetical(GrammarParser.ArithmeticalContext ctx) {
        GrammarParser.ArithmeticalContext arithmetical = ctx.arithmetical();
        ExpressionNode product = visitProduct(ctx.product());
        if (arithmetical == null) {
            return product;
        }
        String opText = ctx.op.getText();
        return new BinaryOpNode(BinaryOpNode.parseBinaryOp(opText), visitArithmetical(arithmetical), product);
    }

    @Override
    public ExpressionNode visitProduct(GrammarParser.ProductContext ctx) {
        GrammarParser.ProductContext product = ctx.product();
        ExpressionNode term = visitArithmeticalTerm(ctx.arithmeticalTerm());
        if (product == null) {
            return term;
        }
        String opText = ctx.op.getText();
        return new BinaryOpNode(BinaryOpNode.parseBinaryOp(opText), visitProduct(product), term);
    }

    @Override
    public ExpressionNode visitArithmeticalTerm(GrammarParser.ArithmeticalTermContext ctx) {
        GrammarParser.ArithmeticalTermContext arithmeticalTermContext = ctx.arithmeticalTerm();
        if (arithmeticalTermContext != null) {
            return new UnaryOpNode(UnaryOp.NEGATE, arithmeticalTermContext.accept(this));
        }
        return ctx.operand().accept(this);
    }

    @Override
    public ExpressionNode visitLogical(GrammarParser.LogicalContext ctx) {
        GrammarParser.LogicalContext logical = ctx.logical();
        GrammarParser.ConjunctionContext conjunction = ctx.conjunction();
        if (logical == null) {
            return conjunction.accept(this);
        }
        return new BinaryOpNode(BinaryOp.OR, logical.accept(this), conjunction.accept(this));
    }

    @Override
    public ExpressionNode visitConjunction(GrammarParser.ConjunctionContext ctx) {
        GrammarParser.ConjunctionContext conjunction = ctx.conjunction();
        GrammarParser.ConjunctContext conjunct = ctx.conjunct();
        if (conjunction == null) {
            return conjunct.accept(this);
        }
        return new BinaryOpNode(BinaryOp.AND, conjunction.accept(this), conjunct.accept(this));
    }

    @Override
    public ExpressionNode visitConjunct(GrammarParser.ConjunctContext ctx) {
        if (ctx.logicalTerm() != null) {
            return ctx.logicalTerm().accept(this);
        }
        Comparison comparison = ComparisonNode.parseComparison(ctx.getText());
        return new ComparisonNode(comparison, ctx.arithmetical(0).accept(this), ctx.arithmetical(1).accept(this));
    }

    @Override
    public ExpressionNode visitLogicalTerm(GrammarParser.LogicalTermContext ctx) {
        GrammarParser.OperandContext operand = ctx.operand();
        if (operand != null) {
            return operand.accept(this);
        }
        return new UnaryOpNode(UnaryOp.NOT, ctx.logicalTerm().accept(this));
    }

    @Override
    public ExpressionNode visitLiteral(GrammarParser.LiteralContext ctx) {
        String text = ctx.start.getText();
        if (ctx.BOOL() != null)
            return new BoolNode(Boolean.valueOf(text));
        if (ctx.STR() != null) {
            String unquoted = text.substring(1, text.length() - 1);
            return new StringNode(unescapeString(unquoted));
        }
        if (ctx.CHAR() != null) {
            String unquoted = text.substring(1, text.length() - 1);
            return new CharNode(unescapeChar(unquoted));
        }
        return LiteralNode.getOrCreateNumeric(text);
    }

    @Override
    public ExpressionNode visitBlock(GrammarParser.BlockContext ctx) {
        List<ExpressionNode> children = ctx.statement().stream()
                .map(statementContext -> statementContext.accept(this))
                .collect(toList());
        return new BlockNode(children);
    }

    @Override
    public ExpressionNode visitExpression(GrammarParser.ExpressionContext ctx) {
        return ctx.expr().accept(this);
    }

    private String unescapeString(String unquoted) {
        return unquoted
                .replace("\\r", "\r")
                .replace("\\n", "\n")
                .replace("\\\"", "\"")
                .replace("\\\\", "\\");
    }

    private Character unescapeChar(String unquoted) {
        if (unquoted.length() == 1)
            return unquoted.charAt(0);
        return switch (unquoted) {
            case "\\r" -> '\r';
            case "\\n" -> '\n';
            case "\\\\" -> '\\';
            case "\\'" -> '\'';
            default -> throw new IllegalStateException("Unexpected value: " + unquoted);
        };
    }
}
