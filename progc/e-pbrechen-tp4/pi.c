#include "pi.h"


float disquePi(int int_nbPointsTotal) {
    float float_pi;
    int int_i;
    float float_x; /**< Coordonnée x du point généré aléatoirement */
    float float_y; /**< Coordonnée y du point généré aléatoirement */

    int int_nbPointCercle = 0; /**< Nombre de points qui tombent dans le cercle */

    /* Boucle qui génère des points aléatoires */
    for(int_i = 0; int_i < int_nbPointsTotal; int_i++) {
        /* Génération des coordonnées aléatoires dans le carré [0, RAYON] */
        float_x = (float)rand() / (float)(RAND_MAX / RAYON);  /**< Coordonnée x dans [0, RAYON] */
        float_y = (float)rand() / (float)(RAND_MAX / RAYON);  /**< Coordonnée y dans [0, RAYON] */

        /* Si le point est dans le cercle (distance à l'origine < RAYON), on l'ajoute */
        if(sqrt(pow(float_x, 2) + pow(float_y, 2)) < RAYON) {
            int_nbPointCercle++;  /**< Incrémenter le nombre de points dans le cercle */
        }
    }

    /* Approximation de Pi : rapport entre les points dans le cercle et le total, multiplié par 4 */
    float_pi = 4 * (int_nbPointCercle * 1.0 / int_nbPointsTotal * 1.0);
    return (float_pi);
}


float sangamagramaPi(int int_nb) {
    float float_pi;
    int int_k;

    float_pi = 0; /**< Initialisation de la somme pour la série */

    /* Boucle pour calculer la série alternée de Sangamagrama */
    for(int_k = 0; int_k < int_nb; int_k++) {
        /* La série est une somme alternée avec (-1)^k / (2k + 1) */
        float_pi = float_pi + pow(-1, int_k) / ((2 * int_k) + 1);
    }

    /* Multiplier par 4 pour obtenir la valeur approximative de Pi */
    float_pi = 4 * float_pi;

    return (float_pi); 
}


float wallisPi(int int_nb) {
    float float_pi;
    int int_k;

    float_pi = 1; /**< Initialisation du produit infini */

    /* Boucle pour calculer le produit de Wallis */
    for(int_k = 1; int_k < int_nb; int_k++) {
        /* Le produit de Wallis est basé sur (2k)^2 / [(2k)^2 - 1] */
        float_pi = float_pi * pow(2 * int_k, 2) / (pow(2 * int_k, 2) - 1);
    }

    /* Multiplier par 2 pour obtenir la valeur approximative de Pi */
    float_pi = 2 * float_pi;

    return (float_pi); 
}
