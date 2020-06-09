package org.golchin.grammar.cfg;

import lombok.Getter;
import org.golchin.grammar.graph.Graph;
import org.golchin.grammar.graph.Node;
import org.golchin.grammar.ir.Instruction;

import java.util.List;

public abstract class Cfg {
    public String name;
    private Graph<List<Instruction>, String> graph;
    @Getter
    protected List<Node<List<Instruction>, String>> exitPoints;
    protected boolean isBreak;
    protected Node<List<Instruction>, String> end = new Node<>(List.of());

    public Cfg(List<Node<List<Instruction>, String>> exitPoints) {
        this.exitPoints = exitPoints;
    }

    private void initialize() {
        if (graph == null) {
            graph = Graph.fromNode(getStart());
        }
    }

    public Graph<List<Instruction>, String> getGraph() {
        initialize();
        return graph;
    }

    public abstract Node<List<Instruction>, String> getStart();

    public void resetNext(Node<List<Instruction>, String> node) {
        end.addEdge(node);
    }

    public void resetNext(Cfg cfg) {
        resetNext(cfg.getStart());
    }
}
