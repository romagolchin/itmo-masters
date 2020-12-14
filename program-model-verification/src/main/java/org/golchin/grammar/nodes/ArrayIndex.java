package org.golchin.grammar.nodes;

import lombok.Getter;
import org.golchin.grammar.ir.Address;
import org.golchin.grammar.ir.CompilationError;
import org.golchin.grammar.ir.InstructionGeneratingVisitor;
import org.golchin.grammar.model.Array;
import org.golchin.grammar.model.BuiltinType;

import java.util.List;

@Getter
public class ArrayIndex extends LValue {
    private final LocalVariableNode array;
    private final List<ExpressionNode> indices;

    public ArrayIndex(LocalVariableNode node, List<ExpressionNode> indices) {
        this.array = node;
        this.indices = indices;
        Array array = (Array) node.getType();
        if (indices.size() != array.getNDimensions())
            throw new CompilationError("Expected " + array.getNDimensions() + " indices, got " + indices.size());
        for (int i = 0; i < indices.size(); i++) {
            indices.set(i, indices.get(i).convertTo(BuiltinType.INT));
        }
        this.type = array.getElementType();
    }

    @Override
    public Address accept(InstructionGeneratingVisitor instructionGeneratingVisitor) {
        return instructionGeneratingVisitor.visitArrayIndex(this);
    }
}
