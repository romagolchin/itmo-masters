package org.golchin.grammar.vm;

import lombok.AllArgsConstructor;
import org.golchin.grammar.model.Type;

@AllArgsConstructor
public abstract class TypedValue<T> {
    private final T value;

    public static TypedValue<?> createDefault(Type type) {
        // todo
        return new IntValue(0);
    }
}
