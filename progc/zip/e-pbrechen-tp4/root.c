#include "root.h"

// Fonction qui utilise la méthode de Newton pour approximer la racine carrée de 2
float newtonRoot(int int_nb) {
    float float_Un = 1; // Initialisation de l'approximation
    // Itération pour affiner l'approximation
    for (int int_i = 0; int_i < int_nb; int_i++) {
        // Mise à jour selon la méthode de Newton
        float_Un = (float_Un / 2) + (1 / float_Un);
    }
    return float_Un; // Retourne l'approximation finale
}

// Fonction qui utilise la méthode de Halley pour calculer une racine
float halleyRoot(int int_nb) {
    float float_Xn = 1; // Initialisation de l'approximation
    // Itération pour affiner l'approximation
    for (int int_i = 0; int_i < int_nb; int_i++) {
        // Mise à jour selon la méthode de Halley
        float_Xn = float_Xn * (pow(float_Xn, 2) + 6) / (3 * pow(float_Xn, 2) + 2);
    }
    return float_Xn; // Retourne l'approximation finale
}

// Fonction qui utilise la méthode de Théon pour approximer la valeur de pi
float theonRoot(int int_nb) {
    int int_Qn = 1, int_Pn = 1; // Initialisation des valeurs
    // Itération pour calculer Pn et Qn
    for (int int_i = 0; int_i < int_nb; int_i++) {
        int int_tempPn = int_Pn + 2 * int_Qn; // Mise à jour de Pn
        int_Qn = int_Pn + int_Qn; // Mise à jour de Qn
        int_Pn = int_tempPn; // Affectation de la nouvelle valeur de Pn
    }
    // Calcul final de pi
    float float_pi = (float)int_Pn / (float)int_Qn;
    return float_pi; // Retourne l'approximation de pi
}
