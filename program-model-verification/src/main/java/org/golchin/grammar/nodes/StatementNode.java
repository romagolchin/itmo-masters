package org.golchin.grammar.nodes;

public class StatementNode {
    private final LValue lValue;
    private final ExpressionNode expression;

    public StatementNode(LValue lValue, ExpressionNode expression) {
        this.lValue = lValue;
        this.expression = expression;
    }
}
