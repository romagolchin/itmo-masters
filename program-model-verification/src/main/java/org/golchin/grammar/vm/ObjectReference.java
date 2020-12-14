package org.golchin.grammar.vm;

public class ObjectReference extends TypedValue<Integer> {
    public ObjectReference(Integer heapAddress) {
        super(heapAddress);
    }
}
