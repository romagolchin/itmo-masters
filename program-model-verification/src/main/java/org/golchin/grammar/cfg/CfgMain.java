package org.golchin.grammar.cfg;

import guru.nidi.graphviz.engine.Format;
import guru.nidi.graphviz.engine.Graphviz;
import guru.nidi.graphviz.model.MutableGraph;
import guru.nidi.graphviz.parse.Parser;
import org.antlr.v4.runtime.tree.ParseTree;
import org.golchin.grammar.CallGraphVisitor;
import org.golchin.grammar.ParseResult;
import org.golchin.grammar.graph.Graph;

import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

public class CfgMain {

    public static void main(String[] args) throws Exception {
        GraphWriter graphWriter = new GraphWriter();
        CfgVisitor cfgVisitor = new CfgVisitor();
        CallGraphVisitor callGraphVisitor = new CallGraphVisitor();
        String directory = args[0];
        Files.createDirectories(Paths.get(directory));
        for (int j = 1; j < args.length; j++) {
            String sourceFile = args[j];
            ParseTree tree = ParseResult.parse(sourceFile).getTree();
            Graph graph = callGraphVisitor.visit(tree);
            String nameWithoutExtension = removeExtension(sourceFile);
            outputGraph(directory, nameWithoutExtension, graph, graphWriter);
            for (int i = 0; i < tree.getChildCount() - 1; i++) {
                Cfg cfg = cfgVisitor.visit(tree.getChild(i));
                outputGraph(directory, nameWithoutExtension + "." + cfg.name, cfg, graphWriter);
            }
        }
    }

    private static String removeExtension(String fileName) {
        int index = fileName.lastIndexOf('.');
        return fileName.substring(0, index);
    }

    private static void outputGraph(String outDir, String dotFileName, Graph graph, GraphWriter graphWriter) throws IOException {
        Path dotFile = Paths.get(outDir, dotFileName + ".dot");
        graphWriter.write(graph, dotFile);
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
