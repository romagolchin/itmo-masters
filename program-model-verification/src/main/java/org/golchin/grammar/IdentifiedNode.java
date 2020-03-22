package org.golchin.grammar;

import org.golchin.grammar.graph.Node;

import java.util.Collections;
import java.util.Objects;

public class IdentifiedNode extends Node {
    private final String id;

    public IdentifiedNode(String id) {
        super(Collections.singletonList(id));
        this.id = id;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        IdentifiedNode that = (IdentifiedNode) o;
        return Objects.equals(id, that.id);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id);
    }
}
