
:- use_module(library(clpfd)).

avant(X,Y,L):-
    nth1(I,L,X),
    nth1(J,L,Y),
    I#<J.

createListe(L,NbLst,NbElt):-length(L,NbLst), createListe(L,NbElt).
createListe([],_).
createListe([L1|R],NbElt):-length(L1,NbElt), createListe(R,NbElt).


voisin(X,Y,L):-
    nth1(I,L,X),
    nth1(J,L,Y),
    abs(I-J)#=1.

apres(X,Y,L):-
    nth1(I,L,X),
    nth1(J,L,Y),
    I#=J+1.


einstein(S):-
    createListe(S,5,5),
    S=[[_,norvegien,_,_,_],_,_,_,_], %p1
    voisin([_,norvegien,_,_,_],[bleu,_,_,_,_],S), %p2
    S=[_,_,[_,_,_,lait,_],_,_], %p3
    member([rouge,anglais,_,_,_],S), %p4
    member([verte,_,_,cafe,_],S), %p5
    member([jaune,_,_,_,kool],S), %p6
    apres([blanche,_,_,_,_],[verte,_,_,_,_],S), %p7
    member([_,espagnol,chien,_,_],S),
    member([_,ukrainien,_,the,_],S),
    member([_,japonais,_,_,craven],S),
    member([_,_,escargot,_,oldgold],S),
    member([_,_,_,vin,gitane],S),
    voisin([_,_,_,_,chesterfield],[_,_,renard,_,_],S),
    voisin([_,_,_,_,kool],[_,_,cheval,_,_],S).




quiboiteau(Q,S):-
    einstein(S),
    member([_,Q,_,eau,_],S).

quiazebre(Q,S):-
    einstein(S),
    member([_,Q,zebre,_,_],S).

    
    

    



