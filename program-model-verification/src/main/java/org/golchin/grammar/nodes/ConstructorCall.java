package org.golchin.grammar.nodes;

import org.golchin.grammar.ir.Address;
import org.golchin.grammar.ir.InstructionGeneratingVisitor;
import org.golchin.grammar.model.ReferenceType;

public class ConstructorCall extends ExpressionNode {
    public ConstructorCall(ReferenceType declaringType) {
        type = declaringType;
    }

    @Override
    public Address accept(InstructionGeneratingVisitor instructionGeneratingVisitor) {
        return instructionGeneratingVisitor.visitConstructorCall(this);
    }
}
