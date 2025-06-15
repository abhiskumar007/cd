%{
#include "y.tab.h"
%}

%%

"for"       { return FOR; }
"("         { return LPAREN; }
")"         { return RPAREN; }
"{"         { return LF; }
"}"         { return RF; }
"="         { return '='; }
"-"         { return '-'; }
"+"         { return '+'; }
">"         { return '>'; }
"<"         { return '<'; }
";"         { return ';'; }
"=="        { return EQ; }
"<="        { return LE; }
">="        { return GE; }
"+="        { return ADDEQ; }
"-="        { return SUBEQ; }
"++"        { return INC; }
"--"        { return DEC; }
[a-zA-Z_][a-zA-Z0-9_]* { return ALPH; }   // For variable names
[0-9]+      { return NUM; }

[ \t\n]     { /* ignore whitespace */ }
"#"         { return 0; }     // end of input
.           { /* ignore unknown characters */ }

%%

int yywrap() { return 1; }
