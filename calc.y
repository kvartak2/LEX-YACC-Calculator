%{
    #include <stdlib.h>
    #include <stdio.h>
    void yyerror(char *);
    int yylex(void);
    int sym[26];
%}


%token TOK_NUM TOK_CHAR
%token TOK_ADD TOK_SUB TOK_MUL TOK_DIV
%token TOK_SELFADD TOK_SELFSUB TOK_SELFMUL TOK_SELFDIV
%token TOK_PRINTLN TOK_SEMICOLON TOK_BRACK_E TOK_BRACK_S TOK_CURLY_BRACK_S TOK_CURLY_BRACK_E
%token TOK_ASSIGN

%left TOK_ADD TOK_SUB
%left TOK_MUL TOK_DIV
%left TOK_SELFADD TOK_SELFSUB TOK_SELFMUL TOK_SELFDIV
%left TOK_PRINTLN
%left TOK_BRACK_E TOK_BRACK_S TOK_CURLY_BRACK_S TOK_CURLY_BRACK_E
%left TOK_ASSIGN

%%
Prog    :   TOK_CURLY_BRACK_S stmts TOK_CURLY_BRACK_E '\n'

;
stmts   :
        |   stmt TOK_SEMICOLON stmts

;

stmt    :
            TOK_CHAR TOK_ASSIGN E             { sym[$1] = $3; }

        |   TOK_CHAR TOK_SELFADD E     { $$ = sym[$1] = (sym[$1] + $3);}
        |   TOK_CHAR TOK_SELFSUB E     { $$ = sym[$1] = (sym[$1] - $3);}
        |   TOK_CHAR TOK_SELFMUL E     { $$ = sym[$1] = (sym[$1] * $3);}
        |   TOK_CHAR TOK_SELFDIV E     { $$ = sym[$1] = (sym[$1] / $3);}

        |   TOK_PRINTLN E     { fprintf(stdout, "the value is %d\n", $2);}
;

E       :   Integer

        |   TOK_CHAR            { $$ = sym[$1]; }

        |   TOK_BRACK_S TOK_SUB Integer TOK_BRACK_E {$$=-$3;}

        |   E TOK_ADD E         { $$ = $1 + $3; }
        |   E TOK_SUB E         { $$ = $1 - $3; }
        |   E TOK_MUL E         { $$ = $1 * $3; }
        |   E TOK_DIV E         { $$ = $1 / $3; }


;
Integer :   TOK_NUM

;


%%

void yyerror(char *s)
{
    fprintf(stderr, "%s\n", s);
}

int main(void)
{
    yyparse();
    return 0;
}
