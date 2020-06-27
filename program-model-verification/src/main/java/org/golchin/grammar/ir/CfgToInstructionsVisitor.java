package org.golchin.grammar.ir;

import lombok.AllArgsConstructor;
import lombok.Getter;
import org.golchin.grammar.cfg.*;
import org.golchin.grammar.graph.Node;
import org.golchin.grammar.model.Type;
import org.golchin.grammar.nodes.ExpressionNode;
import org.golchin.grammar.nodes.ReturnNode;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static org.golchin.grammar.Util.getLast;

@Getter
@AllArgsConstructor
public class CfgToInstructionsVisitor implements CommonCfgVisitor<ExpressionNode> {
    private final InstructionSequence instructionSequence = new InstructionSequence();
    private final LocalScope localScope;
    private final Map<Node<List<ExpressionNode>, String>, Label> nodesToLabels = new HashMap<>();

    @Override
    public void visitBlock(Block<ExpressionNode> block, Type returnType) {
        List<Cfg<ExpressionNode>> cfgs = block.cfgs;
        for (int i = 0; i < cfgs.size() - 1; i++) {
            Cfg<ExpressionNode> cfg = cfgs.get(i);
            cfg.accept(this, null);
        }
        Cfg<ExpressionNode> last = getLast(cfgs);
        if (last != null) {
            last.accept(this, returnType);
        }
    }

    @Override
    public void visitIf(If<ExpressionNode> cfg, Type returnType) {
        Address condition = generateCondition(cfg.condition);
        if (cfg.elseCfg == null) {
            conditionalJumpTo(cfg.getNextNode(), condition, true);
            cfg.thenCfg.accept(this, returnType);
        } else {
            int jumpIndex = instructionSequence.getInstructions().size();
            instructionSequence.getInstructions().add(null);
            cfg.thenCfg.accept(this, returnType);
            jumpTo(cfg.getNextNode());
            cfg.elseCfg.accept(this, returnType);
            Instruction jump = createConditionalJump(cfg.elseCfg.getStart(), condition, true);
            instructionSequence.getInstructions().set(jumpIndex, jump);
        }
    }

    @Override
    public void visitDo(Do<ExpressionNode> cfg) {
        cfg.body.accept(this);
        Address condition = generateCondition(cfg.condition);
        conditionalJumpTo(cfg.body.getStart(), condition, !cfg.isDoWhile);
    }

    @Override
    public void visitWhile(While<ExpressionNode> cfg) {
        Address condition = generateCondition(cfg.condition);
        conditionalJumpTo(cfg.getNextNode(), condition, true);
        cfg.body.accept(this);
        jumpTo(cfg.condition);
    }

    @Override
    public void visitSingleNode(SingleNode<ExpressionNode> singleNode, Type returnType) {
        Node<List<ExpressionNode>, String> node = singleNode.getStart();
        if (returnType != null) {
            List<ExpressionNode> content = node.getContent();
            ExpressionNode last = getLast(content);
            if (last == null) {
                throw new CompilationError("Expected return");
            }
            ExpressionNode cast = last.convertTo(returnType);
            content.set(content.size() - 1, new ReturnNode(cast));
        }
        List<Instruction> instructions = getInstructionSequence(node);
        this.instructionSequence.addAll(instructions);
    }

    @Override
    public void visitBreak(Break<ExpressionNode> cfg) {
        jumpTo(cfg.getNextNode());
    }

    private List<Instruction> getInstructionSequence(Node<List<ExpressionNode>, String> node) {
        var byteCodeVisitor = new InstructionGeneratingVisitor(localScope);
        node.getContent().forEach(expressionNode -> expressionNode.accept(byteCodeVisitor));
        List<Instruction> instructions = byteCodeVisitor.getSequence().getInstructions();
        Label label = getLabel(node);
        if (label != null && !instructions.isEmpty()) {
            label.setInstruction(instructions.get(0));
        }
        return instructions;
    }

    private Address generateCondition(Node<List<ExpressionNode>, String> node) {
        List<Instruction> content = getInstructionSequence(node);
        Address address = ((OperationInstruction) content.get(content.size() - 1)).getResult();
        instructionSequence.addAll(content);
        return address;
    }

    private Label getLabel(Node<List<ExpressionNode>, String> node) {
        return nodesToLabels.computeIfAbsent(node, __ -> new Label());
    }

    private void jumpTo(Node<List<ExpressionNode>, String> node) {
        Jump jump = null;
        if (node != null) {
            Label label = getLabel(node);
            if (label != null) {
                jump = new Jump(label);
            }
        }
        instructionSequence.add(jump);
    }

    private void conditionalJumpTo(Node<List<ExpressionNode>, String> node, Address condition, boolean invert) {
        ConditionalJump jump = createConditionalJump(node, condition, invert);
        instructionSequence.add(jump);
    }

    private ConditionalJump createConditionalJump(Node<List<ExpressionNode>, String> node, Address condition, boolean invert) {
        Label label = getLabel(node);
        ConditionalJump jump = null;
        if (label != null) {
            jump = new ConditionalJump(label, condition, invert);
        }
        return jump;
    }
}
