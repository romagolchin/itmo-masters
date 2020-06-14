package org.golchin.grammar.vm;

import lombok.AllArgsConstructor;

@AllArgsConstructor
public class ArrayElement extends HeapObject {
    private final TypedValue<?> value;
}
