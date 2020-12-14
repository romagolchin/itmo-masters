package org.golchin.grammar.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import org.golchin.grammar.IndentedWriter;
import org.golchin.grammar.ir.Instruction;

import java.io.BufferedWriter;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Getter
@AllArgsConstructor
public class SourceFile {
    private final String filename;
    private final Map<String, ReferenceType> classes;
    private final Map<String, Method> functions;

    public SourceFile(String filename) {
        this(filename, new HashMap<>(), new HashMap<>());
    }

    public void addMethod(Method method) {
        functions.put(method.getFunctionDefinition().getName(), method);
    }

    public void addClass(ReferenceType referenceType) {
        classes.put(referenceType.getName(), referenceType);
    }

    public void dump(Path path) throws IOException {
        try (BufferedWriter writer = Files.newBufferedWriter(path)) {
            IndentedWriter indentedWriter = new IndentedWriter(writer);
            indentedWriter.writeLine("Source file " + filename);
            indentedWriter.indent();

            functions.values().forEach(method -> dumpMethod(method, indentedWriter));
            classes.values().forEach(clazz -> {
                indentedWriter.writeLine("Class " + clazz.getName());
                indentedWriter.indent();
                indentedWriter.writeLine("Methods");
                clazz.getMethods().forEach(m -> dumpMethod(m, indentedWriter));
                indentedWriter.writeLine("Fields");
                clazz.getFields().forEach(f -> indentedWriter.writeLine(String.valueOf(f)));
                indentedWriter.dedent();
            });
        }

    }

    private void dumpMethod(Method method, IndentedWriter writer) {
        writer.writeLine(method.getName());
        List<Instruction> instructions = method.getInstructions();
        writer.indent();
        for (int i = 0; i < instructions.size(); i++) {
            Instruction instruction = instructions.get(i);
            writer.writeLine(String.format("%2d %s", i, instruction));
        }
        writer.dedent();
    }
}
