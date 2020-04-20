package org.golchin.grammar.cg;

import java.util.Objects;

public class Array extends Type {
    private final Type elementType;
    private final int nDimensions;

    public Array(Type elementType, int nDimensions) {
        this.elementType = elementType;
        this.nDimensions = nDimensions;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Array array = (Array) o;
        return nDimensions == array.nDimensions &&
                Objects.equals(elementType, array.elementType);
    }

    @Override
    public int hashCode() {
        return Objects.hash(elementType, nDimensions);
    }
}
