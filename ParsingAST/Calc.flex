// Symbol
import java_cup.runtime.*;

/**
 * This class is the completed Calculator example
 * (and in-class example from CSCI 340).
 */
%%

%class Yylex
%unicode
%cup
%line
%column

DIGIT  = [0-9]
LETTER = [A-Za-z]
WS     = (\r|\n|\r\n) | [ \t\f]

%state STRING

%%

/* patterns */
(\+)
    {
        return new Symbol(sym.PLUS);
    }
-
    {
        return new Symbol(sym.MINUS);
    }
=
    {
        return new Symbol(sym.EQUALS);
    }
;
    {
        return new Symbol(sym.SEMICOLON);
    }
print
    {
        return new Symbol(sym.PRINT);
    }
{DIGIT}+
    {
        return new Symbol(sym.NUM, yytext());
    }
{LETTER}({LETTER}|{DIGIT})*
    {
        return new Symbol(sym.ID, yytext());
    }

{WS}
    {
        ;
    }

/* error fallback */
.
    {
        throw new Error("Illegal character <" + yytext() + "> at line " + yyline +
                        " column " + yycolumn);
    }
