package org.golchin.grammar.nodes.literals;

import org.golchin.grammar.model.BuiltinType;

import java.math.BigInteger;

public class ULongNode extends LiteralNode<BigInteger> {
    public ULongNode(BigInteger value) {
        super(value, BuiltinType.ULONG);
    }
}
