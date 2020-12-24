package org.golchin.automata

abstract class Automaton<TransitionFunctionRange>(
    var start: State,
    acceptingStates: Set<State>,
    transitions: Map<State, Map<Char?, TransitionFunctionRange>>) {
    var acceptingStates: MutableSet<State> = acceptingStates.toMutableSet()
    val transitions: MutableMap<State, MutableMap<Char?, TransitionFunctionRange>> =
        transitions.mapValues { it.value.toMutableMap() }.toMutableMap()

    val alphabet: Set<Char> = transitions.values.flatMap { it.keys }.filterNotNull().toSet()

    open fun transition(state: State?, char: Char): TransitionFunctionRange? {
        val statesByChar = transitions[state]
        return if (statesByChar == null) null else statesByChar[char]
    }

    abstract infix fun accepts(string: String): Boolean

    fun isAccepting(state: State): Boolean = acceptingStates.contains(state)

    fun getAllStates() = transitions.keys.plus(start).plus(acceptingStates)

    fun renumber() {
        val allStates = ArrayList(transitions.keys)
        allStates.addAll(acceptingStates)
        allStates.add(start)
        transitions.values.forEach {
            it.values.forEach { state ->
                if (state is Set<*>) {
                    allStates.addAll(state as Set<State>)
                } else if (state is State) {
                    allStates.add(state)
                }
            }
        }
        allStates.groupBy { it }.values
            .forEachIndexed { index, states -> states.forEach { it.id = index } }
    }

    override fun toString(): String {
        return transitions.map { it.toString() }.joinToString("\n")
    }
}