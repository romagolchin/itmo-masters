package org.golchin.grammar.bytecode;

import com.android.dx.Local;
import org.golchin.grammar.model.CustomType;
import org.golchin.grammar.model.Type;
import org.golchin.grammar.nodes.LocalVariable;

import java.util.HashMap;
import java.util.Map;

public class LocalScope {
    private final Map<String, LocalVariable> nameToLocalVariable = new HashMap<>();
    private final Map<String, Local<?>> nameToLocal = new HashMap<>();

    public LocalVariable getLocalVariable(String name) {
        return nameToLocalVariable.get(name);
    }

    public void addLocal(String name, Type type) {
        nameToLocalVariable.put(name, new LocalVariable(name, type));
    }

    public Local<?> getLocal(String name) {
        return nameToLocal.get(name);
    }

    public CustomType getDeclaringType() {
        return null;
    }
}
