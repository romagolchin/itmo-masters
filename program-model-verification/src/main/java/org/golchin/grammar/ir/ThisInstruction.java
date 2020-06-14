package org.golchin.grammar.ir;

import lombok.AllArgsConstructor;
import lombok.Getter;
import org.golchin.grammar.model.ReferenceType;

@AllArgsConstructor
@Getter
public class ThisInstruction extends Instruction {
    private final Temporary result = new Temporary();
    private final ReferenceType type;

    @Override
    public String toString() {
        return result + " = this";
    }
}
