package org.golchin.grammar.model;

import com.android.dx.TypeId;

import java.util.Collections;
import java.util.Objects;
import java.util.stream.Collectors;

public class Array implements Type {
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

    @Override
    public TypeId<?> toJavaTypeId() {
        String prefix = Collections.nCopies(nDimensions, '[').stream()
                .map(Object::toString)
                .collect(Collectors.joining());
        String name = elementType.toJavaTypeId().getName().replace('.', '/');
        try {
            return TypeId.get(Class.forName(prefix + name));
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public boolean canAssignTo(Type other) {
        if (other.getClass() != Array.class)
            return false;
        Array array = (Array) other;
        return elementType.canAssignTo(array.elementType);
    }
}
