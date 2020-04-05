package org.golchin.grammar.cfg;

import org.antlr.v4.runtime.tree.ParseTree;
import org.golchin.grammar.ParseResult;
import org.golchin.grammar.cg.*;
import org.golchin.grammar.graph.Graph;
import org.golchin.grammar.graph.Node;

import java.util.List;
import java.util.Objects;
import java.util.Optional;

import static org.golchin.grammar.cg.BuiltinTypeName.STRING;

public class CfgMain {

    public static final Signature MAIN = new Signature("main", List.of(new Array(new BuiltinType(STRING), 1)));

    public static void main(String[] args) throws Exception {
        CfgVisitor cfgVisitor = new CfgVisitor();
        CallGraphVisitor callGraphVisitor = new CallGraphVisitor();
        String directory = args[0];
        for (int j = 1; j < args.length; j++) {
            String sourceFile = args[j];
            ParseTree tree = ParseResult.parse(sourceFile).getTree();
            Graph graph = callGraphVisitor.visit(tree);
            Optional<Node> main = graph.getNodes().stream()
                    .filter(node -> node instanceof FunctionNode &&
                            Objects.equals(MAIN, ((FunctionNode) node).getSignature()))
                    .findFirst();
            if (main.isPresent()) {
                graph = Graph.fromNode(main.get());
            }
            String nameWithoutExtension = removeExtension(sourceFile);
            GraphWriter.outputGraph(directory, nameWithoutExtension, graph);
            for (int i = 0; i < tree.getChildCount() - 1; i++) {
                Cfg cfg = cfgVisitor.visit(tree.getChild(i));
                GraphWriter.outputGraph(directory, nameWithoutExtension + "." + cfg.name, cfg.getGraph());
            }
        }
    }

    private static String removeExtension(String fileName) {
        int slashIndex = fileName.lastIndexOf('/');
        int dotIndex = fileName.lastIndexOf('.');
        return fileName.substring(slashIndex + 1, dotIndex);
    }

}
