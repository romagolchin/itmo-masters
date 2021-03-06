package org.golchin.grammar.cfg;

import guru.nidi.graphviz.engine.Format;
import guru.nidi.graphviz.engine.Graphviz;
import guru.nidi.graphviz.model.MutableGraph;
import guru.nidi.graphviz.parse.Parser;
import org.golchin.grammar.IndentedWriter;
import org.golchin.grammar.graph.Graph;
import org.golchin.grammar.graph.Node;

import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.function.Function;

import static java.util.stream.Collectors.joining;

public class GraphWriter {
    public static final Function<? super List<?>, String> LIST_SERIALIZER = instructions -> instructions.stream()
            .map(Objects::toString).collect(joining("\n"));

    public static <T> void write(Graph<? extends T, String> graph,
                                 Function<? super T, String> serializer, Path file) throws IOException {
        try (BufferedWriter writer = Files.newBufferedWriter(file)) {
            IndentedWriter indentedWriter = new IndentedWriter(writer);
            indentedWriter.writeLine("digraph {");
            indentedWriter.indent();
            Map<Node<? extends T, String>, Integer> nodesToIds = new HashMap<>();
            var curId = 0;
            for (var node : graph.getNodes()) {
                String allLabels = serializer.apply(node.getContent());
                nodesToIds.put(node, curId);
                indentedWriter.writeLine(String.format("%d [label=\"%s\"];", curId++, allLabels));
            }
            for (var edge : graph.getEdges()) {
                Integer sourceId = nodesToIds.get(edge.source);
                Integer destinationId = nodesToIds.get(edge.destination);
                String label = edge.label == null ? "" : edge.label;
                indentedWriter.writeLine(String.format("%d -> %d [label=\"%s\"];", sourceId, destinationId, label));
            }
            indentedWriter.dedent();
            indentedWriter.writeLine("}");
        }
    }

    public static <T> void outputGraph(String outDir,
                                       String dotFileName,
                                       Graph<T, String> graph) throws IOException {
        outputGraph(outDir, dotFileName, graph, Objects::toString);
    }

    public static void outputListGraph(String outDir,
                                       String dotFileName,
                                       Graph<? extends List<?>, String> graph) throws IOException {
        outputGraph(outDir, dotFileName, graph, LIST_SERIALIZER);
    }

    public static <T> void outputGraph(String outDir,
                                       String dotFileName,
                                       Graph<? extends T, String> graph,
                                       Function<? super T, String> serializer) throws IOException {
        Files.createDirectories(Paths.get(outDir));
        Path dotFile = Paths.get(outDir, dotFileName + ".dot");
        write(graph, serializer, dotFile);
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
