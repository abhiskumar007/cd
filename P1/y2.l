%{
#include <stdio.h>
#include <string.h>
#include <stdlib.h>   // Required for exit()
void yyerror(const char *s);
%}

%start S

%%
S : A B;

A : 'a' A 'b'   // A → a A b
  |             // Or ε (empty)
  ;

B : 'b' B 'c'   // B → b B c
  |             // Or ε
  ;
%%

int main() {
    printf("Enter string:\n");
    yyparse();
    printf("true\n");
    return 0;
}

void yyerror(const char *s) {
    fprintf(stderr, "Invalid\n");
    exit(0);
}
