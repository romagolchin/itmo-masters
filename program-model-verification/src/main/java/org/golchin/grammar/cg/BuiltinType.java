package org.golchin.grammar.cg;

import java.util.Objects;

public class BuiltinType extends Type {
    private final BuiltinTypeName typeName;

    public BuiltinType(BuiltinTypeName typeName) {
        this.typeName = typeName;
    }

    public BuiltinTypeName getTypeName() {
        return typeName;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        BuiltinType that = (BuiltinType) o;
        return typeName == that.typeName;
    }

    @Override
    public int hashCode() {
        return Objects.hash(typeName);
    }
}
