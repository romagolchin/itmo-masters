package org.golchin.grammar.ir;

import lombok.AllArgsConstructor;
import lombok.Getter;

@AllArgsConstructor
@Getter
public class AssignInstruction extends Instruction {
    private final Address left;
    private final Address right;

    @Override
    public String toString() {
        return left + " = " + right;
    }
}
