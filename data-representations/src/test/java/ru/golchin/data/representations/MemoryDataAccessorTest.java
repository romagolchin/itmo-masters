package ru.golchin.data.representations;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import ru.golchin.data.representations.conditions.Condition;

import java.util.Arrays;
import java.util.List;
import java.util.Map;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertThrows;
import static ru.golchin.data.representations.conditions.BiColumnExpression.gtField;
import static ru.golchin.data.representations.conditions.Conjunction.and;
import static ru.golchin.data.representations.conditions.Disjunction.or;
import static ru.golchin.data.representations.conditions.SingleColumnExpression.eq;
import static ru.golchin.data.representations.conditions.SingleColumnExpression.lt;

class MemoryDataAccessorTest {
    public static final Column<Integer> INT_COLUMN = new Column<>("c1", int.class);
    public static final Column<String> STRING_COLUMN = new Column<>("c2", String.class);
    public static final TableSchema TABLE_SCHEMA = new TableSchema("a", List.of(INT_COLUMN, STRING_COLUMN));
    private DataAccessor accessor;

    @BeforeEach
    void setUp() {
        accessor = new MemoryDataAccessor();
        accessor.createTable(TABLE_SCHEMA);
    }

    @Test
    void selectFail() {
        assertThrows(IllegalArgumentException.class, () -> accessor.select(new Query("b", Condition.TRUE)));
    }

    @Test
    void selectAfterInsert() {
        var row1 = new Row(TABLE_SCHEMA, List.of(1, "2"));
        var row2 = new Row(TABLE_SCHEMA, List.of(3, "4"));
        assertEquals(List.of(), accessor.select(new Query("a", Condition.TRUE)));
        accessor.insert(row1);
        accessor.insert(row2);
        assertEquals(List.of(row1, row2), accessor.select(new Query("a", Condition.TRUE)));
        var condition1 = lt(INT_COLUMN, 3);
        assertEquals(List.of(row1), accessor.select(new Query("a", condition1)));
        var condition2 = eq(STRING_COLUMN, "4");
        assertEquals(List.of(row2), accessor.select(new Query("a", condition2)));
        assertEquals(List.of(row1, row2), accessor.select(new Query("a", or(condition1, condition2))));
        assertEquals(List.of(), accessor.select(new Query("a", and(condition1, condition2))));
        assertEquals(List.of(), accessor.select(new Query("a", Condition.FALSE)));
    }

    @Test
    void insertFail() {
        assertThrows(IllegalArgumentException.class, () -> accessor.insert(new Row(TABLE_SCHEMA, List.of(1, "2", "3"))));
        assertThrows(IllegalArgumentException.class, () -> accessor.insert(new Row(TABLE_SCHEMA, List.of("1", 2))));
    }

    @Test
    void update() {
        List<Column<?>> columns = List.of(new Column<>("c", String.class), new Column<>("d", String.class));
        var tableSchema = new TableSchema("b", columns);
        accessor.createTable(tableSchema);
        accessor.insert(new Row(tableSchema, List.of("x", "z")));
        var query = new Query("b", Condition.TRUE);
        accessor.update(query, new Update(Map.of("c", "y")));
        assertEquals(List.of(new Row(tableSchema, List.of("y", "z"))), accessor.select(query));
    }

    @Test
    void updateFail() {
        accessor.insert(new Row(TABLE_SCHEMA, List.of(1, "2")));
        var update = new Update(Map.of(INT_COLUMN.getName(), 1L, STRING_COLUMN.getName(), "3"));
        assertThrows(IllegalArgumentException.class,
                () -> accessor.update(new Query("a", Condition.TRUE), update));
    }

    @Test
    void remove() {
        var c1 = new Column<>("c1", String.class);
        var c2 = new Column<>("c2", String.class);
        List<Column<?>> columns = List.of(c1, c2);
        var schema = new TableSchema("b", columns);
        accessor.createTable(schema);
        var row = new Row(schema, List.of("1", "2"));
        accessor.insert(row);
        accessor.insert(new Row(schema, Arrays.asList("1", null)));
        accessor.insert(new Row(schema, List.of("4", "3")));
        accessor.remove(new Query("b", gtField(c1, c2)));
        // null is considered less than anything
        assertEquals(List.of(row), accessor.select(new Query("b", Condition.TRUE)));
    }

    @Test
    void removeFail() {
        assertThrows(IllegalArgumentException.class, () -> accessor.remove(new Query("b", Condition.TRUE)));
    }

    @Test
    void createTableFail() {
        assertThrows(IllegalArgumentException.class, () -> accessor.createTable(TABLE_SCHEMA));
    }
}