%{
#include <stdio.h>
#include <stdlib.h>

int count = 0;
int error = 0;

void yyerror(const char *s);
int yylex();
%}

%token FOR LPAREN RPAREN LF RF ALPH NUM
%token EQ LE GE ADDEQ SUBEQ INC DEC

%start S
%%

S : I {
      if (count >= 3)
          printf("valid\n");
      else {
          printf("error\n");
          exit(0);
      }
      printf("Number of nested FOR's are: %d\n", count);
    }
  ;

I : FOR A B { count++; }
  ;

A : LPAREN E ';' E ';' E RPAREN ;  // Condition part inside for loop

// Expressions allowed in for loop header
E : ALPH Z NUM
  | ALPH Z ALPH
  | ALPH U
  | /* empty */
  ;

Z : '=' | '>' | '<' | LE | GE | EQ | ADDEQ | SUBEQ ;

U : INC | DEC ;

B : LF BODY RF ;

BODY : I           // Another nested for loop
     | ALPH        // A variable (i, j, etc.)
     | BODY I      // Multiple inner for loops
     | /* empty */ // Empty body
     ;

%%

int main() {
    yyparse();
    return 0;
}

void yyerror(const char *s) {
    printf("error\n");
    exit(0);
}
