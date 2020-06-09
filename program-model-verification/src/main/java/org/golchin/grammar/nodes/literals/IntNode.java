package org.golchin.grammar.nodes.literals;

import org.golchin.grammar.model.BuiltinType;

public class IntNode extends LiteralNode<Integer> {
    public IntNode(Integer value) {
        super(value, BuiltinType.INT);
    }
}
