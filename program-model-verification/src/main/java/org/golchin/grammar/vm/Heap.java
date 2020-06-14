package org.golchin.grammar.vm;

import org.golchin.grammar.model.ReferenceType;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

public class Heap {
    private final List<HeapObject> heap = new ArrayList<>();

    public ObjectReference allocateObject(ReferenceType referenceType, ClassDescriptor classDescriptor) {
        List<TypedValue<?>> typedValues = referenceType.getFields().stream()
                .map(field -> TypedValue.createDefault(field.getType()))
                .collect(Collectors.toList());
        heap.add(new HeapInstance(typedValues, classDescriptor));
        return new ObjectReference(heap.size() - 1);
    }

    public ArrayReference allocateArray() {
        // fixme
        HeapArray heapArray = new HeapArray(42);
        heap.add(heapArray);
        ArrayReference arrayReference = new ArrayReference(heap.size() - 1);
        // todo allocate sub-arrays if element type is not built-in
        for (int i = 0; i < heapArray.getSize(); i++) {
            allocateArray();
        }
        return arrayReference;
    }
}
