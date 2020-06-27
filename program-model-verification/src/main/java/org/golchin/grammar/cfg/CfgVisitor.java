package org.golchin.grammar.cfg;

import lombok.AllArgsConstructor;
import org.antlr.v4.runtime.RuleContext;
import org.golchin.grammar.GrammarBaseVisitor;
import org.golchin.grammar.GrammarParser;
import org.golchin.grammar.graph.Node;

import java.util.ArrayList;
import java.util.List;
import java.util.function.Function;

import static java.util.Collections.emptyList;

@AllArgsConstructor
public class CfgVisitor<T> extends GrammarBaseVisitor<Cfg<T>> {
    private final Function<RuleContext, T> ruleContextFunction;

    @Override
    public Cfg<T> visitFuncDefAlt(GrammarParser.FuncDefAltContext ctx) {
        GrammarParser.FuncDefContext funcDefContext = ctx.funcDef();
        Cfg<T> cfg = funcDefContext.body().block().getRuleContext().accept(this);
        cfg.name = funcDefContext.funcSignature().IDENTIFIER().getSymbol().getText();
        return cfg;
    }

    private SingleNode<T> createSingleNode(RuleContext ctx) {
        return new SingleNode<>(getNode(ctx));
    }

    private Node<List<T>, String> getNode(RuleContext ruleContext) {
        return Node.getInstance(getInstructions(ruleContext));
    }

    private List<T> getInstructions(RuleContext ctx) {
        return List.of(ruleContextFunction.apply(ctx));
    }

    @Override
    public Cfg<T> visitExpression(GrammarParser.ExpressionContext ctx) {
        return createSingleNode(ctx);
    }

    @Override
    public Cfg<T> visitAssign(GrammarParser.AssignContext ctx) {
        return createSingleNode(ctx);
    }

    @Override
    public Cfg<T> visitIf(GrammarParser.IfContext ctx) {
        List<GrammarParser.StatementContext> statement = ctx.statement();
        Node<List<T>, String> condition = getNode(ctx.expr());
        Cfg<T> thenCfg = ctx.statement(0).accept(this);
        Cfg<T> elseCfg = null;
        var exitPoints = new ArrayList<>(thenCfg.exitPoints);
        if (statement.size() > 1) {
            GrammarParser.StatementContext elseCtx;
            elseCtx = statement.get(1);
            elseCfg = elseCtx.accept(this);
            exitPoints.addAll(elseCfg.exitPoints);
        }
        return new If<>(condition, thenCfg, elseCfg, exitPoints);
    }

    @Override
    public Cfg<T> visitBlock(GrammarParser.BlockContext ctx) {
        var elements = new ArrayList<Cfg<T>>();
        var exitPoints = new ArrayList<Node<List<T>, String>>();
        for (GrammarParser.StatementContext statementContext : ctx.statement()) {
            Cfg<T> cfg = statementContext.accept(this);
            exitPoints.addAll(cfg.getExitPoints());
            elements.add(cfg);
        }
        for (int i = 0; i < elements.size() - 1; i++) {
            var cfg = elements.get(i);
            cfg.resetNext(elements.get(i + 1));
        }
        return new Block<>(elements, exitPoints);
    }

    @Override
    public Cfg<T> visitWhile(GrammarParser.WhileContext ctx) {
        Node<List<T>, String> condition = getNode(ctx.expr());
        return new While<>(condition, ctx.statement().accept(this));
    }

    @Override
    public Cfg<T> visitDo(GrammarParser.DoContext ctx) {
        Node<List<T>, String> condition = getNode(ctx.expr());
        boolean isDoWhile = "while".equals(ctx.whileSpec().getText());
        return new Do<>(condition, ctx.statement().accept(this), isDoWhile);
    }

    @Override
    public Cfg<T> visitBreak(GrammarParser.BreakContext ctx) {
        return new SingleNode<>(Node.getInstance(emptyList()));
    }
}
