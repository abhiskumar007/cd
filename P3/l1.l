%{
#include <stdio.h>
#include <stdlib.h>

int single = 0, multi = 0, multilines = 0;
%}

%x COMMENT  // Define a lexer state

%%
"//".*                 { single++; /* Skip single-line comment */ }

"/*"                   { BEGIN(COMMENT); multi++; }

<COMMENT>{
    [^*\n]*            { for(int i = 0; i < yyleng; i++) if (yytext[i] == '\n') multilines++; }
    "*"[^/]            { for(int i = 0; i < yyleng; i++) if (yytext[i] == '\n') multilines++; }
    "*"+"/"            { BEGIN(INITIAL); }  // Exit comment block
    \n                 { multilines++; }
    .                  { /* Ignore other chars */ }
}

.|\n                   { ECHO; }  // Write everything else
%%

int yywrap() {
    return 1;
}

int main() {
    yyin = fopen("inp.txt", "r");
    yyout = fopen("out.txt", "w");

    if (!yyin || !yyout) {
        printf("Error opening files\n");
        return 1;
    }

    yylex();

    printf("Single line comments = %d\n", single);
    printf("Multiline comments = %d\n", multi);
    printf("Lines in multiline comments = %d\n", multilines);

    fclose(yyin);
    fclose(yyout);
    return 0;
}
