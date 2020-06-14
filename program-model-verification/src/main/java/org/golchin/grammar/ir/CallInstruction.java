package org.golchin.grammar.ir;

import lombok.AllArgsConstructor;
import lombok.Getter;
import org.golchin.grammar.model.Method;

import java.util.List;
import java.util.Objects;

import static java.util.stream.Collectors.joining;

@Getter
@AllArgsConstructor
public class CallInstruction extends Instruction {
    private final Address result;
    private final Method method;
    private final List<Address> args;

    @Override
    public String toString() {
        String resultString = result == null ? "" : result + " = ";
        String filename = method.getLocalScope().getFilename();
        return resultString + String.format("call %s::%s(%s)",
                filename,
                method.getName(),
                args.stream().map(Objects::toString).collect(joining(",")));
    }
}
