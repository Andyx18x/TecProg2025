% Hechos

padre(leoncio, alberto).
padre(leoncio, geronimo).
padre(alberto, juan).
padre(alberto, luis).
padre(geronimo, luisa).

% Reglas

hermano(A, B) :- padre(P, A), padre(P, B), A \= B.
nieto(B, A) :- padre(A, P), padre(P, B).

% Consultas

/*
?- padre(alberto,luis).
true.

?- padre(luis,alberto).
false.

?- hermano(X,luis).
X = juan ;
false.

?- nieto(luisa,X).
X = leoncio ;
false.

?- nieto(X,Y).
X = juan,
Y = leoncio ;
X = luis,
Y = leoncio ;
X = luisa,
Y = leoncio ;
false. 
*/