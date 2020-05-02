package ru.golchin.data.representations;

public class Column<T extends Comparable<T>> {
    private final String name;
    private final Class<T> type;

    private TableSchema tableSchema;

    public Column(String name, Class<T> type) {
        this.name = name;
        this.type = type;
    }

    public String getName() {
        return name;
    }

    public Class<T> getType() {
        return type;
    }

    public TableSchema getTableSchema() {
        return tableSchema;
    }

    public void setTableSchema(TableSchema tableSchema) {
        this.tableSchema = tableSchema;
    }
}
