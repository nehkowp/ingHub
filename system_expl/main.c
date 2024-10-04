#include <stdio.h>
#include <sys/types.h>
#include <unistd.h>
#include <stdlib.h>
#include <sys/wait.h>

int main() {
    int retval, status;
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

                // // Afficher le PID du père du processus
                // printf("Le numéro du père du processus (PPID) est : %d\n", getppid());

                // // Afficher l'UID réel du processus
                // printf("L'UID fils réel du processus (UID) est : %d\n", getuid());

                // // Afficher l'UID effectif du processus
                // printf("L'UID fils effectif du processus (EUID) est : %d\n", geteuid());

                // // Afficher le GID réel du processus
                // printf("Le GID fils réel du processus (GID) est : %d\n", getgid());

                // // Afficher le GID effectif du processus
                // printf("Le GID fils effectif du processus (EGID) est : %d\n", getegid());

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

        // Afficher le PID du père du processus
        // printf("Le numéro du père du processus père (PPID) est : %d\n", getppid());

        // // Afficher l'UID réel du processus
        // printf("L'UID réel  du processus père (UID) est : %d\n", getuid());

        // // Afficher l'UID effectif du processus
        // printf("L'UID effectif du processus père (EUID) est : %d\n", geteuid());

        // // Afficher le GID réel du processus père
        // printf("Le GID  réel du processus père (GID) est : %d\n", getgid());

        // // Afficher le GID effectif du processus père
        // printf("Le GID effectif du processus père (EGID) est : %d\n", getegid());

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
