package org.golchin.grammar.cg;

import org.golchin.grammar.graph.Node;
import org.golchin.grammar.model.Signature;

import java.util.Objects;

public class FunctionNode extends Node<String, String> {
    private final String name;
    private FunctionDefinition functionDefinition;

    public FunctionNode(String name) {
        // fixme
        super(name);
        this.name = name;
    }

    public Signature getSignature() {
        if (functionDefinition == null)
            return null;
        return functionDefinition.getSignature();
    }

    public FunctionDefinition getFunctionDefinition() {
        return functionDefinition;
    }

    public void setFunctionDefinition(FunctionDefinition functionDefinition) {
        this.functionDefinition = functionDefinition;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        FunctionNode that = (FunctionNode) o;
        return Objects.equals(name, that.name);
    }

    @Override
    public int hashCode() {
        return Objects.hash(name);
    }
}
