package org.golchin.grammar.vm;

import lombok.AllArgsConstructor;
import lombok.Getter;

import java.util.List;

@AllArgsConstructor
@Getter
public class ClassDescriptor {
    private final List<MethodDescriptor> methodDescriptors;
}
