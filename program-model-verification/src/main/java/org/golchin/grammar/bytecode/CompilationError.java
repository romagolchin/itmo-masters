package org.golchin.grammar.bytecode;

public class CompilationError extends RuntimeException {
    public CompilationError(String message) {
        super(message);
    }
}
