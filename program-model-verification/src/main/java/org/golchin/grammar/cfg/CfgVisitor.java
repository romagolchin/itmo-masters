package org.golchin.grammar.cfg;

import org.antlr.v4.runtime.RuleContext;
import org.golchin.grammar.GrammarBaseVisitor;
import org.golchin.grammar.GrammarParser;
import org.golchin.grammar.graph.Node;
import org.golchin.grammar.ir.Instruction;

import java.util.ArrayList;
import java.util.List;

import static java.util.Collections.emptyList;

public class CfgVisitor extends GrammarBaseVisitor<Cfg> {

    @Override
    public Cfg visitFuncDefAlt(GrammarParser.FuncDefAltContext ctx) {
        GrammarParser.FuncDefContext funcDefContext = ctx.funcDef();
        Cfg cfg = funcDefContext.body().block().getRuleContext().accept(this);
        cfg.name = funcDefContext.funcSignature().IDENTIFIER().getSymbol().getText();
        return cfg;
    }

    private SingleNode createSingleNode(RuleContext ctx) {
//        List<String> list = singletonList(getText(ctx));
        return new SingleNode(new Node<>(null));
    }

    private String getText(RuleContext ctx) {
        return ctx.getText()
                .replace("\\", "\\\\")
                .replace("\"", "\\\"");
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
//        List<String> labels = singletonList(getText(ctx.expr()));
        Node<List<Instruction>, String> condition = new Node<>(null);
        Cfg thenCfg = ctx.statement(0).accept(this);
        Cfg elseCfg = null;
        var exitPoints = new ArrayList<>(thenCfg.exitPoints);
        if (statement.size() > 1) {
            GrammarParser.StatementContext elseCtx;
            elseCtx = statement.get(1);
            elseCfg = elseCtx.accept(this);
            exitPoints.addAll(elseCfg.exitPoints);
        }
        return new If(condition, thenCfg, elseCfg, null);
    }

    @Override
    public Cfg visitBlock(GrammarParser.BlockContext ctx) {
        var elements = new ArrayList<Cfg>();
        var exitPoints = new ArrayList<Node<List<Instruction>, String>>();
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
//        List<T> ts = singletonList(getText(ctx.expr()));
        Node<List<Instruction>, String> condition = new Node<>(null);
        return new While(condition, ctx.statement().accept(this));
    }

    @Override
    public Cfg visitDo(GrammarParser.DoContext ctx) {
//        List<T> ts = singletonList(getText(ctx.expr()));
        Node<List<Instruction>, String> condition = new Node<>(null);
        boolean isDoWhile = "while".equals(ctx.whileSpec().getText());
        return new Do(condition, ctx.statement().accept(this), isDoWhile);
    }

    @Override
    public Cfg visitBreak(GrammarParser.BreakContext ctx) {
        return new SingleNode(new Node<>(emptyList()), true);
    }
}
