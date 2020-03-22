package org.golchin.grammar.graph;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;
import java.util.stream.Collectors;

public class Graph {
    private Set<Node> nodes = new HashSet<>();
    private Set<Edge> edges = new HashSet<>();

    public Set<Edge> getEdges() {
        return edges;
    }

    public Set<Node> getNodes() {
        return nodes;
    }

    public void addNode(Node node) {
        nodes.add(node);
    }

    public void addEdge(Edge edge) {
        edges.add(edge);
    }

    public Graph merge(Graph other) {
        nodes.addAll(other.nodes);
        edges.addAll(other.edges);
        return this;
    }

    public static Graph fromNode(Node node) {
        Graph graph = new Graph();
        if (node != null) {
            traverse(node, graph, new HashSet<>());
        }
        return graph;
    }


    private static Edge mergeChain(Edge edge, Set<Node> nodes) {
        var first = edge.destination;
        if (first.outEdges.size() != 1) return edge;
        if (nodes.contains(first)) return edge;
        Node cur = first;
        Node next = cur.outEdges.iterator().next().destination;
        var labels = new ArrayList<String>();
        while (cur.outEdges.size() == 1 && next.outEdges.size() == 1 && next.inEdges.size() == 1) {
            labels.addAll(cur.labels);
            cur = next;
            next = next.outEdges.iterator().next().destination;
        }
        if (cur.outEdges.size() == 1)
            labels.addAll(cur.labels);
        if (labels.isEmpty()) {
            if (cur.outEdges.size() == 1) {
                first.inEdges = next.inEdges.stream()
                        .map(e -> new Edge(e.label, e.source, first))
                        .collect(Collectors.toList());
                first.outEdges = next.outEdges.stream()
                        .map(e -> new Edge(e.label, first, e.destination))
                        .collect(Collectors.toList());
                first.labels = next.labels;
                return new Edge(edge.label, edge.source, first);
            }
            return new Edge(edge.label, edge.source, next);
        }

        first.outEdges = Collections.singletonList(new Edge(null, first, next));
        first.labels = labels;
        return edge;
    }

    private static void traverse(Node node, Graph graph, Set<Node> nodes) {
        nodes.add(node);
        for (Edge outEdge : node.outEdges) {
            outEdge = mergeChain(outEdge, nodes);
            graph.edges.add(outEdge);
            var destination = outEdge.destination;
            if (!nodes.contains(destination)) {
                traverse(destination, graph, nodes);
            }
        }
        graph.nodes.add(node);
    }
}
