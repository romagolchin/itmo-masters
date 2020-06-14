package org.golchin.grammar.ir;

import lombok.AllArgsConstructor;
import lombok.Getter;

@AllArgsConstructor
@Getter
public class ArrayCreationInstruction extends Instruction {
    private final Temporary temporary = new Temporary();
    private final ArraySizeSpec sizeSpec;

    @Override
    public String toString() {
        return String.format("%s = new array %s", temporary, sizeSpec.getDimensionSizes());
    }
}
