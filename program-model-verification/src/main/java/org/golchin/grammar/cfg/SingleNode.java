package org.golchin.grammar.cfg;

import org.golchin.grammar.graph.Node;

import java.util.Collections;

import static java.util.Collections.singletonList;

public class SingleNode extends Cfg {
    public Node node;

    public SingleNode(Node node) {
        this(node, false);
    }

    public SingleNode(Node node, boolean isBreak) {
        super(isBreak ? singletonList(node) : Collections.emptyList());
        this.node = node;
        this.isBreak = isBreak;
    }

    @Override
    public Node getStart() {
        return node;
    }

    @Override
    public void resetNext(Node next) {
        if (!isBreak)
            node.addEdge(next);
    }
}
