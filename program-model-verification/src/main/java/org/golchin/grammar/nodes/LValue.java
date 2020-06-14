package org.golchin.grammar.nodes;

import java.util.List;

public abstract class LValue extends ExpressionNode {
    public LValue() {
    }

    public LValue(List<ExpressionNode> children) {
        super(children);
    }
}
