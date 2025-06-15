%{
#include "y.tab.h"
%}

extern YYSTYPE yylval;

%%
"int"       { return INT; }
"float"     { return FLOAT; }
"char"      { return CHAR; }
"double"    { return DOUBLE; }
[a-zA-Z_][a-zA-Z0-9_]*    { return IDENTIFIER; }
[0-9]+      { return NUM; }
"["         { return '['; }
"]"         { return ']'; }
","         { return ','; }
";"         { return ';'; }
[ \t\n]     { /* ignore whitespace */ }
.           { return yytext[0]; }
%%

int yywrap() {
    return 1;
}
