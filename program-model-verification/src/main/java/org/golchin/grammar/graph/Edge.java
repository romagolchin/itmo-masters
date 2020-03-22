package org.golchin.grammar.graph;

import java.util.Objects;

public class Edge {
    public String label;
    public Node source;
    public Node destination;

    public Edge(String label, Node source, Node destination) {
        this.label = label;
        this.source = source;
        this.destination = destination;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Edge edge = (Edge) o;
        return Objects.equals(label, edge.label) &&
                Objects.equals(source, edge.source) &&
                Objects.equals(destination, edge.destination);
    }

    @Override
    public int hashCode() {
        return Objects.hash(label, source, destination);
    }
}
