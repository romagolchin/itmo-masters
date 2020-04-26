package org.golchin.grammar.cg;

import org.antlr.v4.runtime.tree.RuleNode;
import org.golchin.grammar.GrammarBaseVisitor;
import org.golchin.grammar.GrammarParser;
import org.golchin.grammar.graph.Graph;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;

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
    public Graph visitFuncDefAlt(GrammarParser.FuncDefAltContext ctx) {
        Graph graph = visitChildren(ctx);
        FunctionDefinition functionDefinition = createFunctionDefinition(ctx);
        FunctionNode curFunction = nameToNode.computeIfAbsent(functionDefinition.getName(), FunctionNode::new);
        curFunction.setFunctionDefinition(functionDefinition);
        graph.getNodes().forEach(node -> graph.addEdge(curFunction.addEdge(node, null)));
        graph.addNode(curFunction);
        return graph;
    }

    private FunctionDefinition createFunctionDefinition(GrammarParser.FuncDefAltContext ctx) {
        GrammarParser.FuncSignatureContext funcSignatureContext = ctx.funcDef().funcSignature();
        LinkedHashMap<String, Type> parameterTypes = new LinkedHashMap<>();
        for (GrammarParser.ArgDefContext context : funcSignatureContext.argDefList().argDef()) {
            parameterTypes.put(context.IDENTIFIER().toString(), Type.createInstance(context.typeRef()));
        }
        String functionName = funcSignatureContext.IDENTIFIER().toString();
        Type returnType = Type.createInstance(funcSignatureContext.typeRef());
        return new FunctionDefinition(functionName, returnType, parameterTypes);
    }

    @Override
    public Graph visitCall(GrammarParser.CallContext ctx) {
        Graph graph = visitChildren(ctx);
        String functionName = ctx.IDENTIFIER().toString();
        FunctionNode node = nameToNode.computeIfAbsent(functionName, FunctionNode::new);
        graph.addNode(node);
        return graph;
    }
}
