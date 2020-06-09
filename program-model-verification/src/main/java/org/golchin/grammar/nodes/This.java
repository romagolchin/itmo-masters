package org.golchin.grammar.nodes;

import org.golchin.grammar.model.CustomType;

public class This extends ExpressionNode {
    public This(CustomType customType) {
        type = customType;
    }
}
