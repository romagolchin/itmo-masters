package org.golchin.grammar.cfg;

import org.golchin.grammar.graph.Node;
import org.golchin.grammar.ir.CommonCfgVisitor;
import org.golchin.grammar.model.Type;

import java.util.Collections;
import java.util.List;

public class While<T> extends Cfg<T> {
    public final Node<List<T>, String> condition;
    public final Cfg<T> body;

    public While(Node<List<T>, String> condition, Cfg<T> body) {
        super(Collections.emptyList());
        this.condition = condition;
        this.body = body;
        condition.addEdge(body.getStart(), "T");
        condition.addEdge(end, "F");
        body.resetNext(condition);
        body.getExitPoints().forEach(node -> node.addEdge(end));
    }

    @Override
    public Node<List<T>, String> getStart() {
        return condition;
    }

    @Override
    public void accept(CommonCfgVisitor<T> visitor, Type returnType) {
        visitor.visitWhile(this);
    }

}