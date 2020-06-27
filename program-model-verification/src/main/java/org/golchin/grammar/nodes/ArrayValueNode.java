package org.golchin.grammar.nodes;

import org.golchin.grammar.ir.Address;
import org.golchin.grammar.ir.InstructionGeneratingVisitor;
import org.golchin.grammar.model.Array;
import org.golchin.grammar.model.BuiltinType;

import java.util.List;

public class ArrayValueNode extends ExpressionNode {
    public ArrayValueNode(Array array, List<ExpressionNode> dimensions) {
        super(dimensions);
        this.type = array;
        for (int i = 0; i < children.size(); i++) {
            children.set(i, children.get(i).convertTo(BuiltinType.INT));
        }
    }

    @Override
    public Address accept(InstructionGeneratingVisitor instructionGeneratingVisitor) {
        return instructionGeneratingVisitor.visitArrayValueNode(this);
    }
}
