package org.golchin.grammar.model;

import lombok.Getter;

import java.math.BigInteger;

@Getter
public enum BuiltinType implements Type {
    BOOL(false, 1, boolean.class),
    BYTE(1, byte.class),
    INT(4, int.class),
    UINT(4, long.class),
    LONG(8, long.class),
    ULONG(8, BigInteger.class),
    CHAR(2, char.class),
    STRING(false, null, String.class);
    private final boolean isNumeric;
    private final Integer byteCount;
    private final Class<?> javaClass;

    BuiltinType(Integer byteCount, Class<?> javaClass) {
        this(true, byteCount, javaClass);
    }

    BuiltinType(boolean isNumeric, Integer byteCount, Class<?> javaClass) {
        this.isNumeric = isNumeric;
        this.byteCount = byteCount;
        this.javaClass = javaClass;
    }

    public static BuiltinType checkAndGetBuiltinType(Type type) {
        if (type instanceof BuiltinType builtinType) {
            return builtinType;
        } else throw new IllegalArgumentException("Expected built-in type");
    }

    @Override
    public boolean canAssignTo(Type other) {
        if (this == other) return true;
        if (other == null || getClass() != other.getClass()) return false;
        if (!isNumeric() || !((BuiltinType) other).isNumeric)
            return false;
        return getByteCount() <= ((BuiltinType) other).getByteCount();
    }

}
