package org.golchin.grammar.graph;

import org.golchin.grammar.nodes.ExpressionNode;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.function.Consumer;
import java.util.function.Function;

import static java.util.stream.Collectors.toMap;

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
        Node<List<String>, String> graphNode = Node.getInstance(List.of(label));
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
        traverseWithAction(node, graph, __ -> {}, Function.identity());
    }

    public static <T1, T2, S> void traverseWithAction(Node<T1, S> node,
                                                      Graph<T2, S> graph,
                                                      Consumer<T1> action,
                                                      Function<Node<T1, S>, Node<T2, S>> mapper) {
        action.accept(node.getContent());
        var mappedNode = mapper.apply(node);
        graph.nodes.add(mappedNode);
        for (Edge<T1, S> outEdge : node.outEdges) {
            var destination = outEdge.destination;
            if (!graph.nodes.contains(destination)) {
                traverseWithAction(destination, graph, action, mapper);
            }
            graph.edges.add(new Edge<>(outEdge.label, mappedNode, mapper.apply(outEdge.destination)));
        }
    }

    public static <T1, T2, S> Graph<T2, S> map(Function<T1, T2> mapper, Graph<T1, S> graph) {
        Function<Node<T1, S>, T1> getContent = Node::getContent;
        Function<Node<T1, S>, Node<T2, S>> nodeMapper = getContent.andThen(mapper).andThen(Node::new);
        var nodeToNewNode = graph.getNodes().stream()
                .collect(toMap(n -> n, nodeMapper));
        var result = new Graph<T2, S>();
        result.getNodes().addAll(nodeToNewNode.values());
        graph.getEdges().stream()
                .map(edge -> new Edge<>(edge.label, nodeToNewNode.get(edge.source), nodeToNewNode.get(edge.destination)))
                .forEach(result::addEdge);
        return result;
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
        if (nodes.add(node) && !node.outEdges.isEmpty()) {
            var outEdges = new HashSet<>(node.outEdges);
            var inEdges = new HashSet<>(node.inEdges);
            var outEdge = outEdges.iterator().next();
            var next = outEdge.destination;
            boolean canMergeWithNext = outEdges.size() == 1
                    && (!nodes.contains(next) && next.inEdges.size() == 1 || node.getContent().isEmpty());
            if (canMergeWithNext) {
                mergeWithNext(node, graph, nodes, inEdges, outEdge, next);
                return;
            }
            for (var edge : outEdges) {
                graph.edges.add(edge);
                var destination = edge.destination;
                traverseAndMerge(destination, graph, nodes);
            }
        }
        graph.nodes.add(node);
    }

    private static <E, S> void mergeWithNext(Node<List<E>, S> node,
                                             Graph<List<E>, S> graph,
                                             Set<Node<List<E>, S>> nodes,
                                             Set<Edge<List<E>, S>> inEdges,
                                             Edge<List<E>, S> outEdge,
                                             Node<List<E>, S> next) {
        for (var inEdge : inEdges) {
            changeEdgeDestination(graph, inEdge, next);
        }
        List<E> content = new ArrayList<>(node.getContent());
        content.addAll(next.getContent());
        next.setContent(content);
        node.removeEdge(outEdge);
        traverseAndMerge(next, graph, nodes);
    }

    /**
     * Change destination of edge to next
     */
    private static <T, S> void changeEdgeDestination(Graph<T, S> graph, Edge<T, S> edge, Node<T, S> next) {
        Node<T, S> prev = edge.source;
        Edge<T, S> newEdge = prev.addEdge(next, edge.label);
        graph.edges.add(newEdge);
        graph.edges.remove(edge);
        prev.removeEdge(edge);
    }
}
