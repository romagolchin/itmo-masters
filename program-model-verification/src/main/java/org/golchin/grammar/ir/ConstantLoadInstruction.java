package org.golchin.grammar.ir;

import lombok.AllArgsConstructor;
import lombok.Getter;
import org.golchin.grammar.model.Literal;

@Getter
@AllArgsConstructor
public class ConstantLoadInstruction extends Instruction {
    private final Address target;
    private final Literal<?> value;

    @Override
    public String toString() {
        return target + " = " + value.getValue();
    }
}
