package org.golchin.grammar.graph;

import org.golchin.grammar.cfg.GraphWriter;
import org.junit.Test;

import java.util.List;

import static java.util.Collections.singletonList;

public class GraphTest {
    @Test
    public void name() throws Exception {
        var a = new Node(singletonList("a"));
        var otherNode = new Node(List.of());
        a.addEdge(otherNode);
        var anotherNode = new Node(List.of());
        otherNode.addEdge(anotherNode);
        anotherNode.addEdge(new Node(List.of("d")));
        Graph g = Graph.fromNode(a);
        GraphWriter.outputGraph("test_out", "test", g);
    }
}