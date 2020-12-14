package org.golchin.grammar.vm;

import lombok.AllArgsConstructor;

@AllArgsConstructor
public class MethodDescriptor extends FunctionDescriptor {
    private final int programCounter;
}
