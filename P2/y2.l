%{
#include <stdio.h>
#include <stdlib.h>

void yyerror();
int yylex(void);
%}

%token NUM
%left '+' '-'
%left '*' '/'     // Higher precedence than +/-

%%
S : I { printf("Result is %d\n", $$); };

I : I '+' I   { $$ = $1 + $3; }
  | I '-' I   { $$ = $1 - $3; }
  | I '*' I   { $$ = $1 * $3; }
  | I '/' I   { if ($3 == 0) yyerror(); else $$ = $1 / $3; }
  | '(' I ')' { $$ = $2; }
  | NUM       { $$ = $1; }
  | '-' NUM   { $$ = -$2; }
  ;
%%
int main() {
    printf("Enter an expression:\n");
    yyparse();
    printf("Valid\n");
    return 0;
}

void yyerror() {
    printf("Invalid\n");
    exit(1);
}
