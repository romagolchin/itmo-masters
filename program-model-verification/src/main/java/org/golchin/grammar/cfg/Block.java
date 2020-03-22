package org.golchin.grammar.cfg;

import org.golchin.grammar.graph.Node;

import java.util.List;

public class Block extends Cfg {
    public List<Cfg> cfgs;

    public Block(List<Cfg> cfgs, List<Node> exitPoints) {
        super(exitPoints);
        this.cfgs = cfgs;
        if (!cfgs.isEmpty()) {
            cfgs.get(cfgs.size() - 1).resetNext(end);
        }
    }

    @Override
    public Node getStart() {
        if (cfgs.isEmpty())
            return null;
        return cfgs.get(0).getStart();
    }

}
