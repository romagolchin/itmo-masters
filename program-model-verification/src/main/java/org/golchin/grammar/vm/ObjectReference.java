package org.golchin.grammar.vm;

import org.golchin.grammar.model.CustomType;

public class ObjectReference extends TypedValue<Integer> {
    public ObjectReference(CustomType type, Integer heapAddress) {
        super(type, heapAddress);
    }
}
