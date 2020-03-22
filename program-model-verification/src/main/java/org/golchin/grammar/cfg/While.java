package org.golchin.grammar.cfg;

import org.golchin.grammar.graph.Node;

import java.util.Collections;

public class While extends Cfg {
    public Node condition;
    public Cfg body;

    public While(Node condition, Cfg body) {
        super(Collections.emptyList());
        this.condition = condition;
        this.body = body;
        condition.addEdge(body.getStart(), "T");
        condition.addEdge(end, "F");
        body.resetNext(condition);
        body.getExitPoints().forEach(node -> node.addEdge(end));
    }

    @Override
    public Node getStart() {
        return condition;
    }

}