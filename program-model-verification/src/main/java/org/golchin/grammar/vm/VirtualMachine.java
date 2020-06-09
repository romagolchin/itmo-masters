package org.golchin.grammar.vm;

import java.util.ArrayList;
import java.util.List;

public class VirtualMachine {
    private final int pc = 0;
    private final Heap heap = new Heap();
    private final List<StackFrame> stack = new ArrayList<>();

    public void run(List<ClassDescriptor> classes, MethodDescriptor main) {

    }

}
