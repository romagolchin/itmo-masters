package org.golchin.grammar.bytecode;

import com.android.dx.*;
import lombok.Getter;
import org.golchin.grammar.nodes.*;
import org.golchin.grammar.nodes.literals.LiteralNode;

import java.io.PrintStream;

@SuppressWarnings({"unchecked", "rawtypes"})
public class ByteCodeVisitor {
    @Getter
    private final Code code;
    private final GlobalScope globalScope;
    private final LocalScope localScope;
    private final Local<PrintStream> printStreamLocal;

    public ByteCodeVisitor(Code code, GlobalScope globalScope, LocalScope localScope) {
        this.code = code;
        this.globalScope = globalScope;
        this.localScope = localScope;
        printStreamLocal = code.newLocal(TypeId.get(PrintStream.class));
    }

    public Local visitBinaryOpNode(BinaryOpNode node) {
        Local leftOperand = node.getLeft().accept(this);
        Local rightOperand = node.getRight().accept(this);
        code.op(node.getOp(), node.getLocal(), leftOperand, rightOperand);
        return node.getLocal();
    }

    public Local visitCall(Call node) {
        Local[] args = node.getArgs().stream()
                .map(arg -> arg.accept(this))
                .toArray(Local[]::new);
        ExpressionNode instance = node.getInstance();
        MethodId methodId = globalScope.getMethodId(node.getMethod());
        Local<?> target = node.getLocal();
        if (instance == null) {
            code.invokeStatic(methodId, target, args);
        } else {
            code.invokeVirtual(methodId, target, instance.getLocal(), args);
        }
        return target;
    }

    public Local visitComparison(ComparisonNode node) {
        Local target = node.getLocal();
        Local left = node.getLeft().accept(this);
        Local right = node.getRight().accept(this);
        // fixme
        Label trueLabel = new Label();
        code.compare(node.getComparison(), trueLabel, left, right);
        code.mark(trueLabel);
        code.loadConstant(target, true);
        return target;
    }

    public Local visitUnaryOpNode(UnaryOpNode node) {
        Local source = node.getOperand().accept(this);
        code.op(UnaryOp.NEGATE, node.getLocal(), source);
        return node.getLocal();
    }

    public Local visitLiteralNode(LiteralNode node) {
        Local local = node.getLocal();
        code.loadConstant(local, node.getValue());
        return node.getLocal();
    }

    public Local visitLocalVariableNode(LocalVariableNode localVariableNode) {
        String name = localVariableNode.getLocalVariable().getName();
        localVariableNode.setLocal(localScope.getLocal(name));
        return localVariableNode.getLocal();
    }

    public Local visitBlockNode(BlockNode blockNode) {
        FieldId out = TypeId.get(System.class).getField(printStreamLocal.getType(), "out");
        Local<?> local = null;
        for (ExpressionNode child : blockNode.getChildren()) {
            local = child.accept(this);
            code.sget(out, printStreamLocal);
            MethodId println = printStreamLocal.getType().getMethod(TypeId.VOID, "println", child.getType().toJavaTypeId());
            code.invokeVirtual(println, null, printStreamLocal, local);
        }
        return local;
    }

    public void visitChildren(ExpressionNode node) {
        for (ExpressionNode child : node.getChildren()) {
            child.accept(this);
        }
    }

    public Local<?> visitConversionNode(ConversionNode conversionNode) {
        ExpressionNode operand = conversionNode.getOperand();
        code.cast(conversionNode.getLocal(), operand.accept(this));
        return conversionNode.getLocal();
    }
}
