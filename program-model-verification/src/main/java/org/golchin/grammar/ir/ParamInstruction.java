package org.golchin.grammar.ir;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public class ParamInstruction extends Instruction {
    private final Address param;

    @Override
    public String toString() {
        return "param " + param;
    }
}
