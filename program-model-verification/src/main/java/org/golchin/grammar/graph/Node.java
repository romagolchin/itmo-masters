package org.golchin.grammar.graph;

import java.util.*;

public class Node<T, S> {
    private T content;
    public final Collection<Edge<T, S>> outEdges;
    public final Collection<Edge<T, S>> inEdges;

    public static <E, S> Node<List<E>, S> getInstance(List<E> content) {
        return new Node<>(new ArrayList<>(content));
    }

    public Node(T content, Set<Edge<T, S>> outEdges, Set<Edge<T, S>> inEdges) {
        this.setContent(content);
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
        return getContent().toString();
    }

    public T getContent() {
        return content;
    }

    public void setContent(T content) {
        this.content = content;
    }
}
