package ru.golchin.data.representations;

import java.util.Collection;

public interface DataAccessor {
    void insert(Row row);

    void update(Query query, Update update);

    Collection<Row> select(Query query);

    void remove(Query query);

    void createTable(TableSchema tableSchema);
}
