package org.golchin.grammar.nodes;

import com.android.dx.BinaryOp;
import com.android.dx.Local;
import lombok.Getter;
import org.golchin.grammar.bytecode.ByteCodeVisitor;
import org.golchin.grammar.bytecode.CompilationError;
import org.golchin.grammar.model.BuiltinType;
import org.golchin.grammar.model.Type;

import java.util.List;
import java.util.Map;

import static com.android.dx.BinaryOp.*;

@Getter
public class BinaryOpNode extends ExpressionNode {
    private static final Map<String, BinaryOp> OPS =
            Map.of("+", ADD,
                    "-", SUBTRACT,
                    "*", MULTIPLY,
                    "/", DIVIDE,
                    "%", REMAINDER);
    private final BinaryOp op;
    private ExpressionNode left;
    private ExpressionNode right;

    public BinaryOpNode(BinaryOp op, ExpressionNode left, ExpressionNode right) {
        super(List.of(left, right));
        this.op = op;
        this.left = left;
        this.right = right;
        determineType();
    }

    private void determineType() {
        var leftType = checkAndGetBuiltinType(left.getType());
        var rightType = checkAndGetBuiltinType(right.getType());
        if (!leftType.isNumeric() || !rightType.isNumeric())
            throw new CompilationError("Non-numeric types in numeric operation");
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

    private BuiltinType checkAndGetBuiltinType(Type type) {
        if (type instanceof BuiltinType builtinType) {
            return builtinType;
        } else throw new IllegalArgumentException("Expected built-in type");
    }

    public static BinaryOp parseBinaryOp(String op) {
        BinaryOp binaryOp = OPS.get(op);
        if (binaryOp == null) {
            throw new IllegalArgumentException("no such operation: " + op);
        }
        return binaryOp;
    }

    @Override
    public Local<?> accept(ByteCodeVisitor byteCodeVisitor) {
        return byteCodeVisitor.visitBinaryOpNode(this);
    }

    @Override
    public String toString() {
        return op + " " + super.toString();
    }
}
