package org.golchin.grammar.ir;

import lombok.AllArgsConstructor;
import lombok.Getter;

@AllArgsConstructor
@Getter
public class ReturnInstruction extends Instruction {
    private final Address address;

    @Override
    public String toString() {
        return "return " + address;
    }
}
