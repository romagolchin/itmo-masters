package org.golchin.grammar.cfg;

import org.golchin.grammar.graph.Node;
import org.golchin.grammar.ir.CommonCfgVisitor;
import org.golchin.grammar.model.Type;

import java.util.List;

public class If<T> extends Cfg<T> {
    public final Node<List<T>, String> condition;
    public final Cfg<T> thenCfg;
    public final Cfg<T> elseCfg;

    public If(Node<List<T>, String> condition, Cfg<T> thenCfg, Cfg<T> elseCfg, List<Node<List<T>, String>> exitPoints) {
        super(exitPoints);
        this.condition = condition;
        this.thenCfg = thenCfg;
        this.elseCfg = elseCfg;
        condition.addEdge(thenCfg.getStart(), "T");
        thenCfg.resetNext(end);
        if (elseCfg != null) {
            condition.addEdge(elseCfg.getStart(), "F");
            elseCfg.resetNext(end);
        } else {
            condition.addEdge(end, "F");
        }
    }

    @Override
    public Node<List<T>, String> getStart() {
        return condition;
    }

    @Override
    public void resetNext(Cfg<T> cfg) {
        super.resetNext(cfg);
        thenCfg.resetNext(cfg);
        if (elseCfg != null) {
            elseCfg.resetNext(cfg);
        }
    }


    @Override
    public void accept(CommonCfgVisitor<T> visitor, Type returnType) {
        visitor.visitIf(this, returnType);
    }

}
