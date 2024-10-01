

/* Inclusion de la librarie stdio.h pour l'utilisation de printf() */
#include <stdio.h>

/**
 * \file exo6.c
 * \author Paul Brechenmacher
 * \version 0.1 TP 2 Programmation C Exercice 6
 * \date 25 Septembre 2024
 * \brief Programme qui demande deux nombres à l’utilisateur et l’informe ensuite si leur produit est négatif ou positif.
*/



/** 
 * \fn main(int argc, char** argv)
 * \author Paul Brechenmacher
 * \version 0.1 Fonction principale saisie de deux entiers et affichage du signe du produit
 * \date 1 Octobre  2024
 * \brief Écrire un programme qui demande deux nombres à l’utilisateur et l’informe ensuite si leur produit est négatif ou positif. Attention toutefois : on ne doit pas calculer le produit
des deux nombres.
 * \param argc Entier donnant le nombre d'arguments utilisée lors de l'execution du programme
 * \param argv  Tableau de chaine de caractère qui représente chaque arguments donnés lors de l'execution du programme
 * \return 0 si tout c'est bien passé sinon -1
*/
int main(int argc, char** argv){

    int int_jour;
    int int_mois;
    int int_annee;
    int int_bissextile;

    int int_scanf;

    printf("Veuillez saisir une date(format JJ MM AAA): \n");
    //Lit le jour depuis l'entrée standard
    int_scanf = scanf("%d", &int_jour);
   
    // Vérifie si la saisie n'est pas un entier
    if(int_scanf == 0){
        printf("Erreur de saisie jour\n");
        return -1;
    }

    //Lit le mois depuis l'entrée standard
    int_scanf = scanf("%d", &int_mois);

    if(int_scanf == 0){
        printf("Erreur de saisie mois \n");
        return -1;
    }
    //Lit l'année depuis l'entrée standard
    int_scanf = scanf("%d", &int_annee);

    if(int_scanf == 0){
        printf("Erreur de saisie année \n");
        return -1;
    }
    
    printf("La date saisie est : %d/%d/%d\n",int_jour,int_mois,int_annee);
    
    // Si l'année est bissextile (Divisible par 4 ou 400) mais pas divisible par 100 :
    if(((int_annee%4) == 0 && int_annee%100 != 0) || (int_annee%400 == 0)){
        printf("L'année %d est bissextile\n",int_annee);
        int_bissextile = 1;
    }else{
        // Sinon pas bissextile
        printf("L'année %d n'est pas bissextile\n",int_annee);
        int_bissextile = 0;
    }

    switch (int_mois) {
        // Si le mois a 31 jours (Janvier,Mars,Mai,Juillet,Aout,Octobre) sauf Décembre
        case 1:
        case 3:
        case 5:
        case 7:
        case 8:
        case 10:
            //Si dernier jour du mois passer au mois suivant et revenir au premier jour
            if(int_jour == 31){
                int_mois++;
                int_jour = 1;
            //Sinon ajouter un jour
            }else{
                int_jour++;
            }
            break;
        // Si Février
        case 2:
            // Si bissextile 
            if(int_bissextile){
                // Si 29 février passer au mois suivant et revenir au premier jour
                if(int_jour == 29){
                    int_mois++;
                    int_jour = 1;
                // Sinon rajouter un jour
                }else {
                    int_jour++;
                }
            }else{
                // Si 28 février passer au mois suivant et revenir au premier jour
                if(int_jour == 28){
                    int_mois++;
                    int_jour = 1;
                // Sinon rajouter un jour
                }else {
                    int_jour++;
                }
            }
        // Si le mois à 30 jours (Avril,Juin,Septembre,Novembre)
        case 4:
        case 6:
        case 9:
        case 11:
            // Si dernier jour passer au mois suivant et revenir au premier jour
            if(int_jour == 30){
                int_mois++;
                int_jour = 1;
            //Sinon rajouter un jour
            }else {
                int_jour++;
            }
            break;
        // Si dernier mois (Décembre)
        case 12:
            // Si dernier jour passer à l'année suivante et revenir au premier jour et mois
            if(int_jour == 31){
                int_mois = 1;
                int_jour = 1;
                int_annee++;
            // Sinon rajouter un jour
            }else {
                int_jour++;
            }
            break;
        
    }
    //Affichage jour suivant
    printf("Le jour suivant est : %d/%d/%d\n",int_jour,int_mois,int_annee);

    return (0);
    }


