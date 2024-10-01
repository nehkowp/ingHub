/* Inclusion de la librarie stdio.h pour l'utilisation de printf() */
#include <stdio.h>

/**
 * \file exo8.c
 * \author Paul Brechenmacher
 * \version 0.1 TP 2 Programmation C Exercice 8
 * \date 1 Octobre 2024
 * \brief Programme qui crée un compte à rebours (boucle while)
*/



/** 
 * \fn main(int argc, char** argv)
 * \author Paul Brechenmacher
 * \version 0.1 Fonction principale qui crée un compte à rebours (boucle while)
 * \date 1 Octobre 2024
 * \brief Fonction qui crée un compte à rebours
 * \param argc Entier donnant le nombre d'arguments utilisée lors de l'execution du programme
 * \param argv  Tableau de chaine de caractère qui représente chaque arguments donnés lors de l'execution du programme
 * \return 0 si tout c'est bien passé sinon -1
*/
int main(int argc, char** argv){
    int int_compteur;
    int int_scanf_val;
    int int_i;
    
    printf("Veuillez saisir un nombre de départ : ");
    //Lit l'entier 1 depuis l'entrée standard
    int_scanf_val = scanf("%d", &int_compteur);

    // Vérifie si la saisie n'est pas un entier
    if(int_scanf_val == 0){
        // Si la saisie n'est pas un entier, affiche un message d'erreur
        printf("Erreur de saisie nombre\n");
        return -1;
    }

    int_i = int_compteur;
    // Boucle tant que int_i est positive, en partant de int_compteur
    while (int_i >= 0) {
         //Afficher le nombre int_i
        printf("%d\n",int_i);
        // Décrémenter int_i
        int_i--;   
    }

    return (0);
    }


