package org.golchin.grammar.nodes;

import lombok.AllArgsConstructor;
import lombok.Getter;
import org.antlr.v4.runtime.ParserRuleContext;
import org.antlr.v4.runtime.tree.TerminalNode;
import org.golchin.grammar.GrammarBaseVisitor;
import org.golchin.grammar.GrammarParser;
import org.golchin.grammar.ir.*;
import org.golchin.grammar.model.Array;
import org.golchin.grammar.model.Method;
import org.golchin.grammar.model.ReferenceType;
import org.golchin.grammar.model.Type;
import org.golchin.grammar.nodes.literals.BoolNode;
import org.golchin.grammar.nodes.literals.CharNode;
import org.golchin.grammar.nodes.literals.LiteralNode;
import org.golchin.grammar.nodes.literals.StringNode;

import java.util.List;
import java.util.Objects;

import static java.util.stream.Collectors.toList;
import static org.golchin.grammar.ir.BinaryOperation.AND;
import static org.golchin.grammar.ir.BinaryOperation.OR;
import static org.golchin.grammar.model.Visibility.PRIVATE;

@Getter
@AllArgsConstructor
public class ExpressionNodeVisitor extends GrammarBaseVisitor<ExpressionNode> {
    private final GlobalScope globalScope;
    private final LocalScope localScope;

    @Override
    public ExpressionNode visitOperand(GrammarParser.OperandContext ctx) {
        GrammarParser.InstanceContext instance = ctx.instance();
        if (ctx.instance() == null) {
            ExpressionNode operand = ctx.operand().accept(this);
            GrammarParser.MemberContext member = ctx.member();
            if (operand.getType() instanceof ReferenceType referenceType) {
                GrammarParser.CallContext callContext = member.call();
                if (callContext != null) {
                    List<ExpressionNode> args = createArgs(callContext);
                    String identifier = callContext.identifierChain().getText();
                    Method method = referenceType.getMethod(identifier);
                    if (method.getVisibility() == PRIVATE && !Objects.equals(method.getDeclaringType(), localScope.getDeclaringType()))
                        throw new CompilationError("Cannot call private method " + method.getName());
                    return new Call(operand, method, args);
                }
                return new FieldAccess(operand, referenceType.getField(member.getText()));
            }
            throw new CompilationError("Expected reference type");
        } else {
            return instance.accept(this);
        }
    }

    @Override
    public ExpressionNode visitBracesAlt(GrammarParser.BracesAltContext ctx) {
        return ctx.braces().expr().accept(this);
    }

    @Override
    public LocalVariableNode visitVar(GrammarParser.VarContext ctx) {
        TerminalNode identifier = ctx.IDENTIFIER();
        return new LocalVariableNode(localScope.getLocalVariable(identifier.getText()));
    }

    @Override
    public ExpressionNode visitThisAlt(GrammarParser.ThisAltContext ctx) {
        ReferenceType declaringType = localScope.getDeclaringType();
        if (declaringType == null) {
            throw new CompilationError("'this' is not defined");
        }
        return new ThisNode(declaringType);
    }

    @Override
    public ExpressionNode visitCtorCall(GrammarParser.CtorCallContext ctx) {
        String typeName = ctx.IDENTIFIER().getText();
        return new ConstructorCall(globalScope.getCustomType(typeName));
    }

    @Override
    public ExpressionNode visitCallAlt(GrammarParser.CallAltContext ctx) {
        var identifiers = ctx.call().identifierChain().IDENTIFIER();
        String name;
        String filename;
        if (identifiers.size() > 1) {
            filename = identifiers.get(0).getText();
            name = identifiers.get(1).getText();
        } else {
            filename = localScope.getFilename();
            name = identifiers.get(0).getText();
        }
        var function = globalScope.getFunction(filename, name);
        return new Call(null, function, createArgs(ctx.call()));

    }

    private List<ExpressionNode> createArgs(GrammarParser.CallContext callContext) {
        GrammarParser.ExprListContext exprListContext = callContext.exprList();
        List<GrammarParser.ExprContext> exprContexts = exprListContext.expr() == null ? List.of() : exprListContext.expr();
        return visitList(exprContexts);
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
            return new UnaryOpNode(UnaryOperation.NEGATE, arithmeticalTermContext.accept(this));
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
        return new BinaryOpNode(OR, logical.accept(this), conjunction.accept(this));
    }

    @Override
    public ExpressionNode visitConjunction(GrammarParser.ConjunctionContext ctx) {
        GrammarParser.ConjunctionContext conjunction = ctx.conjunction();
        GrammarParser.ConjunctContext conjunct = ctx.conjunct();
        if (conjunction == null) {
            return conjunct.accept(this);
        }
        return new BinaryOpNode(AND, conjunction.accept(this), conjunct.accept(this));
    }

    @Override
    public ExpressionNode visitConjunct(GrammarParser.ConjunctContext ctx) {
        if (ctx.logicalTerm() != null) {
            return ctx.logicalTerm().accept(this);
        }
        RelationOperation comparison = ComparisonNode.parseRelationOperation(ctx.COMPARISON().getText());
        return new ComparisonNode(comparison, ctx.arithmetical(0).accept(this), ctx.arithmetical(1).accept(this));
    }

    @Override
    public ExpressionNode visitLogicalTerm(GrammarParser.LogicalTermContext ctx) {
        GrammarParser.OperandContext operand = ctx.operand();
        if (operand != null) {
            return operand.accept(this);
        }
        return new UnaryOpNode(UnaryOperation.NOT, ctx.logicalTerm().accept(this));
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

    @Override
    public ExpressionNode visitAssign(GrammarParser.AssignContext ctx) {
        GrammarParser.ExprContext leftCtx = ctx.expr().get(0);
        ExpressionNode left = leftCtx.accept(this);
        if (left instanceof LValue lValue) {
            return new AssignNode(lValue, ctx.expr().get(1).accept(this));
        }
        throw new CompilationError("Expected l-value");
    }

    @Override
    public ExpressionNode visitIndexer(GrammarParser.IndexerContext ctx) {
        String arrayName = ctx.IDENTIFIER().getText();
        LocalVariable localVariable = localScope.getLocalVariable(arrayName);
        List<ExpressionNode> indices = ctx.exprList().expr().stream()
                .map(exprContext -> exprContext.accept(this)).collect(toList());
        return new ArrayIndex(new LocalVariableNode(localVariable), indices);
    }

    @Override
    public ExpressionNode visitArrayAlt(GrammarParser.ArrayAltContext ctx) {
        Type elementType = Type.createInstance(ctx.typeRef());
        Array array = Array.ofElements(elementType, ctx.exprList().expr().size());
        return new ArrayValueNode(array, visitList(ctx.exprList().expr()));
    }

    private List<ExpressionNode> visitList(List<? extends ParserRuleContext> exprContexts) {
        return exprContexts.stream()
                .map(exprContext -> exprContext.accept(this))
                .collect(toList());
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
