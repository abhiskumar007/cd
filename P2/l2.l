%{
#include "y.tab.h"       // Token definitions from YACC
extern YYSTYPE yylval;   // Value of NUM token
%}
%%
[0-9]+         { yylval = atoi(yytext); return NUM; }
[-+*/()]       { return yytext[0]; }
.              { return yytext[0]; }     // Any other character → sent to yacc
\n             { return 0; }             // End input on newline
%%
