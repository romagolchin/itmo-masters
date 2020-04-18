package ru.golchin.data.representations;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

public class Row {
    private final TableSchema tableSchema;
    private final List<Comparable<?>> fields = new ArrayList<>();

    public Row(TableSchema tableSchema, List<Comparable<?>> fields) {
        this.tableSchema = tableSchema;
        this.fields.addAll(fields);
    }

    @SuppressWarnings("unchecked")
    public <T extends Comparable<T>> T getField(Column<T> column) {
        var columnIndex = tableSchema.getColumnIndex(column.getName());
        return (T) fields.get(columnIndex);
    }

    public List<Comparable<?>> getFields() {
        return fields;
    }

    public TableSchema getTableSchema() {
        return tableSchema;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Row row = (Row) o;
        return Objects.equals(tableSchema, row.tableSchema) &&
                Objects.equals(fields, row.fields);
    }

    @Override
    public int hashCode() {
        return Objects.hash(tableSchema, fields);
    }
}
