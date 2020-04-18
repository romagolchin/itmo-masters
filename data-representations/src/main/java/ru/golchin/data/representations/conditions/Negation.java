package ru.golchin.data.representations.conditions;

import ru.golchin.data.representations.Row;

public class Negation extends Conjunct {
    private final Conjunct conjunct;

    public Negation(Conjunct conjunct) {
        this.conjunct = conjunct;
    }

    public static Negation not(Conjunct conjunct) {
        return new Negation(conjunct);
    }

    @Override
    public boolean test(Row row) {
        return !conjunct.test(row);
    }
}
