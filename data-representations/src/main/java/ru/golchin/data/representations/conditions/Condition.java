package ru.golchin.data.representations.conditions;

import ru.golchin.data.representations.Column;
import ru.golchin.data.representations.Row;

import java.util.stream.Stream;

public interface Condition {
    Condition TRUE = (row, rows) -> true;
    Condition FALSE = (row, rows) -> false;

    boolean test(Row row, Row... rows);

    default Stream<Column<?>> columns() {
        return Stream.of();
    }
}
