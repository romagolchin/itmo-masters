package org.golchin.grammar.model;

import com.android.dx.TypeId;
import org.golchin.grammar.GrammarParser;

public interface Type {
    static Type createInstance(GrammarParser.TypeRefContext typeRef) {
        if (typeRef == null) {
            return null;
        }
        if (typeRef instanceof GrammarParser.CustomContext customContext)
            return new CustomType(customContext.IDENTIFIER().toString());
        if (typeRef instanceof GrammarParser.ArrayContext arrayContext) {
            var arrayDepthSpec = arrayContext.arrayDepthSpec().getText();
            var commasCount = 0;
            for (int i = 0; i < arrayDepthSpec.length(); i++) {
                if (',' == arrayDepthSpec.charAt(i))
                    commasCount++;
            }
            return new Array(createInstance(arrayContext.typeRef(0)), commasCount + 1);
        }
        String text = ((GrammarParser.BuiltinContext) typeRef).BUILTIN().getText().toUpperCase();
        return BuiltinType.valueOf(text);
    }

    TypeId<?> toJavaTypeId();

    boolean canAssignTo(Type other);
}
