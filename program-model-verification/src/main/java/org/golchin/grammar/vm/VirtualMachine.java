package org.golchin.grammar.vm;

import org.golchin.grammar.model.BuiltinType;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class VirtualMachine {
    private final int pc = 0;
    private final Heap heap = new Heap();
    private final List<StackFrame> stack = new ArrayList<>();
    private final Map<BuiltinType, TypedValue<?>> primitiveRegisters = new HashMap<>();
    private final List<IntValue> referenceRegisters = new ArrayList<>();

    public void run(List<ClassDescriptor> classes, MethodDescriptor main) {

    }

}
