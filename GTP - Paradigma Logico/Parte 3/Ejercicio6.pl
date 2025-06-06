suma_lista([], [], []).

suma_lista([X| Resto], [Y| Resto1], [Z| ListaSumaResto]):-
    Z is X + Y,
    suma_lista(Resto, Resto1, ListaSumaResto).


/*
Primer llamada              De atras para adelante
[2,-1,4] [1,3,2] Z=3        L3 = [] 
L = [3|L1]                  L2 = [6]
Segunda llamada             L1 = [2,6]      
[-1,4] [3,2] Z=2            L = [3,2,6]
L1 = [2,L2]        
Tercer llamada
[4] [2] Z=6
L2 = [6,L3]
Cuarta llamada
L3 = []
*/

/*
?- suma_lista([1, -2, 3, -4], [2, 3, 1, 4], ListaSuma).
ListaSuma = [3, 1, 4, 0].

?- suma_lista([1, -2, 3, -4], [2, 3, 1, 4, 7], ListaSuma).
false.
*/