package org.golchin.grammar.ir;

import lombok.AllArgsConstructor;
import org.golchin.grammar.GrammarParser;
import org.golchin.grammar.GrammarParser.IdentifierListContext;
import org.golchin.grammar.GrammarParser.TypeRefContext;
import org.golchin.grammar.GrammarParser.VarsSpecContext;
import org.golchin.grammar.ParseResult;
import org.golchin.grammar.Util;
import org.golchin.grammar.cfg.Cfg;
import org.golchin.grammar.cfg.CfgVisitor;
import org.golchin.grammar.cg.FunctionDefinition;
import org.golchin.grammar.model.*;
import org.golchin.grammar.nodes.ExpressionNode;
import org.golchin.grammar.nodes.ExpressionNodeVisitor;

import java.io.File;
import java.io.IOException;
import java.io.PrintStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.function.BiConsumer;

import static java.util.stream.Collectors.toList;
import static org.golchin.grammar.cg.FunctionDefinition.createFunctionDefinition;
import static org.golchin.grammar.model.Visibility.PRIVATE;
import static org.golchin.grammar.model.Visibility.PUBLIC;

@AllArgsConstructor
public class IRGenerator {
    private final GlobalScope globalScope = new GlobalScope();

    public static void main(String[] args) throws IOException {
        System.setOut(new PrintStream(new File("code")));
        Map<String, GrammarParser.SourceContext> parsedFiles = new HashMap<>();
        Path sourceDir = Paths.get(args[0]);
        List<String> files = Files.list(sourceDir)
                .filter(path -> !Files.isDirectory(path))
                .filter(path -> path.getFileName().toString().endsWith("source"))
                .map(Objects::toString)
                .collect(toList());
        for (String file : files) {
            ParseResult parseResult = ParseResult.parse(file);
            GrammarParser.SourceContext tree = (GrammarParser.SourceContext) parseResult.getTree();
            var name = Util.removeExtension(file);
            parsedFiles.put(name, tree);
        }
        var irGenerator = new IRGenerator();
        Map<String, SourceFile> definitions = irGenerator.createDefinitions(parsedFiles);
        irGenerator.globalScope.validateDeclarations();
        for (SourceFile sourceFile : definitions.values()) {
            irGenerator.generate(sourceFile);
            sourceFile.dump(sourceDir.resolve(sourceFile.getFilename() + ".out"));
        }
    }

    public Map<String, SourceFile> createDefinitions(Map<String, GrammarParser.SourceContext> parsedFiles) {
        var sourceFilesByName = new HashMap<String, SourceFile>();
        parsedFiles.forEach((filename, sourceContext) -> {
            var sourceFile = new SourceFile(filename);
            sourceContext.sourceItem().forEach(sourceItemContext -> {
                if (sourceItemContext instanceof GrammarParser.ClassDefContext classDefContext) {
                    var customType = globalScope.getOrCreateType(classDefContext.IDENTIFIER().getText());
                    addVarsToScope(classDefContext.varsSpec(), (type, name) ->
                            customType.addField(new Field(name, type, customType)));
                    sourceFile.addClass(customType);
                    globalScope.addCustomType(customType);
                    classDefContext.memberDef().forEach(memberContext -> {
                        GrammarParser.FuncDefContext funcDefContext = memberContext.funcDef();
                        Visibility visibility = PUBLIC;
                        GrammarParser.ModifierContext modifier = memberContext.modifier();
                        if (modifier != null && modifier.getText().equals("private"))
                            visibility = PRIVATE;
                        customType.addMethod(createMethod(filename, customType, funcDefContext, visibility));
                    });
                } else if (sourceItemContext instanceof GrammarParser.FuncDefAltContext funcDefAltContext) {
                    var method = createMethod(filename, null, funcDefAltContext.funcDef(), PUBLIC);
                    sourceFile.addMethod(method);
                    globalScope.addFunction(filename, method);
                }
            });
            sourceFilesByName.put(filename, sourceFile);
        });
        return sourceFilesByName;
    }

    private Method createMethod(String filename,
                                ReferenceType referenceType,
                                GrammarParser.FuncDefContext funcDefContext,
                                Visibility visibility) {
        FunctionDefinition functionDefinition = createFunctionDefinition(funcDefContext, globalScope);
        LocalScope localScope = new LocalScope(filename, referenceType, functionDefinition.getReturnType());
        functionDefinition.getParameterTypes().forEach(localScope::addLocal);
        return new Method(referenceType, functionDefinition, localScope, funcDefContext.body(), visibility);
    }

    public void generate(SourceFile sourceFile) {
        for (ReferenceType referenceType : sourceFile.getClasses().values()) {
            for (Method method : referenceType.getMethods())
                compileMethod(method);
        }
        for (Method method : sourceFile.getFunctions().values())
            compileMethod(method);
    }

    private void compileMethod(Method method) {
        var body = method.getBodyContext();
        if (body != null) {
            VarsSpecContext varsSpecContext = body.varsSpec();
            var localScope = method.getLocalScope();
            addVarsToScope(varsSpecContext, (type, name) -> localScope.addLocal(name, type));
            ExpressionNodeVisitor expressionNodeVisitor = new ExpressionNodeVisitor(globalScope, localScope);
            CfgVisitor<ExpressionNode> cfgVisitor = new CfgVisitor<>(ruleContext -> ruleContext.accept(expressionNodeVisitor));
            Cfg<ExpressionNode> cfg = body.block().accept(cfgVisitor);

            Type returnType = method.getFunctionDefinition().getReturnType();
            CfgToInstructionsVisitor visitor = new CfgToInstructionsVisitor(localScope);
            cfg.accept(visitor, returnType);
            List<Instruction> instructions = visitor.getInstructionSequence().getInstructions();
            method.getInstructions().addAll(instructions);
        }
    }

    private void addVarsToScope(VarsSpecContext varsSpecContext,
                                BiConsumer<Type, String> varCreator) {
        if (varsSpecContext == null) {
            return;
        }
        List<IdentifierListContext> identifierListContexts = varsSpecContext.identifierList();
        for (int i = 0; i < identifierListContexts.size(); i++) {
            IdentifierListContext identifierListContext = identifierListContexts.get(i);
            TypeRefContext typeRefContext = varsSpecContext.typeRef().get(i);
            Type type = globalScope.getOrCreateType(typeRefContext);
            identifierListContext.IDENTIFIER().forEach(terminalNode -> varCreator.accept(type, terminalNode.getText()));
        }
    }
}
