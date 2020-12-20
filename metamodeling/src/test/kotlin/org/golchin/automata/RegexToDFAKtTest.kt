package org.golchin.automata

import org.junit.jupiter.api.Assertions.assertFalse
import org.junit.jupiter.api.Assertions.assertTrue
import org.junit.jupiter.api.Test

class RegexToDFAKtTest {

    @Test
    fun regexToDFA() {
        var dfa = regexToDFA("")
        assertTrue(dfa accepts "")
        assertFalse(dfa accepts "abcd")
        dfa = regexToDFA("ab")
        assertTrue(dfa accepts "ab")
        assertFalse(dfa accepts "abcd")
        assertFalse(dfa accepts "")
        dfa = regexToDFA("ab*")
        assertTrue(dfa accepts "ab")
        assertFalse(dfa accepts "abcd")
        assertFalse(dfa accepts "")
        dfa = regexToDFA("(a|b)*")
        assertTrue(dfa accepts "")
        assertTrue(dfa accepts "aaa")
        assertTrue(dfa accepts "bbb")
        assertTrue(dfa accepts "ab")
        assertFalse(dfa accepts "abcd")
        assertAutomaton(
            "a(a|b|c)*b",
            listOf("aab", "aaab", "acccb"),
            listOf("", "bac", "cab")
        )
        assertAutomaton(
            "а(а|б|в)*б",
            listOf("аб", "аббббб", "авввввб"),
            listOf("", "бав", "ваб")
        )
    }
}