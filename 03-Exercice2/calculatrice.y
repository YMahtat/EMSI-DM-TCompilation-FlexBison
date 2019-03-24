%{
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include "global.h"
int yyerror(char* s);
int yylex();
%}
%token NOMBRE PO PF FIN
%left PLUS MOINS
%left FOIS DIV
%nonassoc COSINUS SINUS RACINE ABS LOGARITHME TANGENTE EXPONENTIELLE
%right PUISSANCE
%start R
%%
R : E FIN {printf("Resultat = %f",$1);return 0;};
E : E PLUS T  {$$=$1+$3;}
	| E MOINS T {$$=$1-$3;}
	| T         {$$=$1;}
  ;
T : T FOIS F {$$=$1*$3;}
	| T DIV F {if ($3 == 0) {printf ("division par zéro interdite");exit(1);} else{ $$ = $1 / $3;}}
	| F
  ;
F : NOMBRE
  | PO E PF {$$=$2;}
	| MOINS F  %prec NEG {$$= -$2;}
	| PLUS F   %prec POS {$$= +$2;}
	| F PUISSANCE F {$$ = pow($1,$3);}
	| COSINUS F {$$ = cos($2);}
	| SINUS F {$$ = sin($2);}
	| TANGENTE F {$$ = tan($2);}
	| LOGARITHME F {$$ = log($2);}
	| EXPONENTIELLE F {$$ = exp($2);}
	| ABS F {$$ = fabs($2);}
	| RACINE F {$$ = sqrt($2);}
  ;
%%

int yyerror(char *s)
{
	printf("%s",s);
	return 1;
}

int main()
{
	printf("Donnez une expression : ");
	yyparse();
	return 0;
}
