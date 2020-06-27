package org.golchin.grammar.model;

import org.golchin.grammar.GrammarParser;
import org.golchin.grammar.ir.CompilationError;

public interface Type {
    static Type createInstance(GrammarParser.TypeRefContext typeRef) {
        if (typeRef == null) {
            return null;
        }
        if (typeRef instanceof GrammarParser.CustomContext customContext)
            return new ReferenceType(customContext.IDENTIFIER().toString());
        if (typeRef instanceof GrammarParser.ArrayContext arrayContext) {
            GrammarParser.ArrayTypeContext arrayType = arrayContext.arrayType();
            var arrayDepthSpec = arrayType.arrayDepthSpec().getText();
            var commasCount = 0;
            for (int i = 0; i < arrayDepthSpec.length(); i++) {
                if (',' == arrayDepthSpec.charAt(i))
                    commasCount++;
            }
            Type elementType = createInstance(arrayType.typeRef());
            int nDimensions = commasCount + 1;
            return Array.ofElements(elementType, nDimensions);
        }
        String text = ((GrammarParser.BuiltinContext) typeRef).BUILTIN().getText().toUpperCase();
        return BuiltinType.valueOf(text);
    }

    boolean canAssignTo(Type other);

    default void attemptToAssign(Type other) {
        if (!canAssignTo(other)) {
            throw new CompilationError("Cannot convert " + this + " to " + other);
        }
    }
}
