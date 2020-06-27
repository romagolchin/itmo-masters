package org.golchin.grammar.ir;

import java.util.concurrent.atomic.AtomicLong;

public class Temporary implements Address {
    private static final AtomicLong ID = new AtomicLong();
    private final long id;

    public Temporary() {
        id = ID.getAndIncrement();
    }

    @Override
    public String toString() {
        return "t~" + id;
    }
}
