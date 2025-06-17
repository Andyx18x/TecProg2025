% ---------------------------------------------
% Base de conocimiento
% ---------------------------------------------

localidades([
    'Córdoba Capital', 'Carlos Paz', 'Bialet Massé', 'Valle Hermoso',
    'La Falda', 'Huerta Grande', 'La Cumbre', 'Capilla del Monte'
]).

costo('Córdoba Capital', 'Carlos Paz', 1500).
costo('Carlos Paz', 'Bialet Massé', 1000).
costo('Bialet Massé', 'Valle Hermoso', 1200).
costo('Valle Hermoso', 'La Falda', 1000).
costo('La Falda', 'Huerta Grande', 1200).
costo('Huerta Grande', 'La Cumbre', 1600).
costo('La Cumbre', 'Capilla del Monte', 0).  % No tiene costo según la tabla.

% Recorridos
recorrido(jorge, 'Córdoba Capital', 'La Falda').
recorrido(adriana, 'Valle Hermoso', 'La Cumbre').
recorrido(gabriela, 'Carlos Paz', 'Capilla del Monte').
recorrido(roberto, 'Bialet Massé', 'Huerta Grande').
recorrido(jose, 'Córdoba Capital', 'Capilla del Monte').

% ---------------------------------------------
% Predicados auxiliares
% ---------------------------------------------

% sublista desde X hasta Y (incluidos)
camino(Inicio, Fin, Camino) :-
    localidades(L),
    camino_aux(L, Inicio, Fin, Camino).

camino_aux([Fin|_], Fin, Fin, [Fin]).
camino_aux([Inicio|Resto], Inicio, Fin, [Inicio|Camino]) :-
    camino_aux(Resto, _, Fin, Camino).
camino_aux([_|Resto], Inicio, Fin, Camino) :-
    camino_aux(Resto, Inicio, Fin, Camino).

% tramos de una lista de localidades
tramos([_], []).
tramos([A, B|Resto], [[A, B]|Tramos]) :-
    tramos([B|Resto], Tramos).

% cuántos usan un tramo
cuenta_uso(_, [], 0).
cuenta_uso([A,B], [[_, Camino, _]|Resto], N) :-
    tramos(Camino, Tramos),
    cuenta_uso([A,B], Resto, N1),
    ( member([A,B], Tramos) -> N is N1 + 1 ; N = N1 ).

% sumar costos de tramos
sumar_costos([], _, 0).
sumar_costos([[A,B]|Resto], Personas, Total) :-
    costo(A, B, CostoTramo),
    cuenta_uso([A,B], Personas, N),
    sumar_costos(Resto, Personas, TotalResto),
    (N > 0 -> Total is TotalResto + CostoTramo // N ; Total is TotalResto).

% datos de una persona
persona_dato(Persona, TodasPersonas, [Persona, Camino, Costo]) :-
    recorrido(Persona, Desde, Hasta),
    camino(Desde, Hasta, Camino),
    tramos(Camino, Tramos),
    sumar_costos(Tramos, TodasPersonas, Costo).

% ---------------------------------------------
% Predicado principal
% ---------------------------------------------

repartir_costos([], []).
repartir_costos([Persona|Resto], [[Persona, Camino, Costo]|ResultadoResto]) :-
    repartir_costos(Resto, ResultadoResto),
    persona_dato(Persona, [[Persona, Camino, Costo]|ResultadoResto], [Persona, Camino, Costo]).
