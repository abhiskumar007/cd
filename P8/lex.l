%{
#include "y.tab.h"
#include <stdlib.h>
#include <string.h>
%}

DIGIT      [0-9]
ID         [a-zA-Z_][a-zA-Z0-9_]*
STRING     \"[^"]*\"
WS         [ \t\n]+

%%

"int"               { return INT; }
"main"              { return MAIN; }
"printf"            { return PRINTF; }

{STRING}            { yylval.str = strdup(yytext); return STRING; }
{ID}                { yylval.id = strdup(yytext); return ID; }
{DIGIT}+            { yylval.num = atoi(yytext); return NUM; }

"+"                 { return ADD; }
"="                 { return ASSIGN; }
"("                 { return LPAREN; }
")"                 { return RPAREN; }
";"                 { return SEMI; }
","                 { return COMMA; }
"{"                 { return LBRACE; }
"}"                 { return RBRACE; }

{WS}                { /* skip whitespace */ }

.                   { /* skip unknown characters */ }

%%

int yywrap() {
    return 1;
}
