package org.golchin.grammar.nodes;

import lombok.Getter;
import org.golchin.grammar.ir.Address;
import org.golchin.grammar.ir.BinaryOperation;
import org.golchin.grammar.ir.CompilationError;
import org.golchin.grammar.ir.InstructionGeneratingVisitor;
import org.golchin.grammar.model.BuiltinType;

import java.util.List;
import java.util.Map;

import static org.golchin.grammar.ir.BinaryOperation.*;
import static org.golchin.grammar.model.BuiltinType.BOOL;


@Getter
public class BinaryOpNode extends ExpressionNode {
    private static final Map<String, BinaryOperation> OPS =
            Map.of("+", ADD,
                    "-", SUBTRACT,
                    "*", MULTIPLY,
                    "/", DIVIDE,
                    "%", REMAINDER);
    private final BinaryOperation op;
    private ExpressionNode left;
    private ExpressionNode right;

    public BinaryOpNode(BinaryOperation op, ExpressionNode left, ExpressionNode right) {
        super(List.of(left, right));
        this.op = op;
        this.left = left;
        this.right = right;
        determineType();
    }

    private void determineType() {
        var leftType = BuiltinType.checkAndGetBuiltinType(left.getType());
        var rightType = BuiltinType.checkAndGetBuiltinType(right.getType());
        if (leftType == BOOL && rightType != BOOL)
            throw new CompilationError("Left operand is bool but right is not");
        if (leftType != BOOL && rightType == BOOL)
            throw new CompilationError("Right operand is bool but left is not");
        if (leftType == BOOL) {
            type = BOOL;
            return;
        }
        if (!leftType.isNumeric() || !rightType.isNumeric())
            throw new CompilationError("Non-numeric types in numeric operation");
        if (leftType.equals(rightType)) {
            type = leftType;
            return;
        }
        if (leftType.getByteCount() > rightType.getByteCount()) {
            type = leftType;
        } else if (rightType.getByteCount() > leftType.getByteCount()) {
            type = rightType;
        } else if (leftType.getByteCount() == 4) {
            type = BuiltinType.INT;
        } else if (leftType.getByteCount() == 8) {
            type = BuiltinType.LONG;
        } else {
            throw new AssertionError("never happens");
        }
        setLeft(left.convertTo(type));
        setRight(right.convertTo(type));
    }

    public ExpressionNode getLeft() {
        return left;
    }

    public void setLeft(ExpressionNode left) {
        this.left = left;
        children.set(0, left);
    }

    public ExpressionNode getRight() {
        return right;
    }

    public void setRight(ExpressionNode right) {
        this.right = right;
        children.set(1, right);
    }

    public static BinaryOperation parseBinaryOp(String op) {
        BinaryOperation binaryOp = OPS.get(op);
        if (binaryOp == null) {
            throw new IllegalArgumentException("no such operation: " + op);
        }
        return binaryOp;
    }

    @Override
    public Address accept(InstructionGeneratingVisitor instructionGeneratingVisitor) {
        return instructionGeneratingVisitor.visitBinaryOpNode(this);
    }

}
