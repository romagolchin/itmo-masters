package org.golchin.automata

import org.antlr.v4.runtime.ANTLRInputStream
import org.antlr.v4.runtime.CommonTokenStream
import org.antlr.v4.runtime.tree.ParseTree

fun createParseTree(string: String): ParseTree {
    val stream = ANTLRInputStream(string)
    val lexer = GrammarLexer(stream)
    // create a buffer of tokens pulled from the lexer
    val tokens = CommonTokenStream(lexer)
    // create a parser that feeds off the tokens buffer
    val parser = GrammarParser(tokens)
    return parser.source()
}

fun regexToNFA(string: String): RegexNFA {
    val regexVisitor = RegexVisitor()
    val parseTree = createParseTree(string)
    return regexVisitor.visit(parseTree)
}

fun regexToDFA(string: String): DFA {
    val nfa = regexToNFA(string)
    nfa.removeEpsMoves()
    val dfa = getDFAFromNFA(nfa)
    dfa.minimize()
    return dfa
}