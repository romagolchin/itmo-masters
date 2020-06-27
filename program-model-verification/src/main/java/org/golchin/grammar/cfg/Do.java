package org.golchin.grammar.cfg;

import org.golchin.grammar.graph.Node;
import org.golchin.grammar.ir.CommonCfgVisitor;
import org.golchin.grammar.model.Type;

import java.util.Collections;
import java.util.List;

public class Do<T> extends Cfg<T> {
    public final Node<List<T>, String> condition;
    public final Cfg<T> body;
    public final boolean isDoWhile;

    public Do(Node<List<T>, String> condition, Cfg<T> body, boolean isDoWhile) {
        super(Collections.emptyList());
        this.condition = condition;
        this.body = body;
        this.isDoWhile = isDoWhile;
        body.resetNext(condition);
        condition.addEdge(body.getStart(), isDoWhile ? "T" : "F");
        condition.addEdge(end, isDoWhile ? "F" : "T");
    }

    @Override
    public Node<List<T>, String> getStart() {
        return body.getStart();
    }

    @Override
    public void accept(CommonCfgVisitor<T> visitor, Type returnType) {
        visitor.visitDo(this);
    }

}
