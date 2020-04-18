package ru.golchin.data.representations.conditions;

import ru.golchin.data.representations.Column;
import ru.golchin.data.representations.Row;

public class SingleColumnExpression<T extends Comparable<T>> extends Conjunct {
    private final Column<T> column;
    private final T value;
    private final BinaryOperation operation;

    public SingleColumnExpression(Column<T> column, T value, BinaryOperation operation) {
        this.column = column;
        this.value = value;
        this.operation = operation;
    }

    public static <T extends Comparable<T>> SingleColumnExpression<T> eq(Column<T> column, T value) {
        return new SingleColumnExpression<>(column, value, BinaryOperation.EQUALS);
    }

    public static <T extends Comparable<T>> SingleColumnExpression<T> lt(Column<T> column, T value) {
        return new SingleColumnExpression<>(column, value, BinaryOperation.LESS);
    }

    public static <T extends Comparable<T>> SingleColumnExpression<T> gt(Column<T> column, T value) {
        return new SingleColumnExpression<>(column, value, BinaryOperation.GREATER);
    }

    public static <T extends Comparable<T>> SingleColumnExpression<T> le(Column<T> column, T value) {
        return new SingleColumnExpression<>(column, value, BinaryOperation.LESS_EQUALS);
    }

    public static <T extends Comparable<T>> SingleColumnExpression<T> ge(Column<T> column, T value) {
        return new SingleColumnExpression<>(column, value, BinaryOperation.GREATER_EQUALS);
    }

    @Override
    public boolean test(Row row) {
        return operation.test(row.getField(column), value);
    }
}
