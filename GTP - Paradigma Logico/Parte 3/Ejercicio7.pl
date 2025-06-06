% Caso base: la lista vacía produce una lista vacía
eliminar_dup([], []).

% Si la cabeza ya aparece en el resto, la descartamos
eliminar_dup([X | Resto], SinDup) :-
    member(X, Resto),          
    eliminar_dup(Resto, SinDup).

% Si la cabeza NO aparece en el resto, la conservamos
eliminar_dup([X | Resto], [X | SinDupResto]) :-
    \+ member(X, Resto),        % \+ = negación
    eliminar_dup(Resto, SinDupResto).

/*
?- eliminar_dup([1, 2, 3, 1, 4, 3, 5, 6], SinDup).
SinDup = [2, 1, 4, 3, 5, 6] 
*/
