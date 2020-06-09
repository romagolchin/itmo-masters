package org.golchin.grammar.nodes.literals;

import com.android.dx.Local;
import lombok.Getter;
import org.golchin.grammar.bytecode.ByteCodeVisitor;
import org.golchin.grammar.bytecode.CompilationError;
import org.golchin.grammar.model.BuiltinType;
import org.golchin.grammar.nodes.ExpressionNode;

import java.math.BigInteger;

@Getter
public abstract class LiteralNode<T> extends ExpressionNode {
    private final T value;

    public LiteralNode(T value, BuiltinType builtinType) {
        this.value = value;
        type = builtinType;
    }

    private static final BigInteger MAX_INT = BigInteger.valueOf(Integer.MAX_VALUE);
    private static final BigInteger MIN_INT = BigInteger.valueOf(Integer.MIN_VALUE);
    private static final BigInteger MAX_LONG = BigInteger.valueOf(Long.MAX_VALUE);
    private static final BigInteger MIN_LONG = BigInteger.valueOf(Long.MIN_VALUE);
    private static final BigInteger MIN_UINT = BigInteger.valueOf(0);
    private static final BigInteger MAX_UINT = BigInteger.valueOf((1L << 32) - 1);

    public static LiteralNode<?> getOrCreateNumeric(String text) {
        int radix = 10;
        if (text.startsWith("0b")) {
            text = text.substring(2);
            radix = 2;
        } else if (text.startsWith("0x")) {
            text = text.substring(2);
            radix = 16;
        }
        BigInteger bigInteger = new BigInteger(text, radix);
        if (MIN_INT.compareTo(bigInteger) <= 0 && bigInteger.compareTo(MAX_INT) <= 0)
            return new IntNode(bigInteger.intValue());
        if (MIN_UINT.compareTo(bigInteger) <= 0 && bigInteger.compareTo(MAX_UINT) <= 0)
            return new IntNode(bigInteger.intValue());
        if (MIN_LONG.compareTo(bigInteger) <= 0 && bigInteger.compareTo(MAX_LONG) <= 0)
            return new LongNode(bigInteger.longValue());
        throw new CompilationError("Illegal numeric value");
    }

    @Override
    public Local<?> accept(ByteCodeVisitor byteCodeVisitor) {
        return byteCodeVisitor.visitLiteralNode(this);
    }
}
