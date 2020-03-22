package org.golchin.grammar.graph;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

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
        graph.edges.removeIf(edge -> !graph.nodes.containsAll(List.of(edge.source, edge.destination)));
        return graph;
    }

    private static void traverse(Node node, Graph graph, Set<Node> nodes) {
        nodes.add(node);
        var outEdges = new HashSet<>(node.outEdges);
        for (Edge outEdge : outEdges) {
            var inEdges = new HashSet<>(node.inEdges);
            var next = outEdges.iterator().next().destination;
            var canMergeWithNext = inEdges.size() == 1 && next.outEdges.size() == 1 && next.inEdges.size() == 1;
            if (outEdges.size() == 1 && (canMergeWithNext || node.labels.isEmpty())) {
                if (canMergeWithNext) {
                    var inEdge = inEdges.iterator().next();
                    replaceEdge(graph, next, inEdge);
                    var labels = new ArrayList<>(node.labels);
                    labels.addAll(next.labels);
                    next.labels = labels;
                } else {
                    for (var inEdge : inEdges) {
                        replaceEdge(graph, next, inEdge);
                    }
                }
                node.removeEdge(outEdge);
                traverse(next, graph, nodes);
                return;
            }
            graph.edges.add(outEdge);
            var destination = outEdge.destination;
            if (!nodes.contains(destination)) {
                traverse(destination, graph, nodes);
            }
        }
        graph.nodes.add(node);
    }

    private static void replaceEdge(Graph graph, Node next, Edge inEdge) {
        graph.edges.add(inEdge.source.addEdge(next, inEdge.label));
        graph.edges.remove(inEdge);
        inEdge.source.removeEdge(inEdge);
    }
}
