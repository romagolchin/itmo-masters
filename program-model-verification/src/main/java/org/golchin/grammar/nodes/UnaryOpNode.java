package org.golchin.grammar.nodes;

import com.android.dx.Local;
import com.android.dx.UnaryOp;
import lombok.Getter;
import org.golchin.grammar.bytecode.ByteCodeVisitor;
import org.golchin.grammar.bytecode.CompilationError;
import org.golchin.grammar.model.BuiltinType;

import java.util.List;

@Getter
public class UnaryOpNode extends ExpressionNode {
    private final ExpressionNode operand;
    private final UnaryOp unaryOp;

    public UnaryOpNode(UnaryOp unaryOp, ExpressionNode node) {
        super(List.of(node));
        this.unaryOp = unaryOp;
        operand = node;
        local = node.getLocal();
        if (node.getType() instanceof BuiltinType builtinType) {
            if (!builtinType.isNumeric())
                throw new CompilationError("Unary minus can be used only with numeric types");
            type = builtinType;
        }
        else throw new CompilationError("Unary minus can be used only with built-in types");
    }

    @Override
    public Local<?> accept(ByteCodeVisitor byteCodeVisitor) {
        return byteCodeVisitor.visitUnaryOpNode(this);
    }

    @Override
    public String toString() {
        return unaryOp + " " + super.toString();
    }
}
