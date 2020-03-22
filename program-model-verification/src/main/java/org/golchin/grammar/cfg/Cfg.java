package org.golchin.grammar.cfg;

import org.golchin.grammar.graph.Edge;
import org.golchin.grammar.graph.Graph;
import org.golchin.grammar.graph.Node;

import java.util.Collections;
import java.util.List;
import java.util.Set;

public abstract class Cfg extends Graph {
    public String name;
    private Graph graph;
    protected List<Node> exitPoints;
    protected boolean isBreak;
    protected Node end = new Node(Collections.emptyList());

    public Cfg(List<Node> exitPoints) {
        this.exitPoints = exitPoints;
    }

    private void initialize() {
        if (graph == null) {
            graph = Graph.fromNode(getStart());
        }
    }

    public Set<Edge> getEdges() {
        initialize();
        return graph.getEdges();
    }

    public Set<Node> getNodes() {
        initialize();
        return graph.getNodes();
    }

    public Graph getGraph() {
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
