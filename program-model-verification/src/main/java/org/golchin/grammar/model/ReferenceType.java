package org.golchin.grammar.model;

import lombok.Getter;
import org.golchin.grammar.ir.CompilationError;

import java.util.*;

@Getter
public class ReferenceType implements Type {
    private final String name;
    private final List<Method> methods;
    private final Map<String, Integer> methodToIndex = new HashMap<>();
    private final List<Field> fields;
    private final Map<String, Integer> fieldsToIndex = new HashMap<>();

    public ReferenceType(String name) {
        this(name, new ArrayList<>(), new ArrayList<>());
    }

    public ReferenceType(String name, List<Method> methods, List<Field> fields) {
        this.name = name;
        this.methods = new ArrayList<>();
        this.fields = new ArrayList<>();
        methods.forEach(this::addMethod);
        fields.forEach(this::addField);
    }

    public void addMethod(Method method) {
        methodToIndex.put(method.getName(), methods.size());
        methods.add(method);
    }

    public Method getMethod(String name) {
        Method method = getSymbol(name, methodToIndex, methods);
        if (method != null) {
            return method;
        }
        throw new CompilationError("Class " + this.name + " doesn't declare method " + name);
    }

    public void addField(Field field) {
        fieldsToIndex.put(field.getName(), fields.size());
        fields.add(field);
    }

    public Field getField(String fieldName) {
        Field field = getSymbol(fieldName, fieldsToIndex, fields);
        if (field != null)
            return field;
        throw new CompilationError("Class " + name + " doesn't declare field " + fieldName);
    }

    private static <T> T getSymbol(String name, Map<String, Integer> nameToIndex, List<T> list) {
        Integer index = nameToIndex.get(name);
        T field = null;
        if (index != null)
            field = list.get(index);
        return field;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        ReferenceType that = (ReferenceType) o;
        return Objects.equals(name, that.name);
    }

    @Override
    public int hashCode() {
        return Objects.hash(name);
    }

    @Override
    public String toString() {
        return name;
    }

    @Override
    public boolean canAssignTo(Type other) {
        return equals(other);
    }
}
