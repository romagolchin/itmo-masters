package org.golchin.grammar.nodes;

import com.android.dx.Code;
import com.android.dx.Local;
import org.golchin.grammar.bytecode.ByteCodeVisitor;

import java.util.List;

public class BlockNode extends ExpressionNode {
    public BlockNode(List<ExpressionNode> children) {
        super(children);
        ExpressionNode last = children.get(children.size() - 1);
        type = last.getType();
    }

    @Override
    public Local<?> getOrCreateLocal(Code code) {
        return children.get(children.size() - 1).getLocal();
    }

    @Override
    public Local<?> accept(ByteCodeVisitor byteCodeVisitor) {
        return byteCodeVisitor.visitBlockNode(this);
    }
}
