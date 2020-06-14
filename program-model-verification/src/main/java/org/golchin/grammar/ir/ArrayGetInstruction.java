package org.golchin.grammar.ir;

import lombok.AllArgsConstructor;
import lombok.Getter;

import java.util.List;

@AllArgsConstructor
@Getter
public class ArrayGetInstruction extends Instruction {
    private final Address arrayAddress;
    private final List<Address> indices;
    private final Address result = new Temporary();

    @Override
    public String toString() {
        return result + " = " + arrayAddress + indices;
    }
}
