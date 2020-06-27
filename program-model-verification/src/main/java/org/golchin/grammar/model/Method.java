package org.golchin.grammar.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import org.golchin.grammar.GrammarParser;
import org.golchin.grammar.cg.FunctionDefinition;
import org.golchin.grammar.ir.Instruction;
import org.golchin.grammar.ir.LocalScope;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

@Getter
@AllArgsConstructor
public class Method {
    private final ReferenceType declaringType;
    private final FunctionDefinition functionDefinition;
    private final LocalScope localScope;
    private final GrammarParser.BodyContext bodyContext;
    private final List<Instruction> instructions = new ArrayList<>();
    private final Visibility visibility;

    public String getName() {
        return getFunctionDefinition().getName();
    }

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

    @Override
    public String toString() {
        return String.valueOf(functionDefinition);
    }
}

