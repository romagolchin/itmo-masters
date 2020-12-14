package org.golchin.grammar.vm;

import java.util.ArrayList;
import java.util.List;

public class StackFrame {
    private final Integer returnAddress;
    private final List<TypedValue<?>> args = new ArrayList<>();
    private final List<TypedValue<?>> locals = new ArrayList<>();
    private final List<TypedValue<?>> temporaries = new ArrayList<>();

    public StackFrame(Integer returnAddress) {
        this.returnAddress = returnAddress;
    }
}
