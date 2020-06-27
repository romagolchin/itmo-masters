package org.golchin.grammar.ir;

import lombok.AllArgsConstructor;
import lombok.Getter;

import java.util.List;

@AllArgsConstructor
@Getter
public class ArraySizeSpec {
    private final List<Address> dimensionSizes;
}
