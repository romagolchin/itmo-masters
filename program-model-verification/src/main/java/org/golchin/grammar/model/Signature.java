package org.golchin.grammar.model;

import java.util.List;
import java.util.Objects;

public class Signature {
    public final String name;
    public final List<Type> types;

    public Signature(String name, List<Type> types) {
        this.name = name;
        this.types = types;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Signature signature = (Signature) o;
        return name.equals(signature.name) &&
                Objects.equals(types, signature.types);
    }

    @Override
    public int hashCode() {
        return Objects.hash(name, types);
    }
}
