package org.golchin.grammar.vm;

enum InstructionType {
    START_FRAME(1),
    // dest : register, src: literal
    LOAD_CONSTANT(2),
    // dest : reg, src: offset
    STORE_LOCAL(2),
    LOAD_PARAM(2),
    FIELD_GET(3),
    FIELD_SET(3),
    ARRAY_GET(3),
    ARRAY_SET(3),
    // src: reg, op1: reg, op2: reg
    ADD(3),
    SUB(3),
    MUL(3),
    DIV(3),
    REM(3),
    JMP(1),
    // cond: reg, label: pc
    JZ(2),
    // instance, method
    INVOKE(2),
    CONSTRUCTOR(1),
    ALLOCATE_ARRAY(1)
    ;
    int opCount;

    InstructionType(int opCount) {
        this.opCount = opCount;
    }
}
