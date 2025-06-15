%{
#include <stdio.h>

int lines = 1, spaces = 0, words = 0, characters = 0;
%}

%%

[ ]        { spaces++; characters++; }
[\t]       { spaces += 3; characters += 1; }
[\n]       { lines++; characters++; }
[a-zA-Z]+  { words++; characters += yyleng; }
[^ \t\n#a-zA-Z]+ { characters += yyleng; } // catch symbols or digits
"#"        { return 0; }

%%

int yywrap() {
    return 1;
}

int main() {
    printf("Enter a paragraph (end with # on a new line):\n");
    yylex();
    printf("Number of lines = %d\n", lines);
    printf("Number of spaces = %d\n", spaces);
    printf("Number of words = %d\n", words);
    printf("Number of characters = %d\n", characters);
    return 0;
}
