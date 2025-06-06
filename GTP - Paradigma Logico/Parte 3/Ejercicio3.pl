cantidad([], 0).
    
cantidad([_|Resto], Elem):-
    cantidad(Resto, Elem1),
    Elem is Elem1 + 1.



/*
Elem3 = 0
Elem2 = 0 + 1 = 1
Elem1 = 1 + 1 = 2
Elem = 2 + 1 = 3
*/

/*
cantidad([a, b, c], Elementos).
Elementos = 3.
*/   