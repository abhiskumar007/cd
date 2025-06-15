%{
#include "y.tab.h"
%}

%%
// Keywords and types
"int"|"void"|"char"|"float"|"double"    { return TYP; }
"return"                                { return RETURN; }

// Identifiers and literals
[a-zA-Z_][a-zA-Z0-9_]*                  { return ID; }
[0-9]+                                  { return NUM; }

// Symbols
"("                                     { return LP; }
")"                                     { return RP; }
"{"                                     { return LB; }
"}"                                     { return RB; }
";"                                     { return SC; }
","                                     { return CM; }
"="                                     { return EQ; }
"+"|"-"|"*"|"/"                         { return OP; }

// Ignore whitespace
[ \t\n]+                                { /* skip whitespace */ }

// Catch-all
.                                       { /* ignore other characters */ }

%%
int yywrap(void) {
    return 1;
}
