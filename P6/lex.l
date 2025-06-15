%{
#include "y.tab.h"
%}

%option noyywrap
%%
[0-9]+          { yylval.sym = yytext[0]; return NUMBER; }
[a-zA-Z]        { yylval.sym = yytext[0]; return LETTER; }
[ \t]           ; // ignore whitespace
\n              { return 0; }
.               { return yytext[0]; }
