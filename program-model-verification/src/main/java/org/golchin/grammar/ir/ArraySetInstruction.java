package org.golchin.grammar.ir;

import lombok.AllArgsConstructor;

import java.util.List;

@AllArgsConstructor
public class ArraySetInstruction extends Instruction {
    private final Address arrayAddress;
    private final List<Address> indices;
    private final Address value;

    @Override
    public String toString() {
        return "%s%s = %s".formatted(arrayAddress, indices, value);
    }
}
