%{
#include "analyse.c"
void yyerror(char* s);
%}


%union {
    char* mytxt;
}
%token MAIN PARENTHESEL PARENTHESER NUM ALPHA INCLUSION STDIOLIB ACCOL ACCOR INT PRNT VAR MESSAGE COMMA SEMICOLUMN EQL
%type<integer> NUM
%type<texte>affectingval
%type<texte>printing
%staret S

%%
S:INC S | AFTERINC;
INC:INCLUSION STDIOLIB {printf("\INCLUSION\n");};
AFTERINC:INT MAIN PARENTHESEL PARENTHESER ACCOL WORK ACCOR {printf("\MAIN\n);}
WORK: affectingval WORK | printing ;
affectingval:INT VAR EQL NUM SEMICOLUMN {printf("\n AFFECTATION\n");};
printing:PRNT PARENTHESEL MESSAGE COMMA VAR PARENTHESER SEMICOLUMN {printf("\n AFFICHER\n");};
%%  
void yyerror(char* s){
   
    printf("\n --erreur syntaxique à la ligne [ %d ] -- \n",yylineno);
}

void main(){
    
    if(!yyparse()){
        printf("\n-- Fin de l'analyse lexicale et syntaxique --\n");   
    }
}