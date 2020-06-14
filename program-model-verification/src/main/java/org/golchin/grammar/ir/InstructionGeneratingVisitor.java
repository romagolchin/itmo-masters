package org.golchin.grammar.ir;

import lombok.Getter;
import org.golchin.grammar.model.*;
import org.golchin.grammar.nodes.*;
import org.golchin.grammar.nodes.literals.LiteralNode;

import java.util.List;

import static java.util.stream.Collectors.toList;

public class InstructionGeneratingVisitor {
    @Getter
    private final InstructionSequence sequence = new InstructionSequence();
    private final LocalScope localScope;

    public InstructionGeneratingVisitor(LocalScope localScope) {
        this.localScope = localScope;
    }

    public Address visitCall(Call node) {
        List<Address> args = node.getArgs().stream()
                .map(arg -> arg.accept(this))
                .collect(toList());
        ExpressionNode instance = node.getInstance();
        Method method = node.getMethod();
        Address target = method.getFunctionDefinition().getReturnType() == null ? null : node.getAddress();
        if (instance == null) {
            return sequence.call(method, target, args);
        } else {
            return sequence.instanceCall(method, target, instance.accept(this), args);
        }
    }

    public Address visitBinaryOpNode(BinaryOpNode node) {
        Address leftOperand = node.getLeft().accept(this);
        Address rightOperand = node.getRight().accept(this);
        return sequence.op(new Temporary(), node.getOp(), leftOperand, rightOperand);
    }

    public Address visitUnaryOpNode(UnaryOpNode node) {
        Address source = node.getOperand().accept(this);
        return sequence.op(node.getAddress(), node.getUnaryOp(), source);
    }

    public Address visitComparison(ComparisonNode node) {
        Address target = node.getAddress();
        Address left = node.getLeft().accept(this);
        Address right = node.getRight().accept(this);
       return sequence.relOp(target, node.getRelationOperation(), left, right);
    }

    public <T> Address visitLiteralNode(LiteralNode<T> node) {
        return sequence.loadConstant(node.getAddress(), node.getLiteral());
    }

    public Address visitLocalVariableNode(LocalVariableNode localVariableNode) {
        return localVariableNode.getAddress();
    }

    public Address visitBlockNode(BlockNode blockNode) {
        Address local = null;
        for (ExpressionNode child : blockNode.getChildren()) {
            local = child.accept(this);
        }
        return local;
    }

    public void visitChildren(ExpressionNode node) {
        for (ExpressionNode child : node.getChildren()) {
            child.accept(this);
        }
    }

    public Address visitConversionNode(ConversionNode conversionNode) {
        ExpressionNode operand = conversionNode.getOperand();
        return sequence.cast(operand.getType(), conversionNode.getType(), operand.accept(this), conversionNode.getAddress());
    }

    public Address visitAssign(AssignNode assignNode) {
        LValue left = assignNode.getLeft();
        var rightAddress = assignNode.getRight().accept(this);
        if (left instanceof LocalVariableNode) {
            Address leftAddress = left.accept(this);
            sequence.getInstructions().add(new AssignInstruction(leftAddress, rightAddress));
            return leftAddress;
        } else if (left instanceof FieldAccess fieldAccess) {
            Address address = fieldAccess.getInstance().accept(this);
            FieldSetInstruction instruction = new FieldSetInstruction(address, fieldAccess.getField(), rightAddress);
            sequence.getInstructions().add(instruction);
            return instruction.getInstance();
        } else {
            ArrayIndex arrayIndex = (ArrayIndex) left;
            Address arrayAddress = arrayIndex.getArray().accept(this);
            List<Address> addresses = arrayIndex.getIndices().stream()
                    .map(expressionNode -> expressionNode.accept(this))
                    .collect(toList());
            sequence.add(new ArraySetInstruction(arrayAddress, addresses, rightAddress));
            return null;
        }
    }

    public Address visitReturn(ReturnNode returnNode) {
        Address address = returnNode.getReturnValue().accept(this);
        sequence.getInstructions().add(new ReturnInstruction(address));
        return address;
    }

    public Address visitFieldAccess(FieldAccess fieldAccess) {
        Address address = fieldAccess.getInstance().accept(this);
        if (fieldAccess.getInstance().getType() instanceof Array && fieldAccess.getField().getName().equals("length")) {
            ArrayLengthInstruction instruction = new ArrayLengthInstruction(address);
            sequence.add(instruction);
            return instruction.getResult();
        }
        FieldGetInstruction instruction = new FieldGetInstruction(address, fieldAccess.getField());
        sequence.add(instruction);
        return instruction.getResult();
    }

    public Address visitArrayIndex(ArrayIndex arrayIndex) {
        LocalVariable localVariable = arrayIndex.getArray().getLocalVariable();
        int actualIndexCount = arrayIndex.getIndices().size();
        int nDimensions = ((Array) arrayIndex.getArray().getType()).getNDimensions();
        if (actualIndexCount != nDimensions)
            throw new CompilationError("Array indices count is not equal to dimensions count");
        List<Address> indices = arrayIndex.getIndices().stream()
                .map(expressionNode -> expressionNode.convertTo(BuiltinType.INT).accept(this))
                .collect(toList());
        ArrayGetInstruction arrayGetInstruction = new ArrayGetInstruction(localVariable, indices);
        sequence.add(arrayGetInstruction);
        return arrayGetInstruction.getResult();
    }

    public Address visitArrayValueNode(ArrayValueNode arrayValueNode) {
        List<Address> dimensionSizes = arrayValueNode.getChildren().stream()
                .map(expressionNode -> expressionNode.accept(this))
                .collect(toList());
        ArrayCreationInstruction instruction = new ArrayCreationInstruction(new ArraySizeSpec(dimensionSizes));
        sequence.add(instruction);
        return instruction.getTemporary();
    }

    public Address visitConstructorCall(ConstructorCall constructorCall) {
        Type type = constructorCall.getType();
        ConstructorCallInstruction constructorCallInstruction = new ConstructorCallInstruction((ReferenceType) type);
        sequence.add(constructorCallInstruction);
        return constructorCallInstruction.getResult();
    }

    public Address visitThis(ThisNode thisNode) {
        ThisInstruction instruction = new ThisInstruction((ReferenceType) thisNode.getType());
        sequence.add(instruction);
        return instruction.getResult();
    }
}
