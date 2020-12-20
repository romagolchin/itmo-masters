package org.golchin.automata

import java.util.concurrent.atomic.AtomicInteger

open class State {
    val id = atomicInteger.incrementAndGet()

    override fun toString(): String {
        return id.toString()
    }
    companion object {
        private val atomicInteger = AtomicInteger()
    }
}

data class CompositeState(val states: Set<State>) : State() {
    override fun toString(): String {
        return states.toString()
    }
}