package org.golchin.grammar.ir;

import lombok.AllArgsConstructor;
import org.antlr.v4.runtime.tree.TerminalNode;
import org.golchin.grammar.GrammarParser;
import org.golchin.grammar.bytecode.ByteCodeVisitor;
import org.golchin.grammar.bytecode.GlobalScope;
import org.golchin.grammar.bytecode.LocalScope;
import org.golchin.grammar.cfg.Cfg;
import org.golchin.grammar.cfg.CfgVisitor;
import org.golchin.grammar.cg.FunctionDefinition;
import org.golchin.grammar.model.CustomType;
import org.golchin.grammar.model.Method;
import org.golchin.grammar.model.Type;

import java.util.ArrayList;
import java.util.List;

import static org.golchin.grammar.cg.FunctionDefinition.createFunctionDefinition;

@AllArgsConstructor
public class IRGenerator {
    private final CfgVisitor cfgVisitor = new CfgVisitor();
    private final GlobalScope globalScope = new GlobalScope();

    public List<Instruction> linearize(Cfg cfg, ByteCodeVisitor byteCodeVisitor) {
        // todo
        return new ArrayList<>();
    }

    public CustomType generate(GrammarParser.ClassDefContext classDefContext) {
        CustomType customType = new CustomType(classDefContext.IDENTIFIER().getText());
        for (GrammarParser.MemberContext memberContext : classDefContext.member()) {
            GrammarParser.FuncDefContext funcDefContext = memberContext.funcDef();
            if (funcDefContext != null) {
                FunctionDefinition functionDefinition = createFunctionDefinition(funcDefContext);
                LocalScope localScope = new LocalScope();
                functionDefinition.getParameterTypes().forEach(localScope::addLocal);
                GrammarParser.BodyContext body = funcDefContext.body();
                List<Instruction> instructions = List.of();
                if (body != null) {
                    Cfg cfg = body.block().accept(cfgVisitor);
                    GrammarParser.VarsSpecContext varsSpecContext = body.varsSpec();
                    List<GrammarParser.IdentifierListContext> identifierListContexts = varsSpecContext.identifierList();
                    for (int i = 0; i < identifierListContexts.size(); i++) {
                        GrammarParser.IdentifierListContext identifierListContext = identifierListContexts.get(i);
                        GrammarParser.TypeRefContext typeRefContext = varsSpecContext.typeRef().get(i);
                        Type type = Type.createInstance(typeRefContext);
                        for (TerminalNode terminalNode : identifierListContext.IDENTIFIER()) {
                            localScope.addLocal(terminalNode.getText(), type);
                        }
                    }
                    ByteCodeVisitor byteCodeVisitor = new ByteCodeVisitor(null, globalScope, localScope);
                    instructions = linearize(cfg, byteCodeVisitor);
                }
                Method method = new Method(customType, functionDefinition, localScope, instructions);
                customType.addMethod(method);
            }
        }
        return customType;
    }
}
