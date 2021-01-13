package org.golchin.automata

import org.antlr.v4.runtime.misc.TestRig

fun main() {
    val inputStream = ClassLoader.getSystemResourceAsStream("automaton.src")
    System.setIn(inputStream)
    TestRig.main(arrayOf("org.golchin.automata.Automaton", "automaton", "-gui"))
}