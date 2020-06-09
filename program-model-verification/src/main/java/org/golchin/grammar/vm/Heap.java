package org.golchin.grammar.vm;

import org.golchin.grammar.model.Array;
import org.golchin.grammar.model.CustomType;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

public class Heap {
    private final List<HeapObject> heap = new ArrayList<>();

    public ObjectReference allocateObject(CustomType customType, ClassDescriptor classDescriptor) {
        List<TypedValue<?>> typedValues = customType.getFields().stream()
                .map(field -> TypedValue.createDefault(field.getType()))
                .collect(Collectors.toList());
        heap.add(new HeapInstance(typedValues, classDescriptor));
        return new ObjectReference(customType, heap.size() - 1);
    }

    public ArrayReference allocateArray(Array array) {
        // fixme
        HeapArray heapArray = new HeapArray(42);
        heap.add(heapArray);
        ArrayReference arrayReference = new ArrayReference(array, heap.size() - 1);
        // todo allocate sub-arrays if element type is not built-in
        for (int i = 0; i < heapArray.getSize(); i++) {
            allocateArray(null);
        }
        return arrayReference;
    }
}
