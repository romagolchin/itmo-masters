package org.golchin.grammar.graph;

import java.util.Objects;

public class Edge<T, S> {
    public final S label;
    public final Node<T, S> source;
    public final Node<T, S> destination;

    public Edge(S label, Node<T, S> source, Node<T, S> destination) {
        this.label = label;
        this.source = source;
        this.destination = destination;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Edge<T, S> edge = (Edge<T, S>) o;
        return Objects.equals(label, edge.label) &&
                Objects.equals(source, edge.source) &&
                Objects.equals(destination, edge.destination);
    }

    @Override
    public int hashCode() {
        return Objects.hash(label, source, destination);
    }
}
