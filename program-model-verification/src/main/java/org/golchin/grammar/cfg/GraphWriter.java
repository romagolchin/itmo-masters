package org.golchin.grammar.cfg;

import org.golchin.grammar.IndentedWriter;
import org.golchin.grammar.graph.Edge;
import org.golchin.grammar.graph.Graph;
import org.golchin.grammar.graph.Node;

import java.io.BufferedWriter;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.HashMap;
import java.util.Map;

public class GraphWriter {
    public void write(Graph graph, Path file) throws IOException {
        try (BufferedWriter writer = Files.newBufferedWriter(file)) {
            IndentedWriter indentedWriter = new IndentedWriter(writer);
            indentedWriter.writeLine("digraph {");
            indentedWriter.indent();
            Map<Node, Integer> nodesToIds = new HashMap<>();
            var curId = 0;
            for (Node node : graph.getNodes()) {
                String allLabels = String.join("\n", node.labels);
                nodesToIds.put(node, curId);
                indentedWriter.writeLine(String.format("%d [label=\"%s\"];", curId++, allLabels));
            }
            for (Edge edge : graph.getEdges()) {
                Integer sourceId = nodesToIds.get(edge.source);
                Integer destinationId = nodesToIds.get(edge.destination);
                String label = edge.label == null ? "" : edge.label;
                indentedWriter.writeLine(String.format("%d -> %d [label=\"%s\"];", sourceId, destinationId, label));
            }
            indentedWriter.dedent();
            indentedWriter.writeLine("}");
        }
    }

}
