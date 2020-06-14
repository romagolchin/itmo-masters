package org.golchin.grammar.cfg;

import org.antlr.v4.runtime.tree.ParseTree;
import org.golchin.grammar.ParseResult;
import org.golchin.grammar.Util;
import org.golchin.grammar.cg.CallGraphVisitor;
import org.golchin.grammar.cg.FunctionNode;
import org.golchin.grammar.graph.Graph;
import org.golchin.grammar.graph.Node;
import org.golchin.grammar.model.Array;
import org.golchin.grammar.model.Signature;

import java.util.List;
import java.util.Objects;
import java.util.Optional;

import static org.golchin.grammar.model.BuiltinType.STRING;

public class CfgMain {

    public static final Signature MAIN = new Signature("main", List.of(new Array(STRING, 1)));

    public static void main(String[] args) throws Exception {
        var cfgVisitor = new StringCfgVisitor();
        CallGraphVisitor callGraphVisitor = new CallGraphVisitor();
        String directory = args[0];
        for (int j = 1; j < args.length; j++) {
            String sourceFile = args[j];
            ParseTree tree = ParseResult.parse(sourceFile).getTree();
            Graph<String, String> graph = callGraphVisitor.visit(tree);
            Optional<Node<String, String>> main = graph.getNodes().stream()
                    .filter(node -> node instanceof FunctionNode functionNode &&
                            Objects.equals(MAIN, functionNode.getSignature()))
                    .findFirst();
            if (main.isPresent()) {
                graph = new Graph<>();
                Graph.traverse(main.get(), graph);
            }
            String nameWithoutExtension = Util.removeExtension(sourceFile);
            GraphWriter.outputGraph(directory, nameWithoutExtension, graph);
            for (int i = 0; i < tree.getChildCount() - 1; i++) {
                Cfg<String> cfg = cfgVisitor.visit(tree.getChild(i));
                GraphWriter.outputListGraph(directory, nameWithoutExtension + "." + cfg.name, cfg.getGraph());
            }
        }
    }

}
