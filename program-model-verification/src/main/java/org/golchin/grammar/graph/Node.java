package org.golchin.grammar.graph;

import java.util.*;

public class Node {
    public List<String> labels;
    public Collection<Edge> outEdges;
    public Collection<Edge> inEdges;

    public Node(List<String> labels, Set<Edge> outEdges, Set<Edge> inEdges) {
        this.labels = labels;
        this.outEdges = outEdges;
        this.inEdges = inEdges;
    }

    public Node(List<String> labels) {
        this(new ArrayList<>(labels), new HashSet<>(), new HashSet<>());
    }

    public Edge addEdge(Node otherNode) {
        return addEdge(otherNode, null);
    }

    public Edge addEdge(Node otherNode, String label) {
        Edge edge = new Edge(label, this, otherNode);
        outEdges.add(edge);
        otherNode.inEdges.add(edge);
        return edge;
    }

    public void removeEdge(Edge edge) {
        if (edge == null) {
            return;
        }
        if (!Objects.equals(edge.source, this)) {
            throw new IllegalArgumentException();
        }
        outEdges.remove(edge);
        edge.destination.inEdges.remove(edge);
    }

    @Override
    public String toString() {
        return String.join("\n", labels);
    }
}
