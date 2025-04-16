:- use_module(library(clpfd)).

% https://www.swi-prolog.org/man/clpfd.html

% TP Calcul

% suite de Fibonacci

% f(0) = 0, f(1) = 1, f(n) = f(n-1) + f(n-2)

% Cas de base
f(0, 0).
f(1, 1).

% Cas récursif
f(N, R) :-
    N #> 1,
    N1 #= N - 1,
    N2 #= N - 2,
    f(N1, R1),
    f(N2, R2),
    R #= R1 + R2.

%TODO

% plus grand diviseur commun

% pgcd avec soustraction

% pgcd(n,n)=n,
% pgcd(n1,n2)=pgcd(n1,n2-n1) si n1 < n2
% pgcd(n1,n2)=pgcd(n1-n2,n2) si n1 > n2


pgcd(N1, N2, N1):-
  N1 #= N2.


pgcd(N1,N2,R) :-
  N1 #> 0, N2 #> 0,
  N2 #> N1,
  N3#=N2-N1,
  pgcd(N1,N3,R).

pgcd(N1,N2,R) :-
  N1 #> 0, N2 #> 0,
  N1 #> N2,
  N3 #=N1-N2,
  pgcd(N3,N2,R).

%TODO

% Exemples du cours sur les listes

% longueur d'une liste

% cas de base

liste_longueur([],0).

% cas général

liste_longueur([_X|L],N) :-   % <-
    liste_longueur(L,N1),
    N #= N1+1.

/*
 lecture déclarative :
 SI L a pour longueur N1
   ET que N = N1+1

 ALORS
   la liste L précédée de l'élément _X a pour longueur N
*/

% power of prolog

% une liste est soit :
%   - une liste vide notée [] ;
%   - contituée d'un élément X et d'un reste (ou queue) R.
%     Cette liste est notée [X|R].


% longueur d'une liste

% cas de base

liste_longueur([],0).

/*
 lecture déclarative :

 La liste vide a pour longueur 0.
*/

% cas général

liste_longueur([_X|L],N) :-   % <-
    N #>= 0,
    liste_longueur(L,N1),
    N #= N1+1.


/*
 lecture déclarative :
 SI L a pour longueur N1
   ET que N = N1+1

 ALORS
   la liste L précédée de l'élément _X a pour longueur N
*/

% power of prolog


% pas de gestion explicite de la mémoire/pas d'espace à réserver
% ?- L=[a,b,c].

% pas de typage/tous les éléments peuvent être de type différent
% atome ou variable
% ?- L=[a,1,3.14,X].

% appartenance   member

membre_liste(X,[X|_L]).

membre_liste(X,[_Y|L]) :-
    membre_liste(X,L).


% nieme   nth0 nth1 https://www.swi-prolog.org/pldoc/man?predicate=nth0/3

indice1_liste_element(1,[X|_L],X).

indice1_liste_element(N,[_X|L],X) :-
    N #> 1,
    N1 #= N-1,
    indice1_liste_element(N1,L,X).  

    
    

% TP sur les listes

% dernier élément de la liste


mylast(X,[X]).
mylast(X,[_X|L]):-
    mylast(X,L).



% avant dernier élément de la liste

% myavantlast(X,[X,Z]).
% myavantlast(X,[_X|L]):-
%   myavantlast(X,L).


% liste inversée (utliser un accumulateur)

%TODO

invert_list(L,LR):-
  invert_list(L,LR,[]).

invert_list([],LR,Acc):-
  LR=Acc.
  

invert_list([X|L],LR,Acc) :-
  invert_list(L,LR,[X|Acc]).


% palindrome

palindrome(L) :-
  invert_list(L,R),
  L=R.


:- set_prolog_flag(double_quotes,chars).


%TODO



%liste compressée (supression des doublons consécutifs, codage RLE)