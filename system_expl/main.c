#include <stdio.h>
#include <sys/types.h>
#include <unistd.h>
#include <stdlib.h>
#include <sys/wait.h>

int main() {
    int status;
    pid_t p;

    int nombre = 3;
    float decimal = 3.14;

    
     for (int i = 0; i < 4; i++) {
        p = fork();

        switch (p) {
            case 0: // Processus fils
                // printf("Nombre :  %d\n",nombre);
                // printf("Décimal : %f\n",decimal);
                // printf("Adresse Nombre :  %p\n",&nombre);
                // printf("Adresse Décimal : %p\n",&decimal);

                printf("\n\nValeur du fork est %d\n",getpid());

                printf("Je suis le fils numéro %d: mon PID est %d et mon PPID est %d\n",i, getpid(), getppid());
                sleep(1);  /* sleep for 1 second */


                exit(getpid());

            case -1: // Erreur lors de la création du processus
                perror("Erreur de creation de processus avec fork");
                exit(-1);

            
        }
     }

        printf("Je suis le pere : mon PID est %d et mon PPID est %d\n", getpid(), getppid());
        

        printf("Nombre :  %d\n",nombre);
        printf("Décimal : %f\n",decimal);
        printf("Adresse Nombre :  %p\n",&nombre);
        printf("Adresse Décimal : %p\n",&decimal);

        printf("PARENT: I will wait for my child to exit.\n");
        for (int i = 0; i < 4; i++) {
            pid_t child_pid = wait(&status);  // Attendre la fin de chaque fils
            if (WIFEXITED(status)) {
                printf("Père : Mon fils avec le PID %d s'est terminé avec le code de sortie %d\n", child_pid, WEXITSTATUS(status));
            }
        }

    printf("Père : Tous mes fils sont terminés.\n");


    return 0;
}
