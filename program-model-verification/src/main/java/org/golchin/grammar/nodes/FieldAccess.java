package org.golchin.grammar.nodes;

import lombok.Getter;
import org.golchin.grammar.ir.Address;
import org.golchin.grammar.ir.InstructionGeneratingVisitor;
import org.golchin.grammar.model.Field;

import java.util.List;
import java.util.Objects;

@Getter
public class FieldAccess extends LValue {
    private final ExpressionNode instance;
    private final Field field;

    public FieldAccess(ExpressionNode instance, Field field) {
        super(List.of(instance));
        this.instance = instance;
        this.field = field;
        type = field.getType();
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        FieldAccess that = (FieldAccess) o;
        return Objects.equals(field, that.field);
    }

    @Override
    public int hashCode() {
        return Objects.hash(field);
    }

    @Override
    public Address accept(InstructionGeneratingVisitor instructionGeneratingVisitor) {
        return instructionGeneratingVisitor.visitFieldAccess(this);
    }
}
