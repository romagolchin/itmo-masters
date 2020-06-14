package org.golchin.grammar.nodes;

import org.golchin.grammar.ir.Address;
import org.golchin.grammar.ir.CompilationError;
import org.golchin.grammar.ir.InstructionGeneratingVisitor;

import java.util.List;

public class AssignNode extends ExpressionNode {
    public AssignNode(LValue left, ExpressionNode right) {
        super(List.of(left, right));
        if (!right.type.canAssignTo(left.type))
            throw new CompilationError("Cannot assign " + right.type + " to " + left.type);
    }

    public LValue getLeft() {
        return (LValue) children.get(0);
    }

    public ExpressionNode getRight() {
        return children.get(1);
    }

    @Override
    public Address accept(InstructionGeneratingVisitor instructionGeneratingVisitor) {
        return instructionGeneratingVisitor.visitAssign(this);
    }
}
