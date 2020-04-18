package ru.golchin.data.representations;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static com.google.common.base.Preconditions.checkArgument;
import static java.util.stream.Collectors.toList;

public class MemoryDataAccessor implements DataAccessor {
    private final Map<String, Table> tablesByName = new HashMap<>();

    public MemoryDataAccessor() {
    }

    @Override
    public void insert(Row row) {
        String name = row.getTableSchema().getName();
        checkTableExists(name).addRow(row);
    }

    @Override
    public void update(Query query, Update update) {
        String tableName = query.getTableName();
        var table = checkTableExists(tableName);
        List<Row> rows = table.getRows();
        var condition = query.getCondition();
        rows.stream()
                .filter(condition)
                .forEach(row -> table.update(row, update));
    }

    @Override
    public Iterable<Row> select(Query query) {
        return checkTableExists(query.getTableName()).getRows()
                .stream()
                .filter(query.getCondition())
                .collect(toList());
    }

    @Override
    public void remove(Query query) {
        var rows = checkTableExists(query.getTableName()).getRows();
        rows.removeIf(query.getCondition());
    }

    @Override
    public void createTable(TableSchema tableSchema) {
        checkTableNotExists(tableSchema.getName());
        var table = new Table(tableSchema);
        tablesByName.put(table.getName(), table);
    }

    private Table checkTableExists(String tableName) {
        Table table = tablesByName.get(tableName);
        checkArgument(table != null, "Table " + tableName + " does not exist");
        return table;
    }

    private void checkTableNotExists(String tableName) {
        checkArgument(!tablesByName.containsKey(tableName), "Table " + tableName + "already exists");
    }
}
