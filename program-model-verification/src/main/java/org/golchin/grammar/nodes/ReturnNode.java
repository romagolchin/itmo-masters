package org.golchin.grammar.nodes;

import org.golchin.grammar.ir.Address;
import org.golchin.grammar.ir.InstructionGeneratingVisitor;

import java.util.List;

public class ReturnNode extends ExpressionNode {
    public ReturnNode(ExpressionNode returnValue) {
        super(List.of(returnValue));
        type = returnValue.getType();
    }

    public ExpressionNode getReturnValue() {
        return children.get(0);
    }

    @Override
    public Address accept(InstructionGeneratingVisitor instructionGeneratingVisitor) {
        return instructionGeneratingVisitor.visitReturn(this);
    }
}
