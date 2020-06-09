package org.golchin.grammar.nodes;

import com.android.dx.Local;
import org.golchin.grammar.bytecode.ByteCodeVisitor;
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
    public Local<?> accept(ByteCodeVisitor byteCodeVisitor) {
        return byteCodeVisitor.visitConversionNode(this);
    }
}
