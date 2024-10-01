/* Inclusion de la librarie stdio.h pour l'utilisation de printf() */
#include <stdio.h>

/**
 * \file exo3.c
 * \author Paul Brechenmacher
 * \version 0.1 TP 2 Programmation C Exerice 3
 * \date 25 Septembre 2024
 * \brief Saisir les informations d'une personne
*/


/** 
 * \fn main(int argc, char** argv)
 * \author Paul Brechenmacher
 * \version 0.1 TP2 Fonction principale saisie d'une personne 
 * \date 1 Octobre  2024
 * \brief Saisie d'une personne
 * \param argc Entier donnant le nombre d'arguments utilisée lors de l'execution du programme
 * \param argv  Tableau de chaine de caractère qui représente chaque arguments donnés lors de l'execution du programme
 * \return 0 si tout c'est bien passé sinon -1
*/
int main(int argc, char** argv){
    
    int int_jour;
    int int_annee;
    char mois[29];
    char nom[29];
    char prenom[29];

    int int_scanf;


    //Affiche un message à l'utilisateur
    printf("Entrée votre prénom : \n");
    //Lit le prénom depuis l'entrée standard
    scanf("%s", prenom);

    printf("Entrée votre nom : \n");
    //Lit le nom depuis l'entrée standard
    scanf("%s", nom);

    //Affiche un message à l'utilisateur
    printf("Veuillez saisir votre date de naissance(format JJ mois AAA): \n");
    //Lit le jour depuis l'entrée standard
    int_scanf = scanf("%d", &int_jour);
   
    // Vérifie si la saisie n'est pas un entier
    if(int_scanf == 0){
        printf("Erreur de saisie jour de naissance\n");
        return -1;
    }

    //Lit le mois depuis l'entrée standard
    scanf("%s", mois);

    //Lit l'année depuis l'entrée standard
    int_scanf = scanf("%d", &int_annee);
    // Vérifie si la saisie n'est pas un entier
    if(int_scanf == 0){
        printf("Erreur de saisie année de naissance\n");
        return -1;
    }

    //Affiche la date de naissance de la personne
    printf("Prénom : %s\n", prenom);
    printf("Nom : %s\n", nom);
    printf("Date de naissance : %d %s %d\n", int_jour, mois, int_annee);

    //Retourne la valeur 0
    return (0);
}

