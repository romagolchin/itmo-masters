package org.golchin.grammar.nodes.literals;

import org.golchin.grammar.model.BuiltinType;

public class StringNode extends LiteralNode<String> {
    public StringNode(String value) {
        super(value, BuiltinType.STRING);
    }
}
