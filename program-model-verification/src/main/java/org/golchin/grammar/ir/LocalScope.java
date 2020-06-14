package org.golchin.grammar.ir;

import lombok.Getter;
import org.golchin.grammar.model.ReferenceType;
import org.golchin.grammar.model.Type;
import org.golchin.grammar.nodes.LocalVariable;

import java.util.HashMap;
import java.util.Map;

public class LocalScope {
    private final Map<String, LocalVariable> nameToLocalVariable = new HashMap<>();
    @Getter
    private final String filename;
    @Getter
    private final ReferenceType declaringType;

    public LocalScope(String filename, ReferenceType declaringType, Type returnType) {
        this.filename = filename;
        this.declaringType = declaringType;
    }

    public LocalVariable getLocalVariable(String name) {
        LocalVariable localVariable = nameToLocalVariable.get(name);
        if (localVariable == null)
            throw new CompilationError("Variable " + name + " is not declared");
        return localVariable;
    }

    public LocalVariable addLocal(String name, Type type) {
        LocalVariable localVariable = new LocalVariable(name, type);
        LocalVariable previous = nameToLocalVariable.put(name, localVariable);
        if (previous != null) {
            throw new CompilationError("Variable " + name + " is already declared");
        }
        return localVariable;
    }

}
