package org.golchin.grammar.nodes.literals;

import org.golchin.grammar.model.BuiltinType;

public class UIntNode extends LiteralNode<LongNode> {
    public UIntNode(LongNode value) {
        super(value, BuiltinType.UINT);
    }
}
