package org.golchin.automata

import org.junit.jupiter.api.Test
import kotlin.test.assertEquals
import kotlin.test.assertFalse
import kotlin.test.assertTrue

internal class DFATest {

    @Test
    fun accepts() {
        val stateA = State()
        val stateB = State()
        val acceptingStates = setOf(stateB)
        val dfa = DFA(stateA, acceptingStates, mapOf(stateA to mapOf('a' to stateA, 'b' to stateB)))
        assertTrue(dfa accepts "b")
        assertTrue(dfa accepts "ab")
        assertTrue(dfa accepts "aab")
        assertFalse(dfa accepts "")
        assertFalse(dfa accepts "ba")
    }

    @Test
    internal fun minimize() {
        val a = State()
        val b = State()
        val c = State()
        val d = State()
        val e = State()
        val f = State()
        val g = State()
        val h = State()
        val transitions: Map<State, Map<Char?, State>> = mapOf(
            b to mapOf('0' to h, '1' to a),
            a to mapOf('0' to h, '1' to b),
            c to mapOf('0' to e, '1' to f),
            d to mapOf('0' to e, '1' to f),
            e to mapOf('0' to f, '1' to g),
            f to mapOf('0' to f, '1' to f),
            g to mapOf('0' to g, '1' to f),
            h to mapOf('0' to c, '1' to c),
        )
        val dfa = DFA(b, setOf(f, g), transitions)
        dfa.minimize()
        assertEquals(5, dfa.getAllStates().size)
        assertAutomaton(
            dfa,
            listOf("001", "011", "01101010110", "11110000"),
            listOf("", "0", "1", "01", "10")
        )
    }
}