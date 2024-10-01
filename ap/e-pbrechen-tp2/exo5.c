

/* Inclusion de la librarie stdio.h pour l'utilisation de printf() */
#include <stdio.h>

/**
 * \file exo5.c
 * \author Paul Brechenmacher
 * \version 0.1 TP2 Programmation C Exercice 5
 * \date 1 Octobre 2024
 * \brief Programme qui demande deux nombres à l’utilisateur et l’informe ensuite si leur produit est négatif ou positif.
*/



/** 
 * \fn main(int argc, char** argv)
 * \author Paul Brechenmacher
 * \version 0.1 TP2 Fonction principale saisie de deux entiers et affichage du signe du produit
 * \date 1 Octobre  2024
 * \brief Demande deux nombres et dit si le produit est négatif ou positif.
 * \param argc Entier donnant le nombre d'arguments utilisée lors de l'execution du programme
 * \param argv  Tableau de chaine de caractère qui représente chaque arguments donnés lors de l'execution du programme
 * \return 0 si tout c'est bien passé sinon -1
*/
int main(int argc, char** argv){

    float int_num1;
    float int_num2;
    int int_scanf_val;

    //Affiche un message à l'utilisateur
    printf("Veuillez saisir 2 nombres : \n");
    //Lit l'entier 1 depuis l'entrée standard
    int_scanf_val = scanf("%f", &int_num1);

    // Vérifie si la saisie n'est pas un entier
    if(int_scanf_val == 0){
        // Si la saisie n'est pas un entier, affiche un message d'erreur
        printf("Erreur de saisie nombre\n");
        return -1;
    }

    //Lit l'entier 2 depuis l'entrée standard
    int_scanf_val = scanf("%f", &int_num2);
   
    // Vérifie si la saisie n'est pas un entier
    if(int_scanf_val == 0){
        printf("Erreur de saisie nombre\n");
        return -1;
    }
    
    //Comparaison du produit des deux nombres si supérieur à 0
    if(int_num1 * int_num2 >= 0){
        printf("Le produit de %f et %f est positif\n",int_num1,int_num2);
    }else{
        printf("Le produit de %f et %f est strictement négatif\n",int_num1,int_num2);
    }

    return (0);
    }


