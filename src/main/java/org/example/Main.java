package org.example;

import org.antlr.v4.runtime.ANTLRFileStream;
import org.antlr.v4.runtime.CommonTokenStream;
import org.antlr.v4.runtime.tree.ParseTree;

public class Main {
    public static void main(String[] args) {
        ccLexer lexer = new ccLexer(new ANTLRFileStream("input"));
        ccParser parser = new ccParser(new CommonTokenStream(lexer));

        ParseTree tree = parser.start();
        VisitorInterface<String> visitor = new VisitorImpl();
        String result = visitor.visit(tree);
        System.out.println(result);
    }

}