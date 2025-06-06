suma([], 0).

suma([Y|Resto], X):-
    suma(Resto, X1),
    X is X1 + Y.

/*
[1,2,3]
X3 = 0
X2 = 0 + 3 = 3
X1 = 3 + 2 = 5
X = 5 + 1 = 6
*/

/*
?- suma([1, 2, 3], X).
X = 6.

?- suma([1, 2, 3, 5], X).
X = 11.
*/