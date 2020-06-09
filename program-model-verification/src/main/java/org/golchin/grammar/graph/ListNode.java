package org.golchin.grammar.graph;

import java.util.List;
import java.util.Set;

public class ListNode<E> extends Node<List<E>, String> {
    public ListNode(List<E> labels, Set<Edge<List<E>, String>> outEdges, Set<Edge<List<E>, String>> inEdges) {
        super(labels, outEdges, inEdges);
    }

    public ListNode(List<E> labels) {
        super(labels);
    }
}
