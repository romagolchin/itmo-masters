package org.golchin.grammar.graph;

import org.golchin.grammar.cfg.GraphWriter;
import org.junit.Test;

import java.util.List;

import static java.util.Collections.singletonList;

public class GraphTest {
    @Test
    public void test() throws Exception {
        Node<List<String>, String> a = new Node<>(singletonList("a"));
        Node<List<String>, String> otherNode = new Node<>(List.of());
        a.addEdge(otherNode);
        Node<List<String>, String> anotherNode = new Node<>(List.of());
        otherNode.addEdge(anotherNode);
        anotherNode.addEdge(new Node<>(List.of("d")));
        var g = Graph.fromNode(a);
        GraphWriter.outputGraph("test_out", "test", g);
    }
}