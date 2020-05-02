package ru.golchin.data.representations;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class TableSchema {
    private final String name;
    private final List<Column<?>> columns;
    private final Map<String, Integer> columnNameToIndex = new HashMap<>();

    private TableSchema(String name, List<Column<?>> columns) {
        this.name = name;
        this.columns = columns;
        for (int i = 0; i < columns.size(); i++) {
            Column<?> column = columns.get(i);
            var columnName = column.getName();
            if (columnNameToIndex.containsKey(columnName))
                throw new IllegalArgumentException("Duplicate column name " + columnName);
            columnNameToIndex.put(columnName, i);
        }
    }

    public static TableSchema createSchema(String name, List<Column<?>> columns) {
        TableSchema tableSchema = new TableSchema(name, columns);
        for (Column<?> column : columns)
            column.setTableSchema(tableSchema);
        return tableSchema;
    }

    public String getName() {
        return name;
    }

    public List<Column<?>> getColumns() {
        return columns;
    }

    public Integer getColumnIndex(String name) {
        var result = columnNameToIndex.get(name);
        if (result == null) {
            throw new IllegalArgumentException("Column " + name + " doesn't exist in table " + getName());
        }
        return result;
    }
}
