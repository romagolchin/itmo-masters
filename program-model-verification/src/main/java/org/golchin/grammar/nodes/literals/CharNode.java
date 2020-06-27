package org.golchin.grammar.nodes.literals;

import org.golchin.grammar.model.BuiltinType;

public class CharNode extends LiteralNode<Character> {
    public CharNode(Character value) {
        super(value, BuiltinType.CHAR);
    }
}
