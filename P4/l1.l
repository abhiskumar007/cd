%{
#include <stdio.h>
int key = 0, id = 0, op = 0;
%}

%%

"int"|"float"|"double"|"if"|"for"|"else"|"while"|"switch"|"printf"|"scanf"|"exit"|"return"|"case"|"main"  { key++; }
[a-zA-Z_][a-zA-Z0-9_]*                                                  { id++; }       // identifiers
[\+\-\*\/\&\|\!\=\<\>\%]                                                { op++; }       // operators
[{}();,]                                                               { /* punctuation, can ignore or count if needed */ }
[ \t\n]                                                                { /* ignore whitespace */ }
"#"                                                                    { return 0; }   // end marker
.                                                                      { printf("Invalid: %s\n", yytext); }

%%

int yywrap() {
    return 1;
}

int main() {
    yyin = fopen("eg.c", "r"); // input file
    if (!yyin) {
        printf("Cannot open file.\n");
        return 1;
    }

    yylex();
    printf("Keywords = %d\nIdentifiers = %d\nOperators = %d\n", key, id - key, op); // remove keywords from id count
    return 0;
}
