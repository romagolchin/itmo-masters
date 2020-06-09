package org.golchin.grammar.model;

import lombok.AllArgsConstructor;
import lombok.Getter;

import java.util.Objects;

@AllArgsConstructor
@Getter
public class Field {
    private final String name;
    private final Type type;
    private final CustomType declaringType;

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Field field = (Field) o;
        return Objects.equals(name, field.name) &&
                Objects.equals(declaringType, field.declaringType);
    }

    @Override
    public int hashCode() {
        return Objects.hash(name, declaringType);
    }
}
