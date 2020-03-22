package org.golchin.grammar.cfg;

import org.golchin.grammar.graph.Node;

import java.util.Collections;

public class Do extends Cfg {
    public Node condition;
    public Cfg body;
    public boolean isDoWhile;

    public Do(Node condition, Cfg body, boolean isDoWhile) {
        super(Collections.emptyList());
        this.condition = condition;
        this.body = body;
        this.isDoWhile = isDoWhile;
        body.resetNext(condition);
        condition.addEdge(body.getStart(), isDoWhile ? "T" : "F");
        condition.addEdge(end, isDoWhile ? "F" : "T");
    }

    @Override
    public Node getStart() {
        return condition;
    }

}
