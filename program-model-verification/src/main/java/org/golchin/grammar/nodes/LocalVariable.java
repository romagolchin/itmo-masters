package org.golchin.grammar.nodes;

import lombok.AllArgsConstructor;
import lombok.Getter;
import org.golchin.grammar.model.Type;

@AllArgsConstructor
@Getter
public class LocalVariable {
    private final String name;
    private final Type instanceType;
}
