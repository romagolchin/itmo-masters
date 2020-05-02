package ru.golchin.data.representations;

import java.util.Map;

public class Update {
    private final Map<String, Comparable<?>> fields;

    public Update(Map<String, Comparable<?>> fields) {
        this.fields = fields;
    }

    public Map<String, Comparable<?>> getFields() {
        return fields;
    }
}
