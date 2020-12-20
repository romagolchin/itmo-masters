package org.golchin.automata

import java.util.*
import java.util.stream.Collectors.toMap

fun getDFAFromNFA(nfa: NFA): DFA {
    val queue: Queue<CompositeState> = ArrayDeque()
    val start = CompositeState(setOf(nfa.start))
    queue.add(start)
    val acceptingStates = mutableSetOf<State>()
    val states = mutableSetOf<State>(start)
    if (isAccepting(start, nfa))
        acceptingStates.add(start)
    val transitions: MutableMap<State, MutableMap<Char?, State>> = mutableMapOf()
    while (!queue.isEmpty()) {
        val state = queue.remove()
        val allTransitions = getTransitionsByChar(state, nfa)
        allTransitions.forEach { (c, neighbor) ->
            transitions.computeIfAbsent(state) { mutableMapOf() }[c] = neighbor
        }
        acceptingStates.addAll(allTransitions.values.filter { s -> isAccepting(s, nfa) })
        allTransitions.values.forEach {
            if (states.add(it)) {
                queue.add(it)
            }
        }
    }
    return DFA(start, acceptingStates, transitions)
}

fun isAccepting(state: CompositeState, nfa: NFA): Boolean {
    return state.states.any(nfa.acceptingStates::contains)
}

fun getTransitionsByChar(compositeState: CompositeState, nfa: NFA): Map<Char?, CompositeState> {
    return nfa.alphabet.stream().collect(toMap({ c -> c }, { c ->
        val states =
            nfa.getTransitions(compositeState, c)
        CompositeState(states)
    }))
}