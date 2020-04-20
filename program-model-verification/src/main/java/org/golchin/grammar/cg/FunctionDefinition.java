package org.golchin.grammar.cg;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.Objects;

public class FunctionDefinition {
    private final String name;
    private final Type returnType;
    private final LinkedHashMap<String, Type> parameterTypes;

    public FunctionDefinition(String name, Type returnType, LinkedHashMap<String, Type> parameterTypes) {
        this.name = name;
        this.returnType = returnType;
        this.parameterTypes = parameterTypes;
    }

    public Signature getSignature() {
        return new Signature(name, new ArrayList<>(parameterTypes.values()));
    }

    public String getName() {
        return name;
    }

    public Type getReturnType() {
        return returnType;
    }

    public LinkedHashMap<String, Type> getParameterTypes() {
        return parameterTypes;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        FunctionDefinition that = (FunctionDefinition) o;
        return Objects.equals(name, that.name) &&
                Objects.equals(returnType, that.returnType) &&
                Objects.equals(parameterTypes, that.parameterTypes);
    }

    @Override
    public int hashCode() {
        return Objects.hash(name, returnType, parameterTypes);
    }
}
