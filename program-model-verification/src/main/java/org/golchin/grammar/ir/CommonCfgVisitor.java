package org.golchin.grammar.ir;

import org.golchin.grammar.cfg.*;
import org.golchin.grammar.model.Type;

public interface CommonCfgVisitor<T> {
    void visitBlock(Block<T> block, Type returnType);

    void visitDo(Do<T> cfg);

    void visitIf(If<T> cfg, Type returnType);

    void visitWhile(While<T> cfg);

    void visitSingleNode(SingleNode<T> singleNode, Type returnType);

    void visitBreak(Break<T> cfg);
}
