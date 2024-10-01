/* Inclusion de la librarie stdio.h pour l'utilisation de printf() */
#include <stdio.h>

/**
 * \file exo1.c
 * \author Paul Brechenmacher
 * \version 0.1 TP2 Programmation C Exercice 1
 * \date 1 Octobre 2024
 * \brief Saisie d'un entier et affiche cet entier.
*/


/** 
 * \fn main(int argc, char** argv)
 * \author Paul Brechenmacher
 * \version 0.1 Fonction principale saisie entier et affichage de celui-ci
 * \date 1 Octobre 2024
 * \brief Saisie d'un entier et affiche de celui-ci
 * \param argc Entier donnant le nombre d'arguments utilisée lors de l'execution du programme
 * \param argv  Tableau de chaine de caractère qui représente chaque arguments donnés lors de l'execution du programme
 * \return 0 si tout c'est bien passé sinon -1
*/
int main(int argc, char** argv){
    
    int nb;
    int scanf_val;

    //Lit un entier depuis l'entrée standard
    scanf_val = scanf ("%d", &nb);

    // Si pas un entier "Erreur de saisie" sinon affiche le nombre
    if(scanf_val == 0){
        printf("Erreur de saisie\n");
        return -1;
    }else{
        //Affiche la valeur de l'entier nb
        printf("%d\n",nb);
    }
    //Retourne la valeur 0
    return (0);
}

