package org.golchin.grammar.ir;

import lombok.Getter;
import lombok.Setter;

@Getter
public abstract class Instruction {
    @Setter
    protected Integer position;
}
