package org.golchin.grammar.ir;

import lombok.AllArgsConstructor;
import lombok.Getter;

@AllArgsConstructor
@Getter
public class Instruction {
    private final Address result;
    private final Operation operation;
    private final Address firstOperand;
    private final Address secondOperand;
    private final Instruction label;
}
