##
# This Makefile creates the parser (Parser.class)
# and creates the test program (ParserTest.class)
# for our Calculator example.
#
# Important targets:
#   make              => builds everything
#   make Parser.class => builds just the Parser (but not ParserTest)
#   make clean        => cleans up for a re-build
##

CLASSPATH = ".:./ast:/usr/people/classes/CS340/software/*"

JAVAC = javac
JFLAGS = -g -Werror -source 1.8 -cp $(CLASSPATH)

JFLEXLOC = /usr/people/classes/CS340/software
JCUPLOC = /usr/people/classes/CS340/software

all: ParserTest.class

ParserTest.class: ParserTest.java Yylex.class Parser.class ast/stamp
	$(JAVAC) $(JFLAGS) ParserTest.java

Parser.class: Parser.java Yylex.class ast/stamp
	$(JAVAC) $(JFLAGS) Parser.java

Yylex.class: Yylex.java sym.class
	$(JAVAC) $(JFLAGS) Yylex.java

Yylex.java: Calc.flex sym.class
	java -jar $(JFLEXLOC)/jflex-full-1.7.0.jar Calc.flex

sym.class: sym.java
	$(JAVAC) $(JFLAGS) sym.java

sym.java: Parser.java
	@echo "sym.java should be good to go!"

Parser.java: Calc.cup
	java -jar $(JCUPLOC)/java-cup-11b.jar -interface -parser Parser Calc.cup

ast/stamp: ast
	$(MAKE) -C ast

clean:
	rm -f *~ *.class Yylex.java sym.java Parser.java
	$(MAKE) -C ast clean
