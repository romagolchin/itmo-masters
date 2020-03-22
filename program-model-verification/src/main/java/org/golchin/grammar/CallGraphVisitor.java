package org.golchin.grammar;

import org.antlr.v4.runtime.tree.RuleNode;
import org.golchin.grammar.graph.Edge;
import org.golchin.grammar.graph.Graph;

public class CallGraphVisitor extends GrammarBaseVisitor<Graph> {

    @Override
    protected Graph aggregateResult(Graph aggregate, Graph nextResult) {
        if (aggregate == null) {
            return nextResult;
        }
        if (nextResult == null) {
            return aggregate;
        }
        return aggregate.merge(nextResult);
    }

    @Override
    protected Graph defaultResult() {
        return null;
    }

    @Override
    public Graph visitChildren(RuleNode node) {
        Graph graph = super.visitChildren(node);
        return graph == null ? new Graph() : graph;
    }

    @Override
    public Graph visitSourceItem(GrammarParser.SourceItemContext ctx) {
        Graph graph = visitChildren(ctx);
        String functionName = ctx.funcSignature().IDENTIFIER().toString();
        IdentifiedNode curFunction = new IdentifiedNode(functionName);
        graph.getNodes().forEach(node -> graph.addEdge(new Edge(null, curFunction, node)));
        graph.addNode(curFunction);
        return graph;
    }

    @Override
    public Graph visitCall(GrammarParser.CallContext ctx) {
        Graph graph = visitChildren(ctx);
        String function = ctx.IDENTIFIER().toString();
        graph.addNode(new IdentifiedNode(function));
        return graph;
    }
}
