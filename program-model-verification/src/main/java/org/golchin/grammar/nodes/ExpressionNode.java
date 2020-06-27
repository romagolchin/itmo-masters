package org.golchin.grammar.nodes;

import lombok.Getter;
import lombok.Setter;
import org.golchin.grammar.ir.Address;
import org.golchin.grammar.ir.InstructionGeneratingVisitor;
import org.golchin.grammar.ir.Temporary;
import org.golchin.grammar.model.Type;

import java.util.ArrayList;
import java.util.List;

@Getter
public abstract class ExpressionNode {
    @Setter
    protected Address address;
    protected Type type;
    protected final List<ExpressionNode> children;

    public ExpressionNode() {
        this(new ArrayList<>());
    }

    public ExpressionNode(List<ExpressionNode> children) {
        this.children = new ArrayList<>(children);
    }

    public Address getAddress() {
        return address == null ? new Temporary() : address;
    }

    public abstract Address accept(InstructionGeneratingVisitor instructionGeneratingVisitor);

    public ExpressionNode convertTo(Type newType) {
        if (type.equals(newType)) {
            return this;
        }
        type.attemptToAssign(newType);
        return new ConversionNode(newType, this);
    }
}
