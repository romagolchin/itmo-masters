package org.golchin.grammar.nodes;

import lombok.Getter;
import org.golchin.grammar.ir.Address;
import org.golchin.grammar.ir.CompilationError;
import org.golchin.grammar.ir.InstructionGeneratingVisitor;
import org.golchin.grammar.model.Method;
import org.golchin.grammar.model.Type;

import java.util.*;

@Getter
public class Call extends ExpressionNode {
    private Method method;
    private final ExpressionNode instance;
    private final List<ExpressionNode> args;

    public Call(ExpressionNode instance, Method method, List<ExpressionNode> args) {
        super(addHead(instance, args));
        this.instance = instance;
        this.args = args;
        setMethod(method);
    }

    private static List<ExpressionNode> addHead(ExpressionNode head, List<ExpressionNode> list) {
        LinkedList<ExpressionNode> expressionNodes = new LinkedList<>(list);
        expressionNodes.addFirst(head);
        return expressionNodes;
    }

    public void setMethod(Method method) {
        this.method = method;
        checkArgTypes();
        type = method.getFunctionDefinition().getReturnType();
    }

    private void checkArgTypes() {
        LinkedHashMap<String, Type> parameterTypes = method.getFunctionDefinition().getParameterTypes();
        if (parameterTypes.size() != args.size())
            throw new CompilationError("Wrong number of arguments, expected " + parameterTypes.size() + ", got " + children.size());
        Iterator<Map.Entry<String, Type>> iterator = parameterTypes.entrySet().iterator();
        for (ExpressionNode arg : args) {
            Map.Entry<String, Type> parameter = iterator.next();
            if (!arg.getType().canAssignTo(parameter.getValue())) {
                throw new CompilationError("Wrong type of argument " + parameter.getKey() +
                        ": cannot convert " + arg.getType() + " to " + parameter.getValue());
            }
        }
    }

    @Override
    public Address accept(InstructionGeneratingVisitor instructionGeneratingVisitor) {
        return instructionGeneratingVisitor.visitCall(this);
    }

    @Override
    public String toString() {
        return method.getFunctionDefinition().getName() + " " + super.toString();
    }
}
