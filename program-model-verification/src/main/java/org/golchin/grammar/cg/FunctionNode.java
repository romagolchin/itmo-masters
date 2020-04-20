package org.golchin.grammar.cg;

import org.golchin.grammar.graph.Node;

import java.util.List;
import java.util.Objects;

public class FunctionNode extends Node {
    private String name;
    private FunctionDefinition functionDefinition;

    public FunctionNode(String name) {
        super(List.of(name));
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
