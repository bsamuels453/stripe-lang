export ANTLR4_LOCATION=$PWD/lib/antlr-4.1-complete.jar

export CLASSPATH=".:$ANTLR4_LOCATION:$CLASSPATH"

alias antlr4='java -jar $ANTLR4_LOCATION'
alias grun='java org.antlr.v4.runtime.misc.TestRig'

cd src/frontend/grammar
java -jar $ANTLR4_LOCATION -package frontend.grammar -visitor stripe.g4
