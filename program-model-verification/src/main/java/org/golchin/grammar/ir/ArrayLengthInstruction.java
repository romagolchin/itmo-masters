package org.golchin.grammar.ir;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public class ArrayLengthInstruction extends Instruction {
    private final Address result = new Temporary();
    private final Address arrayAddress;

    @Override
    public String toString() {
        return result + " = " + arrayAddress + ".length";
    }
}
