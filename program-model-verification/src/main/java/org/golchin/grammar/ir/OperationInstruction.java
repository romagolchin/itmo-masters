package org.golchin.grammar.ir;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public class OperationInstruction extends Instruction {
    private final Address result;
    private final Operation operation;
    private final Address firstOperand;
    private final Address secondOperand;

    public OperationInstruction(Address destination, UnaryOperation operation, Address operand) {
        this(destination, operation, operand, null);
    }

    @Override
    public String toString() {
        if (secondOperand != null) {
            return String.format("%s = %s %s %s", result, firstOperand, operation, secondOperand);
        }
        return String.format("%s = %s %s", result, operation, firstOperand);
    }
}
