package org.golchin.grammar.bytecode;

import com.android.dx.MethodId;
import org.golchin.grammar.model.CustomType;
import org.golchin.grammar.model.Method;

import java.util.HashMap;
import java.util.Map;

public class GlobalScope {
    private final Map<String, CustomType> nameToType = new HashMap<>();

    public void addCustomType(CustomType customType) {
        String name = customType.getName();
        if (nameToType.containsKey(name))
            throw new CompilationError("Class " + name + " is already declared");
        nameToType.put(name, customType);
    }

    public CustomType getCustomType(String name) {
        CustomType customType = nameToType.get(name);
        if (customType == null)
            throw new CompilationError("Class " + name + " is not declared");
        return customType;
    }

    public Method getStaticMethod(String name) {
        // fixme
        throw new RuntimeException();
    }

    public MethodId<?, ?> getMethodId(Method method) {
        // fixme
        throw new RuntimeException();
    }

}
