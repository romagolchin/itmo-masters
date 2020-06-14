package org.golchin.grammar.nodes;

import org.golchin.grammar.ir.Address;
import org.golchin.grammar.ir.InstructionGeneratingVisitor;
import org.golchin.grammar.model.Type;

import java.util.List;

public class ConversionNode extends ExpressionNode {
    public ConversionNode(Type newType, ExpressionNode expressionNode) {
        super(List.of(expressionNode));
        type = newType;
    }

    public ExpressionNode getOperand() {
        return children.get(0);
    }

    @Override
    public Address accept(InstructionGeneratingVisitor instructionGeneratingVisitor) {
        return instructionGeneratingVisitor.visitConversionNode(this);
    }
}
