package org.golchin.grammar.cfg;

import lombok.Getter;
import org.golchin.grammar.graph.Graph;
import org.golchin.grammar.graph.Node;
import org.golchin.grammar.ir.CommonCfgVisitor;
import org.golchin.grammar.model.Type;

import java.util.List;

public abstract class Cfg<T> {
    public String name;
    private Graph<List<T>, String> graph;
    @Getter
    protected List<Node<List<T>, String>> exitPoints;
    @Getter
    protected Node<List<T>, String> end = Node.getInstance(List.of());
    private Cfg<T> nextCfg;

    public Cfg(List<Node<List<T>, String>> exitPoints) {
        this.exitPoints = exitPoints;
    }

    private void initialize() {
        if (graph == null) {
            graph = Graph.fromNode(getStart());
        }
    }

    public Graph<List<T>, String> getGraph() {
        initialize();
        return graph;
    }

    public abstract Node<List<T>, String> getStart();

    public void resetNext(Node<List<T>, String> node) {
        if (end == node)
            throw new AssertionError();
        end.addEdge(node);
    }

    public void resetNext(Cfg<T> cfg) {
        resetNext(cfg.getStart());
        nextCfg = cfg;
    }

    public Node<List<T>, String> getNextNode() {
        return nextCfg == null ? null : nextCfg.getStart();
    }

    public void accept(CommonCfgVisitor<T> visitor) {
        accept(visitor, null);
    }

    public abstract void accept(CommonCfgVisitor<T> visitor, Type returnType);
}
