package org.golchin.grammar.cfg;

import org.golchin.grammar.graph.Node;
import org.golchin.grammar.ir.Instruction;

import java.util.Collections;
import java.util.List;

import static java.util.Collections.singletonList;

public class SingleNode extends Cfg {
    public Node<List<Instruction>, String> node;

    public SingleNode(Node<List<Instruction>, String> node) {
        this(node, false);
    }

    public SingleNode(Node<List<Instruction>, String> node, boolean isBreak) {
        super(isBreak ? singletonList(node) : Collections.emptyList());
        this.node = node;
        this.isBreak = isBreak;
    }

    @Override
    public Node<List<Instruction>, String> getStart() {
        return node;
    }

    @Override
    public void resetNext(Node<List<Instruction>, String> next) {
        if (!isBreak)
            node.addEdge(next);
    }
}
