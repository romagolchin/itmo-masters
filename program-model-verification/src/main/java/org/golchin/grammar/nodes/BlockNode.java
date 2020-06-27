package org.golchin.grammar.nodes;

import org.golchin.grammar.ir.Address;
import org.golchin.grammar.ir.InstructionGeneratingVisitor;

import java.util.List;

public class BlockNode extends ExpressionNode {
    public BlockNode(List<ExpressionNode> children) {
        super(children);
        ExpressionNode last = children.get(children.size() - 1);
        type = last.getType();
        address = last.getAddress();
    }

    @Override
    public Address accept(InstructionGeneratingVisitor instructionGeneratingVisitor) {
        return instructionGeneratingVisitor.visitBlockNode(this);
    }
}
