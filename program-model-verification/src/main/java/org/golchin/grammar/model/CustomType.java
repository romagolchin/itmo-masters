package org.golchin.grammar.model;

import com.android.dx.TypeId;
import lombok.AllArgsConstructor;
import lombok.Getter;
import org.golchin.grammar.bytecode.CompilationError;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

@AllArgsConstructor
@Getter
public class CustomType implements Type {
    private final String name;
    private final List<Method> methods;
    private final List<Field> fields;

    public CustomType(String name) {
        this(name, new ArrayList<>(), new ArrayList<>());
    }

    public void addMethod(Method method) {
        methods.add(method);
    }

    public Method getMethod(String name) {
        throw new CompilationError("Class " + this.name + " doesn't declare method " + name);
    }

    public void addField(Field field) {
        fields.add(field);
    }

    public Field getField(String fieldName) {
        throw new CompilationError("Class " + name + " doesn't declare field " + fieldName);
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        CustomType that = (CustomType) o;
        return Objects.equals(name, that.name);
    }

    @Override
    public int hashCode() {
        return Objects.hash(name);
    }

    @Override
    public TypeId<?> toJavaTypeId() {
        return TypeId.get("L" + name + ";");
    }

    @Override
    public boolean canAssignTo(Type other) {
        return equals(other);
    }
}
