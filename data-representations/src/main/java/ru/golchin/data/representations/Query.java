package ru.golchin.data.representations;

import ru.golchin.data.representations.conditions.Condition;

public class Query {
    private final String tableName;
    private final Condition condition;

    public Query(String tableName, Condition condition) {
        this.tableName = tableName;
        this.condition = condition;
    }

    public String getTableName() {
        return tableName;
    }

    public Condition getCondition() {
        return condition;
    }
}
