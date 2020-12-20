package org.golchin.automata

import org.antlr.v4.runtime.ANTLRInputStream
import org.antlr.v4.runtime.CommonTokenStream
import org.antlr.v4.runtime.misc.TestRig
import org.antlr.v4.runtime.tree.ParseTree
import org.golchin.grammar.GrammarLexer
import org.golchin.grammar.GrammarParser
import java.io.FileInputStream

fun parse(filePath: String) {
    val fileInputStream = FileInputStream(filePath)
    val stream = ANTLRInputStream(fileInputStream)
    val lexer = GrammarLexer(stream)
    // create a buffer of tokens pulled from the lexer
    val tokens = CommonTokenStream(lexer)
    // create a parser that feeds off the tokens buffer
    val parser = GrammarParser(tokens)
    val tree: ParseTree = parser.source()
    println(tree.toStringTree(parser))
    System.setIn(FileInputStream(filePath))
    TestRig.main(arrayOf("org.golchin.automata.Grammar", "source", "-gui"))
}


fun main() {
    parse("example.txt")
}

