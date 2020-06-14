package org.golchin.grammar.nodes;

import lombok.AllArgsConstructor;
import lombok.Getter;
import org.golchin.grammar.ir.Address;
import org.golchin.grammar.model.Type;

@AllArgsConstructor
@Getter
public class LocalVariable implements Address {
    private final String name;
    private final Type instanceType;

    @Override
    public String toString() {
        return name;
    }
}
