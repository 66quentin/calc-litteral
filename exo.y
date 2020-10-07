%{
#include <stdlib.h>
#include <stdio.h>
#include <math.h>
char message[50];
int res[2][16];
int indice=0;
float dernier_calcul;
int yyerror (const char*msg);
int yylex();
%}

%union
{
	char TypeCaract;
}

%token <TypeCaract> carinvalide new
%token <TypeCaract> n e l
%left <TypeCaract> a s
%left <TypeCaract> d m
%left <TypeCaract> p1 p2
%left <TypeCaract> p
%type <TypeCaract> S A
%start S
%%
S : l e A  { res[0][indice]=$1;res[1][indice]=$3;indice++; }
| S l e A { res[0][indice]=$2;res[1][indice]=$4;indice++;}
| l { }
| carinvalide { sprintf(message, "caractere invalide : %c", $1); yyerror(message);}
;

A : A a A { $$ = $1+$3; }
| A s A { $$=$1-$3; }
| A m A { $$=$1*$3; }
| A d A { $$=$1/$3; }
| A p A { $$=pow($1,$3); }
| p1 A p2 { $$ = $2; }
| n { $$=$1; }
| s n { $$=-$2; }
| l { for(int i=0;i<indice;i++){if(res[0][i]==$$)$$=res[1][i];} }
| s l { for(int i=0;i<indice;i++){if(res[0][i]==$2)$$=-res[1][i];} }
| carinvalide { sprintf(message, "caractere invalide : %c", $1); yyerror(message);}
;

%%
int yyerror (const char*msg){
	printf(" erreur: %s \n",msg);
	exit(0);
}
int main (void){
	printf("Séparer les symboles d'un espacer et terminer par ; (exemple dans exp.txt)\n");
	yyparse();
	printf("Table des variables calculées:\n");
	for(int i=0;i<indice;i++)
		printf("%c = %d\n", res[0][i],res[1][i]);
	return 0;
	
}
