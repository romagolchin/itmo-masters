package ru.golchin.data.representations.conditions;

import ru.golchin.data.representations.Column;
import ru.golchin.data.representations.Row;

import java.util.Objects;
import java.util.stream.Stream;

public abstract class Conjunct implements Condition {

    protected static <U extends Comparable<U>> U getField(Column<U> column, Row row, Row... rows) {
        return Stream.concat(Stream.of(row), Stream.of(rows))
                .filter(r -> r.getTableSchema() != null &&
                        Objects.equals(r.getTableSchema().getName(), column.getTableSchema().getName()))
                .findFirst()
                .map(r -> r.getField(column))
                .orElse(null);
    }
}
