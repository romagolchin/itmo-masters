package org.golchin.automata

import org.junit.jupiter.api.Assertions.*
import org.junit.jupiter.api.Test

internal class NFATest {

    @Test
    fun concat() {
        val nfa = regexToNFA("ab")
        nfa.removeEpsMoves()
        val destination = nfa.transition(nfa.start, 'a')
        assertEquals(1, destination.size)
        val nextState = destination.first()
        val finish = nfa.transition(nextState, 'b')
        assertEquals(1, finish.size)
        assertTrue(nfa.acceptingStates.contains(finish.first()))
    }

    @Test
    internal fun closure() {
        val nfa = regexToNFA("a*") concat empty()
        assertTrue(nfa accepts "")
        assertTrue(nfa accepts "a")
        assertTrue(nfa accepts "aa")
        assertFalse(nfa accepts "ab")
    }

    @Test
    internal fun composite() {
        val nfa = regexToNFA("a*b*")
        assertTrue(nfa accepts "")
        assertTrue(nfa accepts "a")
        assertTrue(nfa accepts "b")
        assertTrue(nfa accepts "ab")
        assertTrue(nfa accepts "aabbb")
        assertFalse(nfa accepts "baba")
        assertFalse(nfa accepts "abab")
        assertFalse(nfa accepts "ba")
    }

    @Test
    internal fun parentheses() {
        val nfa = regexToNFA("(a|b)*")
        assertTrue(nfa accepts "aaa")
        assertTrue(nfa accepts "ab")
        assertTrue(nfa accepts "ba")
        assertTrue(nfa accepts "bab")
        assertFalse(nfa accepts "abc")
    }
}