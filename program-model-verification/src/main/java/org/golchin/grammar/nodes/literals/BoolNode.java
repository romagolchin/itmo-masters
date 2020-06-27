package org.golchin.grammar.nodes.literals;

import org.golchin.grammar.model.BuiltinType;

public class BoolNode extends LiteralNode<Boolean> {
    public BoolNode(Boolean value) {
        super(value, BuiltinType.BOOL);
    }
}
