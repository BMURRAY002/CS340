##
# This Makefile creates the scanner (Yylex.class)
# and creates the compiler front-end (StreamerC.class)
# for the Streamer language.
#
# Important targets:
#   make             => builds everything
#   make Yylex.class => builds just the Scanner (but not StreamerC)
#   make clean       => cleans up for a re-build
##

CLASSPATH = ".:/usr/people/classes/CS340/software/*"

JAVAC = javac
JFLAGS = -g -Werror -source 1.8 -cp $(CLASSPATH)

JFLEXLOC = /usr/people/classes/CS340/software

all: StreamerC.class

StreamerC.class: StreamerC.java Yylex.class sym.class
	$(JAVAC) $(JFLAGS) StreamerC.java

Yylex.class: Yylex.java sym.class
	$(JAVAC) $(JFLAGS) Yylex.java

Yylex.java: Streamer.flex sym.class
	java -jar $(JFLEXLOC)/jflex-full-1.7.0.jar Streamer.flex

sym.class: sym.java
	$(JAVAC) $(JFLAGS) sym.java

clean:
	rm -f *~ *.class Yylex.java
