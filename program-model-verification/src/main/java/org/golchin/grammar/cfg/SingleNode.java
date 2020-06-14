package org.golchin.grammar.cfg;

import org.golchin.grammar.graph.Node;
import org.golchin.grammar.ir.CommonCfgVisitor;
import org.golchin.grammar.model.Type;

import java.util.List;

public class SingleNode<T> extends Cfg<T> {
    public Node<List<T>, String> node;

    public SingleNode(Node<List<T>, String> node) {
        super(List.of());
        this.end = node;
    }

    @Override
    public Node<List<T>, String> getStart() {
        return end;
    }

    @Override
    public void accept(CommonCfgVisitor<T> visitor, Type returnType) {
        visitor.visitSingleNode(this, returnType);
    }
}
