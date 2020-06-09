package org.golchin.grammar.graph;

import org.golchin.grammar.nodes.ExpressionNode;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

public class Graph<T, S> {
    private final Set<Node<T, S>> nodes = new HashSet<>();
    private final Set<Edge<T, S>> edges = new HashSet<>();

    public Set<Edge<T, S>> getEdges() {
        return edges;
    }

    public Set<Node<T, S>> getNodes() {
        return nodes;
    }

    public void addNode(Node<T, S> node) {
        nodes.add(node);
    }

    public void addEdge(Edge<T, S> edge) {
        edges.add(edge);
    }

    public Graph<T, S> merge(Graph<T, S> other) {
        nodes.addAll(other.nodes);
        edges.addAll(other.edges);
        return this;
    }

    public static Node<List<String>, String> traverseTree(ExpressionNode node, Graph<List<String>, String> graph) {
        String label = node.toString();
        Node<List<String>, String> graphNode = new Node<>(List.of(label));
        graph.addNode(graphNode);
        for (var child : node.getChildren()) {
            graph.addEdge(new Edge<>(null, graphNode, traverseTree(child, graph)));
        }
        return graphNode;
    }

    public static Graph<List<String>, String> fromTree(ExpressionNode expressionNode) {
        Graph<List<String>, String> graph = new Graph<>();
        traverseTree(expressionNode, graph);
        return graph;
    }

    public static <T, S> void traverse(Node<T, S> node, Graph<T, S> graph) {
        graph.nodes.add(node);
        for (Edge<T, S> outEdge : node.outEdges) {
            graph.edges.add(outEdge);
            var destination = outEdge.destination;
            if (!graph.nodes.contains(destination)) {
                traverse(destination, graph);
            }
        }

    }

    public static <E, S> Graph<List<E>, S> fromNode(Node<List<E>, S> node) {
        Graph<List<E>, S> graph = new Graph<>();
        if (node != null) {
            traverseAndMerge(node, graph, new HashSet<>());
        }
        graph.edges.removeIf(edge -> !graph.nodes.contains(edge.source) || !graph.nodes.contains(edge.destination));
        return graph;
    }

    private static <E, S> void traverseAndMerge(Node<List<E>, S> node,
                                                Graph<List<E>, S> graph,
                                                Set<Node<List<E>, S>> nodes) {
        nodes.add(node);
        var outEdges = new HashSet<>(node.outEdges);
        for (var outEdge : outEdges) {
            var inEdges = new HashSet<>(node.inEdges);
            var next = outEdges.iterator().next().destination;
            boolean canMergeWithNext = inEdges.size() == 1 && next.outEdges.size() == 1 && next.inEdges.size() == 1;
            if (outEdges.size() == 1 && (canMergeWithNext || node.content.isEmpty())) {
                if (canMergeWithNext) {
                    var inEdge = inEdges.iterator().next();
                    replaceEdge(graph, next, inEdge);
                    List<E> labels = new ArrayList<>(node.content);
                    labels.addAll(next.content);
                    next.content = labels;
                } else {
                    for (var inEdge : inEdges) {
                        replaceEdge(graph, next, inEdge);
                    }
                }
                node.removeEdge(outEdge);
                traverseAndMerge(next, graph, nodes);
                return;
            }
            graph.edges.add(outEdge);
            var destination = outEdge.destination;
            if (!nodes.contains(destination)) {
                traverseAndMerge(destination, graph, nodes);
            }
        }
        graph.nodes.add(node);
    }

    private static <T, S> void replaceEdge(Graph<T, S> graph, Node<T, S> next, Edge<T, S> inEdge) {
        graph.edges.add(inEdge.source.addEdge(next, inEdge.label));
        graph.edges.remove(inEdge);
        inEdge.source.removeEdge(inEdge);
    }
}
