package org.golchin.grammar.nodes;

import com.android.dx.BinaryOp;

public class Disjunction extends BinaryOpNode {
    public Disjunction(ExpressionNode left, ExpressionNode right) {
        super(BinaryOp.OR, left, right);
    }
}
