:- use_module(library(clpfd)).

compress([], []).

compress([X],[X]).


compress([X,X|L],R):-
  compress([X|L],R).

compress([X,Y|L],[X|R]):-
  dif(X,Y),
  compress([Y|L],R).

%zip (compression RLE)
%?- zip([a,a,a,a,b,c,c,a,a,d,e,e,e,e],X).
%X = [[4,a],b,[2,c],[2,a],d,[4,e]]


fac(1,1).
fac(N,R):-
    N>1,
    NM1#=N-1,
    R#=R1*N,
    fac(NM1,R1).

%TODO


fib_acc(0,A,_,A).

fib_acc(1,_,B,B).

fib_acc(N,A,B,R):-
    N#>1,
    N1#=N-1,
    C#=A+B,
    fib_acc(N1,B,C,R).

fib(N,R) :-
    fib_acc(N,0,1,R).


%Fibonacci en recursif terminal avec 2 accumulateurs, a et b :
% suite de Fibonacci
% fonction fib_acc(n, a, b)
%    si n = 0
%        renvoyer a
%    sinon si n = 1
%        renvoyer b
%    sinon
%        renvoyer fib_acc(n - 1, b, a + b)
%
% fonction fib(n)
%   renvoyer fib_acc(n,0,1)

%TODO
