% Caso base: una lista vacía tiene como resultado otra lista vacía
positivos([], []).

% Caso en que el número es positivo: lo incluimos en la lista de salida
positivos([X | Resto], [X | PositivosResto]) :-
    X > 0,
    positivos(Resto, PositivosResto).

% Caso en que el número no es positivo: lo descartamos
positivos([X | Resto], PositivosResto) :-
    X =< 0,
    positivos(Resto, PositivosResto).


/*
?- positivos([1, -2, 3, -4], ListaPositivos).
ListaPositivos = [1, 3] ;
false.

?- positivos([1, -2, 3, -4, 5, 9, -7], ListaPositivos).
ListaPositivos = [1, 3, 5, 9] 
*/