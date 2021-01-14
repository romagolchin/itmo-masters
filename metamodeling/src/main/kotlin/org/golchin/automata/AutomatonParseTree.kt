package org.golchin.automata

import org.antlr.v4.runtime.CharStreams
import org.antlr.v4.runtime.CommonTokenStream
import org.antlr.v4.runtime.misc.TestRig
import org.antlr.v4.runtime.tree.ParseTree
import org.antlr.v4.runtime.tree.ParseTreeWalker
import org.golchin.grammar.IndentedWriter
import java.io.FileWriter

fun main() {
    val name = "automaton.src"
    val inputStream = ClassLoader.getSystemResourceAsStream(name)
    val stream = CharStreams.fromStream(inputStream)
    val lexer = AutomatonLexer(stream)
    // create a buffer of tokens pulled from the lexer
    val tokens = CommonTokenStream(lexer)
    // create a parser that feeds off the tokens buffer
    val parser = AutomatonParser(tokens)
    val tree: ParseTree = parser.automaton()
    val writer = FileWriter("output.txt")
    writer.use {
        val listener = WritingParseTreeListener(parser.ruleNames, parser.vocabulary, IndentedWriter(writer))
        ParseTreeWalker.DEFAULT.walk(listener, tree)
    }

    System.setIn(ClassLoader.getSystemResourceAsStream(name))
    TestRig.main(arrayOf("org.golchin.automata.Automaton", "automaton", "-gui"))
}