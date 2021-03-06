// Symbol
import java_cup.runtime.*;

/**
 * This class is the lexer (i.e., scanner) for the Streamer
 * language (that students complete in CSCI 340).
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
        return new Symbol(sym.PLUS, yyline, yycolumn);
    }
{DIGIT}|({DIGIT}(.){DIGIT})+
    {
        return new Symbol(sym.NUM, yyline, yycolumn, yytext());
    }
{WS}
{
 ;
}
(bool)
{
	return new Symbol(sym.BOOL, yyline, yycolumn);
}
(num)
{
	return new Symbol(sym.NUMTYPE, yyline, yycolumn);
}
(print)
{
	return new Symbol(sym.PRINT, yyline, yycolumn);
}
(error)
{
	return new Symbol(sym.ERROR, yyline, yycolumn);
}
(exit)
{
	return new Symbol(sym.EXIT, yyline, yycolumn);
}
(void)
{
	return new Symbol(sym.VOID, yyline, yycolumn);
}
(until)
{
	return new Symbol(sym.UNTIL, yyline, yycolumn);
}
(func)
{
	return new Symbol(sym.FUNC, yyline, yycolumn);
}
(input)
{
	return new Symbol(sym.INPUT, yyline, yycolumn);
}
(\|\|)
{
	return new Symbol(sym.OR, yyline, yycolumn);
}
(&&)
{
	return new Symbol(sym.AND, yyline, yycolumn);
}
(\!)
{
	return new Symbol(sym.NOT, yyline, yycolumn);
}
(<<)
{
	return new Symbol(sym.READ, yyline, yycolumn);
}
(>>)
{
	return new Symbol(sym.WRITE, yyline, yycolumn);
}
(<)
{
	return new Symbol(sym.LT, yyline, yycolumn);
}
(>)
{
	return new Symbol(sym.GT, yyline, yycolumn);
}
(>>\+)
{
	return new Symbol(sym.FILEAPP, yyline, yycolumn);
}
(<=)
{
	return new Symbol(sym.LESSEQUAL, yyline, yycolumn);
}
(>=)
{
	return new Symbol(sym.GREATEQUAL, yyline, yycolumn);
}
(-)
{
	return new Symbol(sym.MINUS, yyline, yycolumn);
}
(\*)
{
	return new Symbol(sym.TIMES, yyline, yycolumn);
}
(%)
{
	return new Symbol(sym.MOD, yyline, yycolumn);
}

(\{)
{
	return new Symbol(sym.OPCURLY, yyline, yycolumn);
}
(\})
{
	return new Symbol(sym.CLCURLY, yyline, yycolumn);
}
[\(]
{
	return new Symbol(sym.OPPAREN, yyline, yycolumn);
}
[\)]
{
	return new Symbol(sym.CLPAREN, yyline, yycolumn);
}
(\[)
{
	return new Symbol(sym.OPSQUARE, yyline, yycolumn);
}
(\])
{
	return new Symbol(sym.CLSQUARE, yyline, yycolumn);
}
(\[\?)
{
	return new Symbol(sym.OPFILTER, yyline, yycolumn);
}
(\?\])
{
	return new Symbol(sym.CLFILTER, yyline, yycolumn);
}
(\/)
{
	return new Symbol(sym.DIVIDE, yyline, yycolumn);
}
(,)
{
	return new Symbol(sym.COMMA, yyline, yycolumn);
}
(true)
{
	return new Symbol(sym.TRUE, yyline, yycolumn);
}
(false)
{
	return new Symbol(sym.FALSE, yyline, yycolumn);
}
(text)
{
	return new Symbol(sym.TEXT, yyline, yycolumn);
}
(list)
{
	return new Symbol(sym.LIST, yyline, yycolumn);
}
(if)
{
	return new Symbol(sym.IF, yyline, yycolumn);
}
(else)
{
	return new Symbol(sym.ELSE, yyline, yycolumn);
}
(switch)
{
	return new Symbol(sym.SWITCH, yyline, yycolumn);
}
(case)
{
	return new Symbol(sym.CASE, yyline, yycolumn);
}
(default)
{
	return new Symbol(sym.DEFAULT, yyline, yycolumn);
}
(==)
{
	return new Symbol(sym.EQUALS, yyline, yycolumn);
}
(:)
{
	return new Symbol(sym.COLON, yyline, yycolumn);
}
(for)
{
	return new Symbol(sym.FOR, yyline, yycolumn);
}
(return)
{
	return new Symbol(sym.RETURN, yyline, yycolumn);
}
{LETTER}({LETTER}|{DIGIT})*
    {
	return new Symbol(sym.ID, yyline, yycolumn, yytext());
    }
(;)
{
	return new Symbol(sym.SEMICOL, yyline, yycolumn);
}
(=)
    {
	return new Symbol(sym.ASSIGN, yyline, yycolumn);
    }

\"([^\"]|(\\.))*\"
    {
        return new Symbol(sym.QSTRING, yyline, yycolumn, yytext());
    }

/* error fallback */
.
    {
        throw new Error("Illegal character <" + yytext() + "> at line " + yyline +
                        " column " + yycolumn);
    }
