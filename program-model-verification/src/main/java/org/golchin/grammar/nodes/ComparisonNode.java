package org.golchin.grammar.nodes;

import com.android.dx.Comparison;
import com.android.dx.Local;
import lombok.Getter;
import org.golchin.grammar.bytecode.ByteCodeVisitor;
import org.golchin.grammar.bytecode.CompilationError;

import java.util.List;
import java.util.Map;

import static com.android.dx.Comparison.*;

@Getter
public class ComparisonNode extends ExpressionNode {
    private static final Map<String, Comparison> CMPS = Map.of("<", LT, "=", EQ, ">", GT);
    private final Comparison comparison;
    public ComparisonNode(Comparison comparison, ExpressionNode left, ExpressionNode right) {
        super(List.of(left, right));
        this.comparison = comparison;
    }

    public static Comparison parseComparison(String cmp) {
        Comparison comparison = CMPS.get(cmp);
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
    public Local<?> accept(ByteCodeVisitor byteCodeVisitor) {
        return byteCodeVisitor.visitComparison(this);
    }
}
