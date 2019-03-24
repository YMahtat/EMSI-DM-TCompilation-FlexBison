%{
#include <math.h>
#include <stdlib.h>
#include "global.h"
#include "calculatrice.tab.h"
%}
nombre  [0-9]+(\.[0-9]+)?((e|E)(\+|\-)?[0-9]+)?
%%
{nombre} {yylval=atof(yytext); return NOMBRE;}
"\n"     {return FIN;}
"+"      {return PLUS;}
"-"      {return MOINS;}
"*"		 {return FOIS;}
"/"		 {return DIV;}
"("    {return PO;}
")"    {return PF;}
"^"		 {return PUISSANCE;}
"cosinus"		 {return COSINUS;}
"sinus"		 {return SINUS;}
"log"		 {return LOGARITHME;}
"valeur_absolu" {return ABS;}
"racine_carre" {return RACINE;}
"tangente" {return TANGENTE;}
"exp"   {return EXPONENTIELLE;}
 .        { }
%%
int yywrap(void)
{
	return 1;
}
