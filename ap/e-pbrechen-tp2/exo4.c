/* Inclusion de la librarie stdio.h pour l'utilisation de printf() */
#include <stdio.h>

/**
 * \file exo4.c
 * \author Paul Brechenmacher
 * \version 0.1 TP2 Programmation C Exercice 4
 * \date 1 Octobre 2024
 * \brief Divise deux nombres choisis par l'utilisateur
*/



/** 
 * \fn main(int argc, char** argv)
 * \author Paul Brechenmacher
 * \version 0.1 Fonction principale saisie d'une personne
 * \date 1 Octobre  2024
 * \brief Saisie d'une personne
 * \param argc Entier donnant le nombre d'arguments utilisée lors de l'execution du programme
 * \param argv  Tableau de chaine de caractère qui représente chaque arguments donnés lors de l'execution du programme
 * \return 0 si tout c'est bien passé sinon -1
*/
int main(int argc, char** argv){
    
    int int_num;
    int int_den;
    int int_scanf_val;

    //Affiche un message à l'utilisateur
    printf("Veuillez saisir le numérateur et le dénominateur : \n");
    //Lit l'entier 1 depuis l'entrée standard
    int_scanf_val = scanf("%d", &int_num);

    // Vérifie si la saisie n'est pas un entier
    if(int_scanf_val == 0){
        // Si la saisie n'est pas un entier, affiche un message d'erreur
        printf("Erreur de saisie nombre\n");
        return -1;
    }

    //Lit l'entier 2 depuis l'entrée standard
    int_scanf_val = scanf("%d", &int_den);
   
    // Vérifie si la saisie n'est pas un entier
    if(int_scanf_val == 0){
        printf("Erreur de saisie nombre\n");
        return -1;
    }


    if(int_den != 0){
        printf("%d / %d =  %d",int_num,int_den,int_num/int_den);
    }



    //Retourne la valeur 0
    return (0);
}

