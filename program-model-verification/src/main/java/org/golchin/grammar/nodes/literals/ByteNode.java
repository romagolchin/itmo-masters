package org.golchin.grammar.nodes.literals;

import org.golchin.grammar.model.BuiltinType;

public class ByteNode extends LiteralNode<Byte> {
    public ByteNode(Byte value) {
        super(value, BuiltinType.BYTE);
    }
}
