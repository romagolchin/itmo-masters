package org.golchin.grammar.vm;

import org.golchin.grammar.model.Type;

public class ArrayReference extends TypedValue<Integer> {
    public ArrayReference(Type type, Integer value) {
        super(type, value);
    }
}
