package org.golchin.grammar.cg;

import org.antlr.v4.runtime.tree.RuleNode;
import org.golchin.grammar.GrammarBaseVisitor;
import org.golchin.grammar.GrammarParser;
import org.golchin.grammar.graph.Graph;
import org.golchin.grammar.ir.GlobalScope;

import java.util.HashMap;
import java.util.Map;

public class CallGraphVisitor extends GrammarBaseVisitor<Graph<String, String>> {
    private final Map<String, FunctionNode> nameToNode = new HashMap<>();
    private final GlobalScope globalScope = new GlobalScope();

    @Override
    protected Graph<String, String> aggregateResult(Graph<String, String> aggregate,
                                                    Graph<String, String> nextResult) {
        if (aggregate == null) {
            return nextResult;
        }
        if (nextResult == null) {
            return aggregate;
        }
        return aggregate.merge(nextResult);
    }

    @Override
    protected Graph<String, String> defaultResult() {
        return null;
    }

    @Override
    public Graph<String, String> visitChildren(RuleNode node) {
        Graph<String, String> graph = super.visitChildren(node);
        return graph == null ? new Graph<>() : graph;
    }

    @Override
    public Graph<String, String> visitSource(GrammarParser.SourceContext ctx) {
        nameToNode.clear();
        return super.visitSource(ctx);
    }

    @Override
    public Graph<String, String> visitFuncDefAlt(GrammarParser.FuncDefAltContext ctx) {
        Graph<String, String> graph = visitChildren(ctx);
        FunctionDefinition functionDefinition = FunctionDefinition.createFunctionDefinition(ctx.funcDef(), globalScope);
        FunctionNode curFunction = nameToNode.computeIfAbsent(functionDefinition.getName(), FunctionNode::new);
        curFunction.setFunctionDefinition(functionDefinition);
        graph.getNodes().forEach(node -> graph.addEdge(curFunction.addEdge(node, null)));
        graph.addNode(curFunction);
        return graph;
    }

    @Override
    public Graph<String, String> visitCall(GrammarParser.CallContext ctx) {
        Graph<String, String> graph = visitChildren(ctx);
        String functionName = ctx.identifierChain().getText();
        FunctionNode node = nameToNode.computeIfAbsent(functionName, FunctionNode::new);
        graph.addNode(node);
        return graph;
    }
}
