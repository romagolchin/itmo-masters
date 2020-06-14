package org.golchin.grammar.ir;

public class CompilationError extends RuntimeException {
    public CompilationError(String message) {
        super(message);
    }
}
