# doxygen Doxyfile

# firefox ./out/html/index.html

clear

echo ""
echo "Entrez le numéro de l'exercice que vous voulez exécuter :"
read exo

gcc -Wall exo$exo.c -o exe && ./exe
