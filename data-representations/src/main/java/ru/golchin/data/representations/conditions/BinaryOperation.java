package ru.golchin.data.representations.conditions;

import java.util.Objects;
import java.util.function.Predicate;

import static java.util.Comparator.naturalOrder;
import static java.util.Comparator.nullsFirst;

public enum BinaryOperation {
    EQUALS(i -> i == 0),
    GREATER(i -> i > 0),
    LESS(i -> i < 0),
    GREATER_EQUALS(i -> i >= 0),
    LESS_EQUALS(i -> i <= 0);

    private final Predicate<Integer> predicate;

    BinaryOperation(Predicate<Integer> predicate) {
        this.predicate = predicate;
    }

    public <T extends Comparable<T>> boolean test(T x, T y) {
        return predicate.test(Objects.compare(x, y, nullsFirst(naturalOrder())));
    }
}
