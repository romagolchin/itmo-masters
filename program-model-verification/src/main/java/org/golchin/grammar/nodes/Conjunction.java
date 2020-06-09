package org.golchin.grammar.nodes;

import com.android.dx.BinaryOp;

public class Conjunction extends BinaryOpNode {
    public Conjunction(ExpressionNode left, ExpressionNode right) {
        super(BinaryOp.AND, left, right);
    }
}
