package org.example;

import org.antlr.v4.runtime.tree.ParseTreeVisitor;


public interface VisitorInterface<T> extends ParseTreeVisitor<T> {
    T visitAnd(MyParser.AndContext ctx);
}
