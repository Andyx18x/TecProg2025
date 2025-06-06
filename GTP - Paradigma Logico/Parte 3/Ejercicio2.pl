% Caso base: la lista está vacía, el contador es 0
contar(_, [], 0).

% Caso recursivo: la cabeza de la lista es igual al elemento
contar(Elem, [Elem | Resto], Cantidad) :-
    contar(Elem, Resto, CantRestante),
    Cantidad is CantRestante + 1.

% Caso recursivo: la cabeza de la lista no es igual al elemento
contar(Elem, [Otro | Resto], Cantidad) :-
    Elem \= Otro,
    contar(Elem, Resto, Cantidad).

/*
?- contar(y, [a, b, c, a, d, e, a, f, a], Cantidad).
Cantidad = 0.

?- contar(a, [a, b, c, a, d, e, a, f, a], Cantidad).
Cantidad = 4 ;
false.

?- contar(c, [a, b, c, a, d, e, a, f, a], Cantidad).
Cantidad = 1 
*/