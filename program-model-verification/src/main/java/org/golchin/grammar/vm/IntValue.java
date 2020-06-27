package org.golchin.grammar.vm;

public class IntValue extends TypedValue<Integer> implements ArithmeticalOperand<IntValue> {
    public IntValue(Integer value) {
        super(value);
    }

    @Override
    public void add(IntValue dest, IntValue secondOperand) {

    }

    @Override
    public void subtract(IntValue dest, IntValue secondOperand) {

    }

    @Override
    public void multiply(IntValue dest, IntValue secondOperand) {

    }

    @Override
    public void divide(IntValue dest, IntValue secondOperand) {

    }

    @Override
    public void remainder(IntValue dest, IntValue secondOperand) {

    }
}
