package org.golchin.grammar.cfg;

import org.golchin.grammar.graph.Node;
import org.golchin.grammar.ir.Instruction;

import java.util.List;

public class If extends Cfg {
    public Node<List<Instruction>, String> condition;
    public Cfg thenCfg;
    public Cfg elseCfg;

    public If(Node<List<Instruction>, String> condition, Cfg thenCfg, Cfg elseCfg, List<Node<List<Instruction>, String>> exitPoints) {
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
    public Node<List<Instruction>, String> getStart() {
        return condition;
    }

}
