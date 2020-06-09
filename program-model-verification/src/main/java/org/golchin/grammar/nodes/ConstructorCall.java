package org.golchin.grammar.nodes;

import lombok.AllArgsConstructor;
import lombok.Getter;
import org.golchin.grammar.model.CustomType;

@AllArgsConstructor
@Getter
public class ConstructorCall extends ExpressionNode {
    private final CustomType declaringType;
}
