package ru.golchin.data.representations.conditions;

import ru.golchin.data.representations.Column;
import ru.golchin.data.representations.Row;

import java.util.stream.Stream;

public class BiColumnExpression<T extends Comparable<T>> extends Conjunct {
    private final Column<T> firstColumn;
    private final Column<T> secondColumn;
    private final BinaryOperation operation;

    public BiColumnExpression(Column<T> firstColumn, Column<T> secondColumn, BinaryOperation operation) {
        this.firstColumn = firstColumn;
        this.secondColumn = secondColumn;
        this.operation = operation;
    }

    @Override
    public boolean test(Row row, Row... rows) {
        T firstField = getField(firstColumn, row, rows);
        T secondField = getField(secondColumn, row, rows);
        return operation.test(firstField, secondField);
    }

    @Override
    public Stream<Column<?>> columns() {
        return Stream.of(firstColumn, secondColumn);
    }

    public static <T extends Comparable<T>> BiColumnExpression<T> eqField(Column<T> column, Column<T> value) {
        return new BiColumnExpression<>(column, value, BinaryOperation.EQUALS);
    }

    public static <T extends Comparable<T>> BiColumnExpression<T> ltField(Column<T> column, Column<T> value) {
        return new BiColumnExpression<>(column, value, BinaryOperation.LESS);
    }

    public static <T extends Comparable<T>> BiColumnExpression<T> gtField(Column<T> column, Column<T> value) {
        return new BiColumnExpression<>(column, value, BinaryOperation.GREATER);
    }

    public static <T extends Comparable<T>> BiColumnExpression<T> leField(Column<T> column, Column<T> value) {
        return new BiColumnExpression<>(column, value, BinaryOperation.LESS_EQUALS);
    }

    public static <T extends Comparable<T>> BiColumnExpression<T> geField(Column<T> column, Column<T> value) {
        return new BiColumnExpression<>(column, value, BinaryOperation.GREATER_EQUALS);
    }
}
