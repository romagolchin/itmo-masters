package ru.golchin.data.representations;

import ru.golchin.data.representations.conditions.Condition;

import java.util.List;

public class Query {
    private final String tableName;
    private final Condition condition;
    private final List<Join> joins;

    public Query(String tableName, Condition condition) {
        this(tableName, condition, List.of());
    }

    public Query(String tableName, Condition condition, List<Join> joins) {
        this.tableName = tableName;
        this.condition = condition;
        this.joins = joins;
    }

    public String getTableName() {
        return tableName;
    }

    public Condition getCondition() {
        return condition;
    }

    public List<Join> getJoins() {
        return joins;
    }
}
