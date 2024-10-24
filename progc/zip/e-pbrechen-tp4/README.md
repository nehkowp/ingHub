## TP4 | Compilation Séparée

# Pour créer la documentation uniquement

doxygen Doxyfile && firefox ./out/html/index.html


# Pour lancher le programme et l'exercice de votre choix:
```
sh ./tp4.sh
```

# Pour lancher le programme uniquement 

```
gcc -Wall -c main.c -o main.o
gcc -Wall -c pi.c -o pi.o
gcc -Wall -c root.c -o root.o
gcc -Wall -c fonctions.c -o fonctions.o
gcc main.o fonctions.o pi.o root.o -o exe -lm

```

