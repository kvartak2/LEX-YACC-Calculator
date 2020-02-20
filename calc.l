%{
    #include <stdlib.h>
    #include <stdio.h>
    #include "calc.tab.h"
    void yyerror(char *);
%}


digit	([0-9])
var   ([a-z]([a-z0-9]*))


%%

"print"     {return(TOK_PRINTLN);}

{var}+      {
                yylval = *yytext - 'a';
								return TOK_CHAR;

            }

{digit}+    {
                sscanf(yytext, "%d", &yylval);
                return TOK_NUM;
            }

";"	        {	return(TOK_SEMICOLON);	}

"+"     {	return(TOK_ADD);	}

"-"     {   return(TOK_SUB);	}

"*"	    {	return(TOK_MUL);	}

"/"	    {	return(TOK_DIV);	}

"+="    {   return(TOK_SELFADD);}

"-="    {   return(TOK_SELFSUB);}

"*="    {   return(TOK_SELFMUL);}

"/="    {   return(TOK_SELFDIV);}



[()=]   { return *yytext;       }

[" "]   ;


"{"         { printf("Start of the file '{' ignored\n"); }

"}"         { printf("Start of the file '}' ignored\n"); }

"main()"    { printf("Start of the file 'main()' ignored\n");}

[ \n]   {  return *yytext; }

[ \t]   ;


.       {   printf("Invalid character '%c', ignored\n", yytext[0]); }

%%

int yywrap(void)
{
    return 1;
}
