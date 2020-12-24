package org.golchin.automata

import java.io.BufferedWriter
import java.io.FileWriter

fun <T> Automaton<T>.toDOT(path: String) {
    val fileWriter = FileWriter(path)
    BufferedWriter(fileWriter).use {
        it.write("digraph {")
        it.newLine()
        it.write("graph [fontsize=12]")
        it.newLine()
        it.write("rankdir=LR")
        it.write("\"\" [shape=none]")
        it.newLine()
        getAllStates().forEach { state ->
            var shape = "circle"
            if (isAccepting(state))
                shape = "doublecircle"
            val serialize = serialize(state)
            var label = "s${state.id}"
            if (serialize != null)
                label += " $serialize"
            it.write("${state.id} [shape=$shape, label=${quote(label)}]")
            it.newLine()
        }
        it.write("${quote("")} -> ${start.id}")
        it.newLine()
        getEdges().forEach { (sourceToTarget, labels) ->
            val (source, target) = sourceToTarget
            val label = labels.joinToString(",", "\"", "\"")
            it.write("${source.id} -> ${target.id} [label = $label]")
            it.newLine()
        }
        it.write("}")
        it.newLine()
    }
}

fun serialize(state: State): String? {
    if (state is CompositeState)
        return state.states.joinToString(",", "{", "}") {
            "s${it.id}"
        }
    return null
}

fun quote(string: String): String {
    return "\"$string\""
}

fun toCollection(any: Any?): Collection<State> {
    if (any is Collection<*>)
        return any as Collection<State>
    if (any is State)
        return listOf(any)
    return listOf()
}

fun <T> Automaton<T>.getEdges(): Map<Pair<State, State>, List<String>> {
    val result = mutableMapOf<Pair<State, State>, MutableList<String>>()
    transitions.forEach { (st, trans) ->
        trans.forEach { (c, neighbor) ->
            val collection = toCollection(neighbor)
            collection.forEach { n ->
                result.computeIfAbsent(st to n) { mutableListOf() }
                    .add(c?.toString() ?: "eps")
            }
        }
    }
    return result
}

fun main() {
    val nfa = regexToNFA("ba((ab)|(bc))*ab")
    nfa.renumber()
    nfa.toDOT("eps_nfa.dot")
    nfa.removeEpsMoves()
    nfa.toDOT("nfa.dot")
    val dfa = getDFAFromNFA(nfa)
    dfa.renumber()
    dfa.toDOT("dfa.dot")
    dfa.minimize()
    dfa.toDOT("minimized_dfa.dot")
}
