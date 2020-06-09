package org.golchin.grammar.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import org.golchin.grammar.bytecode.LocalScope;
import org.golchin.grammar.cg.FunctionDefinition;
import org.golchin.grammar.ir.Instruction;

import java.util.List;
import java.util.Objects;

@Getter
@AllArgsConstructor
public class Method {
    private final CustomType declaringType;
    private final FunctionDefinition functionDefinition;
    private final LocalScope localScope;
    private final List<Instruction> instructions;

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Method method = (Method) o;
        return Objects.equals(declaringType, method.declaringType) &&
                Objects.equals(functionDefinition, method.functionDefinition);
    }

    @Override
    public int hashCode() {
        return Objects.hash(declaringType, functionDefinition);
    }
}

