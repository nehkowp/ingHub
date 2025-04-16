:- use_module(library(clpfd)).

pb(Struct):-createListe(Struct, 3,2),faits(Struct).
faits(Struct) :-
        avant3([toto,_],[_,rouge],Struct),
        avant3([lolo,jaune],[_,vert],Struct).
createListe(L,NbLst,NbElt):-length(L,NbLst), createListe(L,NbElt).
createListe([],_).
createListe([L1|R],NbElt):-length(L1,NbElt), createListe(R,NbElt).
avant3(X,Y,[X,Y,_]).
avant3(X,Y,[X,_,Y]).
avant3(X,Y,[_,X,Y]).

avant(X,Y,L):-
    nth1(I,L,X),
    nth1(J,L,Y),
    I#<J.