package org.golchin.automata

open class NFA(
    start: State,
    acceptingStates: Set<State>,
    transitions: Map<State, Map<Char?, Set<State>>>
) : Automaton<MutableSet<State>>(start, acceptingStates, makeTransitionsMutable(transitions)) {
    private val reverseEpsMoves = computeReverseEpsMoves()

    private fun hasEpsMoves() = reverseEpsMoves.isNotEmpty()

    private fun computeReverseEpsMoves(): MutableMap<State, MutableSet<State>> {
        val result = mutableMapOf<State, MutableSet<State>>()
        transitions.forEach { (state, trans) ->
            val neighbors = trans[null]
            neighbors?.forEach { result.computeIfAbsent(it) { mutableSetOf() }.add(state) }
        }
        return result
    }

    override fun transition(state: State?, char: Char): MutableSet<State> {
        return super.transition(state, char) ?: mutableSetOf()
    }

    private fun transitivelyClose() {
        val reachableByState = mutableMapOf<State, MutableSet<State>>()
        computeReachable(start, reachableByState)
        reachableByState.forEach { (state, neighbors) ->
            neighbors.forEach { addEdge(state, it, null) }
        }
    }

    private fun computeReachable(state: State, reachableByState: MutableMap<State, MutableSet<State>>) {
        val result = reachableByState.computeIfAbsent(state) { mutableSetOf() }
        transitions[state]?.forEach { (c, neighbors) ->
            if (c == null) {
                result.addAll(neighbors)
            }
            neighbors.forEach { neighbor ->
                if (!reachableByState.containsKey(neighbor)) {
                    computeReachable(neighbor, reachableByState)
                }
                if (c == null) {
                    val reachable = reachableByState[neighbor]
                    reachable?.forEach {
                        result.add(it)
                    }
                }
            }
        }
    }

    fun addEpsEdge(start: State, end: State) = addEdge(start, end, null)

    fun addEdge(start: State, end: State, char: Char?) {
        val statesByChar = transitions.computeIfAbsent(start) { mutableMapOf() }
        statesByChar.computeIfAbsent(char) { mutableSetOf() }
            .add(end)
        if (char == null) {
            reverseEpsMoves.computeIfAbsent(end) { mutableSetOf() }.add(start)
        }
    }

    private fun addAcceptingStates() {
        reverseEpsMoves.forEach { (state, neighbors) ->
            if (acceptingStates.contains(state))
                neighbors.forEach { neighbor ->
                    acceptingStates.add(neighbor)
                }
        }
    }

    private fun addEdges() {
        transitions.forEach { (state, trans) ->
            val revNeighbors = reverseEpsMoves[state]
            trans.forEach { (c, neighbors) ->
                revNeighbors?.forEach { revNeighbor ->
                    neighbors.forEach { neighbor ->
                        addEdge(revNeighbor, neighbor, c)
                    }
                }
            }
        }
    }

    fun removeEpsMoves() {
        if (hasEpsMoves()) {
            transitivelyClose()
            addAcceptingStates()
            addEdges()
            transitions.values.forEach { trans ->
                trans.remove(null)
            }
            reverseEpsMoves.clear()
            val visited = mutableSetOf<State>()
            traverse(start, visited)
            val iterator = transitions.entries.iterator()
            while (iterator.hasNext()) {
                val (state, _) = iterator.next()
                if (!visited.contains(state))
                    iterator.remove()
            }
        }
    }

    private fun traverse(state: State, visited: MutableSet<State>) {
        visited.add(state)
        transitions[state]?.forEach { (_, neighbors) ->
            neighbors.forEach {
                if (!visited.contains(it))
                    traverse(it, visited)
            }
        }
    }

    internal fun getTransitions(
        compositeState: CompositeState,
        c: Char
    ) = compositeState.states.asSequence().flatMap { transition(it, c) }.toSet()


    override fun accepts(string: String): Boolean {
        removeEpsMoves()
        var curState = CompositeState(setOf(start))
        for (c in string) {
            val allTransitions = getTransitions(curState, c)
            curState = CompositeState(allTransitions)
        }
        return curState.states.any(this::isAccepting)
    }
}

internal fun makeTransitionsMutable(transitions: Map<State, Map<Char?, Set<State>>>): Map<State, Map<Char?, MutableSet<State>>> {
    return transitions.mapValues {
        it.value.toMutableMap()
            .mapValues { entry -> entry.value.toMutableSet() }
    }
        .toMutableMap()
}

