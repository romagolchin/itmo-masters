package org.golchin.grammar.vm;

import lombok.AllArgsConstructor;

import java.util.List;

@AllArgsConstructor
public class HeapInstance extends HeapObject {
    private final List<TypedValue<?>> fields;
    private final ClassDescriptor classDescriptor;
}
