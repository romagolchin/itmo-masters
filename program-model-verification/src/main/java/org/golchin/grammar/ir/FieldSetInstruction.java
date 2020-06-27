package org.golchin.grammar.ir;

import lombok.AllArgsConstructor;
import lombok.Getter;
import org.golchin.grammar.model.Field;

@AllArgsConstructor
@Getter
public class FieldSetInstruction extends Instruction {
    private final Address instance;
    private final Field field;
    private final Address value;

    @Override
    public String toString() {
        return String.format("%s.%s = %s", instance, field.getName(), value);
    }
}
