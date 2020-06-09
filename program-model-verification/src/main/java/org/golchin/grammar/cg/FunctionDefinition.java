package org.golchin.grammar.cg;

import org.golchin.grammar.GrammarParser;
import org.golchin.grammar.model.Signature;
import org.golchin.grammar.model.Type;

import java.util.*;

public class FunctionDefinition {
    private final String name;
    private final Type returnType;
    private final LinkedHashMap<String, Type> parameterTypes;
    private final Map<String, Integer> parameterNameToIndex = new HashMap<>();

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

    public static FunctionDefinition createFunctionDefinition(GrammarParser.FuncDefContext ctx) {
        GrammarParser.FuncSignatureContext funcSignatureContext = ctx.funcSignature();
        LinkedHashMap<String, Type> parameterTypes = new LinkedHashMap<>();
        for (GrammarParser.ArgDefContext context : funcSignatureContext.argDefList().argDef()) {
            parameterTypes.put(context.IDENTIFIER().toString(), Type.createInstance(context.typeRef()));
        }
        String functionName = funcSignatureContext.IDENTIFIER().toString();
        Type returnType = Type.createInstance(funcSignatureContext.typeRef());
        return new FunctionDefinition(functionName, returnType, parameterTypes);
    }
}
