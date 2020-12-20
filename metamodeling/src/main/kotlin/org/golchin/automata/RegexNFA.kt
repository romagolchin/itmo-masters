package org.golchin.automata

class RegexNFA(
    start: State,
    private val finalState: State,
    acceptingStates: Set<State>,
    transitions: Map<State, Map<Char?, Set<State>>>
) : NFA(start, acceptingStates, transitions) {
    constructor(
        start: State,
        finalState: State,
        transitions: Map<State, Map<Char?, Set<State>>>
    ) : this(start, finalState, setOf(finalState), transitions)

    infix fun concat(right: RegexNFA): RegexNFA {
        val acceptState = finalState
        val transitionsFromStart = right.transitions[right.start] ?: mapOf()
        val transitions = transitions.plus(right.transitions)
            .plus(acceptState to transitionsFromStart)
            .minus(right.start)
        return RegexNFA(
            start,
            right.finalState,
            transitions
        )
    }

    infix fun union(other: RegexNFA): RegexNFA {
        val start = State()
        val end = State()
        val transitions = transitions.plus(other.transitions)
            .plus(
                listOf<Pair<State, Map<Char?, Set<State>>>>(
                    start to mapOf(null to setOf(this.start, other.start)),
                    epsMove(finalState, end),
                    epsMove(other.finalState, end)
                )
            )
        return RegexNFA(start, end, transitions)
    }

    fun closure(): RegexNFA {
        val start = State()
        val end = State()
        val nfa = RegexNFA(start, end, transitions)
        nfa.addEpsEdge(start, this.start)
        nfa.addEpsEdge(start, end)
        nfa.addEpsEdge(finalState, this.start)
        nfa.addEpsEdge(finalState, end)
        return nfa
    }

    private fun epsMove(start: State, end: State): Pair<State, Map<Char?, Set<State>>> =
        start to mapOf(null to setOf(end))
}

fun singleTransition(char: Char?): RegexNFA {
    val start = State()
    val end = State()
    val transitions: Map<State, Map<Char?, Set<State>>> = mapOf(start to mapOf(char to setOf(end)))
    return RegexNFA(start, end, transitions)
}


fun empty() = singleTransition(null)

fun constant(char: Char) = singleTransition(char)
