package org.golchin.grammar;

import org.antlr.v4.runtime.RuleContext;
import org.antlr.v4.runtime.tree.RuleNode;
import org.golchin.grammar.graph.Graph;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.stream.Collectors;

public class CallGraphVisitor extends GrammarBaseVisitor<Graph> {
    private final Map<String, FunctionNode> nameToNode = new HashMap<>();

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
    public Graph visitSource(GrammarParser.SourceContext ctx) {
        nameToNode.clear();
        return super.visitSource(ctx);
    }

    @Override
    public Graph visitSourceItem(GrammarParser.SourceItemContext ctx) {
        Graph graph = visitChildren(ctx);
        GrammarParser.FuncSignatureContext funcSignatureContext = ctx.funcSignature();
        List<String> types = funcSignatureContext.argDefList().argDef()
                .stream()
                .map(GrammarParser.ArgDefContext::typeRef)
                .filter(Objects::nonNull)
                .map(RuleContext::getText)
                .collect(Collectors.toList());
        String functionName = funcSignatureContext.IDENTIFIER().toString();
        FunctionNode curFunction = nameToNode.computeIfAbsent(functionName, FunctionNode::new);
        curFunction.getSignature().types = types;
        graph.getNodes().forEach(node -> graph.addEdge(curFunction.addEdge(node, null)));
        graph.addNode(curFunction);
        return graph;
    }

    @Override
    public Graph visitCall(GrammarParser.CallContext ctx) {
        Graph graph = visitChildren(ctx);
        String function = ctx.IDENTIFIER().toString();
        FunctionNode node = nameToNode.computeIfAbsent(function, FunctionNode::new);
        graph.addNode(node);
        return graph;
    }
}
