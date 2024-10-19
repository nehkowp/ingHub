/* Inclusion de la librarie stdio.h pour l'utilisation de printf() */
#include <stdio.h>


/**
    \def ERREUR SAISIE
    Code d'erreur associé à une mauvaise saisie utilisateur
*/
#define ERREUR_SAISIE -1



/**
 * \file exo3.c
 * \author Paul Brechenmacher
 * \version 0.1 TP3 Programmation C Exercice 3
 * \date 18 Octobre 2024
 * \brief Echange de deux valeurs
*/


/**
 * \fn void echange(int int_nb1, int int_nb2)
 * \author Paul Brechenmacher
 * \version 0.1 Fonction d'échange de deux entiers
 * \date 18 Octobre 2024
 * \brief Echange de deux nombres entiers (par valeur)
 * \param int_nb1 Premier entier à échanger
 * \param int_nb2 Deuxième entier à échanger
 */
void echange(int int_nb1, int int_nb2);


/** 
 * \fn main(int argc, char** argv)
 * \author Paul Brechenmacher
 * \version 0.1 Fonction principale Echange de deux valeurs
 * \date 18 Octobre 2024
 * \brief Saisie et échange de deux entiers
 * \param argc Entier donnant le nombre d'arguments utilisée lors de l'execution du programme
 * \param argv  Tableau de chaine de caractère qui représente chaque arguments donnés lors de l'execution du programme
 * \return 0 si tout s'est bien passé 
 */
int main(int argc, char** argv){
    int int_nb1, int_nb2;

    int_nb1 = 5;
    int_nb2 = 7;

    // Affichage des valeurs avant appel de la fonction d'échange
    printf("\nAvant appel de la fonction echange :\n");
    printf("int_Nb1 = %d, int_Nb2 = %d\n", int_nb1, int_nb2);

    // Appel de la fonction d'échange
    echange(int_nb1, int_nb2);

    // Affichage des valeurs après appel de la fonction d'échange
    printf("\nAprès appel de la fonction echange :\n");
    printf("int_Nb1 = %d, int_Nb2 = %d\n", int_nb1, int_nb2);

    return (0);
}


void echange(int int_nb1, int int_nb2) {
    int int_tmp;

    // Affichage des valeurs avant l'échange
    printf("\nDans la fonction echange - Avant échange :\n");
    printf("int_Nb1 = %d, int_Nb2 = %d\n", int_nb1, int_nb2);

    // Echange des valeurs
    int_tmp = int_nb1;
    int_nb1 = int_nb2;
    int_nb2 = int_tmp;

    // Affichage des valeurs après l'échange
    printf("Dans la fonction echange - Après échange :\n");
    printf("int_Nb1 = %d, int_Nb2 = %d\n", int_nb1, int_nb2);
}
