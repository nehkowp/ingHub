## TP2 | Entrées & Sorties

# Pour créer la documentation uniquement

doxygen Doxyfile && firefox ./out/html/index.html


# Pour lancher le programme et l'exercice de votre choix:
```
sh ./tp2.sh
```

# Pour lancher le programme uniquement (changer exo1 selon l'exercice)

```
gcc -Wall exo1.c -o exe && ./exe
```


# Question 2 :

Que se passe-t-il si vous entrez une lettre, à la place d’un nombre ? Même question pour
une chaîne de caractères, et pour un réel.

    Si je rentre une lettre : scanf_val = 0
    Si je rentre un chaine de caracètre : scanf_val = 0
    Si je rentre un float, la valeur prise est la partie entière, scanf_val = 1

# Question 3:

Saisissez deux entiers depuis l’entrée standard, puis affichez les. Que se passe-t-il si vous
saisissez un réel ? Comment pouvez vous vous apercevoir pendant l’éxecution que le pro-
gramme ne fonctionne pas correctement ? 

    Il prend le 3 pour le nombre 1 mais il lui reste des valeurs dans le buffer donc lors du 2e scanf,
    il reste une valeur décimal par exemple 3.14 , nb1 sera égale a 3 et .14 sera lu par le 2e scanf,
    donc la valeur du scanf ne correspond pas à un entier provoquant une erreur de saisie


