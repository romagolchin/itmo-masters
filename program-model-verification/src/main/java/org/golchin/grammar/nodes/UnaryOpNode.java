package org.golchin.grammar.nodes;

import lombok.Getter;
import org.golchin.grammar.ir.Address;
import org.golchin.grammar.ir.CompilationError;
import org.golchin.grammar.ir.InstructionGeneratingVisitor;
import org.golchin.grammar.ir.UnaryOperation;
import org.golchin.grammar.model.BuiltinType;

import java.util.List;

import static org.golchin.grammar.model.BuiltinType.BOOL;

@Getter
public class UnaryOpNode extends ExpressionNode {
    private final ExpressionNode operand;
    private final UnaryOperation unaryOp;

    public UnaryOpNode(UnaryOperation unaryOp, ExpressionNode node) {
        super(List.of(node));
        this.unaryOp = unaryOp;
        operand = node;
        if (node.getType() instanceof BuiltinType builtinType) {
            if (unaryOp == UnaryOperation.NEGATE && !builtinType.isNumeric())
                throw new CompilationError("Unary minus can be used only with numeric types");
            if (unaryOp == UnaryOperation.NOT && builtinType != BOOL)
                throw new CompilationError("Not can be used only with boolean");
            type = builtinType;
        }
        else throw new CompilationError("Unary operations can be used only with built-in types");
    }

    @Override
    public Address accept(InstructionGeneratingVisitor instructionGeneratingVisitor) {
        return instructionGeneratingVisitor.visitUnaryOpNode(this);
    }

    @Override
    public String toString() {
        return unaryOp + " " + super.toString();
    }
}
