package org.golchin.grammar.nodes;

import lombok.Getter;
import org.golchin.grammar.ir.Address;
import org.golchin.grammar.ir.InstructionGeneratingVisitor;

@Getter
public class LocalVariableNode extends LValue {
    private final LocalVariable localVariable;

    public LocalVariableNode(LocalVariable localVariable) {
        this.localVariable = localVariable;
        type = localVariable.getInstanceType();
        address = localVariable;
    }

    public String getName() {
        return localVariable.getName();
    }

    @Override
    public Address accept(InstructionGeneratingVisitor instructionGeneratingVisitor) {
        return instructionGeneratingVisitor.visitLocalVariableNode(this);
    }

    @Override
    public String toString() {
        return getName() + " " + super.toString();
    }
}
