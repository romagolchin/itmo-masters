package org.golchin.grammar.ir;

import lombok.Getter;
import org.golchin.grammar.model.BuiltinType;
import org.golchin.grammar.model.Type;

import static org.golchin.grammar.model.BuiltinType.checkAndGetBuiltinType;

@Getter
public class CastInstruction extends Instruction {
    private final BuiltinType fromType;
    private final BuiltinType toType;
    private final Address from;
    private final Address to;

    public CastInstruction(Type fromType, Type toType, Address from, Address to) {
        this.fromType = checkAndGetBuiltinType(fromType);
        this.toType = checkAndGetBuiltinType(toType);
        this.from = from;
        this.to = to;
    }

    @Override
    public String toString() {
        return to + " = " + fromType + "-to-" + toType + " " + from;
    }
}
