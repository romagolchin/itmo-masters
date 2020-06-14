package org.golchin.grammar.model;

import lombok.Getter;

@Getter
public class Literal<T> {
    private final T value;
    private final BuiltinType type;

    public Literal(T value, BuiltinType builtinType) {
        this.value = value;
        type = builtinType;
    }
}
