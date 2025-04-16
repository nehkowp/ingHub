
homme(socrate).
homme(albert).
homme(jean).
homme(paul).
homme(bertrand).
homme(louis).
homme(benoit).

% règle : si une personne est un homme,
% alors elle est mortelle
mortel(X) :-
    homme(X);femme(X).



femme(germaine).
femme(christiane).
femme(simone).
femme(marie).
femme(sophie).

% nommer les prédicats arg1_arg2_..._argn donc
% NE PAS avoir un prédicat pere(arg1,arg2)
pere_enfant(albert,jean).
pere_enfant(jean,paul).
pere_enfant(paul,bertrand).
pere_enfant(paul,sophie).
pere_enfant(jean,simone).
pere_enfant(louis,benoit).
mere_enfant(germaine,jean).
mere_enfant(christiane,simone).
mere_enfant(christiane,paul).
mere_enfant(simone,benoit).
mere_enfant(marie,bertrand).
mere_enfant(marie,sophie).


parent_enfant(X,Y) :-
    pere_enfant(X,Y);mere_enfant(X,Y).

fils_parent(X,Y) :-
    parent_enfant(Y,X),homme(X).

fille_parent(X,Y) :-
    parent_enfant(Y,X),femme(X).

grandPere_petitEnfant(X,Y) :-
    parent_enfant(X,Z),parent_enfant(Z,Y),homme(X).

grandMere_petitEnfant(X,Y) :-
    parent_enfant(X,Z),parent_enfant(Z,Y),femme(X).

frere_frereOuSoeur(X,Y) :-
    homme(X),
    parent_enfant(Z,X),
    parent_enfant(Z,Y),
    dif(X,Y).

soeur_frereOuSoeur(X,Y) :-
    femme(X),
    parent_enfant(Z,X),
    parent_enfant(Z,Y),
    dif(X,Y).



voleur(pierre).

personne_aime_objet(marie,vin).

personne_aime_objet(pierre,X) :-
    personne_aime_objet(X,vin).


voleur_vole(V,X) :-
    voleur(V),personne_aime_objet(V,X).


