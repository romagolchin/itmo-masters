package org.golchin.automata

import org.junit.jupiter.api.Test
import kotlin.test.assertEquals

internal class ThompsonAlgorithmKtTest {

    @Test
    fun getDFAFromNFA() {
        val first = State()
        val second = State()
        val firstEdges: Map<Char?, Set<State>> = mapOf('a' to setOf(first, second), 'b' to setOf(first))
        val secondEdges: Map<Char?, Set<State>> = mapOf('b' to setOf(first, second))
        val transitions: Map<State, Map<Char?, Set<State>>> = mapOf(first to firstEdges, second to secondEdges)
        val nfa = NFA(first, setOf(second), transitions)
        val dfa = getDFAFromNFA(nfa)
        val both = CompositeState(setOf(first, second))
        assertEquals(both, dfa.acceptingStates.first())
        val one = CompositeState(setOf(first))
        val expected: MutableMap<State, MutableMap<Char?, CompositeState>> = mutableMapOf(
            one to mutableMapOf('a' to both, 'b' to one),
            both to mutableMapOf('a' to both, 'b' to both)
        )
        assertEquals(expected, dfa.transitions)
    }
}