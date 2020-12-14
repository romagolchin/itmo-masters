package org.golchin.grammar.model;

import lombok.Getter;

import java.util.Objects;

public class Array extends ReferenceType {
    @Getter
    private final Type elementType;
    @Getter
    private final int nDimensions;

    public Array(Type elementType, int nDimensions) {
        super("array");
        addField(new Field("length", BuiltinType.INT, this));
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

    public static Array ofElements(Type elementType, int nDimensions) {
        if (elementType instanceof Array array) {
            return new Array(array.getElementType(), nDimensions + array.getNDimensions());
        }
        return new Array(elementType, nDimensions);
    }
}
