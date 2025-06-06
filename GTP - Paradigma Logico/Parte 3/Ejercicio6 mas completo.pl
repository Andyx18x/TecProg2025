suma_lista([], [], []). % Caso base: si ambas listas están vacías, la lista resultante también está vacía.

suma_lista([X|Resto1], [Y|Resto2], [Z|RestoSuma]) :- 
    Z is X + Y, % Suma los elementos correspondientes de las dos listas.
    suma_lista(Resto1, Resto2, RestoSuma). % Llama recursivamente con el resto de las listas.

% Verifica que las listas sean de la misma longitud.
listas_iguales_longitud([], []). % Caso base: dos listas vacías tienen la misma longitud.
listas_iguales_longitud([_|Resto1], [_|Resto2]) :- 
    listas_iguales_longitud(Resto1, Resto2). % Verifica recursivamente el resto de las listas.

% Predicado principal que combina ambas verificaciones.
sumar_listas(Lista1, Lista2, Resultado) :- 
    listas_iguales_longitud(Lista1, Lista2), % Verifica que las listas tengan la misma longitud.
    suma_lista(Lista1, Lista2, Resultado). % Calcula la suma elemento a elemento.


/*
?- suma_lista([1, -2, 3, -4], [2, 3, 1, 4], ListaSuma).
ListaSuma = [3, 1, 4, 0].

?- suma_lista([1, -2, 3, -4], [2, 3, 1, 4, 6], ListaSuma).
false.
*/
