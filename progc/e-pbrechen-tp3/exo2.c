/* Inclusion de la librarie stdio.h pour l'utilisation de printf() */
#include <stdio.h>


/**
    \def ERREUR SAISIE
    Code d'erreur associé à une mauvaise saisie utilisateur
*/
#define ERREUR_SAISIE -1



/**
 * \file exo2.c
 * \author Paul Brechenmacher
 * \version 0.1 TP3 Programmation C Exercice 2
 * \date 1 Octobre 2024
 * \brief Saisie d’un nombre + Fonction Bidon
*/



/**
 * \author : Peio Loubière <peio.loubiere@cyu.fr>
 * \date  : Thu Nov 19 17:07:41 2020
 * \brief : Vide le buffer après une saisie
 */
void emptyBuffer(void);

/** 
 * \fn void bidon(void)
 * \author Paul Brechenmacher
 * \version 0.1 Fonction Saisie d’un entier
 * \date 18 Octobre 2024
 * \brief Saisie d'un entier
*/
void bidon(void);



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
    int int_n;
    int int_scanf_val;

    //Affichage de la valeur avant sa saisie
    printf("La valeur 'n' est égale à  %d\n",int_n);

    printf("Veuillez saisir un entier : \n");
    int_scanf_val = scanf("%d",&int_n);

    while(int_scanf_val == 0){
        fprintf(stderr,"Saisie utilisateur incorrecte\n");
        printf("Entrer une nouvelle valeur : \n");
        //Vide le buffer
        emptyBuffer(); 
        //Redemande la valeur pour int_n
        int_scanf_val = scanf("%d",&int_n);
    }  

    //Affichage de la valeur après sa saisie
    printf("La valeur 'n' est égale à  %d\n\n",int_n);
    
    //Exécution de la procédure bidon
    bidon();
    
     //Affichage de la valeur après sa saisie et après la fonction bidon
    printf("La valeur 'n' est égale à  %d\n\n",int_n);

    return (0);
}


void emptyBuffer(void) {
  char c;
  while (((c = getchar()) != '\n') && (c != EOF));
}


void bidon(void){
    int int_n;
    int int_scanf_val;

    //Affichage de la valeur avant sa saisie
    printf("La valeur 'n' est égale à  %d\n",int_n);

    printf("Veuillez saisir un entier : \n");
    int_scanf_val = scanf("%d",&int_n);

    while(int_scanf_val == 0){
        fprintf(stderr,"Saisie utilisateur incorrecte\n");
        printf("Entrer une nouvelle valeur : \n");
        // Vide le buffer
        emptyBuffer(); 
        int_scanf_val = scanf("%d",&int_n);
    }  
    //Affichage de la valeur après sa saisie
    printf("La valeur 'n' est égale à  %d\n\n",int_n);
}







