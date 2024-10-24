#include "fonctions.h"

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


