/* Inclusion de la librarie stdio.h pour l'utilisation de printf() */
#include <stdio.h>


/**
    \def ERREUR SAISIE
    Code d'erreur associé à une mauvaise saisie utilisateur
*/
#define ERREUR_SAISIE -1



/**
 * \file exo1.c
 * \author Paul Brechenmacher
 * \version 0.1 TP3 Programmation C Exercice 1
 * \date 1 Octobre 2024
 * \brief Saisie d’un nombre
*/



/**
 * \author : Peio Loubière <peio.loubiere@cyu.fr>
 * \date  : Thu Nov 19 17:07:41 2020
 * \brief : vide le buffer après une saisie
 */
void emptyBuffer();

/** 
 * \fn saisieEntier()
 * \author Paul Brechenmacher
 * \version 0.1 Fonction Saisie d’un entier
 * \date 18 Octobre 2024
 * \brief Saisie d'un entier
 * \return L'entier saisie par l'utilisateur
*/
int saisieEntier(void);








/** 
 * \fn main(int argc, char** argv)
 * \author Paul Brechenmacher
 * \version 0.1 Fonction principale Saisie d’un entier
 * \date 18 Octobre 2024
 * \brief Saisie d'un nombre
 * \param argc Entier donnant le nombre d'arguments utilisée lors de l'execution du programme
 * \param argv  Tableau de chaine de caractère qui représente chaque arguments donnés lors de l'execution du programme
 * \return 0 si tout c'est bien passé 
*/
int main(int argc, char** argv){
    int int_nb;
    // Demande d'une saisie d'entier
    int_nb = saisieEntier();
    printf("Vous avez saisi le nombre : %d\n",int_nb);
    return (0);
}


void emptyBuffer() {
  char c;
  while (((c = getchar()) != '\n') && (c != EOF));
}


int saisieEntier(void){
    int int_n;
    int int_scanf_val;
    printf("Veuillez saisir un entier : \n");
    int_scanf_val = scanf("%d",&int_n);

    // Tant que l'utilisateur ne rentre pas une valeur correcte, on lui redemande une valeur
    while(int_scanf_val == 0){
        // Envoie l'erreur dans la sortie erreur
        fprintf(stderr,"Saisie utilisateur incorrecte\n");
        printf("Entrer une nouvelle valeur : \n");
        //Vide le buffer
        emptyBuffer(); 
        //Redemande une valeur pour int_n
        int_scanf_val = scanf("%d",&int_n);
    }

    return (int_n);
}







