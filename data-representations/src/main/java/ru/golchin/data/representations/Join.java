package ru.golchin.data.representations;

import ru.golchin.data.representations.conditions.Condition;

public class Join {
    private final String tableName;

    private final Condition joinCondition;

    public Join(String tableName, Condition joinCondition) {
        this.tableName = tableName;
        this.joinCondition = joinCondition;
    }

    public String getTableName() {
        return tableName;
    }

    public Condition getJoinCondition() {
        return joinCondition;
    }
}
