package org.golchin.grammar.ir;

import org.golchin.grammar.GrammarParser;
import org.golchin.grammar.model.Array;
import org.golchin.grammar.model.Method;
import org.golchin.grammar.model.ReferenceType;
import org.golchin.grammar.model.Type;

import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

public class GlobalScope {
    private final Map<String, ReferenceType> nameToType = new HashMap<>();
    private final Map<String, Map<String, Method>> filenameToMethodNameToMethod = new HashMap<>();
    private final Set<ReferenceType> declaredTypes = new HashSet<>();

    public void addCustomType(ReferenceType referenceType) {
        String name = referenceType.getName();
        if (!declaredTypes.add(referenceType))
            throw new CompilationError("Class " + name + " is already declared");
        nameToType.putIfAbsent(name, referenceType);
    }

    public ReferenceType getCustomType(String name) {
        ReferenceType referenceType = nameToType.get(name);
        if (referenceType == null)
            throw new CompilationError("Class " + name + " is not declared");
        return referenceType;
    }

    public Type getOrCreateType(GrammarParser.TypeRefContext typeRefContext) {
        String name = typeRefContext.getText();
        Type type = nameToType.get(name);
        if (type != null) {
            return type;
        }
        type = Type.createInstance(typeRefContext);
        if (type instanceof ReferenceType referenceType) {
            nameToType.put(name, referenceType);
        }
        return type;
    }

    public ReferenceType getOrCreateType(String name) {
        return nameToType.computeIfAbsent(name, ReferenceType::new);
    }

    public void validateDeclarations() {
        nameToType.values().forEach(referenceType -> {
            if (!(referenceType instanceof Array) && !declaredTypes.contains(referenceType))
                throw new CompilationError("Class " + referenceType + " is not declared");
        });
    }

    public void addFunction(String filename, Method method) {
        filenameToMethodNameToMethod.putIfAbsent(filename, new HashMap<>());
        filenameToMethodNameToMethod.get(filename).put(method.getFunctionDefinition().getName(), method);
    }

    public Method getFunction(String filename, String name) {
        var methodsByName = filenameToMethodNameToMethod.get(filename);
        if (methodsByName == null)
            throw new CompilationError("No such file: " + filename);
        var method = methodsByName.get(name);
        if (method == null)
            throw new CompilationError("Method " + name + " is not declared in " + filename);
        return method;
    }

}
