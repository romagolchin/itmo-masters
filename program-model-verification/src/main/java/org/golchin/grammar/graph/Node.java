package org.golchin.grammar.graph;

import java.util.Collection;
import java.util.HashSet;
import java.util.Objects;
import java.util.Set;

public class Node<T, S> {
    public T content;
    public Collection<Edge<T, S>> outEdges;
    public Collection<Edge<T, S>> inEdges;

    public Node(T content, Set<Edge<T, S>> outEdges, Set<Edge<T, S>> inEdges) {
        this.content = content;
        this.outEdges = outEdges;
        this.inEdges = inEdges;
    }

    public Node(T content) {
        this(content, new HashSet<>(), new HashSet<>());
    }

    public Edge<T, S> addEdge(Node<T, S> otherNode) {
        return addEdge(otherNode, null);
    }

    public Edge<T, S> addEdge(Node<T, S> otherNode, S label) {
        Edge<T, S> edge = new Edge<>(label, this, otherNode);
        outEdges.add(edge);
        otherNode.inEdges.add(edge);
        return edge;
    }

    public void removeEdge(Edge<T, S> edge) {
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
        return content.toString();
    }
}
