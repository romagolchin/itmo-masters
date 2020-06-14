package org.golchin.grammar.nodes;

import lombok.Getter;
import org.golchin.grammar.ir.Address;
import org.golchin.grammar.ir.CompilationError;
import org.golchin.grammar.ir.InstructionGeneratingVisitor;
import org.golchin.grammar.ir.RelationOperation;

import java.util.List;
import java.util.Map;

import static org.golchin.grammar.ir.RelationOperation.*;
import static org.golchin.grammar.model.BuiltinType.BOOL;

@Getter
public class ComparisonNode extends ExpressionNode {
    private static final Map<String, RelationOperation> CMPS = Map.of("<", LT, "=", EQ, ">", GT);
    private final RelationOperation relationOperation;
    public ComparisonNode(RelationOperation relationOperation, ExpressionNode left, ExpressionNode right) {
        super(List.of(left, right));
        this.relationOperation = relationOperation;
        type = BOOL;
    }

    public static RelationOperation parseRelationOperation(String cmp) {
        RelationOperation comparison = CMPS.get(cmp);
        if (comparison == null) {
            throw new CompilationError("No such comparison: " + cmp);
        }
        return comparison;
    }

    public ExpressionNode getLeft() {
        return children.get(0);
    }

    public ExpressionNode getRight() {
        return children.get(1);
    }

    @Override
    public Address accept(InstructionGeneratingVisitor instructionGeneratingVisitor) {
        return instructionGeneratingVisitor.visitComparison(this);
    }
}
