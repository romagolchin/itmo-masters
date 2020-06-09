package org.golchin.grammar.cfg;

import org.golchin.grammar.graph.Node;
import org.golchin.grammar.ir.Instruction;

import java.util.Collections;
import java.util.List;

public class Do extends Cfg {
    public Node<List<Instruction>, String> condition;
    public Cfg body;
    public boolean isDoWhile;

    public Do(Node<List<Instruction>, String> condition, Cfg body, boolean isDoWhile) {
        super(Collections.emptyList());
        this.condition = condition;
        this.body = body;
        this.isDoWhile = isDoWhile;
        body.resetNext(condition);
        condition.addEdge(body.getStart(), isDoWhile ? "T" : "F");
        condition.addEdge(end, isDoWhile ? "F" : "T");
    }

    @Override
    public Node<List<Instruction>, String> getStart() {
        return condition;
    }

}
