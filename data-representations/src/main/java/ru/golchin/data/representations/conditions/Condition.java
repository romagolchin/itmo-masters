package ru.golchin.data.representations.conditions;

import ru.golchin.data.representations.Row;

import java.util.function.Predicate;

public interface Condition extends Predicate<Row> {
    Condition TRUE = __ -> true;
    Condition FALSE = __ -> false;
}
