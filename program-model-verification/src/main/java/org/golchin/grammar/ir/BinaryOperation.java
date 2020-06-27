package org.golchin.grammar.ir;

public enum BinaryOperation implements Operation {
    ADD("+"),
    SUBTRACT("-"),
    MULTIPLY("*"),
    DIVIDE("/"),
    REMAINDER("%"),
    AND("&&"),
    OR("||");

    private final String symbol;

    BinaryOperation(String symbol) {
        this.symbol = symbol;
    }

    @Override
    public String toString() {
        return symbol;
    }
}
