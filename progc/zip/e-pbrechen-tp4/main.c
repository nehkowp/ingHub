/* Inclusion des librairies nécessaires pour l'utilisation de printf() et srand() */
#include <time.h>
#include <stdio.h>
#include "pi.h"
#include "root.h"
#include "fonctions.h"

/**
 * \file main.c
 * \author Paul Brechenmacher
 * \version 0.1 TP3 Programmation C Exercice 1
 * \date 1 Octobre 2024
 * \brief Programme qui calcule des approximations de Pi et des racines en utilisant différentes méthodes
 * 
 * Ce fichier implémente une fonction principale qui utilise des méthodes d'approximation 
 * de Pi (comme les méthodes du disque, de Sangamagrama, et de Wallis) ainsi que des méthodes
 * pour le calcul de racines (Newton, Halley, et Théon).
 */

/**
 * \fn main(int argc, char** argv)
 * \author Paul Brechenmacher
 * \version 0.1
 * \date 24 Octobre 2024
 * \brief Fonction principale qui exécute les approximations de Pi et des racines
 * 
 * La fonction principale initialise un entier pour le nombre de points utilisés dans les calculs
 * et génère les approximations de Pi et des racines avec différentes méthodes. 
 * Elle affiche les résultats pour chaque méthode.
 * 
 * \param argc Nombre d'arguments passés en ligne de commande
 * \param argv Tableau de chaînes de caractères représentant les arguments
 * \return Retourne 0 si le programme s'est exécuté correctement
 */
int main(int argc, char** argv) {
    int int_precision;
    // Demande d'une saisie d'entier

    /* Initialisation du générateur de nombres aléatoires avec l'horloge système */
    srand(time(NULL));

    /* Demande un nombre à l'utilisateur, plus le nombre est grand plus l'algorithme est précis  */
    int_precision = saisieEntier();

    /* Calcul des approximations de Pi avec différentes méthodes */
    printf("Approximation de Pi avec la méthode du disque : %g\n", disquePi(int_precision));
    printf("Approximation de Pi avec la méthode de Sangamagrama : %g\n", sangamagramaPi(int_precision));
    printf("Approximation de Pi avec la méthode de Wallis : %g\n", wallisPi(int_precision));

    int_precision = saisieEntier();

    /* Calcul des racines avec différentes méthodes */
    printf("Calcul de racine de 2 avec la méthode de Newton : %g\n", newtonRoot(int_precision));
    printf("Calcul de racine de 2 avec la méthode de Halley : %g\n", halleyRoot(int_precision));
    printf("Calcul de racine de 2 avec la méthode de Théon : %g\n", theonRoot(int_precision));


    return (0);  
}
