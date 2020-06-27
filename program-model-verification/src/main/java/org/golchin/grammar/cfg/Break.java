package org.golchin.grammar.cfg;

import org.golchin.grammar.graph.Node;
import org.golchin.grammar.ir.CommonCfgVisitor;
import org.golchin.grammar.model.Type;

import java.util.List;

public class Break<T> extends Cfg<T> {
    public final Node<List<T>, String> node;

    public Break(Node<List<T>, String> exitPoint) {
        super(List.of(exitPoint));
        this.node = exitPoint;
    }

    @Override
    public Node<List<T>, String> getStart() {
        return node;
    }

    @Override
    public void resetNext(Node<List<T>, String> node) {

    }

    @Override
    public void accept(CommonCfgVisitor<T> visitor, Type returnType) {
        visitor.visitBreak(this);
    }
}
