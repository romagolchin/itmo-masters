package org.golchin.grammar.ir;

import lombok.Getter;

@Getter
public class ConditionalJump extends Jump {
    private final Address condition;
    private final boolean invert;

    public ConditionalJump(Label label, Address condition, boolean invert) {
        super(label);
        this.condition = condition;
        this.invert = invert;
    }

    @Override
    public String toString() {
        var operation = invert ? "ifFalse" : "ifTrue";
        return "%s %s goto %s".formatted(operation, condition, getLabel().getInstruction().getPosition());
    }
}
