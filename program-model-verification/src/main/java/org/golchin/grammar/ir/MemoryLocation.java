package org.golchin.grammar.ir;

import lombok.AllArgsConstructor;
import lombok.Getter;

@AllArgsConstructor
@Getter
public class MemoryLocation extends Location {
    private final int memoryAddress;
}
