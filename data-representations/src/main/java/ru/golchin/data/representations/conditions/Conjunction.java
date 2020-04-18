package ru.golchin.data.representations.conditions;

import ru.golchin.data.representations.Row;

import java.util.List;

public class Conjunction implements Condition {
    private final List<Conjunct> expressions;

    public Conjunction(List<Conjunct> expressions) {
        this.expressions = expressions;
    }

    public static Conjunction and(Conjunct... conjuncts) {
        return new Conjunction(List.of(conjuncts));
    }

    public boolean test(Row row) {
        return expressions.stream()
                .allMatch(e -> e.test(row));
    }
}
