#ifndef __ROOT_H_
#define __ROOT_H_

#include <math.h>
#include <stdio.h>

/**
 * \file root.h
 * \author Paul Brechenmacher
 * \version 0.1
 * \date 24 Octobre 2024
 * \brief Déclaration des fonctions pour le calcul des racines avec diverses méthodes
 * 
 * Ce fichier contient les déclarations des fonctions permettant de calculer des racines
 * en utilisant différentes méthodes (Newton, Halley et Théon).
 */

/**
 * \fn float newtonRoot(int int_nb)
 * \brief Calcul d'une racine avec la méthode de Newton
 * 
 * Cette fonction utilise la méthode de Newton pour approximer une racine d'une équation
 * donnée. Le nombre d'itérations spécifié détermine la précision de l'approximation.
 * 
 * \param int_nb Nombre d'itérations pour la méthode de Newton
 * \return Valeur approximative de la racine
 */
float newtonRoot(int int_nb);

/**
 * \fn float halleyRoot(int int_nb)
 * \brief Calcul d'une racine avec la méthode de Halley
 * 
 * Cette fonction utilise la méthode de Halley, une extension de la méthode de Newton
 * qui prend en compte la dérivée seconde, pour améliorer la vitesse de convergence.
 * 
 * \param int_nb Nombre d'itérations pour la méthode de Halley
 * \return Valeur approximative de la racine
 */
float halleyRoot(int int_nb);

/**
 * \fn float theonRoot(int int_nb)
 * \brief Calcul d'une racine avec la méthode de Théon
 * 
 * Cette fonction utilise une méthode attribuée à Théon pour approximer une racine
 * d'une équation. Elle effectue un nombre donné d'itérations pour affiner l'approximation.
 * 
 * \param int_nb Nombre d'itérations pour la méthode de Théon
 * \return Valeur approximative de la racine
 */
float theonRoot(int int_nb);

#endif
