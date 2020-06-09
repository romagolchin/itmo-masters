package org.golchin.grammar.cfg;

import org.golchin.grammar.graph.Node;
import org.golchin.grammar.ir.Instruction;

import java.util.Collections;
import java.util.List;

public class While extends Cfg {
    public Node<List<Instruction>, String> condition;
    public Cfg body;

    public While(Node<List<Instruction>, String> condition, Cfg body) {
        super(Collections.emptyList());
        this.condition = condition;
        this.body = body;
        condition.addEdge(body.getStart(), "T");
        condition.addEdge(end, "F");
        body.resetNext(condition);
        body.getExitPoints().forEach(node -> node.addEdge(end));
    }

    @Override
    public Node<List<Instruction>, String> getStart() {
        return condition;
    }

}