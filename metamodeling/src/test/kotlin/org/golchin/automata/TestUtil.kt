package org.golchin.automata

import org.junit.jupiter.api.Assertions

fun assertAutomaton(
    regex: String,
    acceptable: List<String>,
    notAcceptable: List<String>
) {
    return assertAutomaton(regexToDFA(regex), acceptable, notAcceptable)
}

fun <T> assertAutomaton(
    automaton: Automaton<T>,
    acceptable: List<String>,
    notAcceptable: List<String>
) {
    acceptable.forEach { Assertions.assertTrue(automaton accepts it) }
    notAcceptable.forEach { Assertions.assertFalse(automaton accepts it) }
}
