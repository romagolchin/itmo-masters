package org.golchin.grammar.nodes;

import org.golchin.grammar.ir.Address;
import org.golchin.grammar.ir.InstructionGeneratingVisitor;
import org.golchin.grammar.model.ReferenceType;

public class ThisNode extends ExpressionNode {
    public ThisNode(ReferenceType referenceType) {
        type = referenceType;
    }

    @Override
    public Address accept(InstructionGeneratingVisitor instructionGeneratingVisitor) {
        return instructionGeneratingVisitor.visitThis(this);
    }
}
