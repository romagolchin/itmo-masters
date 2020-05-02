package ru.golchin.data.representations;

import ru.golchin.data.representations.conditions.Condition;

import java.util.*;

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
        checkArgument(query.getJoins().isEmpty(), "no joins allowed for update");
        List<Row> rows = table.getRows();
        var condition = query.getCondition();
        rows.stream()
                .filter(condition::test)
                .forEach(row -> table.update(row, update));
    }

    @Override
    public Collection<Row> select(Query query) {
        Table table = checkTableExists(query.getTableName());
        List<Column<?>> columnsFromCondition = query.getCondition().columns()
                .collect(toList());
        Set<Column<?>> columns = new HashSet<>(table.getSchema().getColumns());

        List<List<Row>> rows = table.getRows().stream()
                .map(r -> new ArrayList<>(List.of(r))).collect(toList());
        for (Join join : query.getJoins()) {
            Table joinTable = checkTableExists(join.getTableName());
            columns.addAll(joinTable.getSchema().getColumns());
            columnsFromCondition.addAll(join.getJoinCondition().columns()
                    .collect(toList()));
            rows = join(rows, joinTable.getRows(), join.getJoinCondition());
        }

        columnsFromCondition.stream()
                .dropWhile(columns::contains)
                .findFirst()
                .ifPresent(column -> {
                    throw new IllegalArgumentException("no such column: " + column);
                });

        return rows.stream()
                .map(this::union)
                .filter(query.getCondition()::test)
                .collect(toList());
    }

    private List<List<Row>> join(List<List<Row>> rows, List<Row> otherRows, Condition condition) {
        List<List<Row>> result = new ArrayList<>();
        for (List<Row> joinedRow : rows)
            for (Row otherRow : otherRows)
                if (condition.test(otherRow, joinedRow.toArray(new Row[0]))) {
                    ArrayList<Row> joinedRowCopy = new ArrayList<>(joinedRow);
                    joinedRowCopy.add(otherRow);
                    result.add(joinedRowCopy);
                }
        return result;
    }

    private Row union(List<Row> rows) {
        if (rows.size() == 1)
            return rows.get(0);
        List<Comparable<?>> fields = rows.stream()
                .map(Row::getFields)
                .flatMap(Collection::stream)
                .collect(toList());
        return new Row(null, fields);
    }

    @Override
    public void remove(Query query) {
        checkArgument(query.getJoins().isEmpty(), "no joins allowed for remove");
        var rows = checkTableExists(query.getTableName()).getRows();
        rows.removeIf(query.getCondition()::test);
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
