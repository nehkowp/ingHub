:- use_module(library(clpfd)).

origine_destination_distance__arc(a,b,2).
origine_destination_distance__arc(b,a,2).
origine_destination_distance__arc(a,g,6).
origine_destination_distance__arc(b,e,2).
origine_destination_distance__arc(b,c,7).
origine_destination_distance__arc(g,e,1).
origine_destination_distance__arc(g,h,4).
origine_destination_distance__arc(e,f,2).
origine_destination_distance__arc(f,c,3).
origine_destination_distance__arc(f,h,2).
origine_destination_distance__arc(c,d,3).
origine_destination_distance__arc(h,d,2).

origine_destination__chemin(X,Y,ch(X,Y)) :-
    origine_destination_distance__arc(X,Y,_).

origine_destination__chemin(X,Y,ch(X,CheminXY)) :-
    origine_destination_distance__arc(X,Z,_),
    CheminXY = ch(X,CheminZY),
    origine_destination__chemin(Z,Y,CheminZY).


indice1_liste_element(1,[X|_L],X).
indice1_liste_element(N,[_|L],Elt):-
    N1 #= N-1,
    indice1_liste_element(N1,L,Elt).


liste_longueur([],0).
liste_longueur([_X|L],N):-
    N #> 0,
    N #= N1+1,
    liste_longueur(L,N1).

chemin(X,Y,[X,Y]):-
    origine_destination_distance__arc(X,Y,_).

chemin_it(X,Y,C);-
    length(C,_).

