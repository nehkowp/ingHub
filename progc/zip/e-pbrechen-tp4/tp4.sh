# doxygen Doxyfile

# firefox ./out/html/index.html

clear
gcc -Wall -c main.c -o main.o -fPIC
gcc -Wall -c pi.c -o pi.o -fPIC
gcc -Wall -c root.c -o root.o -fPIC
gcc -Wall -c fonctions.c -o fonctions.o -fPIC
gcc main.o fonctions.o pi.o root.o -o exe -lm
# rm *.o

./exe


