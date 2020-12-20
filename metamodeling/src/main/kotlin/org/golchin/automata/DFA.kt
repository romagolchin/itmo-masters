package org.golchin.automata

class DFA(
    start: State,
    acceptingStates: Set<State>,
    transitions: Map<State, Map<Char?, State>>
) : Automaton<State>(start, acceptingStates, transitions) {
    override fun accepts(string: String): Boolean {
        var curState: State? = start
        for (c in string) {
            curState = transition(curState, c)
            if (curState == null) {
                return false
            }
        }
        return acceptingStates.contains(curState)
    }

    private fun removeUnreachable() {
        val reachable = mutableSetOf<State>()
        traverse(start, reachable)
        with(transitions.iterator()) {
            forEach {
                if (!reachable.contains(it.key))
                    remove()
            }
        }
    }

    private fun traverse(state: State, reachable: MutableSet<State>) {
        reachable.add(state)
        transitions[state]?.values?.forEach {
            if (!reachable.contains(it))
                traverse(it, reachable)
        }
    }

    private fun getDistinguishableStates(): Map<State, Set<State>> {
        val distinguishable = mutableMapOf<State, MutableSet<State>>()
        getAllStates().forEach { state ->
            distinguishable[state] = mutableSetOf()
        }
        val queue = ArrayDeque<Pair<State, State>>()
        getAllStates()
            .filter { !isAccepting(it) }
            .forEach { state ->
            acceptingStates.forEach { acceptingState ->
                queue.add(state to acceptingState)
                distinguishable[state]?.add(acceptingState)
                distinguishable[acceptingState]?.add(state)
            }
        }
        val reverseTransitions: Map<State, Map<Char, Set<State>>> = getReverseTransitions()
        while (!queue.isEmpty()) {
            val (u, v) = queue.removeFirst()
            distinguishable[u]?.add(v)
            distinguishable[v]?.add(u)
            val vTransitions = reverseTransitions[v]
            reverseTransitions[u]?.forEach { (c, uRevNeighbors) ->
                vTransitions?.get(c)?.let { vRevNeighbors ->
                    uRevNeighbors.forEach {  u1 ->
                        vRevNeighbors.forEach { v1 ->
                            if (distinguishable[u1]?.contains(v1) != true) {
                                queue.add(u1 to v1)
                                distinguishable[u1]?.add(v1)
                                distinguishable[v1]?.add(u1)
                            }
                        }
                    }
                }
            }
        }
        return distinguishable
    }

    private fun getReverseTransitions(): Map<State, Map<Char, Set<State>>> {
        val revTransitions = mutableMapOf<State, MutableMap<Char, MutableSet<State>>>()
        transitions.forEach { (state, trans) ->
            trans.forEach { (c, neighbor) ->
                if (c != null) {
                    val revTrans = revTransitions.computeIfAbsent(neighbor) { mutableMapOf() }
                    revTrans.computeIfAbsent(c) { mutableSetOf() }.add(state)
                }
            }
        }
        return revTransitions
    }

    fun minimize() {
        removeUnreachable()
        val distinguishableStates = getDistinguishableStates()
        val representativeByState: MutableMap<State, State> = mutableMapOf()
        val representatives = mutableSetOf<State>()
        distinguishableStates.forEach { (state, nonEquivalent) ->
            if (!representativeByState.containsKey(state)) {
                val equivalent = getAllStates().minus(nonEquivalent)
                val representative = equivalent.minByOrNull { it.id }
                equivalent.forEach {
                    representativeByState[it] = representative!!
                }
                representatives.add(representative!!)

            }
        }
        val iterator = transitions.iterator()
        while (iterator.hasNext()) {
            val (state, trans) = iterator.next()
            if (representatives.contains(state)) {
                trans.replaceAll { _, st -> representativeByState[st]!! }
            } else {
                iterator.remove()
            }
        }
        start = representativeByState[start]!!
        acceptingStates = acceptingStates.asSequence().map { representativeByState[it]!! }.toMutableSet()
    }
}

