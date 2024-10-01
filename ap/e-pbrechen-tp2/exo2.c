/* Inclusion de la librarie stdio.h pour l'utilisation de printf() */
#include <stdio.h>

/**
 * \file exo2.c
 * \author Paul Brechenmacher
 * \version 0.1 TP 2 Programmation C Exercice 2
 * \date 25 Septembre 2024
 * \brief  Saisie 2 entiers et affichage
*/



/** 
 * \fn main(int argc, char** argv)
 * \author Paul Brechenmacher
 * \version 0.1 TP2 Fonction principale saisie 2 entiers et affichage 
 * \date 1 Octobre  2024
 * \brief Saisie de deux entiers et affichage de ceux-ci
 * \param argc Entier donnant le nombre d'arguments utilisée lors de l'execution du programme
 * \param argv  Tableau de chaine de caractère qui représente chaque arguments donnés lors de l'execution du programme
 * \return 0 si tout c'est bien passé sinon -1
*/
int main(int argc, char** argv){
    
    int int_nb1;
    int int_nb2;
    int int_scanf_val;

    //Affiche un message à l'utilisateur
    printf("Veuillez saisir votre premier nombre : \n");
    //Lit l'entier 1 depuis l'entrée standard
    int_scanf_val = scanf("%d", &int_nb1);

    // Vérifie si la saisie n'est pas un entier
    if(int_scanf_val == 0){
        // Si la saisie n'est pas un entier, affiche un message d'erreur
        printf("Erreur de saisie nombre 1\n");
        return -1;
    }else{
        //Sinon affiche l'entier
        printf("%d\n",int_nb1);
    }

    //Affiche un message à l'utilisateur
    printf("Veuillez saisir votre deuxième nombre : \n");
    //Lit l'entier 2 depuis l'entrée standard
    int_scanf_val = scanf("%d", &int_nb2);
   
   
    // Vérifie si la saisie n'est pas un entier
    if(int_scanf_val == 0){
        printf("Erreur de saisie nombre 2\n");
        return -1;
    }else{
        printf("%d\n",int_nb2);
    }

    //Retourne la valeur 0
    return (0);
}

