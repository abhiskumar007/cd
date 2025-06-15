%{
int nf=0, p=0, n=0, pf=0;
%}
%%
[+]?([0-9]+)                                  { p++; }
[-]([0-9]+)                                   { n++; }
[+]?([0-9]+)\.([0-9]+)                        { pf++; }
[-]([0-9]+)\.([0-9]+)                         { nf++; }
[+]?([0-9]+\.?[0-9]*)/[-]?([0-9]+\.?[0-9]*)   { pf++; }
[-]([0-9]+\.?[0-9]*)/[+]?([0-9]+\.?[0-9]*)    { nf++; }
[-]([0-9]+\.?[0-9]*)/[-]([0-9]+\.?[0-9]*)     { pf++; }
#                                             { return 0; }
%%
int yywrap() {
    return 1;
}
int main() {
    printf("Enter numbers (use # to end):\n");
    yylex();
    printf("Number of positive integers  = %d\n", p);
    printf("Number of negative integers  = %d\n", n);
    printf("Number of positive fractions = %d\n", pf);
    printf("Number of negative fractions = %d\n", nf);
    return 0;
}
