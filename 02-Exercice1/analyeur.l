%{
#include <stdio.h>
#include <stdlib.h>
#include "PrintSymbolTableLib.cpp" // Bibliothèque d'affichage réaliser pour l'analyseur

//  addOutput(char* lexeme,char* classUnit, int index) : ajout un lexeme analysé à l'affichage final (résultat de l'analyse)
//  addErrorOutput(char* lexeme, int index) : ajout une erreur trouvé à l'affichage final (résultat de l'analyse)
// printOutput() : affiche le résultat de l'analyse


int index = 1; // indice du 1er mot, puis sera incrementé à chaque lexeme trouvé !


%}
delim [\t ]
bl {delim}+
lettre [a-zA-Z]
chiffre [0-9]
id {lettre}({lettre}|{chiffre})+
signe (\+|\-)?
nbr {chiffre}+(.{chiffre}+)?((e|E){signe}?{chiffre}+)?
%%
\n {/* NE RIEN FAIRE */}
{bl} {/* IGNORE */}
"ENTIER" {addOutput(yytext,"MOT-CLE",index);index++;}
"REEL" {addOutput(yytext,"MOT-CLE",index);index++;}
{id} {addOutput(yytext,"IDENTIFICATEUR",index);index++;}
{nbr} {addOutput(yytext,"NOMBRE",index);index++;}
"," {addOutput(yytext,"VIRGULE",index);index++;}
";" {addOutput(yytext,"POINT-VIRGULE",index);index++;}
"=" {addOutput(yytext,"AFFECTATION",index);index++;}
"+" {addOutput(yytext,"ADDITION",index);index++;}
"-" {addOutput(yytext,"SOUSTRACTION",index);index++;}
"*" {addOutput(yytext,"MULTIPLICATION",index);index++;}
"/" {addOutput(yytext,"DIVISION",index);index++;}
"(" {addOutput(yytext,"PARENTHESE OUVRANTE",index);index++;}
")" {addOutput(yytext,"PARENTHESE FERMANTE",index);index++;}
"$" {addOutput(yytext,"FIN",index);index++;printOutput(); exit(0);}
.  {addErrorOutput(yytext,index);index++;}
%%
int main()
{
	printf("\nExpressions a analyser (terminees par $) : \n");
	yylex();
	return 0;
}

int yywrap()
{
	// le delimiteur de la lecture
	return 1;
}
