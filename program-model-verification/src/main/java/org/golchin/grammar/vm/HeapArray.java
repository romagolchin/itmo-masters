package org.golchin.grammar.vm;

import lombok.AllArgsConstructor;
import lombok.Getter;

@AllArgsConstructor
@Getter
public class HeapArray extends HeapObject {
    private final int size;
}