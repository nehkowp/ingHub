:- use_module(library(clpfd)).



%liste des entiers entre deux bornes :
%?- borneInf_borneSup_liste(3,7,L).


%TODO V1 (recursif)
%L=[3,4,5,6,7].

borneInfo_borneSup_liste(B,B,[B]).

borneInfo_borneSup_liste(A,B,[A|L]):-
    N#=A+1,
    borneInfo_borneSup_liste(N,B,L).

%TODO V2 (avancée)

borneInfo_borneSup_liste_findall(Bi,Bs,R):-
    findall(V,between(Bi, Bs,V),R).
    
    

%liste des diviseurs d'un nombre entier
%?-?- entier_listeDiviseurs(7,L).

entier_listeDiviseursA(_N,[1],1).

entier_listeDiviseursA(N,[A|L],A):-
    A#>1,
    0#=N mod A,
    AM1#=A-1,
    entier_listeDiviseursA(N,L,AM1).

entier_listeDiviseursA(N,L,A):-
    A#>1,
    AM1#=A-1,
    entier_listeDiviseursA(N,L,AM1).

entier_listeDiviseurs(N,L):-
    entier_listeDiviseursA(N,L,N).

entier_listeDiviseursT(N,L):-
        entier_listeDiviseursT(N,N,L).

entier_listeDiviseursT(_,1,[1]).
entier_listeDiviseursT(N,D,[D|R]):-
    D#>1,
    DM1 #= D-1,
    N mod D #=0,
    entier_listeDiviseursT(N,DM1,R).

entier_listeDiviseursT(N,D,R):-
    D#>1,
    DM1#=D-1,
    N mod D #>0,
    entier_listeDiviseursT(N,DM1,R).


% liste des nombres premiers inférieurs à une borne
%?- borneSup_listePremiers(7,L).
%L=[1,2,3,5,7]

est_premier(N):-
    entier_listeDiviseursT(N,L),
    length(L,2).
    
%L=[1,7]
 
%TODO


%liste des nombres premiers inférieurs à une borne 
%?- borneSup_listePremiers(7,L).
%L=[1,2,3,5,7] 

%TODO V1 (include)

borneSup_listePremiers(Bs,L):-
    borneInfo_borneSup_liste_findall(1,Bs,LI),
    include(est_premier, LI, L).
        

%TODO V2 (findall)

borneSup_listePremiers_ter(Bs,L):-
    findall(E,(between(1,Bs,E),est_premier(E)), L).
    

%Tri séléction

%TODO


liste_min_reste([Min],Min,[]).

% + - -
liste_min_reste([X1,X2|L],X1,[X2|L]):- %Résultat
    X1#< Min,
    liste_min_reste([X2|L],Min,_). % Entrée / oui c'est bizzare mais X1=Min dans le résultat

liste_min_reste([X1,X2|L],Min,[X1|Reste]):-
    X1#> Min,
    liste_min_reste([X2|L],Min,Reste).

tri_selection([],[]).
tri_selection(L,[Min|LSR]):-
    liste_min_reste(L,Min,Reste),
    tri_selection(Reste,LSR).

% + + -
insert_liste(E,[],[E]).

insert_liste(E,[X|L],[E,X|L]):-
    E #< X.

insert_liste(E,[X|L],[X|R]):-
    E #> X,
    insert_liste(E,L,R).

tri_insertion([],[]).

tri_insertion([X|L],LS):-
    tri_insertion(L,S),
    insert_liste(X,S,LS).
    

    





%Tri insertion

%TODO

%Tri fusion

%TODO

%Tri rapide

%TODO
