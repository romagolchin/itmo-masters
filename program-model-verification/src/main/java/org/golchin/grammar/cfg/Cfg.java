package org.golchin.grammar.cfg;

import org.golchin.grammar.graph.Graph;
import org.golchin.grammar.graph.Node;

import java.util.List;

public abstract class Cfg {
    public String name;
    private Graph graph;
    protected List<Node> exitPoints;
    protected boolean isBreak;
    protected Node end = new Node(List.of());

    public Cfg(List<Node> exitPoints) {
        this.exitPoints = exitPoints;
    }

    private void initialize() {
        if (graph == null) {
            graph = Graph.fromNode(getStart());
        }
    }

    public Graph getGraph() {
        initialize();
        return graph;
    }

    public abstract Node getStart();

    public List<Node> getExitPoints() {
        return exitPoints;
    }

    public void resetNext(Node node) {
        end.addEdge(node);
    }

    public void resetNext(Cfg cfg) {
        resetNext(cfg.getStart());
    }
}
