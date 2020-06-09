package org.golchin.grammar.nodes;

import com.android.dx.Code;
import com.android.dx.Local;
import lombok.Getter;
import lombok.Setter;
import org.golchin.grammar.bytecode.ByteCodeVisitor;
import org.golchin.grammar.bytecode.CompilationError;
import org.golchin.grammar.model.Type;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.Stream;

@Getter
public abstract class ExpressionNode {
    @Setter
    protected Local<?> local;
    protected Type type;
    protected final List<ExpressionNode> children;

    public ExpressionNode() {
        this(new ArrayList<>());
    }

    public ExpressionNode(List<ExpressionNode> children) {
        this.children = new ArrayList<>(children);
    }

    public Local<?> getOrCreateLocal(Code code) {
        if (local == null)
            local = code.newLocal(type.toJavaTypeId());
        return local;
    }

    public List<Local<?>> createLocals(Code code) {
        return Stream.concat(
                Stream.of(getOrCreateLocal(code)),
                children.stream().flatMap(c -> c.createLocals(code).stream()))
                .collect(Collectors.toList());
    }

    public Local<?> accept(ByteCodeVisitor byteCodeVisitor) {
        byteCodeVisitor.visitChildren(this);
        return local;
    }

    public ExpressionNode convertTo(Type newType) {
        if (!type.canAssignTo(newType))
            throw new CompilationError("Cannot convert " + type + " to " + newType);
        if (type.equals(newType)) {
            return this;
        }
        return new ConversionNode(newType, this);
    }

    @Override
    public String toString() {
        return String.valueOf(local);
    }
}
