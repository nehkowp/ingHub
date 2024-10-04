/* Inclusion de la librarie stdio.h pour l'utilisation de printf() */
#include <stdio.h>

/**
 * \file main.c
 * \author Paul Brechenmacher
 * \version 0.1 Premier TP 1 Programmation C
 * \date 25 Septembre 2024
*  \brief Premier contact avec la programmation C 
*/



/** 
 * \fn main(int argc, char** argv)
 * \author Paul Brechenmacher
 * \version 0.1 Fonction principale affichage "Hello World"
 * \date 25 Septembre 2024
 * \brief Affiche à l'utilsateur la phrase "Hello World" 
 * \param argc Entier donnant le nombre d'arguments utilisée lors de l'execution du programme
 * \param argv  Tableau de chaine de caractère qui représente chaque arguments donnés lors de l'execution du programme
 * \return 0 si tout c'est bien passé
*/
int main(int argc, char** argv){
    
    //Affichage de l'inscription "Hello World dans le terminal avec un retour à la ligne"
    printf("Hello World\n");

    //Retourne la valeur 0
    return (0);
}

