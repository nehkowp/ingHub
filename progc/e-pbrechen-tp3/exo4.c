/* Inclusion de la librarie stdio.h pour l'utilisation de printf() */
#include <stdlib.h>
#include <stdio.h>


/**
    \def ERREUR SAISIE
    Code d'erreur associé à une mauvaise saisie utilisateur
    \def RED
    Code couleur ANSI Rouge
    \def GREEN
    Code couleur ANSI Vert
    \def WHITE
    Code couleur ANSI Blanc
    \def YELLOW
    Code couleur ANSI Jaune
    \def RESET
    Code couleur ANSI Aucune couleur
*/
#define ERREUR_SAISIE -1
#define RED "\e[1;31m"
#define GREEN "\e[1;32m"
#define WHITE "\e[1;37m"
#define RESET "\e[0m"
#define YELLOW "\e[1;33m"


/**
 * \file exo4.c
 * \author Paul Brechenmacher
 * \version 0.1 TP3 Programmation C Exercice 4
 * \date 18 Octobre 2024
 * \brief Saisie et affichage divers via menu d'options
 */


/**
 * \fn void emptyBuffer(void)
 * \author Peio Loubière
 * \version 0.1 Fonction de nettoyage du buffer
 * \date 19 Novembre 2020
 * \brief Vide le buffer après une saisie incorrecte
 */
void emptyBuffer(void);


/** 
 * \fn int saisieEntier(void)
 * \author Paul Brechenmacher
 * \version 0.1 Fonction Saisie d’un entier
 * \date 18 Octobre 2024
 * \brief Saisie d'un entier par l'utilisateur
 * \return L'entier saisi par l'utilisateur
*/
int saisieEntier(void);


/**
 * \fn void affichageTriangle(int n)
 * \author Paul Brechenmacher
 * \version 0.1 Affichage d'un triangle
 * \date 18 Octobre 2024
 * \brief Affiche un triangle en fonction de la taille donnée par l'utilisateur
 * \param int_n Taille du triangle (nombre de lignes)
 */
void affichageTriangle(int int_n);


/**
 * \fn void tableMultiplication(int n)
 * \author Paul Brechenmacher
 * \version 0.1 Table de multiplication
 * \date 18 Octobre 2024
 * \brief Affiche la table de multiplication d'un nombre donné
 * \param int_n Le nombre pour lequel afficher la table de multiplication
 */
void tableMultiplication(int int_n);


/**
 * \fn int taille_entier(int int_n)
 * \author Paul Brechenmacher
 * \version 0.1 Calcul de la taille d'un entier
 * \date 18 Octobre 2024
 * \brief Calcule le nombre de chiffres dans un entier
 * \param int_n L'entier dont on veut connaître le nombre de chiffres
 * \return Le nombre de chiffres de l'entier
 */
int taille_entier(int int_n);


/**
 * \fn int power(int int_n, int int_p)
 * \author Paul Brechenmacher
 * \version 0.1 Puissance d'un nombre
 * \date 18 Octobre 2024
 * \brief Calcule la puissance d'un entier
 * \param int_n Le nombre à élever
 * \param int_p La puissance à laquelle on veut élever le nombre
 * \return Le résultat de la puissance
 */
int power(int int_n, int int_p);


/**
 * \fn void estArmstrong(int n)
 * \author Paul Brechenmacher
 * \version 0.1 Vérification d'un nombre d'Armstrong
 * \date 18 Octobre 2024
 * \brief Vérifie si un nombre est un nombre d'Armstrong
 * \param int_n Le nombre à vérifier
 */
void estArmstrong(int int_n);


/** 
 * \fn main(int argc, char** argv)
 * \author Paul Brechenmacher
 * \version 0.1 Fonction principale offrant un menu d'options
 * \date 18 Octobre 2024
 * \brief Menu interactif pour afficher des triangles, des tables de multiplication et vérifier des nombres d'Armstrong
 * \param argc Entier donnant le nombre d'arguments utilisée lors de l'exécution du programme
 * \param argv Tableau de chaînes de caractères représentant les arguments donnés lors de l'exécution du programme
 * \return 0 si tout s'est bien passé
 */
int main(int argc, char** argv){
    
    int int_choix;
    int int_n;
    // Variable choix initialisée à -1 pour rentrer dans la boucle.
    int_choix = -1;
    printf("%d\n",taille_entier(0));
    // Tant que l'utilisateur ne demande pas de quitter
    while (int_choix != 0) {
        
        // Affichage du menu
        printf(WHITE"\n\nMenu des options :\n");
        printf(GREEN"[1] Affichage Triangle\n");
        printf("[2] Affichage Table Multiplication\n");
        printf("[3] Affichage Nombre Armstrong\n"RESET);
        printf(RED"[0] Quitter le programme\n"RESET);

        //Demande du choix à l'utilisateur
        int_choix = saisieEntier();

        //Efface le terminal pour une meilleure interface utilisateur
        system("clear");
        
        switch (int_choix) {
            case 0: // Quitter
                printf(WHITE"Au Revoir\n"RESET);
                break;
            case 1: // Affichage Triangle
                printf(WHITE"Vous avez choisi l'option 1 : Affichage Triangle\n");
                int_n = saisieEntier();
                affichageTriangle(int_n);
                break;
            case 2: // Table de multiplication
                printf(WHITE"Vous avez choisi l'option 2 : Affichage Table Multiplication\n");
                int_n = saisieEntier();
                tableMultiplication(int_n);
                break;
            case 3: // Armstrong
                printf(WHITE"Vous avez choisi l'option 3 : Affichage Nombre Armstrong\n");
                int_n = saisieEntier();
                estArmstrong(int_n);
                break;
            default:
                printf(YELLOW"Erreur : choix invalide. Veuillez entrer un chiffre entre 1 et 3. Ou quitter avec 0\n"RESET);
                break;
        }
    }
    return (0);
}

void emptyBuffer(void) {
    char c;
    while (((c = getchar()) != '\n') && (c != EOF));
}


int saisieEntier(void){
    int int_n;
    int int_scanf_val;
    printf("Veuillez saisir un entier : \n");
    int_scanf_val = scanf("%d",&int_n);

    //Tant que l'utilisateur ne saisie pas une valeur correcte, on lui redemande une valeur
    while(int_scanf_val == 0){
        //Envoie erreur dans le canal erreur
        fprintf(stderr,"Saisie utilisateur incorrecte\n");
        printf("Entrer une nouvelle valeur : \n");
        // Vide le buffer
        emptyBuffer(); 
        int_scanf_val = scanf("%d",&int_n);
    }

    return (int_n);
}


void affichageTriangle(int int_n){
    int int_ligne;
    int int_nb_symbols;
    int int_nb_espace;
    int int_index;

    //Boucle pour afficher chaque ligne 
    for(int_ligne = 1; int_ligne <= int_n; int_ligne++){

        // Calcule le nombre de symboles à écrire pour la ligne actuelle
        int_nb_symbols = (int_ligne * 2) - 1;
        // Calcule le nombre d'espaces à écrire avant les symboles
        int_nb_espace = (int_n - int_ligne);

        //Boucle sur le nombre d'espaces à afficher
        for(int_index = 0; int_index < int_nb_espace; int_index++){
            printf(" ");
        }

        //Boucle sur le nombre de symboles à afficher
        for(int_index = 0; int_index< int_nb_symbols; int_index++){
            printf("*");
        }

        //Passe à la ligne suivante
        printf("\n");
    }
}


void tableMultiplication(int int_n){
    int int_index;
    int int_resultat;

    printf("Table de multiplication de %d : \n",int_n);
    // On répète 10 fois l'opération pour afficher chaque opération de la table
    for(int_index = 1; int_index <= 10; int_index++){
        int_resultat = int_index * int_n;
        // On affiche le résultat pour chaque valeur de la table de 1 à 10
        printf("%d x %d = %d\n",int_index,int_n,int_resultat);
    }
}


int taille_entier(int int_n){
    int int_taille;

    // Si int_n est 0, retourne 1 car il s'agit d'un chiffre
    if (int_n == 0) {
        return (1);
    }

    int_taille = 0;
    // Tant que supérieur à 0, on enleve un chiffre au nombre en le divisant par 10
    while (int_n > 0) {
        int_taille++; // On ajoute 1 à la taille
        int_n = int_n / 10; // On passe au chiffre suivant
    }
    return (int_taille);
}

int power(int int_n, int int_p){
    int int_resultat;
    int int_index;

    int_resultat = 1;
    // Répéter autant de fois selon la puissance choisie 
    for(int_index = 0; int_index < int_p; int_index++){
        // On multiplie le résultat précedent avec le nombre de départ
        int_resultat = int_resultat * int_n;
    }
    return (int_resultat);
}


void estArmstrong(int int_n){
    int int_taille;
    int int_nb;
    int int_somme_armstrong;

    int_somme_armstrong = 0;
    // Calcule la taille de l'entier int_n pour les puissance
    int_taille = taille_entier(int_n);

    //Variable pour garder en mémoire int_n pour la comparaison avec la somme
    int_nb = int_n;

    // Tant que le dernier chiffre n'est pas 0 ou que le nombre n'est pas divisible par 10
    /*
        Premier cas pour voir si le parsing du nombre est fini
        Deuxieme cas pour éviter l'erreur si c'est le reste de la division est bien 0 
        mais que on est pas encore arrivé à 0 
    */
    while (int_nb > 0) {
        int_somme_armstrong = int_somme_armstrong + power(int_nb%10,int_taille);
        int_nb = int_nb / 10;
    }

    // Si la somme des chiffres avec la puissance est égale au nombre alors nombre d'armstrong
    if(int_somme_armstrong == int_n){
        printf("%d est un nombre d'Armstrong\n",int_n);
    }else{ // Sinon il ne l'est pas
        printf("%d n'est pas un nombre d'Armstrong\n",int_n);
    }
}
