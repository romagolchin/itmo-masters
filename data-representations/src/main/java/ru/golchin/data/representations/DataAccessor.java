package ru.golchin.data.representations;

public interface DataAccessor {
    void insert(Row row);

    void update(Query query, Update update);

    Iterable<Row> select(Query query);

    void remove(Query query);

    void createTable(TableSchema tableSchema);
}
