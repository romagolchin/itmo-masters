package org.golchin.grammar.ir;

import lombok.AllArgsConstructor;

@AllArgsConstructor
public enum  RelationOperation implements Operation {
    LT("<"), LE("<="), EQ("=="), GE(">="), GT(">");

    private final String symbol;

    @Override
    public String toString() {
        return symbol;
    }
}
