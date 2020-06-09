package org.golchin.grammar.nodes;

import com.android.dx.Local;
import lombok.Getter;
import org.golchin.grammar.bytecode.ByteCodeVisitor;

@Getter
public class LocalVariableNode extends ExpressionNode {
    private final LocalVariable localVariable;

    public LocalVariableNode(LocalVariable localVariable) {
        this.localVariable = localVariable;
        type = localVariable.getInstanceType();
    }

    public String getName() {
        return localVariable.getName();
    }

    @Override
    public Local<?> accept(ByteCodeVisitor byteCodeVisitor) {
        return byteCodeVisitor.visitLocalVariableNode(this);
    }

    @Override
    public String toString() {
        return getName() + " " + super.toString();
    }
}
