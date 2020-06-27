package org.golchin.grammar.cfg;

import org.antlr.v4.runtime.RuleContext;

public class StringCfgVisitor extends CfgVisitor<String> {
    public StringCfgVisitor() {
        super(StringCfgVisitor::getText);
    }

    private static String getText(RuleContext ctx) {
        return ctx.getText()
                .replace("\\", "\\\\")
                .replace("\"", "\\\"");
    }
}
