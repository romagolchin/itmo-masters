package org.golchin.grammar.graph;

import org.golchin.grammar.cfg.GraphWriter;
import org.junit.Test;

import java.util.List;

import static java.util.Collections.singletonList;

public class GraphTest {
    @Test
    public void test() throws Exception {
        Node<List<String>, String> a = Node.getInstance(singletonList("a"));
        Node<List<String>, String> otherNode = Node.getInstance(List.of());
        a.addEdge(otherNode);
        Node<List<String>, String> anotherNode = Node.getInstance(List.of());
        otherNode.addEdge(anotherNode);
        anotherNode.addEdge(Node.getInstance(List.of("d")));
        var g = Graph.fromNode(a);
        GraphWriter.outputGraph("test_out", "test", g);
    }
}