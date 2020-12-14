[Grammar](src/main/antlr4/org/golchin/Grammar.g4)

[Sample](example.il)

To generate Java classes from grammar, use
`mvn install antlr4:antlr4`.

Then `mvn exec:java -Dexec.mainClass="org.golchin.ParseTreeKt"` to see the parse tree of the sample.