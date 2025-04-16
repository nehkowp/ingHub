:- use_module(library(clpfd)).

%savoir faire le include en prolog norlmal pour exam 

sup10(X):-
    X#>10.


sup(X,Y):-
    Y > X.

add(Z,X,Y) :-
    Y #= X+Z.

plus(X,Y,Z):-
    Z#=X+Y.

frere(toto,titi).
frere(toto,tutu).


qs([],[]).

qs([P|L],LS):-
    partition(sup(P),L, PG,PP),
    qs(PG,PGT),
    qs(PP,PPT),
    append(PPT,[P|PGT],LS).