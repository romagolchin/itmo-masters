package org.golchin.automata

import org.antlr.v4.runtime.ParserRuleContext
import org.golchin.grammar.GrammarBaseVisitor
import org.golchin.grammar.GrammarParser

class RegexVisitor : GrammarBaseVisitor<RegexNFA>() {
    private fun visitOperator(
        contexts: List<ParserRuleContext>,
        operator: (RegexNFA, RegexNFA) -> RegexNFA
    ): RegexNFA {
        val first = contexts[0]
        var result = first.accept(this)
        for (i in 1 until contexts.size) {
            result = operator(result, contexts[i].accept(this))
        }
        return result
    }

    override fun visitSource(ctx: GrammarParser.SourceContext?): RegexNFA {
        return ctx!!.expr().accept(this)
    }

    override fun visitExpr(ctx: GrammarParser.ExprContext?): RegexNFA {
        return visitOperator(ctx!!.concat(), RegexNFA::union)
    }

    override fun visitConcat(ctx: GrammarParser.ConcatContext?): RegexNFA {
        val clauses = ctx!!.clause()
        if (clauses.isEmpty())
            return empty()
        return visitOperator(clauses, RegexNFA::concat)
    }

    override fun visitClause(ctx: GrammarParser.ClauseContext?): RegexNFA {
        val primitive = ctx!!.primitive()
        val nfa = primitive.accept(this)
        val hasStar = primitive.text.length != ctx.text.length
        if (hasStar)
            return nfa.closure()
        return nfa
    }

    private fun getChar(char: String): Char {
        return when (char) {
            "\\\\" -> '\\'
            "\\*" -> '*'
            "\\|" -> '|'
            else -> {
                assert(char.length == 1)
                return char[0]
            }
        }
    }

    override fun visitPrimitive(ctx: GrammarParser.PrimitiveContext?): RegexNFA {
        val char = ctx!!.CHAR()
        if (char != null) {
            return constant(getChar(char.text))
        }
        return ctx.expr().accept(this)
    }
}