package org.golchin.grammar;

import java.util.List;
import java.util.stream.Stream;

import static java.util.Collections.singletonList;
import static java.util.stream.Collectors.toList;

public class Util {
    private Util() {
    }

    public static <T> List<T> concat(List<T> first, List<T> second) {
        return Stream.concat(first.stream(), second.stream())
                .collect(toList());
    }

    public static <T> List<T> append(List<T> list, T element) {
        return concat(list, singletonList(element));
    }

    public static <T> List<T> prepend(T element, List<T> list) {
        return concat(singletonList(element), list);
    }

    public static <T> T getLast(List<T> list) {
        return list.isEmpty() ? null : list.get(list.size() - 1);
    }

    public static String removeExtension(String fileName) {
        int slashIndex = fileName.lastIndexOf('/');
        int dotIndex = fileName.lastIndexOf('.');
        return fileName.substring(slashIndex + 1, dotIndex);
    }
}
