package org.golchin.grammar.cfg;

import org.antlr.v4.runtime.RuleContext;
import org.golchin.grammar.GrammarBaseVisitor;
import org.golchin.grammar.GrammarParser;
import org.golchin.grammar.graph.Node;

import java.util.ArrayList;
import java.util.List;

import static java.util.Collections.emptyList;
import static java.util.Collections.singletonList;

public class CfgVisitor extends GrammarBaseVisitor<Cfg> {
    @Override
    public Cfg visitSourceItem(GrammarParser.SourceItemContext ctx) {
        Cfg cfg = ctx.body().block().getRuleContext().accept(this);
        cfg.name = ctx.funcSignature().IDENTIFIER().getSymbol().getText();
        return cfg;
    }

    private SingleNode createSingleNode(RuleContext ctx) {
        return new SingleNode(new Node(singletonList(getText(ctx))));
    }

    private String getText(RuleContext ctx) {
        return ctx.getText().replace("\"", "\\\"");
    }

    @Override
    public Cfg visitExpression(GrammarParser.ExpressionContext ctx) {
        return createSingleNode(ctx);
    }

    @Override
    public Cfg visitAssign(GrammarParser.AssignContext ctx) {
        return createSingleNode(ctx);
    }

    @Override
    public Cfg visitIf(GrammarParser.IfContext ctx) {
        List<GrammarParser.StatementContext> statement = ctx.statement();
        List<String> labels = singletonList(getText(ctx.expr()));
        Node condition = new Node(labels);
        Cfg thenCfg = ctx.statement(0).accept(this);
        Cfg elseCfg = null;
        var exitPoints = new ArrayList<>(thenCfg.exitPoints);
        if (statement.size() > 1) {
            GrammarParser.StatementContext elseCtx;
            elseCtx = statement.get(1);
            elseCfg = elseCtx.accept(this);
            exitPoints.addAll(elseCfg.exitPoints);
        }
        return new If(condition, thenCfg, elseCfg, exitPoints);
    }

    @Override
    public Cfg visitBlock(GrammarParser.BlockContext ctx) {
        var elements = new ArrayList<Cfg>();
        var exitPoints = new ArrayList<Node>();
        for (GrammarParser.StatementContext statementContext : ctx.statement()) {
            Cfg cfg = statementContext.accept(this);
            exitPoints.addAll(cfg.getExitPoints());
            elements.add(cfg);
        }
        for (int i = 0; i < elements.size() - 1; i++) {
            var cfg = elements.get(i);
            cfg.resetNext(elements.get(i + 1));
        }
        return new Block(elements, exitPoints);
    }

    @Override
    public Cfg visitWhile(GrammarParser.WhileContext ctx) {
        Node condition = new Node(singletonList(getText(ctx.expr())));
        return new While(condition, ctx.statement().accept(this));
    }

    @Override
    public Cfg visitDo(GrammarParser.DoContext ctx) {
        Node condition = new Node(singletonList(getText(ctx.expr())));
        boolean isDoWhile = "while".equals(ctx.whileSpec().getText());
        return new Do(condition, ctx.statement().accept(this), isDoWhile);
    }

    @Override
    public Cfg visitBreak(GrammarParser.BreakContext ctx) {
        return new SingleNode(new Node(emptyList()), true);
    }
}