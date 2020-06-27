package org.golchin.grammar.ir;

import lombok.AllArgsConstructor;
import lombok.Getter;
import org.golchin.grammar.model.Field;

@AllArgsConstructor
@Getter
public class FieldGetInstruction extends Instruction {
    private final Temporary result = new Temporary();
    private final Address instance;
    private final Field field;

    @Override
    public String toString() {
        return String.format("%s = %s.%s", result, instance, field.getName());
    }
}
