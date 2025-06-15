%{
#include <stdio.h>
#include <stdlib.h>
int count = 0;
int max_depth = 0;

int yyerror();
int yylex();

void update_depth(int depth) {
    if (depth > max_depth)
        max_depth = depth;
}
%}

%token IF ALPHA NUM GEQ LEQ EQ
%token LPAREN RPAREN LF RF

%%

S: Stmts;

Stmts: /* empty */
     | Stmts Stmt
     ;

Stmt: IF_COND      { update_depth($1); }
    | ALPHA ';'    /* regular statements */
    ;

IF_COND:
    IF LPAREN Expr RPAREN Block {
        $$ = $5 + 1;  // increase nesting level
    };

Block:
    Stmt               { $$ = $1; }
    | LF Inner RF      { $$ = $2; }
    ;

Inner:
    Stmt                  { $$ = $1; }
    | Inner Stmt          {
        $$ = ($1 > $2) ? $1 : $2;  // max nesting among statements
    };

Expr:
    ALPHA RelOp ALPHA     {}
    | ALPHA RelOp NUM     {}
    ;

RelOp:
    '<'
    | '>'
    | GEQ
    | LEQ
    | EQ
    ;

%%

int main() {
    printf("Enter C code with IFs (end with #):\n");
    yyparse();
    printf("Max nesting level of IF statements: %d\n", max_depth);
    return 0;
}

int yyerror() {
    printf("Invalid input\n");
    exit(1);
}
