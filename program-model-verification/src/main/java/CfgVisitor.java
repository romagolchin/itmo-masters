import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import static java.util.Collections.singletonList;

public class CfgVisitor extends GrammarBaseVisitor<Cfg> {
    @Override
    public Cfg visitIf(GrammarParser.IfContext ctx) {
        List<GrammarParser.StatementContext> statement = ctx.statement();
        List<String> labels = singletonList(ctx.expr().getText());
        CfgNode condition = new CfgNode(labels);
        Cfg thenCfg = ctx.statement(0).accept(this);
        condition.addEdge(thenCfg.getStart(), "true");
        Cfg elseCfg = null;
        if (statement.size() > 1) {
            GrammarParser.StatementContext elseCtx;
            elseCtx = statement.get(1);
            elseCfg = elseCtx.accept(this);
            condition.addEdge(elseCfg.getStart(), "false");
        }
        return new If(condition, thenCfg, elseCfg);
    }

    @Override
    public Cfg visitBlock(GrammarParser.BlockContext ctx) {
        var curLabels = new ArrayList<String>();
        var elements = new ArrayList<Cfg>();
        for (GrammarParser.StatementContext statementContext : ctx.statement()) {
            Cfg cfg = statementContext.accept(this);
            CfgNode start = cfg.getStart();
            if (start.outEdges.isEmpty()) {
                curLabels.addAll(start.labels);
            } else {
                if (!curLabels.isEmpty()) {
                    elements.add(new SingleNode(new CfgNode(curLabels)));
                    curLabels.clear();
                }
                elements.add(cfg);
            }
        }
        if (!curLabels.isEmpty())
            elements.add(new SingleNode(new CfgNode(curLabels)));
        return new Block(elements);
    }
}
