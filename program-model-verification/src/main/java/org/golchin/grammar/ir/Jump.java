package org.golchin.grammar.ir;

import lombok.AllArgsConstructor;
import lombok.Getter;

@AllArgsConstructor
@Getter
public class Jump extends Instruction {
    protected final Label label;

    @Override
    public String toString() {
        return "goto " + getJumpPosition();
    }

    private Integer getJumpPosition() {
        return label.getInstruction().position;
    }

    public Integer getOffset() {
        return getJumpPosition() - getPosition();
    }

}
