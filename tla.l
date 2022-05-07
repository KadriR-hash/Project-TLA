%{
#include "analyse.tab.h"
extern YYSTYPE yylval;
%}

%option noyywrap
%option yylineno
numbers [0-9]+
msg ["]"la valeur de  x=%d"["]
var [a-zA-Z]*

%%
{msg} {return (MESSAGE);}
"printf" return (PRNT);
"int" return (INT);
"main" return (MAIN);
"#include" return (INCLUSION);
"<stdio.h>" return(STDIOLIB);
"(" return (PARENTHESEL);
")" return (PARENTHESER);
"{" return (ACCOL);
"}" return (ACCOR);
";" return (SEMICOLUMN);
"=" return (EQL);
"," return (COMMA);
" "|"\n"|"\t" {}
{var} return (VAR);
{numbers} return(NUM);
. {printf("lexical error in line: %d\n",yylineno);}
%%
