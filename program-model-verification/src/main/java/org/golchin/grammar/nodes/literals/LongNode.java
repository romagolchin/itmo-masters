package org.golchin.grammar.nodes.literals;

import org.golchin.grammar.model.BuiltinType;

public class LongNode extends LiteralNode<Long> {
    public LongNode(Long value) {
        super(value, BuiltinType.LONG);
    }
}
