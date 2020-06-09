package org.golchin.grammar.vm;

public interface ArithmeticalOperand<T> {
    void add(T dest, T secondOperand);
    void subtract(T dest, T secondOperand);
    void multiply(T dest, T secondOperand);
    void divide(T dest, T secondOperand);
    void remainder(T dest, T secondOperand);
}
