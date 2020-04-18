package ru.golchin.data.representations.conditions;

import ru.golchin.data.representations.Row;

import java.util.Arrays;
import java.util.List;

import static java.util.stream.Collectors.toList;

public class Disjunction implements Condition {
    private final List<Conjunction> conjunctions;

    public Disjunction(List<Conjunction> conjunctions) {
        this.conjunctions = conjunctions;
    }

    public static Disjunction or(Conjunction... conjunctions) {
        return new Disjunction(List.of(conjunctions));
    }

    public static Disjunction or(Conjunct... conjuncts) {
        return new Disjunction(Arrays.stream(conjuncts)
                .map(expressions -> new Conjunction(List.of(expressions)))
                .collect(toList()));
    }

    public boolean test(final Row row) {
        return conjunctions.stream()
                .anyMatch(c -> c.test(row));
    }
}
