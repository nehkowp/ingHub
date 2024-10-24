#ifndef __FONCTIONS_H_
#define __FONCTIONS_H_

#include <stdio.h>

/**
 * \file fonctions.h
 * \author Paul Brechenmacher
 * \version 0.1
 * \date 24 Octobre 2024
 * \brief Déclarations des fonctions utilitaires pour la saisie d'entier et la gestion du buffer
 * 
 * Ce fichier contient les déclarations de fonctions permettant la saisie d'un entier
 * et la gestion du buffer d'entrée pour éviter les erreurs de saisie.
 */

/**
 * \fn void emptyBuffer()
 * \author Peio Loubière <peio.loubiere@cyu.fr>
 * \date Thu Nov 19 17:07:41 2020
 * \brief Vide le buffer après une saisie
 * 
 * Cette fonction permet de vider le buffer d'entrée après une saisie utilisateur incorrecte
 * pour éviter des erreurs lors des prochains appels à `scanf`. Elle lit et ignore les caractères
 * restants dans le buffer jusqu'à ce qu'il soit vide.
 */
void emptyBuffer();

/** 
 * \fn int saisieEntier(void)
 * \author Paul Brechenmacher
 * \version 0.1
 * \date 18 Octobre 2024
 * \brief Saisie d'un entier par l'utilisateur
 * 
 * Cette fonction demande à l'utilisateur de saisir un entier et vérifie la validité de l'entrée.
 * En cas de saisie incorrecte, elle redemande à l'utilisateur de saisir une valeur correcte.
 * 
 * \return L'entier saisi par l'utilisateur
 */
int saisieEntier(void);

#endif
