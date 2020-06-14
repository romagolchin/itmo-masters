package org.golchin.grammar.cfg;

import org.golchin.grammar.graph.Node;
import org.golchin.grammar.ir.CommonCfgVisitor;
import org.golchin.grammar.model.Type;

import java.util.List;

public class Block<T> extends Cfg<T> {
    public final List<Cfg<T>> cfgs;

    public Block(List<Cfg<T>> cfgs, List<Node<List<T>, String>> exitPoints) {
        super(exitPoints);
        this.cfgs = cfgs;
        if (!cfgs.isEmpty()) {
            cfgs.get(cfgs.size() - 1).resetNext(end);
        }
    }

    @Override
    public Node<List<T>, String> getStart() {
        if (cfgs.isEmpty())
            return end;
        return cfgs.get(0).getStart();
    }


    @Override
    public void accept(CommonCfgVisitor<T> visitor, Type returnType) {
        visitor.visitBlock(this, returnType);
    }

}
