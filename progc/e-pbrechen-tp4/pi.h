#ifndef __PI_H_
#define __PI_H_

#include <math.h>
#include <stdlib.h>

/**
 * \file pi.h
 * \author Paul Brechenmacher
 * \version 0.1
 * \date 24 Octobre 2024
 * \brief Déclaration des fonctions d'approximation de Pi
 * 
 * Ce fichier contient les déclarations des fonctions permettant de calculer des approximations 
 * de Pi à l'aide de différentes méthodes (méthode du disque, méthode de Sangamagrama, et méthode de Wallis).
 */

/**
 * \def RAYON
 * \brief Constante définissant le rayon du cercle utilisé dans certaines méthodes d'approximation de Pi
 */
#define RAYON 10

/**
 * \fn float disquePi(int int_nbPoints)
 * \brief Approximation de Pi avec la méthode du disque
 * 
 * Cette fonction génère des points aléatoires dans un carré et compte ceux qui tombent
 * dans un cercle inscrit dans ce carré. Le rapport des points dans le cercle
 * par rapport au total des points est utilisé pour approximer Pi.
 * 
 * \param int_nbPoints Nombre de points à générer pour l'approximation
 * \return La valeur approximative de Pi
 */
float disquePi(int int_nbPoints);

/**
 * \fn float sangamagramaPi(int int_nb)
 * \brief Approximation de Pi avec la méthode de Sangamagrama
 * 
 * Cette fonction calcule une approximation de Pi en utilisant la formule
 * de Sangamagrama, une série rapide pour calculer Pi.
 * 
 * \param int_nb Nombre d'itérations pour la série
 * \return La valeur approximative de Pi
 */
float sangamagramaPi(int int_nb);

/**
 * \fn float wallisPi(int int_nb)
 * \brief Approximation de Pi avec la méthode de Wallis
 * 
 * Cette fonction calcule une approximation de Pi en utilisant le produit
 * infini de Wallis, basé sur une série de fractions.
 * 
 * \param int_nb Nombre d'itérations pour le produit infini
 * \return La valeur approximative de Pi
 */
float wallisPi(int int_nb);

#endif
