package ru.golchin.data.representations.conditions;

import ru.golchin.data.representations.Column;
import ru.golchin.data.representations.Row;

import java.util.stream.Stream;

public class Negation extends Conjunct {
    private final Conjunct conjunct;

    public Negation(Conjunct conjunct) {
        this.conjunct = conjunct;
    }

    public static Negation not(Conjunct conjunct) {
        return new Negation(conjunct);
    }

    @Override
    public boolean test(Row row, Row... rows) {
        return !conjunct.test(row, rows);
    }

    @Override
    public Stream<Column<?>> columns() {
        return conjunct.columns();
    }
}
