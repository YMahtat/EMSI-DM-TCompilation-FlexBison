#include <stdio.h>
#include <stdlib.h>
#include <iostream>
#include <string>
using namespace std;


string output = ""; // variable qui contiendra le resultat de l'analyse
char temp[100]; // variable tempon, pour convertir un int to string

// Ajout une ligne à la variable output, qui contient le (lexeme, unité lexical, indice) :
void addOutput(char* lexeme,char* classUnit, int index)
{
  // Preparation de la ligne, et l'ajout partie par partie !
  output +=  "LEXEME : " ;
  output += lexeme;
  output +=  "   |   lexicalUnit : ";
  output += classUnit;
  output +=  "   |   index : ";
  sprintf(temp,"%d",index);
  output +=  temp;
  output += "   ;\n";
}

// Ajout une ligne d'erreur à la variable output, pour un mot qui n'est pas dans le lexique
void addErrorOutput(char* lexeme, int index)
{
  // Preparation de la ligne d'erreur, et l'ajout partie par partie !
  output +=  "motERREUR : " ;
  output += lexeme;
  output +=  "   |   NON INCLU DANS LE LEXIQUE";
  output +=  "   |   index : ";
  sprintf(temp,"%d",index);
  output +=  temp;
  output += "   ;\n";
}

// Affiche la variable output, le résultat de l'analyse
void printOutput()
{
  cout << output;
}
