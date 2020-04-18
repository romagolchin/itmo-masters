package ru.golchin.data.representations;

import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import static com.google.common.base.Preconditions.checkArgument;

public class Table {
    private static final Map<Class<?>, Class<?>> BOXED_TO_PRIMITIVES =
            Map.of(
                    Boolean.class, boolean.class,
                    Byte.class, byte.class,
                    Short.class, short.class,
                    Character.class, char.class,
                    Integer.class, int.class,
                    Long.class, long.class,
                    Float.class, float.class,
                    Double.class, double.class);
    private final TableSchema schema;
    private final List<Row> rows;

    public Table(TableSchema schema) {
        this.schema = schema;
        this.rows = new LinkedList<>();
    }

    public void addRow(Row row) {
        checkArgument(row.getFields().size() == schema.getColumns().size(),
                "Row size does not match column count");
        List<Comparable<?>> fields = row.getFields();
        for (int i = 0; i < fields.size(); i++) {
            Comparable<?> field = fields.get(i);
            Column<?> column = schema.getColumns().get(i);
            if (field != null) {
                validateFieldType(field.getClass(), column.getType());
            }
        }
        rows.add(row);
    }

    private void validateFieldType(Class<?> actualType, Class<?> expectedType) {
        Class<?> primitivizedType = BOXED_TO_PRIMITIVES.get(actualType);
        if (primitivizedType != null)
            actualType = primitivizedType;
        checkArgument(actualType.isPrimitive() || actualType == String.class,
                "field " + actualType + " is not primitive");
        checkArgument(expectedType == actualType, "Expected " + expectedType + ", got" + actualType);
    }

    public List<Row> getRows() {
        return rows;
    }

    public String getName() {
        return schema.getName();
    }

    public void update(Row row, Update update) {
        update.getFields().forEach((name, value) -> {
            var columnIndex = schema.getColumnIndex(name);
            Column<?> column = schema.getColumns().get(columnIndex);
            validateFieldType(value.getClass(), column.getType());
            row.getFields().set(columnIndex, value);
        });
    }
}
