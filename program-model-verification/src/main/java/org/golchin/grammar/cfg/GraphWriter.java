package org.golchin.grammar.cfg;

import guru.nidi.graphviz.engine.Format;
import guru.nidi.graphviz.engine.Graphviz;
import guru.nidi.graphviz.model.MutableGraph;
import guru.nidi.graphviz.parse.Parser;
import org.golchin.grammar.IndentedWriter;
import org.golchin.grammar.graph.Edge;
import org.golchin.grammar.graph.Graph;
import org.golchin.grammar.graph.Node;

import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.HashMap;
import java.util.Map;

public class GraphWriter {
    public static void write(Graph graph, Path file) throws IOException {
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

    public static void outputGraph(String outDir, String dotFileName, Graph graph) throws IOException {
        Files.createDirectories(Paths.get(outDir));
        Path dotFile = Paths.get(outDir, dotFileName + ".dot");
        write(graph, dotFile);
        dotToSvg(dotFile, Paths.get(outDir, dotFileName + ".svg"));
    }

    private static void dotToSvg(Path inFile, Path outFile) throws IOException {
        try (InputStream inputStream = Files.newInputStream(inFile)) {
            MutableGraph g = new Parser().read(inputStream);
            Graphviz.fromGraph(g).render(Format.SVG)
                    .toOutputStream(Files.newOutputStream(outFile));
        }
    }
}
