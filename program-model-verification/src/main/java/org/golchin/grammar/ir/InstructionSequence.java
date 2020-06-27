package org.golchin.grammar.ir;

import lombok.Getter;
import org.golchin.grammar.model.Literal;
import org.golchin.grammar.model.Method;
import org.golchin.grammar.model.Type;

import java.util.ArrayList;
import java.util.List;

import static org.golchin.grammar.Util.prepend;

public class InstructionSequence {
    @Getter
    private final List<Instruction> instructions = new ArrayList<>();

    public Address op(Address destination, BinaryOperation operation, Address firstOperand, Address secondOperand) {
        instructions.add(new OperationInstruction(destination, operation, firstOperand, secondOperand));
        return destination;
    }

    public Address op(Address destination, UnaryOperation operation, Address operand) {
        instructions.add(new OperationInstruction(destination, operation, operand));
        return destination;
    }

    public Address call(Method method, Address target, List<Address> args) {
        instructions.add(new CallInstruction(target, method, args));
        return target;
    }

    public Address instanceCall(Method method, Address target, Address instance, List<Address> args) {
        return call(method, target, prepend(instance, args));
    }

    public Address cast(Type fromType, Type toType, Address from, Address to) {
        instructions.add(new CastInstruction(fromType, toType, from, to));
        return to;
    }

    public Address relOp(Address target, RelationOperation comparison, Address left, Address right) {
        instructions.add(new OperationInstruction(target, comparison, left, right));
        return target;
    }

    public <T> Address loadConstant(Address local, Literal<T> value) {
        instructions.add(new ConstantLoadInstruction(local, value));
        return local;
    }

    public void addAll(List<Instruction> instructions) {
        for (Instruction instruction : instructions) {
            add(instruction);
        }
    }

    public void add(Instruction instruction) {
        if (instruction != null) {
            instruction.setPosition(instructions.size());
            instructions.add(instruction);
        }
    }
}
