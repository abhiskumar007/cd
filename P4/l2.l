%{
#include "y.tab.h"
%}

%%

"if"            { return IF; }
"("             { return LPAREN; }
")"             { return RPAREN; }
"{"             { return LF; }
"}"             { return RF; }

"=="            { return EQ; }
"<="            { return LEQ; }
">="            { return GEQ; }

"<"             { return '<'; }
">"             { return '>'; }
"="             { return '='; }
"+"             { return '+'; }
"-"             { return '-'; }

";"             { return ';'; }
","             { /* ignored */ }

[a-zA-Z_][a-zA-Z0-9_]*   { return ALPHA; }
[0-9]+                  { return NUM; }

[ \t\n]+               { /* ignore whitespace */ }

"#"                    { return 0; }
.                      { /* catch-all ignore */ }

%%
int yywrap() {
    return 1;
}
