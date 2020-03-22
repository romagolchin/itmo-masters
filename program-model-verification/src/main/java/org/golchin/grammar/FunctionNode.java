package org.golchin.grammar;

import org.golchin.grammar.graph.Node;

import java.util.List;
import java.util.Objects;

public class FunctionNode extends Node {
    private Signature signature;

    public FunctionNode(String name) {
        this(new Signature(name));
    }

    public FunctionNode(Signature signature) {
        super(List.of(signature.name));
        this.signature = signature;
    }

    public Signature getSignature() {
        return signature;
    }

    public void setSignature(Signature signature) {
        this.signature = signature;
        labels = List.of(signature.name);
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        FunctionNode that = (FunctionNode) o;
        return Objects.equals(signature.name, that.signature.name);
    }

    @Override
    public int hashCode() {
        return Objects.hash(signature.name);
    }
}
